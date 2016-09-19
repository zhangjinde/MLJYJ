package cn.itcast.domain;

public class RealTimeDynamic {
	private Integer rtd_id;
	private String rtd_title;
	private String rtd_body;
	private String rtd_pic_url;
	
	public Integer getRtd_id() {
		return rtd_id;
	}
	public void setRtd_id(Integer rtd_id) {
		this.rtd_id = rtd_id;
	}
	public String getRtd_body() {
		return rtd_body;
	}
	public void setRtd_body(String rtd_body) {
		this.rtd_body = rtd_body;
	}
	public String getRtd_title() {
		return rtd_title;
	}
	public void setRtd_title(String rtd_title) {
		this.rtd_title = rtd_title;
	}
	
	public String getRtd_pic_url() {
		return rtd_pic_url;
	}
	public void setRtd_pic_url(String rtd_pic_url) {
		this.rtd_pic_url = rtd_pic_url;
	}
}
