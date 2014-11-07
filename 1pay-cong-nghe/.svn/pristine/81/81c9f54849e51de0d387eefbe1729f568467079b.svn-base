package vn.onepay.cdr.filter.scan;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import vn.onepay.charging.sms.dao.SmsCdrDAO;
import vn.onepay.charging.sms.model.SmsCdr;

public class ScanWorker implements Runnable {
	private Scaner scaner;
	private Date fromTime;
	private Date toTime;
	public void setScaner(Scaner scaner) {
		this.scaner = scaner;
	}
	public ScanWorker(Scaner scaner, Date fromTime, Date toTime,int limit) {
		this.scaner = scaner;
		this.fromTime = fromTime;
		this.toTime = toTime;
//		System.out.println("Scan from "+ dtFormat.format(fromTime)+" to "+ dtFormat.format(toTime));
	}
	private static DateFormat dtFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	private static String IGNORE_MERCHANTS="|mwork|tofu|1pay|";
	@Override
	public void run() {
		File baseDir = this.scaner.getBaseDir();
		SmsCdrDAO smsCdrDAO = this.scaner.getSmsCdrDAO();
		final String serviceNumber = null;
		final String shortCode = null;
		final int offset = 0;
		final int size = 0;
		List<SmsCdr> cdrs = smsCdrDAO.findSmsCdr4Statistic(serviceNumber, shortCode, fromTime, toTime, offset, size);
		if(cdrs!=null && cdrs.size()>0){
			Map<String,Integer> mapMerchantMsisdnStats = new HashMap<String, Integer>();
			List<String> warningMerchants = new ArrayList<String>(); 
			//-------
			StringBuffer buffer = new StringBuffer();
			for(SmsCdr cdr:cdrs){
				final String sourceRef = cdr.getId();
				final String msisdn = StringUtils.trimToEmpty(cdr.getMsisdn());
				final String merchant = StringUtils.trimToEmpty(cdr.getMerchant());
				final String provider = StringUtils.trimToEmpty(cdr.getPaymentProvider());
				final String command = StringUtils.trimToEmpty(cdr.getCommandCode());
				final String appCode = cdr.getApp_code();
				final String amount = Integer.toString(cdr.getAmount());
				if(IGNORE_MERCHANTS.indexOf("|"+ merchant +"|")==-1){
					if(cdr.getRequestTime()!=null){
						scaner.increase(msisdn, cdr.getRequestTime());
					}
					buffer.append(sourceRef+"\t"+ msisdn +"\t" + merchant + "\t" + appCode+ "\t" + provider + "\t"+ StringUtils.trimToEmpty(cdr.getShortCode()) + "\t" + command + "\t" + dtFormat.format(cdr.getRequestTime())+"\t"+amount).append("\n");
					//---------
					//For Alert SMS
					final String mapKey = msisdn + "_" + merchant;
					int count = mapMerchantMsisdnStats.containsKey(mapKey) ? (mapMerchantMsisdnStats.get(mapKey) +1) : 1;
					mapMerchantMsisdnStats.put(mapKey, count);
					if(count>=3 && !warningMerchants.contains(merchant)){
						warningMerchants.add(merchant);
					}
					//--------
				}
			}
			//-------
			String content = buffer.toString();
			if(StringUtils.isNotEmpty(content)){
				try{
					DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					File logDir = new File(baseDir,dateFormat.format(fromTime));
					if(!logDir.exists())
						logDir.mkdirs();
					dateFormat = new SimpleDateFormat("yyyyMMdd_HH_mm_ss");
					File file = new File(logDir,dateFormat.format(fromTime)+".txt");
		            //------
					if (!file.exists()) {
						file.createNewFile();
					}
					FileWriter fw = new FileWriter(file.getAbsoluteFile());
					BufferedWriter bw = new BufferedWriter(fw);
					bw.write(buffer.toString());
					bw.close();
		        } catch (IOException e) {  
//		            e.printStackTrace();  
		        } 
			}
			
			//---------ALERT---------//
			if(warningMerchants!=null && warningMerchants.size()>0){
				scaner.pushToAlert(warningMerchants);
			}
		}
	}
}
