package cn.itcast.action.permissions;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Permissions;
import cn.itcast.service.PermissionsService;
import cn.itcast.web.util.PageBean;

import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class PermissionsAction {
	
	@Resource private PermissionsService permissionsService;
	
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
	private Permissions permissions;
	private Integer permissions_id;
	
	
	public PermissionsService getPermissionsService() {
		return permissionsService;
	}
	public void setPermissionsService(PermissionsService permissionsService) {
		this.permissionsService = permissionsService;
	}
	public Permissions getPermissions() {
		return permissions;
	}
	public void setPermissions(Permissions permissions) {
		this.permissions = permissions;
	}
	public Integer getPermissions_id() {
		return permissions_id;
	}
	public void setPermissions_id(Integer permissions_id) {
		this.permissions_id = permissions_id;
	}
	public String addUI(){
			return "addUI";
		}
		public String add(){
			permissionsService.save(permissions);
			ActionContext.getContext().put("message", "保存成功");
			return "success";
		}
		public String del(){
			permissionsService.del(permissions_id);
			ActionContext.getContext().put("message", "删除成功");
			return "success";
		}
	   public String update(){
		   permissions=permissionsService.find(permissions_id);
		   ActionContext.getContext().put("role", permissions);
		   return "update";
	   }
	   public String updatedo(){
		   
		   permissionsService.update(permissions);
		   ActionContext.getContext().put("message", "更新成功");
		   return "success";
	   }
	   
	   
    public PermissionsService getpermissionsService() {
		return permissionsService;
	}
	public void setpermissionsService(PermissionsService permissionsService) {
		this.permissionsService = permissionsService;
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



