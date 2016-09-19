package cn.itcast.action.settings;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.CustomTS;
import cn.itcast.domain.Family;
import cn.itcast.domain.StudioUrl;
import cn.itcast.domain.Usermain;
import cn.itcast.service.CustomTSService;
import cn.itcast.service.StudioService;
import cn.itcast.service.StudioUrlService;


@Controller @Scope("propotype")
public class SettingsAction {
	
	public String execute(){
		return "adminsettings";
	}
	@Resource CustomTSService ctss;
	public String getts(){
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		Family fy=um.getUservice().getFy();
		Integer id=fy.getFamily_studio().getStudio_id();
		CustomTS ts=ctss.findbyStudioid(id);
		if(ts!=null){
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			JSONArray json=JSONArray.fromObject(ts);
			try {
				response.getWriter().print(json.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	private String tsone;
	private String tstwo;
	public String getTsone() {
		return tsone;
	}
	public void setTsone(String tsone) {
		this.tsone = tsone;
	}
	public String getTstwo() {
		return tstwo;
	}
	public void setTstwo(String tstwo) {
		this.tstwo = tstwo;
	}
	public String updatets() throws IOException{
		try {
			Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
			Family fy=um.getUservice().getFy();
			Integer id=fy.getFamily_studio().getStudio_id();
			CustomTS ts=ctss.findbyStudioid(id);
			if(ts==null){
				ts=new CustomTS();
			}
			ts.setTs_one(tsone);
			ts.setTs_two(tstwo);
			ts.setTs_studioid(id);
			ctss.saveandeupdate(ts);
			ServletActionContext.getResponse().getWriter().print("ok");
		} catch (Exception e) {
			e.printStackTrace();
			ServletActionContext.getResponse().getWriter().print("err");
		}
		return null;
		
	}
	private String studiourl;
	
	public String getStudiourl() {
		return studiourl;
	}
	public void setStudiourl(String studiourl) {
		this.studiourl = studiourl;
	}
	@Resource StudioUrlService sus;
	public String saveorupdateurl() throws IOException{
		try {
			Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
			Family fy=um.getUservice().getFy();
			Integer id=fy.getFamily_studio().getStudio_id();
			StudioUrl su=sus.findByStudioId(id);
			if(su==null){
				su=new StudioUrl();
			}
			su.setStudioid(id);
			su.setStudiourl(studiourl.trim());
			sus.saveorupdate(su);
			ServletActionContext.getResponse().getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			ServletActionContext.getResponse().getWriter().print("err");
			e.printStackTrace();
		}
		return null;
	}
	public String getstudiourl() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		Family fy=um.getUservice().getFy();
		Integer id=fy.getFamily_studio().getStudio_id();
		StudioUrl su=sus.findByStudioId(id);
		if(su!=null){
			JSONArray json=JSONArray.fromObject(su);
			response.getWriter().print(json);
		}
		return null;
	}
	
	
}
