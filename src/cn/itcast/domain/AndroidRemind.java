package cn.itcast.domain;

import java.util.Date;

public class AndroidRemind {
	private String head_url;
	private String name;
	private Integer islun;
	private Date birthday;

	public String getHead_url() {
		return head_url;
	}
	public void setHead_url(String head_url) {
		this.head_url = head_url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getIslun() {
		return islun;
	}
	public void setIslun(Integer islun) {
		this.islun = islun;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
}
