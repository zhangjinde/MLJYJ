package cn.itcast.domain.android;

import java.util.Date;

public class Release {
	private Integer re_id;   //发布ID
	public String headurl;
	public String nickname;
	public String re_media_img;
	
	public String getRe_media_img() {
		return re_media_img;
	}

	public void setRe_media_img(String re_media_img) {
		this.re_media_img = re_media_img;
	}

	public String getHeadurl() {
		return headurl;
	}

	public void setHeadurl(String headurl) {
		this.headurl = headurl;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	private String re_content;  //发布内容
	
	private String re_media;    //发布的视频
	
	private Integer dianancount;  //点赞次数
	
	private Integer pingluncount;   //发布评论次数
	
	private Integer u_id;    //用户ID
	
	private String re_city;    //所在区域
	
	public Integer getRe_id() {
		return re_id;
	}

	public void setRe_id(Integer re_id) {
		this.re_id = re_id;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_media() {
		return re_media;
	}

	public void setRe_media(String re_media) {
		this.re_media = re_media;
	}

	public Integer getDianancount() {
		return dianancount;
	}

	public void setDianancount(Integer dianancount) {
		this.dianancount = dianancount;
	}

	public Integer getPingluncount() {
		return pingluncount;
	}

	public void setPingluncount(Integer pingluncount) {
		this.pingluncount = pingluncount;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public String getRe_city() {
		return re_city;
	}

	public void setRe_city(String re_city) {
		this.re_city = re_city;
	}
	

	
	
	

}
