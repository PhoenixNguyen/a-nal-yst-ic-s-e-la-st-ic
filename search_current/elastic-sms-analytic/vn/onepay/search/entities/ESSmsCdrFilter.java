package vn.onepay.search.entities;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldIndex;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.format.annotation.DateTimeFormat;

@Document(indexName = "sms-filter-index", type = "sms-filter-index", shards = 1, replicas = 0, refreshInterval = "-1", indexStoreType = "fs")
public class ESSmsCdrFilter {
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
	private int amount;
	private String command_code;
	private String short_code;
	private String mo_message;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private Date request_time;

	private String filterType = FilterType.OVER_03_MESSAGES_LIMIT_PER_05_MINUTES;

	public ESSmsCdrFilter() {
	}

	public ESSmsCdrFilter(String id, String merchant, String app_id, String provider, String telco, String msisdn, int amount, String command_code,
      String short_code, String mo_message, Date request_time) {
    super();
    this.id = id;
    this.merchant = merchant;
    this.app_id = app_id;
    this.provider = provider;
    this.telco = telco;
    this.msisdn = msisdn;
    this.amount = amount;
    this.command_code = command_code;
    this.short_code = short_code;
    this.mo_message = mo_message;
    this.request_time = request_time;
  }
	
	public ESSmsCdrFilter(String id, String merchant, String app_id, String provider, String telco, String msisdn, int amount, String command_code,
			String short_code, String mo_message, Date request_time, String filterType) {
		super();
		this.id = id;
		this.merchant = merchant;
		this.app_id = app_id;
		this.provider = provider;
		this.telco = telco;
		this.msisdn = msisdn;
		this.amount = amount;
		this.command_code = command_code;
		this.short_code = short_code;
		this.mo_message = mo_message;
		this.request_time = request_time;
		this.filterType = filterType;
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

	public Date getRequest_time() {
		return request_time;
	}

	public void setRequest_time(Date request_time) {
		this.request_time = request_time;
	}

	public String getFilterType() {
		return this.filterType;
	}

	public void setFilterType(String filterType) {
		this.filterType = filterType;
	}

}
