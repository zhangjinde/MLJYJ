package cn.itcast.action.remind;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import cn.itcast.domain.Usermain;
import cn.itcast.service.FamilyService;

@Controller
@Scope("prototype")
public class TongjiAction {
	@Resource FamilyService fs;
	private Integer todaycount;
	private Integer monthcount;
	private String month;
	
	

	public Integer getMonthcount() {
		return monthcount;
	}



	public void setMonthcount(Integer monthcount) {
		this.monthcount = monthcount;
	}



	public String getMonth() {
		return month;
	}



	public void setMonth(String month) {
		this.month = month;
	}



	public Integer getTodaycount() {
		return todaycount;
	}



	public void setTodaycount(Integer todaycount) {
		this.todaycount = todaycount;
	}



	public String today(){
		Date date=new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	String time = format.format(date);
    	Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
    	Integer s_id=um.getUservice().getFy().getFamily_studio().getStudio_id();
    	todaycount=fs.familycount(s_id, time);
		return "today";
	}
	public String month() throws IOException{
		Date date=new Date();
		DateFormat format = new SimpleDateFormat("yyyy");
    	String time = format.format(date);
    	time=time+"-"+month;
    	Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
    	Integer s_id=um.getUservice().getFy().getFamily_studio().getStudio_id();
    	monthcount=fs.familycount(s_id, time);
    	HttpServletResponse response=ServletActionContext.getResponse();
    	response.getWriter().print(monthcount);
		return null;
	}
}
