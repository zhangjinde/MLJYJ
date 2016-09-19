package cn.itcast.domain;

public class TreeContent {
	private Integer tc_id;
	private String title;
	private String content;
	private String date;
	private Integer um_id;
	
	
	public Integer getUm_id() {
		return um_id;
	}
	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}
	public Integer getTc_id() {
		return tc_id;
	}
	public void setTc_id(Integer tc_id) {
		this.tc_id = tc_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
