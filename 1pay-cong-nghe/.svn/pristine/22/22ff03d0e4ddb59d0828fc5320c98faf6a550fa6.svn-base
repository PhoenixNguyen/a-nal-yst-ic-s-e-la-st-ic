package vn.onepay.money.flow.management.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;


@Document(collection="MoneyFlowCategory")
public class MoneyFlowCategory implements Serializable{
	/*
	 * parent_id : root=null else: parent_id = id
	 * type      : revenue & cost 
	 * title     : content
	 * status    : 1-active, 2-deleted
	 * code_name :
	 * sum_requesting : > 1 if contain requesting
	 * 
	 */

	private static final long serialVersionUID = -6289800405384922840L;
	public static String REVENUE_TYPE = "REVENUE";
	public static String COST_TYPE = "COST";
	
	@Id
	private String id;
	
	private String title;
	@DBRef
	private MoneyFlowCategory parentCategory;
	
	private String type;
	
	private float first_period;
	private float in_period;
	private float last_period;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date created_time;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date updated_time;
	
	private String account;
	private int status;
	
	private String code_name;
	
	private int sum_requesting;
	
	private int index;
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
	public int getSum_requesting() {
		return sum_requesting;
	}
	public void setSum_requesting(int sum_requesting) {
		this.sum_requesting = sum_requesting;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	
	public MoneyFlowCategory getParentCategory() {
		return parentCategory;
	}
	public void setParentCategory(MoneyFlowCategory parentCategory) {
		this.parentCategory = parentCategory;
	}
}
