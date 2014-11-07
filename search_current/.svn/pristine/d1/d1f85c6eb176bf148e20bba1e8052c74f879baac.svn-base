package vn.onepay.search.entities;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldIndex;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.format.annotation.DateTimeFormat;

@Document(indexName = "sms-index", type = "sms-index", shards = 1, replicas = 0, refreshInterval = "-1", indexStoreType = "fs")
public class ESSmsCdr {
	/*
	 * comman code - gamcode short code 9029 app-id - cotent id merchant - cp
	 * code
	 */

	@Id
	private String id;
	@Field(type = FieldType.String, store = true, index = FieldIndex.not_analyzed)
	private String merchant;
	private String app_id;
	@Field(type = FieldType.String, store = true, index = FieldIndex.not_analyzed)
	private String provider;
	@Field(type = FieldType.String, store = true, index = FieldIndex.not_analyzed)
	private String telco;
	@Field(type = FieldType.String, store = true, index = FieldIndex.not_analyzed)
	private String msisdn;
	private String short_code;
	private int amount;
	private String command_code;
	private String mo_message;
	private String mt_message;
	private String billing_status;
	private String status;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date request_time;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date response_time;

	public ESSmsCdr() {
	}

	public ESSmsCdr(String id, String merchant, String app_id, String provider, String telco, String msisdn, String short_code, int amount,
			String command_code, String mo_message, String mt_message, String billing_status, String status, Date request_time, Date response_time) {
		super();
		this.id = id;
		this.merchant = merchant;
		this.app_id = app_id;
		this.provider = provider;
		this.telco = telco;
		this.msisdn = msisdn;
		this.short_code = short_code;
		this.amount = amount;
		this.command_code = command_code;
		this.mo_message = mo_message;
		this.mt_message = mt_message;
		this.billing_status = billing_status;
		this.status = status;
		this.request_time = request_time;
		this.response_time = response_time;
	}

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

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public String getTelco() {
		return telco;
	}

	public void setTelco(String telco) {
		this.telco = telco;
	}

	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCommand_code() {
		return command_code;
	}

	public void setCommand_code(String command_code) {
		this.command_code = command_code;
	}

	public String getShort_code() {
		return short_code;
	}

	public void setShort_code(String short_code) {
		this.short_code = short_code;
	}

	public String getMo_message() {
		return mo_message;
	}

	public void setMo_message(String mo_message) {
		this.mo_message = mo_message;
	}

	public String getMt_message() {
		return this.mt_message;
	}

	public void setMt_message(String mt_message) {
		this.mt_message = mt_message;
	}

	public String getBilling_status() {
		return this.billing_status;
	}

	public void setBilling_status(String billing_status) {
		this.billing_status = billing_status;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRequest_time() {
		return request_time;
	}

	public void setRequest_time(Date request_time) {
		this.request_time = request_time;
	}

	public Date getResponse_time() {
		return this.response_time;
	}

	public void setResponse_time(Date response_time) {
		this.response_time = response_time;
	}
}
