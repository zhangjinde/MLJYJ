package cn.itcast.action.remind;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Child;
import cn.itcast.domain.Family;
import cn.itcast.domain.Remind;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.ChildService;
import cn.itcast.service.FamilyService;
import cn.itcast.service.UserviceService;
import cn.itcast.web.util.Lunar;

@Controller
@Scope("prototype")
public class RemindAction {
	@Resource
	FamilyService fs;
	@Resource
	UserviceService uvs;
	@Resource
	ChildService cs;
	private List<Remind> remindlist = new ArrayList<Remind>();

	public List<Remind> getRemindlist() {
		return remindlist;
	}

	public void setRemindlist(List<Remind> remindlist) {
		this.remindlist = remindlist;
	}

	@SuppressWarnings("static-access")
	public String execute() throws ParseException {

		/* ??????? */
		Usermain um = (Usermain) ActionContext.getContext().getSession()
				.get("usermain");
		int s_id = um.getUservice().getFy().getFamily_studio().getStudio_id();// ???????????￥ID
		/*
		 * ?????
		 */

	//	List<Family> s_family = fs.marryremind(s_id);
		
		remindlist  = fs.marryremind1(s_id);
		
	

			
		return "success";
	}
}
