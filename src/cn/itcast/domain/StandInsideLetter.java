package cn.itcast.domain;

public class StandInsideLetter {
	private Integer sil_id;
	private String sil_title;
	private String sil_user_send;
	private String sil_user_accept;
	private String 	sil_content;
	private boolean isread;
	
	public Integer getSil_id() {
		return sil_id;
	}
	public void setSil_id(Integer sil_id) {
		this.sil_id = sil_id;
	}
	public String getSil_title() {
		return sil_title;
	}
	public void setSil_title(String sil_title) {
		this.sil_title = sil_title;
	}
	public String getSil_user_send() {
		return sil_user_send;
	}
	public void setSil_user_send(String sil_user_send) {
		this.sil_user_send = sil_user_send;
	}
	public String getSil_user_accept() {
		return sil_user_accept;
	}
	public void setSil_user_accept(String sil_user_accept) {
		this.sil_user_accept = sil_user_accept;
	}
	public String getSil_content() {
		return sil_content;
	}
	public void setSil_content(String sil_content) {
		this.sil_content = sil_content;
	}
	public boolean isIsread() {
		return isread;
	}
	public void setIsread(boolean isread) {
		this.isread = isread;
	}
}
