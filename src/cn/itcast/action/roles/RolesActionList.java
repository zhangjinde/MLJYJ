package cn.itcast.action.roles;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



import cn.itcast.domain.Roles;
import cn.itcast.service.RolesService;
import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class RolesActionList {
@Resource private RolesService rolesService;
	
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //�����ֲ���Ϣ��bean
	private Roles role;
	
	

	public RolesService getRolesService() {
		return rolesService;
	}

	public void setRolesService(RolesService rolesService) {
		this.rolesService = rolesService;
	}

	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
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
        //��ҳ��pageBean,����pageSize��ʾÿҳ��ʾ��¼��,pageΪ��ǰҳ
        this.pageBean = rolesService.queryForPage(15, page);
        return "list";
    }
}
