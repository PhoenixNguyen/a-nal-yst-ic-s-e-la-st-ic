package vn.onepay.merchant.product.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Document(collection="ProductVerify")
public class ProductVerify implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static int INIT_STATUS 				= 0;
	public static int SUGGESTED_REJECTED_STATUS = 1;
	public static int SUGGESTED_STATUS 			= 2;
	public static int APPROVED_REJECTED_STATUS 	= 3;
	public static int APPROVED_STATUS 			= 4;
	
	@Id
	private String id;
	private String app_code;
	private String charging_type;
	private int version;
	
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private Date created_date;
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private Date expired_date;
	
	private int status;
	private String title;
	
	private String description;
	private String image_profile;
	private String bizz_channel;
	private String[] list_attachment;
	
	private String reject_reason;
	
	public String getReject_reason() {
		return reject_reason;
	}
	public void setReject_reason(String reject_reason) {
		this.reject_reason = reject_reason;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getApp_code() {
		return app_code;
	}
	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}
	public String getCharging_type() {
		return charging_type;
	}
	public void setCharging_type(String charging_type) {
		this.charging_type = charging_type;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getExpired_date() {
		return expired_date;
	}
	public void setExpired_date(Date expired_date) {
		this.expired_date = expired_date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage_profile() {
		return image_profile;
	}
	public void setImage_profile(String image_profile) {
		this.image_profile = image_profile;
	}
	public String getBizz_channel() {
		return bizz_channel;
	}
	public void setBizz_channel(String bizz_channel) {
		this.bizz_channel = bizz_channel;
	}
	public String[] getList_attachment() {
		return list_attachment;
	}
	public void setList_attachment(String[] list_attachment) {
		this.list_attachment = list_attachment;
	}
	
}
