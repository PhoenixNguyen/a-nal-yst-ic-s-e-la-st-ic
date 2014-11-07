package vn.onepay.dev.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@SuppressWarnings("serial")
@Document(collection = "DevArticle")
@TypeAlias("devArticle")
public class DevArticle implements Serializable {
	public static final String 		STATUS_PUBLISH 		= "publish";
	public static final String 		STATUS_UNPUBLISH 	= "unpublish";
	public static final String 		STATUS_PRIVATE 		= "private";
	public static final String 		STATUS_DELETE 		= "delete";
	public static final String[] 	ALL_STATUS	 		= {STATUS_DELETE, STATUS_PUBLISH, STATUS_UNPUBLISH, STATUS_PRIVATE};
	public static final String[] 	ALL_ADMIN_STATUS	= {STATUS_PUBLISH, STATUS_UNPUBLISH, STATUS_PRIVATE};
	
	@Id
	private String 		id;
	@DBRef
	private DevCategory dev_category;
	private String 		avatar;
	private String 		title;
	private String		description;
	private String 		content;
	private int 		order = 999;    // Thứ tự xuất hiện trong Subcategory
	private String 		status = STATUS_PRIVATE;
	private String		updated_by;
	private String		created_by;
	private String[]	tags;
	private String		author;
	private boolean		is_intro;
	
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private Date created_time;
	@DateTimeFormat(iso=ISO.DATE_TIME)
	private Date updated_time;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public DevCategory getDev_category() {
		return dev_category;
	}
	public void setDev_category(DevCategory dev_category) {
		this.dev_category = dev_category;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String[] getTags() {
		return tags;
	}
	public void setTags(String[] tags) {
		this.tags = tags;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public boolean isIs_intro() {
		return is_intro;
	}
	public void setIs_intro(boolean is_intro) {
		this.is_intro = is_intro;
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
}
