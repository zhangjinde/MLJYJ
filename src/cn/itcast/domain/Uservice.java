package cn.itcast.domain;

import java.util.Date;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


@Cache(usage=CacheConcurrencyStrategy.NONE)
public class Uservice {
	private Integer uv_id;
	private String uv_name;
	private String gender;//性别
	private Date birthday;
	private String workunit;
	private String tel;
	private String weixin;
	private String qq;
	private Integer tree;
	private String headportrait_url;//用户头像路径
	private Family fy;
	private String email;
	private Integer isparent;//是否为父母
	private Integer islun;//是否为阴历
	private String openid;//绑定微信的openid
	
	
	
	
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getWorkunit() {
		return workunit;
	}
	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}
	public Integer getIslun() {
		return islun;
	}
	public void setIslun(Integer islun) {
		this.islun = islun;
	}
	public Integer getIsparent() {
		return isparent;
	}
	public Family getFy() {
		return fy;
	}
	public void setFy(Family fy) {
		this.fy = fy;
	}
	public Integer getUv_id() {
		return uv_id;
	}
	public void setUv_id(Integer uv_id) {
		this.uv_id = uv_id;
	}
	public String getHeadportrait_url() {
		return headportrait_url;
	}
	public void setHeadportrait_url(String headportrait_url) {
		this.headportrait_url = headportrait_url;
	}
	public Integer getTree() {
		return tree;
	}
	public void setTree(Integer tree) {
		this.tree = tree;
	}
	public String getUv_name() {
		return uv_name;
	}
	public void setUv_name(String uv_name) {
		this.uv_name = uv_name;
	}
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getWeixin() {
		return weixin;
	}
	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer isIsparent() {
		return isparent;
	}
	public void setIsparent(Integer isparent) {
		this.isparent = isparent;
	}
	
	
	
}
