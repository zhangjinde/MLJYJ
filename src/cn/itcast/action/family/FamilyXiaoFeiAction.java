package cn.itcast.action.family;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;


import cn.itcast.domain.FamilyXiaoFei;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.XiaoFeiFM;
import cn.itcast.domain.XiaofeiY;

import cn.itcast.service.FamilyService;
import cn.itcast.service.FamilyXiaoFeiService;
import cn.itcast.service.UserviceService;

@Controller @Scope("prototype")
public class FamilyXiaoFeiAction {
	@Resource
	FamilyXiaoFeiService fs;
	@Resource
	UserviceService uvs;
	
	private Integer xf_id;

	public Integer getXf_id() {
		return xf_id;
	}
	public void setXf_id(Integer xf_id) {
		this.xf_id = xf_id;
	}
	
	private String xfcount="";

	public String getXfcount() {
		return xfcount;
	}
	public void setXfcount(String xfcount) {
		this.xfcount = xfcount;
	}


	private String home_instructions="";
	
	public String getHome_instructions() {
		return home_instructions;
	}
	public void setHome_instructions(String home_instructions) {
		this.home_instructions = home_instructions;
	}


	private List<FamilyXiaoFei> xiaofeiYlist = new ArrayList<FamilyXiaoFei>();
	
	private List<XiaoFeiFM> xiaofeiFMlist = new ArrayList<XiaoFeiFM>();
	
	public List<FamilyXiaoFei> getXiaofeiYlist() {
		return xiaofeiYlist;
	}
	public void setXiaofeiYlist(List<FamilyXiaoFei> xiaofeiYlist) {
		this.xiaofeiYlist = xiaofeiYlist;
	}
	public List<XiaoFeiFM> getXiaofeiFMlist() {
		return xiaofeiFMlist;
	}
	public void setXiaofeiFMlist(List<XiaoFeiFM> xiaofeiFMlist) {
		this.xiaofeiFMlist = xiaofeiFMlist;
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
		
		xiaofeiYlist  = fs.fmxiaofeilist(s_id, home_instructions,xfcount);
		
			
		return "list";
	}

	 public String xflist(){
		 xiaofeiFMlist= fs.xiaofeilist(xf_id);
	    	return "xfmlist";
	    }
}
