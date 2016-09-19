package cn.itcast.action.permissions;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



import cn.itcast.domain.Permissions;
import cn.itcast.service.PermissionsService;
import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class PermissionsActionList {
@Resource private PermissionsService permissionsService;
	
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
	private Permissions permissions;
	

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

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	

	public String execute(){
        //分页的pageBean,参数pageSize表示每页显示记录数,page为当前页
        this.pageBean = permissionsService.queryForPage(15, page);
        return "list";
    }
}
