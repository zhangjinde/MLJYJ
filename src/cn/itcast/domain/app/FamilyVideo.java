package cn.itcast.domain.app;

public class FamilyVideo {
	private Integer fv_id;
	private String fv_title;
	private String fv_introduction;
	private String fv_videourl;
	private String fv_place;
	private String fv_time;
	private Integer fv_familyid;
	private Integer state;
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getFv_familyid() {
		return fv_familyid;
	}
	public void setFv_familyid(Integer fv_familyid) {
		this.fv_familyid = fv_familyid;
	}
	public Integer getFv_id() {
		return fv_id;
	}
	public void setFv_id(Integer fv_id) {
		this.fv_id = fv_id;
	}
	public String getFv_title() {
		return fv_title;
	}
	public void setFv_title(String fv_title) {
		this.fv_title = fv_title;
	}
	public String getFv_introduction() {
		return fv_introduction;
	}
	public void setFv_introduction(String fv_introduction) {
		this.fv_introduction = fv_introduction;
	}
	public String getFv_videourl() {
		return fv_videourl;
	}
	public void setFv_videourl(String fv_videourl) {
		this.fv_videourl = fv_videourl;
	}
	public String getFv_place() {
		return fv_place;
	}
	public void setFv_place(String fv_place) {
		this.fv_place = fv_place;
	}
	public String getFv_time() {
		return fv_time;
	}
	public void setFv_time(String fv_time) {
		this.fv_time = fv_time;
	}
	

}
