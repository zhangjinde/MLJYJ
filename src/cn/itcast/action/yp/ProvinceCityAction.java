package cn.itcast.action.yp;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.City;
import cn.itcast.domain.Province;
import cn.itcast.service.CityService;
import cn.itcast.service.ProvinceService;

@Controller
@Scope("prototype")
public class ProvinceCityAction {
	@Resource ProvinceService ps;
	@Resource CityService cs;
	private Integer pid;
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String allprovince() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("text/html;charset=utf-8"); 
		List<Province> listp=ps.findall();
		JSONArray json=JSONArray.fromObject(listp);
		response.getWriter().print(json.toString());
		return null;
	}
	public String findcity() throws Exception{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		List<City> listc=cs.findcity(pid);
		JSONArray json=JSONArray.fromObject(listc);
		response.getWriter().print(json.toString());
		return null;
				
	}
}
