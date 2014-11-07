package vn.onepay.iac.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import vn.onepay.common.SharedConstants;
import vn.onepay.utils.Utils;

@Document(collection = "IacCharging.CDR")
@TypeAlias("iacCdr")
public class IacCdr implements Serializable {
	@Id
	private String id;
	@Indexed
	private String merchant = SharedConstants.DEFAULT_MERCHANT;
	private String app_code;
	@Indexed
	private String provider = "mw_9029";
	// --------
	@Indexed
	private String requestId;//
	@Indexed
	private String command;// Tên Game
	@Indexed
	private String moMessage;// CPCode_GameCode_ContentID_Accounts_ThongTinKhac
	private String mtMessage;// Noi dung tra ve
	private String merchantRespMessage;
	@Indexed
	private String msisdn; // 09xxx
	@Indexed
	private String telco;
	private int amount;
	// --------
	@Indexed
	private String billingStatus;//Tinh cuoc/ ko
	@Indexed
	private String status;//Loi - Khong loi
	private String errorCode;
	private String errorMessage;
	// --------
	private String params;
	//-------
	@Indexed
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private java.util.Date requestTime = new Date();
	@Indexed
	@DateTimeFormat(iso = ISO.DATE_TIME)
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

	public String getApp_code() {
		return app_code;
	}

	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}
	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	// ---
	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}
	
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
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
	
	public String getMerchantRespMessage() {
		return merchantRespMessage;
	}
	public void setMerchantRespMessage(String merchantRespMessage) {
		this.merchantRespMessage = merchantRespMessage;
	}

	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public String getTelco() {
		if (StringUtils.isEmpty(this.telco))
			return StringUtils.trimToEmpty(Utils
					.findMobileOperatorCode(this.msisdn));
		return telco;
	}

	public void setTelco(String telco) {
		this.telco = telco;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	// ---
	public String getBillingStatus() {
		return this.billingStatus;
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

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getParams() {
		return this.params;
	}
	public void setParams(String params) {
		this.params = params;
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
}
