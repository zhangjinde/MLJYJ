package com.wx.service.wxaction;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.Usermain;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

@Controller @Scope("propotype")
public class WxSupport {
	private String pastr;
	private Integer pid;
	private String openid;
	private String path;
	private String picstr;
	private Integer picid;
	
	@Resource PhotoAlbumService pas;
	@Resource PicturesService ps;
	public String getPicstr() {
		return picstr;
	}

	public void setPicstr(String picstr) {
		this.picstr = picstr;
	}

	public Integer getPicid() {
		return picid;
	}

	public void setPicid(Integer picid) {
		this.picid = picid;
	}
	
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}
	

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPastr() {
		return pastr;
	}

	public void setPastr(String pastr) {
		this.pastr = pastr;
	}
	public String pastr() throws IOException{
		
		try {
			PhotoAlbum pa=pas.find(pid);
			pa.setPa_instructions(pastr);
			pas.updatewx(pa);
			ServletActionContext.getResponse().getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			ServletActionContext.getResponse().getWriter().print("no");
		}
		return null;
	}
	public String setcover() throws IOException{
		try {
			PhotoAlbum pa=pas.find(pid);
			pa.setPa_url(path);
			pas.updatewx(pa);
			ServletActionContext.getResponse().getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			ServletActionContext.getResponse().getWriter().print("no");
		}
		return null;
	}
	
	

	public String picstr() throws IOException{
		try {
			
			Pictures pic=ps.find(picid);
			pic.setPic_instructions(picstr);
			ps.update(pic);
			ServletActionContext.getResponse().getWriter().print("ok");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			ServletActionContext.getResponse().getWriter().print("no");
		}
		return null;
	}
	
	public String picstr_get(){
		Pictures pic=ps.find(picid);
		try {
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(pic.getPic_instructions());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return null;
	}
}
