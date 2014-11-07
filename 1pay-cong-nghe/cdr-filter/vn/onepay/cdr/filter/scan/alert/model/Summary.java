package vn.onepay.cdr.filter.scan.alert.model;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import vn.onepay.cdr.filter.model.SmsCdrFilter;

@XmlRootElement(name = "summary")
@XmlAccessorType (XmlAccessType.FIELD)
public class Summary implements Serializable{
	@XmlElement(name = "fromTime")
	private String fromTime;
	@XmlElement(name = "toTime")
	private String toTime;
	@XmlElement(name = "msisdn")
    private List<SmsCdrFilter> msisdns = null;
	@XmlElement(name = "merchant")
    private List<SmsCdrFilter> merchants = null;
	
	public String getFromTime() {
		return this.fromTime;
	}
	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}
	public String getToTime() {
		return this.toTime;
	}
	public void setToTime(String toTime) {
		this.toTime = toTime;
	}
	public List<SmsCdrFilter> getMsisdns() {
		return this.msisdns;
	}
	public void setMsisdns(List<SmsCdrFilter> msisdns) {
		this.msisdns = msisdns;
	}
	
	public List<SmsCdrFilter> getMerchants() {
		return this.merchants;
	}
	
	public void setMerchants(List<SmsCdrFilter> merchants) {
		this.merchants = merchants;
	}
}
