package cn.itcast.domain;

public class MarketResearch {
	private Integer mr_id;
	private String mr_name;
	private String mr_instructions;
	private Integer mr_num_agreed;
	private Integer mr_num_refused;
	
	public Integer getMr_id() {
		return mr_id;
	}
	public void setMr_id(Integer mr_id) {
		this.mr_id = mr_id;
	}
	public String getMr_name() {
		return mr_name;
	}
	public void setMr_name(String mr_name) {
		this.mr_name = mr_name;
	}
	public String getMr_instructions() {
		return mr_instructions;
	}
	public void setMr_instructions(String mr_instructions) {
		this.mr_instructions = mr_instructions;
	}
	public Integer getMr_num_agreed() {
		return mr_num_agreed;
	}
	public void setMr_num_agreed(Integer mr_num_agreed) {
		this.mr_num_agreed = mr_num_agreed;
	}
	public Integer getMr_num_refused() {
		return mr_num_refused;
	}
	public void setMr_num_refused(Integer mr_num_refused) {
		this.mr_num_refused = mr_num_refused;
	}
}
