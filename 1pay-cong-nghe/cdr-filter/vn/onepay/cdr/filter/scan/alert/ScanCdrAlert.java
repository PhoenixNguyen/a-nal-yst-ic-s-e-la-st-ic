package vn.onepay.cdr.filter.scan.alert;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vn.onepay.cdr.filter.model.SmsCdrFilter;
import vn.onepay.cdr.filter.model.SmsMerchantProductVerify;
import vn.onepay.cdr.filter.scan.alert.model.Summary;
import vn.onepay.cdr.filter.service.CdrFilterService;
import vn.onepay.email.service.EmailService;
import vn.onepay.utils.Utils;
import vn.onepay.xslt.XmlTransform;

@Component("scanCdrAlert")
public class ScanCdrAlert {
	final int limit = 10;
	final int maxPageSize = 1000;
	final int minTotalSMS = 3;
	@Autowired private CdrFilterService cdrFilterService;
	@Autowired private EmailService emailService;
	private List<String> emails = new ArrayList<String>();
	public void setEmails(List<String> emails) {
		this.emails = emails;
	}
	public void run(){
		try {
			int offset = 0;
			final List<String> msisdns = null;
			final List<String> commandCode = null;
			final List<String> provider = null;
			final List<String> merchants = null;
			DateFormat dtFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			final Date fromTime = Utils.getStartOfDay(new Date());
			final Date toTime = new Date();
			
//			System.out.println(dtFormat.format(fromTime) +" - " + dtFormat.format(toTime));
			List<SmsMerchantProductVerify> smpvs = cdrFilterService.findSmsMerchantProductVerifies(null, null, null, Arrays.asList(new String[] {SmsMerchantProductVerify.APPROVED_STATUS}), null, null, -1, 0);
			List<String[]> exceptCmds = null;
			if(smpvs!=null && smpvs.size()>0) {
				exceptCmds = new ArrayList<String[]>();
				for(SmsMerchantProductVerify smpv: smpvs)
					exceptCmds.add(new String[] {smpv.getProvider(), smpv.getCommand_code()});
			}
			
			List<SmsCdrFilter> msisdnStats = cdrFilterService.findSmsCdrFilters(msisdns, commandCode, provider, merchants, exceptCmds, fromTime, toTime, 
					Arrays.asList(new String[] {"msisdn", "merchant"}), 
					Arrays.asList(new String[] {"msisdn:totalSMS"}), 
					Arrays.asList(new String[] {"totalSMS:desc"}),
					maxPageSize, offset);
			
			if(msisdnStats != null && msisdnStats.size() > 0) {
				int i = 0;
				while(i < msisdnStats.size())
					if(msisdnStats.get(i).getTotalSMS() < minTotalSMS)
						msisdnStats.remove(i);
					else
						i++;
						
			}
			if(msisdnStats != null && msisdnStats.size() > 0) {
				Map<String, SmsCdrFilter> map = new HashMap<String, SmsCdrFilter>(); 
				
				for(SmsCdrFilter cdr : msisdnStats) {
					if(!map.containsKey(cdr.getMerchant())) {
						SmsCdrFilter cdr_ = new SmsCdrFilter(
								cdr.getTransactionRef(),
								cdr.getMsisdn(),
								cdr.getMerchant(),
								cdr.getServiceNumber(),
								cdr.getCommandCode(),
								cdr.getContentService(),
								cdr.getChargingService(),
								cdr.getPaymentProvider(),
								cdr.getTelco(),
								cdr.getAmount(),
								cdr.getChargingTime(),
								cdr.getCreatedTime(),
								cdr.getUpdatedTime()
								);
						
						cdr_.setTotalMSISDN(cdr.getTotalMSISDN());
						cdr_.setTotalSMS(cdr.getTotalSMS());
						
						if(cdr_.getTotalMSISDN() == 0)
							cdr_.setTotalMSISDN(1);
						if(cdr_.getTotalSMS() == 0)
							cdr_.setTotalSMS(1);
						map.put(cdr.getMerchant(), cdr_);
					} else {
						SmsCdrFilter cdr_ = map.get(cdr.getMerchant());
						cdr_.setTotalSMS(cdr_.getTotalSMS() + cdr.getTotalSMS());
						cdr_.setTotalMSISDN(cdr_.getTotalMSISDN() + 1);
						map.put(cdr.getMerchant(), cdr_);
					}
				}
	
				List<SmsCdrFilter> merchantStats = new ArrayList<SmsCdrFilter>(map.values());
				Collections.sort(merchantStats, new Comparator<SmsCdrFilter>() {

					@Override
					public int compare(SmsCdrFilter arg0, SmsCdrFilter arg1) {
						// TODO Auto-generated method stub
						return arg1.getTotalMSISDN() - arg0.getTotalMSISDN();
					}
				});
				
				Collections.sort(msisdnStats, new Comparator<SmsCdrFilter>() {

					@Override
					public int compare(SmsCdrFilter arg0, SmsCdrFilter arg1) {
						// TODO Auto-generated method stub
						return arg1.getTotalSMS() - arg0.getTotalSMS();
					}
				});
				
				while(msisdnStats.size() > limit) {
					msisdnStats.remove(limit);
				}
				
				while(merchantStats.size() > limit) {
					merchantStats.remove(limit);
				}
				//------
				for(SmsCdrFilter cdrFilter:msisdnStats){
					cdrFilter.setMsisdn(invisibleString(cdrFilter.getMsisdn(), 3, "*", false));
					cdrFilter.setMerchant(invisibleString(cdrFilter.getMerchant(), 3, "*", true));
				}
				for(SmsCdrFilter cdrFilter:merchantStats){
					cdrFilter.setMsisdn(invisibleString(cdrFilter.getMsisdn(), 3, "*", false));
					cdrFilter.setMerchant(invisibleString(cdrFilter.getMerchant(), 3, "*", true));
				}
				//------
				JAXBContext jaxbContext = JAXBContext.newInstance(Summary.class);
				Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
				jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//				 Marshal the in console
//				jaxbMarshaller.marshal(summary, System.out);
				Summary summary = new Summary();
				summary.setFromTime(dtFormat.format(fromTime));
				summary.setToTime(dtFormat.format(toTime));
				if(msisdnStats!=null && msisdnStats.size()>0)
					summary.setMsisdns(msisdnStats);
				if(merchantStats!=null && merchantStats.size()>0)
					summary.setMerchants(merchantStats);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				jaxbMarshaller.marshal(summary, baos);
				final String xml = baos.toString("UTF-8");
//				System.out.println(xml);
				//-------
				BufferedReader br = null;
				StringBuilder sb = new StringBuilder();
				String line;
				try {
		 
					br = new BufferedReader(new InputStreamReader(ScanCdrAlert.class
							.getResourceAsStream("/vn/onepay/cdr/filter/scan/alert/xsl/scan_sms_cdr_email_template.xsl"),
					"UTF-8"));
					while ((line = br.readLine()) != null) {
						sb.append(line);
					}
				} catch (IOException e) {
//					e.printStackTrace();
				} finally {
					if (br != null) {
						try {
							br.close();
						} catch (IOException e) {
//							e.printStackTrace();
						}
					}
				}
				final String xsl = new String(sb.toString().getBytes(),"UTF-8");
				//-------
				String html = XmlTransform.getTransformedHtml(xml, xsl);
//				System.out.println(html);
				if(emails!=null && emails.size()>0){
					try{
						
						final String from ="1Pay.vn - The simplest mobile payment platform <noreply@1pay.vn>";
						final String replyTo="noreply@1pay.vn";
						final List<String> to = Arrays.asList(new String[]{emails.get(0)});
						final List<String> cc = null;
						final List<String> bcc = new ArrayList<String>(emails);
						bcc.remove(0);
						Calendar cal = Calendar.getInstance();
						cal.setTime(toTime);
						int hour = cal.get(Calendar.HOUR_OF_DAY);
						DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//						final String subject="[1Pay] Thu nghiem he thong noi bo 0h - "+hour+"h " +dateFormat.format(cal.getTime());
						final String subject="[1Pay] Thu nghiem he thong noi bo";
						emailService.sendEmail(from, replyTo, to, cc, bcc, subject, html);
					}catch(Exception e){
//						e.printStackTrace();
					}
				}
			}
		}catch(Exception e){
//			e.printStackTrace();
		}
	}
	public static String invisibleString(String content, int numOfCharacter, String replaceCharacter, boolean beginOrEnd) {
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
	public static void main(String[] args) throws Exception{
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		System.out.println(hour+"h " +dateFormat.format(new Date()));
		String msisdn ="84936663369";
		System.out.println(msisdn);
		System.out.println(invisibleString(msisdn, 3, "*", false));
		System.out.println(invisibleString(msisdn, 3, "*", true));
	}
}
