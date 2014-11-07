package vn.onepay.money.flow.management.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Document(collection="MoneyFlowRecord")
public class MoneyFlowRecord implements Serializable{
	/**
	 * status    : 1-active, 2-deleted
	 * month_year with format: MM/yyyy
	 * request: requesting, accepted, rejected
	 * generated: 1: generated, 2 not yet
	 * 
	 */
	private static final long serialVersionUID = -5854322788026423708L;
	public static String REQUESTING = "requesting";
	public static String ACCEPTED = "accepted";
	public static String REJECTED = "rejected";
	
	@Id
	private String id;
	
	private String category_id;
	
	private String type;
	
	private String title;
	
	private float first_period;
	private float in_period;
	private float last_period;
	
	private String period;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date month_year;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date created_time;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date updated_time;
	
	private String account;
	private int status;
	
	private String code_name;
	
	private String description;
	
	private String request;
	
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}

	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public float getFirst_period() {
		return first_period;
	}
	public void setFirst_period(float first_period) {
		this.first_period = first_period;
	}
	public float getIn_period() {
		return in_period;
	}
	public void setIn_period(float in_period) {
		this.in_period = in_period;
	}
	public float getLast_period() {
		return last_period;
	}
	public void setLast_period(float last_period) {
		this.last_period = last_period;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public Date getMonth_year() {
		return month_year;
	}
	public void setMonth_year(Date month_year) {
		this.month_year = month_year;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public Date getUpdated_time() {
		return updated_time;
	}
	public void setUpdated_time(Date updated_time) {
		this.updated_time = updated_time;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public MoneyFlowRecord(){
		
	}
	

	public MoneyFlowRecord(String type, String title, float first_period,
			float in_period, float last_period, String account) {
		super();
		this.type = type;
		this.title = title;
		this.first_period = first_period;
		this.in_period = in_period;
		this.last_period = last_period;
		this.account = account;
	}

	public MoneyFlowRecord(String category_id, String type, String title,
			float first_period, float in_period, float last_period,
			String period, Date month_year, Date created_time,
			Date updated_time, String account, int status) {
		super();
		this.category_id = category_id;
		this.type = type;
		this.title = title;
		this.first_period = first_period;
		this.in_period = in_period;
		this.last_period = last_period;
		this.period = period;
		this.month_year = month_year;
		this.created_time = created_time;
		this.updated_time = updated_time;
		this.account = account;
		this.status = status;
	}
}
