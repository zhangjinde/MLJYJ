package cn.itcast.domain;

public class UserstatusComments {
	private Integer usc_id;
	private String str;
	private Integer usc_ust_id;//评论的ID
	private Integer usc_um_id;//谁评论的
	public Integer getUsc_id() {
		return usc_id;
	}
	public void setUsc_id(Integer usc_id) {
		this.usc_id = usc_id;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public Integer getUsc_ust_id() {
		return usc_ust_id;
	}
	public void setUsc_ust_id(Integer usc_ust_id) {
		this.usc_ust_id = usc_ust_id;
	}
	public Integer getUsc_um_id() {
		return usc_um_id;
	}
	public void setUsc_um_id(Integer usc_um_id) {
		this.usc_um_id = usc_um_id;
	}
}
