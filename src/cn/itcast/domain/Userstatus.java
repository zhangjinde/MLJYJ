package cn.itcast.domain;

import java.util.Date;

public class Userstatus {
	private Integer ust_id;
	private String title;
	private String instr;//心情寄语
	private Integer ust_um_id;//用户ID
	private String ust_nickname;//用户昵称
	private Date time;
	private Integer acceptgood;//点赞
	
	public String getUst_nickname() {
		return ust_nickname;
	}
	public void setUst_nickname(String ust_nickname) {
		this.ust_nickname = ust_nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getUst_id() {
		return ust_id;
	}
	public void setUst_id(Integer ust_id) {
		this.ust_id = ust_id;
	}
	public String getInstr() {
		return instr;
	}
	public void setInstr(String instr) {
		this.instr = instr;
	}
	public Integer getUst_um_id() {
		return ust_um_id;
	}
	public void setUst_um_id(Integer ust_um_id) {
		this.ust_um_id = ust_um_id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Integer getAcceptgood() {
		return acceptgood;
	}
	public void setAcceptgood(Integer acceptgood) {
		this.acceptgood = acceptgood;
	}
	
	
}
