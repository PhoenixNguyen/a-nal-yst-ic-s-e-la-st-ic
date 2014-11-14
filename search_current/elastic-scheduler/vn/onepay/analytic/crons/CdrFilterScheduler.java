package vn.onepay.analytic.crons;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import vn.onepay.analytic.dao.CdrFilterDAO;
import vn.onepay.analytic.model.MsisdnStatistic;
import vn.onepay.cache.dynacache.PassiveDynaCache;
import vn.onepay.cache.dynacache.common.CacheConstants;
import vn.onepay.charging.iac.model.IacCdr;
import vn.onepay.charging.sms.model.SmsCdr;
import vn.onepay.common.SharedConstants;
import vn.onepay.search.entities.ESSmsCdrFilter;
import vn.onepay.search.entities.FilterType;
import vn.onepay.search.service.ElasticSearchService;
import vn.onepay.sms.SMSBrandName;
import vn.onepay.utils.Utils;

public class CdrFilterScheduler {
	private final static Logger logger = Logger.getLogger(CdrFilterScheduler.class);
	private PassiveDynaCache passiveDynaCache;
	private CdrFilterDAO cdrFilterDAO;
	private ElasticSearchService elasticSearchService;
	private List<String> phones;

	public void setPassiveDynaCache(PassiveDynaCache passiveDynaCache) {
		this.passiveDynaCache = passiveDynaCache;
	}

	public void setCdrFilterDAO(CdrFilterDAO cdrFilterDAO) {
		this.cdrFilterDAO = cdrFilterDAO;
	}

	public void setElasticSearchService(ElasticSearchService elasticSearchService) {
		this.elasticSearchService = elasticSearchService;
	}
	
	public void setPhones(List<String> phones) {
		this.phones = phones;
	}

	private static DateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
	private String[] CHARGING_SERVICES = new String[] { SharedConstants.SMS_CHARGING_SERVICE_CODE, SharedConstants.IAC_CHARGING_SERVICE_CODE };

	private static Set<String> warningMerchants = new HashSet<String>();
	public synchronized void alert(){
		final SMSBrandName smsBrandName = new SMSBrandName();
		if(warningMerchants!=null && warningMerchants.size()>0){
			try{
				String message = "Merchant ${merchant} co yeu cau can kiem tra ngay. Chi tiet tai https://1pay.vn hoac trong email!.";
				String dsMerchant="";
				boolean blnAlert = false;
				for(String merchant: warningMerchants){
					String key = "sms_warning_merchant_"+ dtFormat.format(new Date()) +  "_" +StringUtils.trimToEmpty(merchant).toLowerCase();
					String obj = (String) passiveDynaCache.getCachedItem(key);
					if(StringUtils.isEmpty(obj)){
						passiveDynaCache.setCachedItem(key, merchant, CacheConstants.MEMCACHED_TIMEOUT_24_HOURS);
						dsMerchant= dsMerchant+ invisibleString(merchant, 3, "*", true) + ", ";
						blnAlert=true;
					}
				}
				if(blnAlert){
					message =  message.replace("${merchant}", dsMerchant);
					Calendar cal = Calendar.getInstance();
					if(cal.get(Calendar.HOUR_OF_DAY)>=7 && cal.get(Calendar.HOUR_OF_DAY)<=22){
						for(String phone: phones)
							smsBrandName.sendSMSBrandName(Utils.getFormatedMsisdn(phone), message);
					}
				}
				warningMerchants.clear();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				warningMerchants.clear();
			}
		}
	}

