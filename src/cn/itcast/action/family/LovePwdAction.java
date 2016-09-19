package cn.itcast.action.family;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Family;
import cn.itcast.domain.Usermain;
import cn.itcast.service.FamilyService;

@Controller @Scope("prototype")
public class LovePwdAction {
	
	@Resource FamilyService fs;
	private String lovepwd;
	
	public String getLovepwd() {
		return lovepwd;
	}

	public void setLovepwd(String lovepwd) {
		this.lovepwd = lovepwd;
	}

	public String isexsit() throws Exception{
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		Integer s_id=um.getUservice().getFy().getFamily_studio().getStudio_id();
		List<Family> f=fs.findlikelovepwd(lovepwd, s_id);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		if(f.size()!=0){
			response.getWriter().print("密码已存在");
		}
		else{
			response.getWriter().print("可用");
		}
		return null;
	}
}
