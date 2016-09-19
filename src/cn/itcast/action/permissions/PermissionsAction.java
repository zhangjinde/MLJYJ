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
	
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //�����ֲ���Ϣ��bean
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
			ActionContext.getContext().put("message", "����ɹ�");
			return "success";
		}
		public String del(){
			permissionsService.del(permissions_id);
			ActionContext.getContext().put("message", "ɾ���ɹ�");
			return "success";
		}
	   public String update(){
		   permissions=permissionsService.find(permissions_id);
		   ActionContext.getContext().put("role", permissions);
		   return "update";
	   }
	   public String updatedo(){
		   
		   permissionsService.update(permissions);
		   ActionContext.getContext().put("message", "���³ɹ�");
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

    public void setPage(int page) {        //��URL���޴˲���,��Ĭ��Ϊ��1ҳ
        this.page = page;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    
   
	
}



