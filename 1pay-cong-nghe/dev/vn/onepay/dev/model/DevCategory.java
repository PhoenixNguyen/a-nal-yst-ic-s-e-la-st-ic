package vn.onepay.dev.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@SuppressWarnings("serial")
@Document(collection = "DevCategory")
@TypeAlias("devCategory")
public class DevCategory implements Serializable {
	public static final String 		STATUS_PUBLISH 		= "publish";
	public static final String 		STATUS_UNPUBLISH 	= "unpublish";
	public static final String 		STATUS_PRIVATE 		= "private";
	public static final String 		STATUS_DELETE 		= "delete";
	public static final String[] 	ALL_STATUS	 		= {STATUS_DELETE, STATUS_PUBLISH, STATUS_UNPUBLISH, STATUS_PRIVATE};
	public static final String[] 	ALL_ADMIN_STATUS	= {STATUS_PUBLISH, STATUS_UNPUBLISH, STATUS_PRIVATE};
	
	public static final String 		CATEGORY_TYPE_NORMAL 		= "normal";
	public static final String 		CATEGORY_TYPE_POPULATION 	= "population";
	public static final String[] 	ALL_CATEGORY_TYPE 			= {CATEGORY_TYPE_NORMAL, CATEGORY_TYPE_POPULATION};
	
	@Id
	private String 		id;
	@DBRef
	private DevCategory parent;
	private String		icon;
	private String 		title;
	private String 		url;
	private String 		category_type = CATEGORY_TYPE_NORMAL;
	private String		description;
	private int 		order = 999;
	private String 		status = STATUS_PRIVATE;
	private String		updated_by;
	private String		created_by;
	private List<DevCategory> childs;
	
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
	public DevCategory getParent() {
		return parent;
	}
	public void setParent(DevCategory parent) {
		this.parent = parent;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
	public String getCategory_type() {
		return category_type;
	}
	public void setCategory_type(String category_type) {
		this.category_type = category_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public List<DevCategory> getChilds() {
		return childs;
	}
	public void setChilds(List<DevCategory> childs) {
		this.childs = childs;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
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
