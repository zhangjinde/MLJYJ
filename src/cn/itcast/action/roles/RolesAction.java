package cn.itcast.action.roles;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Permissions;
import cn.itcast.domain.Roles;
import cn.itcast.service.PermissionsService;
import cn.itcast.service.RolesService;
import cn.itcast.web.util.PageBean;

import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class RolesAction {
	
	@Resource private RolesService rolesService;
	@Resource private PermissionsService ps;
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
	private Roles role;
	private Integer role_id;
	private List<Permissions> list;
	private Integer[] pnum;
	private Set<Permissions> pe=new HashSet<Permissions>();
	
	public Integer[] getPnum() {
		return pnum;
	}
	public void setPnum(Integer[] pnum) {
		this.pnum = pnum;
	}
	public PermissionsService getPs() {
		return ps;
	}
	public void setPs(PermissionsService ps) {
		this.ps = ps;
	}
	
	public List<Permissions> getList() {
		return list;
	}
	public void setList(List<Permissions> list) {
		this.list = list;
	}
	public Roles getRole() {
		return role;
	}
	public void setRole(Roles role) {
		this.role = role;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String addUI(){
			return "addUI";
		}
		public String add(){
			rolesService.save(role);
			ActionContext.getContext().put("message", "保存成功");
			return "success";
		}
		public String del(){
			rolesService.del(role_id);
			ActionContext.getContext().put("message", "删除成功");
			return "success";
		}
	   @SuppressWarnings("unchecked")
	public String update(){
		   role=rolesService.find(role_id);
		   list=ps.findall();
		  
		   return "update";
	   }
	   public String updatedo(){
		   for(Integer p:pnum){
			   pe.add(ps.find(p));
		   }
		   role.setPermissions(pe);
		   rolesService.update(role);
		   ActionContext.getContext().put("message", "更新成功");
		   return "success";
	   }
	   
	   
    public RolesService getRolesService() {
		return rolesService;
	}
	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}
	public int getPage() {
        return page;
    }

    public void setPage(int page) {        //若URL中无此参数,会默认为第1页
        this.page = page;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    
   
	
}



