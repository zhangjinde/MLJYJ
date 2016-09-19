package cn.itcast.domain;

public class Package {
	private Integer package_id;
	private String package_name;
	private Integer package_price;
	private String package_instructions;
	private String package_pic_url;//Ì×²ÍÍ¼Æ¬Â·¾¢
	
	public Integer getPackage_id() {
		return package_id;
	}
	public void setPackage_id(Integer package_id) {
		this.package_id = package_id;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public Integer getPackage_price() {
		return package_price;
	}
	public void setPackage_price(Integer package_price) {
		this.package_price = package_price;
	}
	public String getPackage_instructions() {
		return package_instructions;
	}
	public void setPackage_instructions(String package_instructions) {
		this.package_instructions = package_instructions;
	}
	public String getPackage_pic_url() {
		return package_pic_url;
	}
	public void setPackage_pic_url(String package_pic_url) {
		this.package_pic_url = package_pic_url;
	}
	
}
