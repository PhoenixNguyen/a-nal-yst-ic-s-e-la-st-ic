package vn.onepay.money.flow.management.model;

public class Report {
	private String stt;
	private String content;
	private float first_period;
	private float in_period;
	private float last_period;
	
	public String getStt() {
		return stt;
	}
	public void setStt(String stt) {
		this.stt = stt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
}
