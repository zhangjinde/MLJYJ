package cn.itcast.domain;

public class XiaoFei {
	private Integer xf_id;
	private String xf_project;
	private Integer xf_money;
	private String xf_other;//备注说明之类的
	private Family xf_family;
	public Family getXf_family() {
		return xf_family;
	}
	public void setXf_family(Family xf_family) {
		this.xf_family = xf_family;
	}
	public Integer getXf_id() {
		return xf_id;
	}
	public void setXf_id(Integer xf_id) {
		this.xf_id = xf_id;
	}
	public String getXf_project() {
		return xf_project;
	}
	public void setXf_project(String xf_project) {
		this.xf_project = xf_project;
	}
	public Integer getXf_money() {
		return xf_money;
	}
	public void setXf_money(Integer xf_money) {
		this.xf_money = xf_money;
	}
	public String getXf_other() {
		return xf_other;
	}
	public void setXf_other(String xf_other) {
		this.xf_other = xf_other;
	}
	
}
