package cn.itcast.domain;

public class City {
	private Integer id;
	private Integer	city_index;
	private Integer province_id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCity_index() {
		return city_index;
	}
	public void setCity_index(Integer city_index) {
		this.city_index = city_index;
	}
	public Integer getProvince_id() {
		return province_id;
	}
	public void setProvince_id(Integer province_id) {
		this.province_id = province_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
