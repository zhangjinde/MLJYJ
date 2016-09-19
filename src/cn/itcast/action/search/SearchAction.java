package cn.itcast.action.search;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.itcast.domain.Family;
import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.FamilyService;
import cn.itcast.service.StudioService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

@Controller @Scope("prototype")
public class SearchAction {
	@Resource StudioService ss;
	@Resource FamilyService fs;
	@Resource UsermainService ums;
	@Resource UserviceService uvs;
	/*studio*/
	private List<Studio> list_studio;
	private String studioname;
	/*family*/
	private List<Family> list_family;
	private String familypwd;
	/*user*/
	private List<Usermain> list_user=new ArrayList<Usermain>();
	private String user;
	private String searchtype;
	private Integer s_id;
		public Integer getS_id() {
		return s_id;
	}


	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}


		public List<Usermain> getList_user() {
		return list_user;
	}


	public void setList_user(List<Usermain> list_user) {
		this.list_user = list_user;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getSearchtype() {
		return searchtype;
	}


	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}


		public List<Family> getList_family() {
		return list_family;
	}


	public void setList_family(List<Family> list_family) {
		this.list_family = list_family;
	}



		public String getFamilypwd() {
		return familypwd;
	}


	public void setFamilypwd(String familypwd) {
		this.familypwd = familypwd;
	}


		public String getStudioname() {
		return studioname;
	}


	public void setStudioname(String studioname) {
		this.studioname = studioname;
	}


		public List<Studio> getList_studio() {
		return list_studio;
	}


	public void setList_studio(List<Studio> list_studio) {
		this.list_studio = list_studio;
	}


	/*search sutdio*/
	public String studio(){
		
		list_studio=ss.findlikeName(studioname);
		return "studio";
	}
	public String family(){
		boolean isadmin=false;
		if(s_id!=null){//判断s_id是否为空来判断是否为全局查询。
			isadmin=true;
		}
		if (searchtype.endsWith("爱情密码")) {
			if(s_id==null){
			Usermain um = (Usermain) ActionContext.getContext().getSession().get("usermain");
			s_id = um.getUservice().getFy().getFamily_studio().getStudio_id();
			}
			list_family = fs.findlikelovepwd(familypwd, s_id);
		}
		if (searchtype.endsWith("孩子姓名")) {
			if(s_id==null){
			Usermain um = (Usermain) ActionContext.getContext().getSession().get("usermain");
			s_id = um.getUservice().getFy().getFamily_studio().getStudio_id();
			}
			list_family = fs.findBychildname(familypwd, s_id);
		}
		if(isadmin==true){
			return "admin";
		}
		else{
			return "family";
		}
	}
	public String user(){
		if(searchtype.endsWith("账号"))
		{
			Usermain admin=(Usermain)ActionContext.getContext().getSession().get("usermain");
			Integer id=admin.getUservice().getFy().getFamily_studio().getStudio_id();
			Usermain um=ums.findByName(user,id);
			if(um!=null){
			list_user.add(um);
			}
		}
		if(searchtype.endsWith("姓名"))
		{
			Usermain admin=(Usermain)ActionContext.getContext().getSession().get("usermain");
			Integer id=admin.getUservice().getFy().getFamily_studio().getStudio_id();
			List<Uservice> list_uv=uvs.findByName(user,id);
			for(Uservice u:list_uv)
			{
				Usermain um=ums.findById(u.getUv_id());
				
				list_user.add(um);
			}
		}
		if(searchtype.endsWith("手机"))
		{
			Usermain admin=(Usermain)ActionContext.getContext().getSession().get("usermain");
			Integer id=admin.getUservice().getFy().getFamily_studio().getStudio_id();
			Uservice uv=uvs.findByTel(user,id);
			if(uv!=null){
			list_user.add(ums.findById(uv.getUv_id()));
			}
		}
		return "user";
	}
	
	public String admin(){
		return "admin";
	}
	
	public String formain(){
		
		return "main";
	}
}
