package cn.itcast.domain;

public class Employees {
	private Integer e_id;
	private String e_name;
	private String jianjie;//简介
	private String ry_one;//荣誉1
	private String ry_two;//荣誉2
	private String img_one;
	private String img_two;
	private String img_three;
	private String img_four;
	private String img_five;
	private String img_six;
	private String professional;//职业
	private Integer province_id;//省
	private Integer city_id;//市
	private String img_head;//头像
	
	public String getImg_head() {
		return img_head;
	}
	public void setImg_head(String img_head) {
		this.img_head = img_head;
	}
	public Integer getProvince_id() {
		return province_id;
	}
	public void setProvince_id(Integer province_id) {
		this.province_id = province_id;
	}
	public Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}
	public Integer getE_id() {
		return e_id;
	}
	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	
	public String getJianjie() {
		return jianjie;
	}
	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}
	public String getRy_one() {
		return ry_one;
	}
	public void setRy_one(String ry_one) {
		this.ry_one = ry_one;
	}
	public String getRy_two() {
		return ry_two;
	}
	public void setRy_two(String ry_two) {
		this.ry_two = ry_two;
	}
	public String getImg_one() {
		return img_one;
	}
	public void setImg_one(String img_one) {
		this.img_one = img_one;
	}
	public String getImg_two() {
		return img_two;
	}
	public void setImg_two(String img_two) {
		this.img_two = img_two;
	}
	public String getImg_three() {
		return img_three;
	}
	public void setImg_three(String img_three) {
		this.img_three = img_three;
	}
	public String getImg_four() {
		return img_four;
	}
	public void setImg_four(String img_four) {
		this.img_four = img_four;
	}
	public String getImg_five() {
		return img_five;
	}
	public void setImg_five(String img_five) {
		this.img_five = img_five;
	}
	public String getImg_six() {
		return img_six;
	}
	public void setImg_six(String img_six) {
		this.img_six = img_six;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	
}
