package cn.itcast.domain;


public class OperationRecords {
	private Integer or_id;
	private String or_type;
	private Studio or_studio;
	private String record_time;
	
	public Integer getOr_id() {
		return or_id;
	}
	public void setOr_id(Integer or_id) {
		this.or_id = or_id;
	}
	public String getOr_type() {
		return or_type;
	}
	public void setOr_type(String or_type) {
		this.or_type = or_type;
	}
	public Studio getOr_studio() {
		return or_studio;
	}
	public void setOr_studio(Studio or_studio) {
		this.or_studio = or_studio;
	}
	public String getRecord_time() {
		return record_time;
	}
	public void setRecord_time(String record_time) {
		this.record_time = record_time;
	}
}
