package cn.itcast.domain;

public class Relation {
	private Integer r_id;
	private String r_label;//关系名称 比如父亲 母亲 朋友
	private String r_uname;//添加用户的姓名
	private String r_tel;//添加用户的联系方式
	private String r_head;
	public String getR_head() {
		return r_head;
	}
	public void setR_head(String r_head) {
		this.r_head = r_head;
	}
	public String getR_uname() {
		return r_uname;
	}
	public void setR_uname(String r_uname) {
		this.r_uname = r_uname;
	}
	public String getR_tel() {
		return r_tel;
	}
	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}
	private String r_eval;//我对他的评价、映像描述
	private Integer r_umid;//属于哪个用户
	private Integer r_whichgroup;//属于哪个分组1位亲人 2为朋友
	public Integer getR_whichgroup() {
		return r_whichgroup;
	}
	public void setR_whichgroup(Integer r_whichgroup) {
		this.r_whichgroup = r_whichgroup;
	}
	private Integer realman;//对应的真实用户usermain
	
	
	public Integer getRealman() {
		return realman;
	}
	public void setRealman(Integer realman) {
		this.realman = realman;
	}
	public Integer getR_umid() {
		return r_umid;
	}
	public void setR_umid(Integer r_umid) {
		this.r_umid = r_umid;
	}
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public String getR_label() {
		return r_label;
	}
	public void setR_label(String r_label) {
		this.r_label = r_label;
	}
	
	public String getR_eval() {
		return r_eval;
	}
	public void setR_eval(String r_eval) {
		this.r_eval = r_eval;
	}
	
	
}
