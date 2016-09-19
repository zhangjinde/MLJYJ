package cn.itcast.action.backorder;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.service.ShopOrderService;
import cn.itcast.web.util.PageBean;

@Controller @Scope("prototype")
public class BackOrderList {
	@Resource ShopOrderService sos;
	private int page;    //当前页序号
    private PageBean pageBean;  //页面bean
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
    	 this.pageBean = sos.queryForPage(15, page);
         return "orderlist";
    }

}
