package cn.itcast.action.user;

import javax.annotation.Resource;


import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Usermain;

import cn.itcast.service.UsermainService;

import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class UserActionList {
@Resource private UsermainService ums;


	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
	private Usermain usermain;

	

	public UsermainService getUms() {
		return ums;
	}

	public void setUms(UsermainService ums) {
		this.ums = ums;
	}

	public Usermain getUsermain() {
		return usermain;
	}

	public void setUsermain(Usermain usermain) {
		this.usermain = usermain;
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
		Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		if (um!=null){
        this.pageBean = ums.queryForPage(15, page,um);//测试已过 影楼ID familybean.getFamily_studio().getStudio_id()
        return "list";
		}
		else{
			return "loginagain";
		}
    }
}
