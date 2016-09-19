package cn.itcast.action.records;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.service.RecordsService;
import cn.itcast.web.util.PageBean;

@Controller @Scope("prototype")
public class RecordsActionList {
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
    @Resource RecordsService rs;
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
	public RecordsService getRs() {
		return rs;
	}
	public void setRs(RecordsService rs) {
		this.rs = rs;
	}
	
	public String execute(){
		this.pageBean = rs.queryForPage(20, page);
		return "list";
	}
}
