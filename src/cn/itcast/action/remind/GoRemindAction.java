package cn.itcast.action.remind;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope("prototype")
public class GoRemindAction {
	public String execute(){
		return "go";
	}
}
