package cn.itcast.domain;

import java.sql.Date;



public class Child {
	private Integer child_id;
	
	private String child_name;
	private String child_gender;
	private Date child_birthday;
	private Family child_family;
	private Integer islun;//�Ƿ�Ϊ����
	private String headurl;
	
	public String getHeadurl() {
		return headurl;
	}
	public void setHeadurl(String headurl) {
		this.headurl = headurl;
	}
	public Integer getIslun() {
		return islun;
	}
	public void setIslun(Integer islun) {
		this.islun = islun;
	}
	public String getChild_gender() {
		return child_gender;
	}
	public void setChild_gender(String child_gender) {
		this.child_gender = child_gender;
	}
	public Integer getChild_id() {
		return child_id;
	}
	public void setChild_id(Integer child_id) {
		this.child_id = child_id;
	}
	public Family getChild_family() {
		return child_family;
	}
	public void setChild_family(Family child_family) {
		this.child_family = child_family;
	}
	public String getChild_name() {
		return child_name;
	}
	public void setChild_name(String child_name) {
		this.child_name = child_name;
	}
	public Date getChild_birthday() {
		return child_birthday;
	}
	public void setChild_birthday(Date child_birthday) {
		this.child_birthday = child_birthday;
	}
	
	
}
