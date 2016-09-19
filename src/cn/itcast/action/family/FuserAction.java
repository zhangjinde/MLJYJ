package cn.itcast.action.family;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Child;
import cn.itcast.domain.Family;
import cn.itcast.domain.Roles;
import cn.itcast.domain.Usermain;


import cn.itcast.service.ChildService;
import cn.itcast.service.RolesService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class FuserAction {
	@Resource
	UsermainService ums;
	@Resource
	UserviceService uvs;
	@Resource
	private RolesService rs;
	@Resource
	private ChildService cs;
	private Usermain umbean;
	private Integer um_id;
	private Integer family_id;
	private Integer child_id;
	private Child child;
	
	public Child getChild() {
		return child;
	}

	public void setChild(Child child) {
		this.child = child;
	}

	public Integer getChild_id() {
		return child_id;
	}

	public void setChild_id(Integer child_id) {
		this.child_id = child_id;
	}

	public Integer getFamily_id() {
		return family_id;
	}

	public void setFamily_id(Integer family_id) {
		this.family_id = family_id;
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
		family_id=ums.findById(um_id).getUservice().getFy().getFamily_id();
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
		if(umbean!=null&&uvs!=null&&ums!=null){
		uvs.update(umbean.getUservice());
		ums.update(umbean);
		family_id=umbean.getUservice().getFy().getFamily_id();
		return "success";
		}else{
			return "loginagain";
		}
	}
	
	public String addpa(){
		Family fy=ums.findById(um_id).getUservice().getFy();
		ActionContext.getContext().getSession().put("fy", fy);
		return "addpa";
	}
	
	public String delchild(){
		
		family_id=cs.findById(child_id).getChild_family().getFamily_id();
		cs.delchild(child_id);
		ActionContext.getContext().put("message", "删除成功");
		return "success";
	}
	
	public String updatechild(){
		child=cs.findById(child_id);
		return "childUI";
	}
	public String updatechilddo(){
		cs.update(child);
		family_id=child.getChild_family().getFamily_id();
		ActionContext.getContext().put("message", "更新成功");
		return "success";
	}
}
