package cn.itcast.action.sil;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Usermain;
import cn.itcast.service.SILService;
import cn.itcast.web.util.PageBean;

@Controller @Scope("prototype")
public class SILActionAcceptList {
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
    @Resource SILService sils;
 
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
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		String username=um.getUsername();
		this.pageBean = sils.findaccept(15, page, username);
		return "list";
	}
}
