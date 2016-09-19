package cn.itcast.domain.android;

import java.util.Date;

public class Reply {
	
	private Integer r_id;  //评论ID
	
	private Integer re_id; //发布心情消息id
	
	private Integer fbus_id; //发布人的ID
	
	private Integer hfus_id; //回复人的ID
	
	private String hfcontent; //回复内容
	
	private Date hftime;  //回复时间

	public Integer getR_id() {
		return r_id;
	}

	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}

	public Integer getRe_id() {
		return re_id;
	}

	public void setRe_id(Integer re_id) {
		this.re_id = re_id;
	}

	public Integer getFbus_id() {
		return fbus_id;
	}

	public void setFbus_id(Integer fbus_id) {
		this.fbus_id = fbus_id;
	}

	public Integer getHfus_id() {
		return hfus_id;
	}

	public void setHfus_id(Integer hfus_id) {
		this.hfus_id = hfus_id;
	}

	public String getHfcontent() {
		return hfcontent;
	}

	public void setHfcontent(String hfcontent) {
		this.hfcontent = hfcontent;
	}

	public Date getHftime() {
		return hftime;
	}

	public void setHftime(Date hftime) {
		this.hftime = hftime;
	}
	
	

	

}
