package cn.itcast.action.family;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import cn.itcast.domain.Child;
import cn.itcast.domain.Family;
import cn.itcast.domain.Roles;
import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.domain.XiaoFei;

import cn.itcast.service.ChildService;
import cn.itcast.service.FamilyService;
import cn.itcast.service.RolesService;
import cn.itcast.service.StudioService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;
import cn.itcast.service.XiaoFeiService;

import cn.itcast.web.util.PageBean;

import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class FamilyAction {
	@Resource private RolesService rs;
	@Resource private UsermainService us;
	@Resource private UserviceService uvs;
	@Resource private FamilyService familyService;
	@Resource private StudioService ss;
	@Resource ChildService cs;
	@Resource XiaoFeiService xfs;
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //��ֲ���Ϣ��bean
	private Family familybean;
	private Integer family_id;
	private Studio fs;
	private List<Studio> studios;
	private Integer fs_id;
	private Usermain um;
	private Uservice uv;
	private List<Usermain> userlist;
	private List<Child> childlist;
	private Child child;
	private XiaoFei xf;
	private Integer xf_id;
	private Uservice uv_man;
	private Uservice uv_woman;
	private String username;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Uservice getUv_man() {
		return uv_man;
	}
	public void setUv_man(Uservice uv_man) {
		this.uv_man = uv_man;
	}
	public Uservice getUv_woman() {
		return uv_woman;
	}
	public void setUv_woman(Uservice uv_woman) {
		this.uv_woman = uv_woman;
	}
	public Integer getXf_id() {
		return xf_id;
	}
	public void setXf_id(Integer xf_id) {
		this.xf_id = xf_id;
	}
	public XiaoFei getXf() {
		return xf;
	}
	public void setXf(XiaoFei xf) {
		this.xf = xf;
	}
	public List<Child> getChildlist() {
		return childlist;
	}
	public void setChildlist(List<Child> childlist) {
		this.childlist = childlist;
	}
	public Child getChild() {
		return child;
	}
	public void setChild(Child child) {
		this.child = child;
	}
	public List<Usermain> getUserlist() {
		return userlist;
	}
	public void setUserlist(List<Usermain> userlist) {
		this.userlist = userlist;
	}
	public UsermainService getUs() {
		return us;
	}
	public void setUs(UsermainService us) {
		this.us = us;
	}
	public Uservice getUv() {
		return uv;
	}
	public void setUv(Uservice uv) {
		this.uv = uv;
	}
	public Usermain getUm() {
		return um;
	}
	public void setUm(Usermain um) {
		this.um = um;
	}
	
	public Integer getFs_id() {
		return fs_id;
	}
	public void setFs_id(Integer fs_id) {
		this.fs_id = fs_id;
	}
	public List<Studio> getStudios() {
		return studios;
	}
	public void setStudios(List<Studio> studios) {
		this.studios = studios;
	}
	public Studio getFs() {
		return fs;
	}
	public void setFs(Studio fs) {
		this.fs = fs;
	}
	
	public StudioService getSs() {
		return ss;
	}
	public void setSs(StudioService ss) {
		this.ss = ss;
	}
	
	public Family getFamilybean() {
		return familybean;
	}
	public void setFamilybean(Family familybean) {
		this.familybean = familybean;
	}
	
	public FamilyService getFamilyService() {
		return familyService;
	}
	public void setFamilyService(FamilyService familyService) {
		this.familyService = familyService;
	}
	
	public Integer getFamily_id() {
		return family_id;
	}
	public void setFamily_id(Integer family_id) {
		this.family_id = family_id;
	}
	
	
	
	
	
	public String addUI(){
			studios=ss.findall();
			Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
			fs=um.getUservice().getFy().getFamily_studio();
			ActionContext.getContext().put("fs", fs);
			return "addUI";
		}
		public String add(){
			Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
			int role_id=um.getRole().getRole_id();
			if(role_id==7){
				familybean.setUm_id(um.getUm_id());//子门店
			}
//			Date date = new Date();
//			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	    	String time = format.format(date);
//			familybean.setRegtime(time);
			familyService.save(familybean);
			return "success";
		}
		public String del(){
			try{
				um=(Usermain)ActionContext.getContext().getSession().get("usermain");
				familybean=familyService.find(family_id);
				if(!familybean.getFamily_id().equals(um.getUservice().getFy().getFamily_id())){
			List<Uservice> uvlist=uvs.findByfamilyid(family_id);
			List<Child> clist=cs.findByfamilyid(family_id);
			Integer[] id=new Integer[uvlist.size()];
			Integer[] cid=new Integer[clist.size()];
			for(int i=0;i<uvlist.size();i++)
			{
				id[i]=uvlist.get(i).getUv_id();
			}
			for(int i=0;i<clist.size();i++)
			{
				cid[i]=clist.get(i).getChild_id();
			}
			us.del(id);//删除um  hibenate会关联删除附表
			cs.delchild(cid);
			familyService.del(family_id);
				}
				else{
					ActionContext.getContext().put("message", "无法删除管理员家庭组");
				}
			}
			catch(Exception e){
				ActionContext.getContext().put("message", "删除失败，家庭成员账号未删除成功。");
			}
			return "success";
		}
	   public String update(){
		   studios=ss.findall();
		   Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
			fs=um.getUservice().getFy().getFamily_studio();
			ActionContext.getContext().put("fs", fs);
		   familybean=familyService.find(family_id);
		   ActionContext.getContext().put("family", familybean);
		   return "update";
	   }
	   public String updatedo(){
		   familyService.update(familybean);
		   return "success";
	   }
	   
	    public String adduserUI(){
	    	Family ff=familyService.find(family_id);
	    	List<Roles> rolelist=rs.findall();
	    	ActionContext.getContext().put("ff", ff);
	    	ActionContext.getContext().put("rolelist", rolelist);
	    	return "adduserUI";
	    }
	    
	    public String adduser(){
	    	Date date = new Date();
	    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String time = format.format(date);
	    	um.setRegtime(time);
	    	um.setUservice(uv);
	    	us.save(um);
	    	return "success";
	    }
	    
	public String getusers() {
		List<Uservice> userv = uvs.findByfamilyid(family_id);
		childlist = cs.findByfamilyid(family_id);
		userlist = new ArrayList<Usermain>();
		Usermain testum = null;
		for (Uservice u : userv) {
			// 兼容老数据
			testum = us.findById(u.getUv_id());
			if(testum==null){
				uvs.del(u.getUv_id());
				ActionContext.getContext().put("message", "该家庭存在异常数据，系统已自动清理");
			}else{
				userlist.add(testum);
			}
		}
		return "getusers";
	}
	    
	    public String addchild(){
	    	
	    	return "childUI";
	    }
	    
	    public String savechild(){
	    	cs.save(child);
	    	ActionContext.getContext().put("message", "小孩信息添加成功");
	    	return "success";
	    }
	    
	    public String xflist(){
	    	this.pageBean=xfs.queryForPage(15, page, family_id);
	    	return "xflist";
	    }
	    
	    public String addxfUI(){
	    	
	    	return "addxfUI";
	    }
	    
	    public String savexf(){
	    	family_id=xf.getXf_family().getFamily_id();
	    	xfs.save(xf);
	    	ActionContext.getContext().put("message", "保存成功");
	    	return "savexf";
	    }
	    
	    public String updatexfUI(){
	    	xf=xfs.findById(xf_id);
	    	return "updatexfUI";
	    }
	    
	    public String updatexf(){
	    	family_id=xf.getXf_family().getFamily_id();
	    	xfs.update(xf);
	    	ActionContext.getContext().put("message", "更新成功");
	    	return "savexf";
	    }
	    
	    public String delxf(){
	    	family_id=xfs.findById(xf_id).getXf_family().getFamily_id();
	    	xfs.del(xf_id);
	    	ActionContext.getContext().put("message", "删除成功");
	    	return "savexf";
	    }
	    
	    public String allinfo(){
	    	familybean=familyService.find(family_id);
	    	List<Uservice> uvlist_family=uvs.findByfamilyid(family_id);
	    	childlist=cs.findByfamilyid(family_id);
	    	for (Uservice u:uvlist_family){
	    		if(u.getGender().equals("MAN"))
	    		{
	    			uv_man=u;
	    		}else{
	    			uv_woman=u;
	    		}
	    	}
	    	return "allinfo";
	    }
	    
	    
    public int getPage() {
        return page;
    }

    public void setPage(int page) {        //��URL���޴˲���,��Ĭ��Ϊ��1ҳ
        this.page = page;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    public String checkusername() throws IOException{
    	Usermain uu=us.findByName(username);
    	int result=1;
    	if(uu==null){
    		result=0;
    	}
    	HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(result);
    	return null;
    }
   
	
}



