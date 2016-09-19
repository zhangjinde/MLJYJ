package cn.itcast.action.usercenter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Usermain;
import cn.itcast.domain.Userstatus;
import cn.itcast.domain.UserstatusComments;
import cn.itcast.service.UserStatusService;
import cn.itcast.web.util.PageBean;

@Controller
@Scope("prototype")
public class UserStatusAction {
	@Resource UserStatusService uss;
	
	private Userstatus usst;
	private Integer ust_id;
	
	public Integer getUst_id() {
		return ust_id;
	}

	public void setUst_id(Integer ust_id) {
		this.ust_id = ust_id;
	}

	public Userstatus getUsst() {
		return usst;
	}

	public void setUsst(Userstatus usst) {
		this.usst = usst;
	}

	
	//回复
	private UserstatusComments ussc;
	
	private Integer usc_id;
	


	public UserstatusComments getUssc() {
		return ussc;
	}

	public void setUssc(UserstatusComments ussc) {
		this.ussc = ussc;
	}

	public Integer getUsc_id() {
		return usc_id;
	}

	public void setUsc_id(Integer usc_id) {
		this.usc_id = usc_id;
	}


	private int page;    
    private PageBean pageBean; 
    
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	
	private List<UserstatusComments> list;  //查询返回list
	

	public List<UserstatusComments> getList() {
		return list;
	}

	public void setList(List<UserstatusComments> list) {
		this.list = list;
	}

	public String index(){
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		int um_id=um.getUm_id();
		 this.pageBean = uss.queryForPage(15, page,um_id);
		return "index";
	}
	
	
	
	//保存
	
		public String Save(){
			try {
				//成功返回list页查询
				Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
				int um_id=um.getUm_id();
				String nick=um.getUser_nickname();
				usst.setUst_um_id(um_id);
				usst.setUst_nickname(nick);
				Date date=new Date();
//				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				String time=format.format(date);
				
				usst.setTime(date);
				uss.save(usst);
				ActionContext.getContext().put("message","保存成功");
				return "success";
			} catch (Exception e) {
				//异常返回错误页
				ActionContext.getContext().put("message","保存错误");
				e.printStackTrace();
				return "error";
			}
		
		}
		
		
		//保存
		
		public String Savers(){
			try {
				//成功返回list页查询
				Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
				int um_id=um.getUm_id();
				ussc.setUsc_um_id(um_id);
//				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				String time=format.format(date);
				
				
				uss.savers(ussc);
				ActionContext.getContext().put("message","保存成功");
				return "success";
			} catch (Exception e) {
				//异常返回错误页
				ActionContext.getContext().put("message","保存错误");
				e.printStackTrace();
				return "error";
			}
		
		}
		
		
		public String addui()
		{
			
			return "addui";
		}
		
		public String goresultui()
		{
			int i=1000;
			list=uss.returnlist(ust_id, i);
			return "resultui";
		}
		
		public String del(){
			uss.updatedz(ust_id);
			ActionContext.getContext().put("message", "删除成功");
			return "success";
		}
}
