package vn.onepay.charging.card.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Document(collection="CardCharging.CardCdr.MaintenanceCalendar")
@TypeAlias("cardCharging.CardCdr.MaintenanceCalendar")
public class MaintenanceCalendar {
  @Id
  private String id;
  private String title;
  private String telco;
  @DateTimeFormat(iso=ISO.DATE_TIME)
  private Date from_time;
  @DateTimeFormat(iso=ISO.DATE_TIME)
  private Date end_time;
  
  private int status;
  
  @DateTimeFormat(iso=ISO.DATE_TIME)
  private Date created_time;
  @DateTimeFormat(iso=ISO.DATE_TIME)
  private Date updated_time;
  
  private String note;
  
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

  public String getTelco() {
    return telco;
  }

  public void setTelco(String telco) {
    this.telco = telco;
  }

  public Date getFrom_time() {
    return from_time;
  }

  public void setFrom_time(Date from_time) {
    this.from_time = from_time;
  }

  public Date getEnd_time() {
    return end_time;
  }

  public void setEnd_time(Date end_time) {
    this.end_time = end_time;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
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

  public String getNote() {
    return note;
  }

  public void setNote(String note) {
    this.note = note;
  }

  
}
