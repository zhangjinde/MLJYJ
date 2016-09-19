package cn.itcast.action.gg;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Gg;
import cn.itcast.service.GgService;
import cn.itcast.web.util.PageBean;

@Controller @Scope("prototype")
public class GgActionList {
	@Resource GgService gs;
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
    private Gg gbean;
    
	
	public Gg getGbean() {
		return gbean;
	}


	public void setGbean(Gg gbean) {
		this.gbean = gbean;
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
		this.pageBean=gs.queryForPage(15, page);
		return "list";
	}
}