	private synchronized void scan(final String chargingService, final int count, final double amount, final Date fromTime, final Date toTime, final String filterType) {
		try {
			String mapKey = dtFormat.format(toTime) + "_" + chargingService + "_" + filterType;
			Map<String, Set<String>> mapProviderMsisdn = (Map<String, Set<String>>) passiveDynaCache.getCachedItem(mapKey);
			if (mapProviderMsisdn == null)
				mapProviderMsisdn = new HashMap<String, Set<String>>();
			List<MsisdnStatistic> msisdnStatistics = cdrFilterDAO.mapReduce(
					SharedConstants.SMS_CHARGING_SERVICE_CODE.equalsIgnoreCase(chargingService) ? SmsCdr.class : IacCdr.class, fromTime, toTime, count, amount);
			if (msisdnStatistics != null && msisdnStatistics.size() > 0) {
				for (MsisdnStatistic statistic : msisdnStatistics) {
					Set<String> dsMsisdn = mapProviderMsisdn.containsKey(statistic.getProvider()) ? mapProviderMsisdn.get(statistic.getProvider())
							: new HashSet<String>();
					dsMsisdn.add(statistic.getMsisdn());
					mapProviderMsisdn.put(statistic.getProvider(), dsMsisdn);
					// ------------
					warningMerchants.add(statistic.getMerchant());
				}
			}
			passiveDynaCache.setCachedItem(mapKey, mapProviderMsisdn, CacheConstants.MEMCACHED_TIMEOUT_24_HOURS);
			// ------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public synchronized void scan() {
		Calendar calendar = Calendar.getInstance();
		final Date toTime = calendar.getTime();
		Date fromTime = calendar.getTime();
		int count =3;
		double amount = 1000d;
		for (String chargingService : CHARGING_SERVICES) {
			calendar.setTime(toTime);
			calendar.add(Calendar.MINUTE, -5);
			fromTime = calendar.getTime();
			
			count =3;
			amount =1000;
			scan(chargingService, count, amount, fromTime, toTime, FilterType.OVER_03_MESSAGES_LIMIT_PER_05_MINUTES);
			//--------------
			
			calendar.setTime(toTime);
			calendar.add(Calendar.MINUTE, -10);
			fromTime = calendar.getTime();
			
			count = 5;
			amount = 1000;
			scan(chargingService, count, amount, fromTime, toTime, FilterType.OVER_05_MESSAGES_LIMIT_PER_10_MINUTES);
			//--------------
			
			calendar.setTime(toTime);
			calendar.add(Calendar.MINUTE, -60);
			fromTime = calendar.getTime();
			
			count = 30;
			amount = 1000;
			scan(chargingService, count, amount, fromTime, toTime, FilterType.OVER_30_MESSAGES_LIMIT_PER_60_MINUTES);
			//--------------
		}
	}
	
	public synchronized void run() {
		Calendar calendar = Calendar.getInstance();
		final Date toTime = calendar.getTime();
		Date fromTime = calendar.getTime();
		int count =3;
		double amount = 1000d;
		for (String chargingService : CHARGING_SERVICES) {
			fromTime = Utils.getStartOfDay(toTime);

			count = 3;
			amount = SharedConstants.SMS_CHARGING_SERVICE_CODE.equalsIgnoreCase(chargingService) ? 150000d:500000d;
			scan(chargingService, count, amount, fromTime, toTime, FilterType.OVER_AMOUNT_LIMIT_PER_DAY);
			//------
		}
	}
	
	
	public static boolean	blnProcessing	= false;
	public synchronized void push() {
		if (blnProcessing)
			return;
		blnProcessing = true;
		
		Calendar calendar = Calendar.getInstance();
		final Date toTime = calendar.getTime();
		final Date fromTime = Utils.getStartOfDay(toTime);
		
		final int offset = 0;
		final int limit = 0;
		
		try{
			for (String chargingService : CHARGING_SERVICES) {
				for(String filterType: FilterType.ALL_FILTER_TYPES){
					String mapKey = dtFormat.format(toTime) + "_" + chargingService + "_" + filterType;
					Map<String, Set<String>> mapProviderMsisdn = (Map<String, Set<String>>) passiveDynaCache.getCachedItem(mapKey);
					if (mapProviderMsisdn != null && mapProviderMsisdn.size() > 0) {
						for (String provider : mapProviderMsisdn.keySet()) {
							Set<String> dsMsisdn = mapProviderMsisdn.get(provider);
							List<ESSmsCdrFilter> esSmsCdrFilters = cdrFilterDAO.findESSmsCdrFilters(chargingService, provider, new ArrayList<String>(dsMsisdn),
									fromTime, toTime, offset, limit);
							if (esSmsCdrFilters != null && esSmsCdrFilters.size() > 0) {
								for (ESSmsCdrFilter esSmsCdrFilter : esSmsCdrFilters) {
									if(passiveDynaCache.containsKey(filterType + "_"+ esSmsCdrFilter.getId()))
										continue;
									try {
										esSmsCdrFilter.setFilterType(filterType);
										if (elasticSearchService.checkIndex(ESSmsCdrFilter.class)) {
											if (!elasticSearchService.exist(esSmsCdrFilter.getId(), ESSmsCdrFilter.class)) {
												if (StringUtils.isNotEmpty(elasticSearchService.index(esSmsCdrFilter.getId(), esSmsCdrFilter))){
													if("mw_9029".equalsIgnoreCase(esSmsCdrFilter.getProvider()))
														logger.info("FUCK|"+esSmsCdrFilter.getProvider() +"|" + esSmsCdrFilter.getMerchant() + "|" +esSmsCdrFilter.getMsisdn()+"|"+esSmsCdrFilter.getShort_code()+"|"+esSmsCdrFilter.getCommand_code());
													logger.info("indexed");
												}
											} else {
												elasticSearchService.reindex(esSmsCdrFilter.getId(), esSmsCdrFilter, ESSmsCdrFilter.class);
												logger.info("existed");
											}
											passiveDynaCache.setCachedItem(filterType + "_"+ esSmsCdrFilter.getId(), esSmsCdrFilter.getId() , CacheConstants.MEMCACHED_TIMEOUT_24_HOURS);
										} else {
											elasticSearchService.createIndex(ESSmsCdrFilter.class);
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
									try{TimeUnit.MILLISECONDS.sleep(200);}catch(InterruptedException ie){}
								}
							}
						}
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		blnProcessing = false;
	}
	
	private String invisibleString(String content, int numOfCharacter, String replaceCharacter, boolean beginOrEnd) {
		if(numOfCharacter>=content.length())
			return content.replaceAll(".", replaceCharacter);
		if(beginOrEnd){
			int pos = numOfCharacter;
			return content.substring(0, pos).replaceAll(".", replaceCharacter) + content.substring(pos);
		}else{
			int pos = content.length() - numOfCharacter;
			return content.substring(0, pos) + content.substring(pos).replaceAll(".", replaceCharacter); 
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
