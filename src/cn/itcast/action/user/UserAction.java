package cn.itcast.action.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Family;
import cn.itcast.domain.Roles;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;

import cn.itcast.service.RolesService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class UserAction {
	@Resource
	UsermainService ums;
	@Resource
	UserviceService uvs;
	@Resource
	private RolesService rs;
	private Usermain umbean;
	private Integer um_id;
	private Integer jf;
	private String username;
	private Integer family_id;
	private List<Family> list_family;


	public List<Family> getList_family() {
		return list_family;
	}

	public void setList_family(List<Family> list_family) {
		this.list_family = list_family;
	}

	public Integer getFamily_id() {
		return family_id;
	}

	public void setFamily_id(Integer family_id) {
		this.family_id = family_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getJf() {
		return jf;
	}

	public void setJf(Integer jf) {
		this.jf = jf;
	}

	public UserviceService getUvs() {
		return uvs;
	}

	public void setUvs(UserviceService uvs) {
		this.uvs = uvs;
	}

	public RolesService getRs() {
		return rs;
	}

	public void setRs(RolesService rs) {
		this.rs = rs;
	}

	public UsermainService getUms() {
		return ums;
	}

	public void setUms(UsermainService ums) {
		this.ums = ums;
	}

	public Usermain getUmbean() {
		return umbean;
	}

	public void setUmbean(Usermain umbean) {
		this.umbean = umbean;
	}

	public Integer getUm_id() {
		return um_id;
	}

	public void setUm_id(Integer Um_id) {
		this.um_id = Um_id;
	}

	public String del() {

		ums.del(um_id);
		return "success";
	}

	public String update() {
		List<Roles> rolelist = rs.findall();
		ActionContext.getContext().put("rolelist", rolelist);
		umbean = ums.findById(um_id);
		ActionContext.getContext().put("umbean", umbean);
		return "update";
	}

	public String updatedo() {
		uvs.update(umbean.getUservice());
		ums.update(umbean);
		return "success";
	}
	
	public String addpa(){
		Family fy=ums.findById(um_id).getUservice().getFy();
		ActionContext.getContext().getSession().put("fy", fy);
		return "addpa";
	}
	
	public String jf(){
		umbean=ums.findById(um_id);
		jf=umbean.getJf();
		username=umbean.getUservice().getUv_name();
		if(jf==null){
			jf=0;
		}
		return "jf";
	}
	
	public String changejf(){
			umbean=ums.findById(um_id);
			umbean.setJf(jf);
			ums.update(umbean);
		return null;
	}
	
	public String utof(){
		family_id=uvs.findById(um_id).getFy().getFamily_id();
		return "utof";
	}
	private String familypwd;
	private String searchtype;
	
	public String getSearchtype() {
		return searchtype;
	}

	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}

	public String getFamilypwd() {
		return familypwd;
	}

	public void setFamilypwd(String familypwd) {
		this.familypwd = familypwd;
	}

	public String getlovepwd(){
		umbean=ums.findById(um_id);
		familypwd=umbean.getUservice().getFy().getLovepwd();
		searchtype="爱情密码";
		return "getlovepwd";
	}
}
