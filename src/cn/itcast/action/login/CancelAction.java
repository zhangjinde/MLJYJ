package cn.itcast.action.login;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller @Scope("prototype")
public class CancelAction {
	public String execute(){
		ServletActionContext.getRequest().getSession().removeAttribute("usermain");
		
		return "cancel";
	}
}
