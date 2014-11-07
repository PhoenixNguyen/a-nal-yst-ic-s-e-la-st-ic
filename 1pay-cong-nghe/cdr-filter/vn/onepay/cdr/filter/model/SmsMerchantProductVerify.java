package vn.onepay.cdr.filter.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONObject;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.index.CompoundIndexes;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.mongodb.DBObject;
import com.mongodb.util.JSON;

@Document(collection = "SmsMerchantProductVerify")
@CompoundIndexes(value = { @CompoundIndex(name = "merchant_provider_command_idx", def = "{'merchant' : 1, 'provider' : 1, 'command_code': 1}", unique=true) })
@TypeAlias("smsMerchantProductVerify")
public class SmsMerchantProductVerify {

	final public static String BEAN_NAME = "smsMerchantProductVerify";
	final public static String COLLECTION_NAME = "SmsMerchantProductVerify";
	
	public final static String INIT_STATUS		="init";
	public final static String PENDING_STATUS	="pending";
	public final static String APPROVED_STATUS	="approved";
	public final static String REJECT_STATUS	="reject";
	
	@Id
	private String id;
	@Indexed
	private String merchant;
	private String app_code;
	private String command_code;
	@Indexed
	private String provider;
	private String comment;
	private String log;
	@Indexed
	private String status = INIT_STATUS; 
	
	@Indexed
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private java.util.Date created_time = new Date();
	
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private java.util.Date updated_time = new Date();
	
	public SmsMerchantProductVerify() {
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

	public String getApp_code() {
		return app_code;
	}
	
	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}
	
	public String getCommand_code() {
		return command_code;
	}

	public void setCommand_code(String command_code) {
		this.command_code = command_code;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public String getLastLog() {
		String lastLog = "";
		try {
			String[] logs = this.log.split("\r\n#\r\n");
			lastLog = logs[logs.length - 1];
		} catch (Exception e) {
		}
		return lastLog;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public java.util.Date getCreated_time() {
		return created_time;
	}

	public void setCreated_time(java.util.Date created_time) {
		this.created_time = created_time;
	}

	public java.util.Date getUpdated_time() {
		return updated_time;
	}

	public void setUpdated_time(java.util.Date updated_time) {
		this.updated_time = updated_time;
	}
	
	private static DateFormat isoDateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
	public static SmsMerchantProductVerify dbObjectToPojo(DBObject obj) {
		SmsMerchantProductVerify smsMerchantProductVerify = null;
		try{
			JSONObject jsonObject = new JSONObject(JSON.serialize(obj));

			smsMerchantProductVerify = new SmsMerchantProductVerify();
			
			smsMerchantProductVerify.setId(((JSONObject)jsonObject.get("_id")).get("$oid").toString());
			
			try{
				if(jsonObject.has("command_code"))
					smsMerchantProductVerify.setCommand_code(jsonObject.getString("command_code"));
				if(jsonObject.has("provider"))
					smsMerchantProductVerify.setProvider(jsonObject.getString("provider"));
				if(jsonObject.has("merchant"))
					smsMerchantProductVerify.setMerchant(jsonObject.getString("merchant"));
				if(jsonObject.has("app_code"))
					smsMerchantProductVerify.setApp_code(jsonObject.getString("app_code"));
				if(jsonObject.has("comment"))
					smsMerchantProductVerify.setComment(jsonObject.getString("comment"));
				if(jsonObject.has("log"))
					smsMerchantProductVerify.setLog(jsonObject.getString("log"));
				if(jsonObject.has("status"))
					smsMerchantProductVerify.setStatus(jsonObject.getString("status"));
				
			}catch(Exception e){}
			try{
				if(jsonObject.has("created_time")){
					Date created_time = isoDateTimeFormat.parse(((JSONObject)jsonObject.get("created_time")).getString("$date"));
					smsMerchantProductVerify.setCreated_time(created_time);
				}
			}catch(Exception e){}
			try{
				if(jsonObject.has("updated_time")){
					Date updated_time = isoDateTimeFormat.parse(((JSONObject)jsonObject.get("updated_time")).getString("$date"));
					smsMerchantProductVerify.setUpdated_time(updated_time);
				}
			}catch(Exception e){}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return smsMerchantProductVerify;
	}
}
