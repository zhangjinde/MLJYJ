package cn.itcast.action.login;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Gg;
import cn.itcast.domain.Usermain;
import cn.itcast.service.GgService;
import cn.itcast.service.SILService;
import cn.itcast.service.UsermainService;

@Controller @Scope("prototype")
public class LoginAction {
	//安卓标志
	
	private Integer isandroid;
	public Integer getIsandroid() {
		return isandroid;
	}

	public void setIsandroid(Integer isandroid) {
		this.isandroid = isandroid;
	}

	private String username;
	private String password;
	@Resource private UsermainService us;
	@Resource private SILService sils;
	@Resource private GgService gs;
	private Usermain um;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String execute() throws IOException{
		um=us.findByName(username);
		if(isandroid==null)isandroid=0;
		if(um!=null)
		{
			
			if(um.getUser_password().equals(password)){
				int a=sils.findnoread(username);
				ActionContext.getContext().put("noreadmail", a);
				if(um.getRole().getRole_id()!=3&&isandroid!=1){
					ActionContext.getContext().getSession().put("usermain",um);
					ActionContext.getContext().getSession().put("role_id",um.getRole().getRole_id());
					um.setIP(ServletActionContext.getRequest().getRemoteAddr());
					Integer log=um.getLog_num();
					if (log==null)
					{
						log=0;
					}
					um.setLog_num(log+1);
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
					String time=df.format(new Date());
					um.setLastlogtime(time);
					us.update(um);
					Gg g=gs.findischeck();
					if(g!=null){
						String gg=g.getTitle()+":"+g.getGg();
						ActionContext.getContext().getSession().put("gg", gg);
					}
					return "background";
				}
				
				um.setIP(ServletActionContext.getRequest().getRemoteAddr());
				Integer log=um.getLog_num();
				if (log==null)
				{
					log=0;
				}
				um.setLog_num(log+1);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
				String time=df.format(new Date());
				um.setLastlogtime(time);
				ActionContext.getContext().getSession().put("usermain", um);
				us.update(um);
				if(isandroid==1){
					HttpServletResponse response=ServletActionContext.getResponse();
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().print("验证成功um_id="+um.getUm_id());
					return null;
				}
				if(isandroid==2){
					HttpServletResponse response=ServletActionContext.getResponse();
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().print("验证成功um_id="+um.getUm_id());
					return null;
				}
				return "userview";
			}
			else{
				if(isandroid==1){
					HttpServletResponse response=ServletActionContext.getResponse();
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().print("密码不正确");
					return null;
				}
				ActionContext.getContext().getSession().put("message", "密码不正确");
				return "login";
			}
		}
		else{
			if(isandroid==1||isandroid==2){
				HttpServletResponse response=ServletActionContext.getResponse();
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("用户不存在");
				return null;
			}
			ActionContext.getContext().getSession().put("message", "用户不存在");
			return "login";
		}
		
	}
}
