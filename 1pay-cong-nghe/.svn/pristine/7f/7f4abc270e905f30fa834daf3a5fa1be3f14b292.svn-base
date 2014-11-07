package vn.onepay.cdr.filter.scan;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.onepay.cache.dynacache.PassiveDynaCache;
import vn.onepay.cache.dynacache.PassiveDynaHashTableCache;
import vn.onepay.cache.dynacache.common.CacheConstants;
import vn.onepay.cdr.filter.model.SmsCdrFilter;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;
import vn.onepay.cdr.filter.service.CdrFilterService;
import vn.onepay.charging.sms.dao.SmsCdrDAO;
import vn.onepay.dao.service.BaseService;
import vn.onepay.sms.service.SmsBrandNameService;
import vn.onepay.utils.Utils;
import vn.onepay.web.tld.MyCustomTagLib;

@Service
public class Scaner {
	private File baseDir = new File("/opt/one-pay/sms-cdr");
	private BaseService baseService;
	private SmsCdrDAO smsCdrDAO;
	private int minutes = 5;
	private int limit = 3;
	private List<String> phones = new ArrayList<String>();
	private SmsBrandNameService smsBrandNameService;
	@Autowired private CdrFilterService cdrFilterService;
	public File getBaseDir() {
		return this.baseDir;
	}
	public void setBaseDir(File baseDir) {
		this.baseDir = baseDir;
	}
	
	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	public BaseService getBaseService() {
		return this.baseService;
	}
	public void setSmsCdrDAO(SmsCdrDAO smsCdrDAO) {
		this.smsCdrDAO = smsCdrDAO;
	}
	public SmsCdrDAO getSmsCdrDAO() {
		return this.smsCdrDAO;
	}
	
	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public List<String> getPhones() {
		return this.phones;
	}
	public void setPhones(List<String> phones) {
		this.phones = phones;
	}
	public void setSmsBrandNameService(SmsBrandNameService smsBrandNameService) {
		this.smsBrandNameService = smsBrandNameService;
	}
	//---------
	private static final int NTHREDS = 100;
	public void scan(Date fromDate, Date endDate) {
		try {
			System.out.println("Start scan from "+ dtFormat.format(fromDate)+" to "+ dtFormat.format(endDate));
			ExecutorService executor = Executors.newFixedThreadPool(NTHREDS);
			Calendar cal = Calendar.getInstance();
			cal.setTime(fromDate);
			while (endDate.after(cal.getTime())) {
				Date fromTime = cal.getTime();
				cal.add(Calendar.MINUTE, this.minutes);
				Date toTime = cal.getTime();
				ScanWorker worker = new ScanWorker(this, fromTime, toTime, limit);
				executor.execute(worker);
			}
			// This will make the executor accept no new threads
			// and finish all existing threads in the queue
			executor.shutdown();
			// Wait until all threads are finish
			executor.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
			System.out.println("Finished all threads");
			//Statistic from generated log
			Map<String, Integer> treeMap = new TreeMap<String, Integer>(mapMsisdnStats);
			Map<String,List<String>> mapMsisdn = new HashMap<String, List<String>>();
			for(String key : treeMap.keySet()){
				String[] arr = key.split("_");
				String date = arr[0];
				String msisdn = arr[1];
				int count = treeMap.get(key);
				if(count>= this.limit){
					List<String> dsMsisdn = mapMsisdn.containsKey(date)? mapMsisdn.get(date):new ArrayList<String>();
					if(!dsMsisdn.contains(msisdn)){
						dsMsisdn.add(msisdn);
						mapMsisdn.put(date, dsMsisdn);
					}
				}
			}
			for(String date: mapMsisdn.keySet()){
				List<String> dsMsisdn = mapMsisdn.get(date);
				File logDir = new File(baseDir, date);
				if (logDir.exists()) {
					File[] listOfFiles = logDir.listFiles();
					Arrays.sort(listOfFiles);
					for (int i = 0; i < listOfFiles.length; i++) {
						if (listOfFiles[i].isFile()) {
							File file  = listOfFiles[i];
							String fileName = file.getName();
							if (fileName.endsWith(".txt")) {
								BufferedReader br = null;
								try {
									String sCurrentLine;
									br = new BufferedReader(new FileReader(file));
									while ((sCurrentLine = br.readLine()) != null) {
										String[] arr = sCurrentLine.split("\t");
										if(arr.length>1){
											final String sourceRef = arr[0];
											final String msisdn =  arr[1];
											final String merchant = arr[2];
											final String appCode = arr[3];
											final String provider = arr[4];
											final String shortCode = arr[5];
											final String commandCode = arr[6];
											final Date requestTime = dtFormat.parse(arr[7]);
											BigDecimal amount = BigDecimal.valueOf(0d);
											try{
												amount = BigDecimal.valueOf(Integer.parseInt(arr[8]));
											}catch(Exception e){
												amount = BigDecimal.valueOf(0d);
											}
											if(dsMsisdn.contains(msisdn)){
//												System.out.println(sCurrentLine);
												SmsCdrFilter cdr = new SmsCdrFilter();
												cdr.setChargingService("SMS");
												cdr.setChargingTime(requestTime);
												cdr.setCommandCode(commandCode);
												cdr.setContentService(appCode);
												cdr.setMerchant(merchant);
												cdr.setMsisdn(msisdn);
												cdr.setPaymentProvider(provider.contains("_")?provider.substring(provider.indexOf("_")+1):provider);
												cdr.setServiceNumber(shortCode);
												cdr.setTransactionRef(sourceRef);
												cdr.setTelco(Utils.findMobileOperator(msisdn));
												cdr.setAmount(amount);
												cdr.setCreatedTime(requestTime);
												cdr.setUpdatedTime(requestTime);
												try {
													this.baseService.saveOrUpdate(cdr);
												} catch (Exception e) {
//													e.printStackTrace();
												}
												try{
													SmsMerchantProductVerify verify = new SmsMerchantProductVerify();
													verify.setCommand_code(cdr.getCommandCode());
													verify.setProvider(cdr.getPaymentProvider());
													verify.setMerchant(cdr.getMerchant());
													verify.setComment("no text");
													verify.setCreated_time(cdr.getChargingTime());
													verify.setUpdated_time(cdr.getChargingTime());
													verify.setApp_code(cdr.getContentService());
													cdrFilterService.save(verify);
												}catch(Exception e){
//													e.printStackTrace();
												}
											}
										}
									}
								}catch(ParseException e){
//									e.printStackTrace();
								} catch (IOException e) {
//									e.printStackTrace();
								} finally {
									try {
										if (br != null)br.close();
									} catch (IOException ex) {
//										ex.printStackTrace();
									}
								}
							}
						}
					}
				}
			}
		} catch (InterruptedException e) {
//			e.printStackTrace();
		}
	}
	private static Map<String,Integer> mapMsisdnStats = new HashMap<String,Integer>();
	public int increase(String msisdn, Date cdrTime){
		synchronized (mapMsisdnStats) {
			try{
				final DateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
				String key = dtFormat.format(cdrTime)+"_" + msisdn;
				Integer count = mapMsisdnStats.containsKey(key) ? mapMsisdnStats.get(key):0;
				count++;
				mapMsisdnStats.put(key, count);
				return count;
			}catch(Exception e){
//				e.printStackTrace();
			}
		}
		return 0;
	}
	private static List<String> warningMerchants = new ArrayList<String>();
	public void run(){
		try{
			warningMerchants = new ArrayList<String>();
			final Date endDate = new Date();
			final Date fromDate = Utils.getStartOfDay(endDate);
			scan(fromDate, endDate);
			alertSMS();
		}catch(Exception e){
//			e.printStackTrace();
		}
	}
	
