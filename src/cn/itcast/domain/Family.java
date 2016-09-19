package cn.itcast.domain;

import java.sql.Date;






public class Family {
	private Integer family_id;
	
	private String family_address;
	private String home_phone;
	private String lovepwd;
	private Integer consumption;//消费
	private Date marrydate;
	private Date childbirth;//预产期
	private String home_instructions;
	private Studio family_studio;
	private Integer handover_studio;
	private String postnum;//护照编号
	private Integer islun;//是否以阴历
	private Integer um_id;//影楼分店的对应家庭ID
	private String regtime;
	private Integer treedone;//是否修改过家谱
	

	
	public Integer getTreedone() {
		return treedone;
	}
	public void setTreedone(Integer treedone) {
		this.treedone = treedone;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public Integer getUm_id() {
		return um_id;
	}
	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}
	public Integer getIslun() {
		return islun;
	}
	public void setIslun(Integer islun) {
		this.islun = islun;
	}
	public Date getChildbirth() {
		return childbirth;
	}
	public void setChildbirth(Date childbirth) {
		this.childbirth = childbirth;
	}
	public String getPostnum() {
		return postnum;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}
	public Integer getHandover_studio() {
		return handover_studio;
	}
	public void setHandover_studio(Integer handover_studio) {
		this.handover_studio = handover_studio;
	}
	//	
	public Family() {
		
	}
	public Family(String family_address) {
		this.family_address = family_address;
	}
	public Studio getFamily_studio() {
		return family_studio;
	}
	public void setFamily_studio(Studio family_studio) {
		this.family_studio = family_studio;
	}
	

	public Integer getFamily_id() {
		return family_id;
	}
	public void setFamily_id(Integer family_id) {
		this.family_id = family_id;
	}
	public String getFamily_address() {
		return family_address;
	}
	public void setFamily_address(String family_address) {
		this.family_address = family_address;
	}
	public String getHome_phone() {
		return home_phone;
	}
	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}
	public String getLovepwd() {
		return lovepwd;
	}
	public void setLovepwd(String lovepwd) {
		this.lovepwd = lovepwd;
	}
	public Integer getConsumption() {
		return consumption;
	}
	public void setConsumption(Integer consumption) {
		this.consumption = consumption;
	}
	public Date getMarrydate() {
		return marrydate;
	}
	public void setMarrydate(Date marrydate) {
		this.marrydate = marrydate;
	}
	public String getHome_instructions() {
		return home_instructions;
	}
	public void setHome_instructions(String home_instructions) {
		this.home_instructions = home_instructions;
	}
	


}
