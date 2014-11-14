package vn.onepay.charging.sms.model;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import vn.onepay.common.SharedConstants;
import vn.onepay.utils.Utils;

import com.mongodb.DBObject;
import com.mongodb.util.JSON;

@Document(collection = "SmsCharging.CDR")
@TypeAlias("smsCdr")
public class SmsCdr implements Serializable{
	@Id
	private String id;
	@Indexed
	private String merchant = SharedConstants.DEFAULT_MERCHANT;
	private String app_code;
	@Indexed
	private String paymentProvider;//sms provider 8x38, 6x86
	@Indexed
	private String requestId;//
	private String shortCode;//
	@Indexed
	private int amount; // Price of Short Code
	@Indexed
	private String msisdn; //09xxx
	@Indexed
	private String telco;
	@Indexed
	private String commandCode;//NAP
	@Indexed
	private String moMessage;//NAP hahm
	private String mtMessage;// Noi dung tra ve
	private String mtMessageType; // Text /Wap push
	@Indexed
	private String billingStatus;//Tinh cuoc/ ko
	@Indexed
	private String status;//Loi - Khong loi
	private String errorMessage;
	
	private String originalMessage; // [	{“type”:”text|wap_push”,  “status”: 0|1, “sms”:”nội dung mt”}] // e.getMessage()
	@Indexed
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private java.util.Date requestTime = new Date();
	@Indexed
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private java.util.Date responseTime = new Date();
	
	@Indexed
	private boolean extractStatus = false;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMerchant() {
		return merchant;
	}
	public void setMerchant(String merchant) {
		this.merchant = merchant;
	}
	
	public String getPaymentProvider() {
		return paymentProvider;
	}
	
	public void setPaymentProvider(String paymentProvider) {
		this.paymentProvider = paymentProvider;
	}
	
	public String getApp_code() {
		return app_code;
	}
	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}
	
	public String getShortCode() {
		return shortCode;
	}
	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}
	
	public int getAmount() {
		if(amount <=0){
			final int[] arrSmsPrice = new int[]{500,1000,2000,3000,4000,5000,10000,15000};
			int price = arrSmsPrice[Integer.parseInt(shortCode.charAt(1)+"")];
			return price;
		}
		
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getRequestId() {
		return requestId;
	}
	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	
	public String getMsisdn() {
		return msisdn;
	}
	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}	
	public String getTelco() {
		if(StringUtils.isEmpty(this.telco))
			return StringUtils.trimToEmpty(Utils.findMobileOperatorCode(this.msisdn));
		return telco;
	}
	public void setTelco(String telco) {
		this.telco = telco;
	}
	
	public String getCommandCode() {
		return commandCode;
	}
	public void setCommandCode(String commandCode) {
		this.commandCode = commandCode;
	}
	
	public String getMoMessage() {
		return moMessage;
	}
	public void setMoMessage(String moMessage) {
		this.moMessage = moMessage;
	}
	
	public String getMtMessage() {
		return mtMessage;
	}
	public void setMtMessage(String mtMessage) {
		this.mtMessage = mtMessage;
	}
	
	public String getMtMessageType() {
		return mtMessageType;
	}
	
	public void setMtMessageType(String mtMessageType) {
		this.mtMessageType = mtMessageType;
	}
	
	public String getBillingStatus() {
		return billingStatus;
	}
	public void setBillingStatus(String billingStatus) {
		this.billingStatus = billingStatus;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	public String getOriginalMessage() {
		return originalMessage;
	}
	
	public void setOriginalMessage(String originalMessage) {
		this.originalMessage = originalMessage;
	}
	
	public java.util.Date getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(java.util.Date requestTime) {
		this.requestTime = requestTime;
	}
	
	public java.util.Date getResponseTime() {
		return responseTime;
	}
	public void setResponseTime(java.util.Date responseTime) {
		this.responseTime = responseTime;
	}
	public boolean getExtractStatus() {
		return extractStatus;
	}
	public void setExtractStatus(boolean extractStatus) {
		this.extractStatus = extractStatus;
	}
	private static DateFormat isoDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
	public static SmsCdr dbObjectToCdr(DBObject obj){
		SmsCdr cdr = null;
		try{
			JSONObject jsonObject = new JSONObject(JSON.serialize(obj));
			cdr = new SmsCdr();
			cdr.setId(((JSONObject)jsonObject.get("_id")).get("$oid").toString());
			try{
				if(jsonObject.has("merchant"))
					cdr.setMerchant(jsonObject.getString("merchant"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("app_code"))
					cdr.setApp_code(jsonObject.getString("app_code"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("paymentProvider"))
					cdr.setPaymentProvider(jsonObject.getString("paymentProvider"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("requestId"))
					cdr.setRequestId(jsonObject.getString("requestId"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("msisdn"))
				cdr.setMsisdn(jsonObject.getString("msisdn"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("telco"))
					cdr.setTelco(jsonObject.getString("telco"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("shortCode"))
					cdr.setShortCode(jsonObject.getString("shortCode"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("amount"))
					cdr.setAmount(jsonObject.getInt("amount"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("commandCode"))
					cdr.setCommandCode(jsonObject.getString("commandCode"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("moMessage"))
					cdr.setMoMessage(jsonObject.getString("moMessage"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("mtMessage"))
					cdr.setMtMessage(jsonObject.getString("mtMessage"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("mtMessageType"))
					cdr.setMtMessageType(jsonObject.getString("mtMessageType"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("billingStatus"))
					cdr.setBillingStatus(jsonObject.getString("billingStatus"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("status"))
					cdr.setStatus(jsonObject.getString("status"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("errorMessage"))
					cdr.setErrorMessage(jsonObject.getString("errorMessage"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("originalMessage"))
					cdr.setOriginalMessage(jsonObject.getString("originalMessage"));
			}catch(Exception e){}
			try{
				if(jsonObject.has("requestTime")){
					Date requestTime = isoDateTimeFormat.parse(((JSONObject)jsonObject.get("requestTime")).getString("$date"));
					cdr.setRequestTime(requestTime);
				}
			}catch(Exception e){
//				e.printStackTrace();
			}
			try{
				if(jsonObject.has("responseTime")){
					Date responseTime = isoDateTimeFormat.parse(((JSONObject)jsonObject.get("responseTime")).getString("$date"));
					cdr.setRequestTime(responseTime);
				}
			}catch(Exception e){
//				e.printStackTrace();
			}
			if(cdr.getRequestTime()==null && cdr.getResponseTime()!=null){
				cdr.setRequestTime(cdr.getResponseTime());
			}
			if(cdr.getRequestTime()!=null && cdr.getResponseTime() == null){
				cdr.setResponseTime(cdr.getRequestTime());
			}
			try{
				if(jsonObject.has("extractStatus"))
					cdr.setExtractStatus(jsonObject.getBoolean("extractStatus"));
			}catch(Exception e){}
		}catch(Exception e){
			e.printStackTrace();
		}
		return cdr;
	}
}