	//-----------------
	public synchronized void pushToAlert(List<String> dsMerchant){
		if(dsMerchant!=null){
			if(warningMerchants==null)
				warningMerchants = new ArrayList<String>();
			warningMerchants.addAll(dsMerchant);
		}
	}
	private static PassiveDynaCache passiveDynaCache = new PassiveDynaHashTableCache();
	private synchronized void alertSMS(){
		if(warningMerchants!=null && warningMerchants.size()>0){
			try{
				String message = "Merchant ${merchant} co yeu cau can kiem tra ngay. Chi tiet tai https://1pay.vn hoac trong email!.";
				String dsMerchant="";
				boolean blnAlert = false;
				for(String merchant: warningMerchants){
					String key = "sms_warning_merchant_"+StringUtils.trimToEmpty(merchant).toLowerCase();
					String obj = (String) passiveDynaCache.getCachedItem(key);
					if(StringUtils.isEmpty(obj)){
						passiveDynaCache.setCachedItem(key, merchant, CacheConstants.MEMCACHED_TIMEOUT_24_HOURS);
						dsMerchant= dsMerchant+ MyCustomTagLib.invisibleString(merchant, 3, "*", true) + ", ";
						blnAlert=true;
					}
				}
				if(blnAlert){
					message =  message.replace("${merchant}", dsMerchant);
					Calendar cal = Calendar.getInstance();
					if(cal.get(Calendar.HOUR_OF_DAY)>=7 && cal.get(Calendar.HOUR_OF_DAY)<=22){
						for(String phone: phones){
							System.out.println(message);
							smsBrandNameService.sendSMSMessage(Utils.getFormatedMsisdn(phone), message);
						}
					}
				}
				warningMerchants.clear();
			}catch(Exception e){
//				e.printStackTrace();
			}finally{
				warningMerchants.clear();
			}
		}
	}
	
	private static DateFormat dtFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	public static void main(String[] args) throws Exception{
		Date time = dtFormat.parse("01-03-2014 00:00:00");
		System.out.println(time.getTime());
	}
}
