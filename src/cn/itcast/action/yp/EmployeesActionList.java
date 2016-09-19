package cn.itcast.action.yp;

import java.util.List;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Employees;
import cn.itcast.service.EmployeesService;
import cn.itcast.web.util.PageBean;

@Controller
@Scope("prototype")
public class EmployeesActionList {
	@Resource
	EmployeesService es;
	private int page; // 当前页
	private PageBean pageBean; // 页面bean
	private Employees ebean;
	private Integer province_id;
	private Integer city_id;
	private String professional;

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public Integer getProvince_id() {
		return province_id;
	}

	public void setProvince_id(Integer province_id) {
		this.province_id = province_id;
	}

	public Integer getCity_id() {
		return city_id;
	}

	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
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

	public Employees getEbean() {
		return ebean;
	}

	public void setEbean(Employees ebean) {
		this.ebean = ebean;
	}

	public String execute() {
		this.pageBean = es.queryForPage(15, page);
		return "list";
	}

	public String findemployees() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		// response.getWriter().print("你好");
		List<Employees> list = es.serach(province_id, city_id, professional);
		
			JSONArray json = JSONArray.fromObject(list);
			response.getWriter().print(json.toString());
		
		return null;
	}
}
