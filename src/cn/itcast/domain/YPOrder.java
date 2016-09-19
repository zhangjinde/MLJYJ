package cn.itcast.domain;

import java.util.Date;

public class YPOrder {
	private Integer id;
	private Integer pid;
	private Integer cid;
	private Integer sy_id;//摄影师ID
	private String sy_name;//摄影师姓名
	private Integer hz_id;
	private String hz_name;
	private String user_name;
	private String tel;
	private String bz;
	private Date time;
	private boolean ischeck;
	public boolean isIscheck() {
		return ischeck;
	}
	public void setIscheck(boolean ischeck) {
		this.ischeck = ischeck;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getSy_id() {
		return sy_id;
	}
	public void setSy_id(Integer sy_id) {
		this.sy_id = sy_id;
	}
	public String getSy_name() {
		return sy_name;
	}
	public void setSy_name(String sy_name) {
		this.sy_name = sy_name;
	}
	public Integer getHz_id() {
		return hz_id;
	}
	public void setHz_id(Integer hz_id) {
		this.hz_id = hz_id;
	}
	public String getHz_name() {
		return hz_name;
	}
	public void setHz_name(String hz_name) {
		this.hz_name = hz_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
}
