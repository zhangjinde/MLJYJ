package cn.itcast.action.yp;


import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.YPOrder;
import cn.itcast.service.YPOrderService;
import cn.itcast.web.util.PageBean;

@Controller @Scope("prototype")
public class PlaceOrderAction {
	@Resource YPOrderService yps;
	private int page;    //当前页
    private PageBean pageBean;  //页bean
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

	private Integer id;
	private Integer pid;
	private Integer cid;
	private Integer sy_id;//摄影师ID
	private String sy_name;//摄影师姓名
	private Integer hz_id;
	private String hz_name;
	private String user_name;
	private String tel;
	private String bz;
	private Date time;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getSy_id() {
		return sy_id;
	}
	public void setSy_id(Integer sy_id) {
		this.sy_id = sy_id;
	}
	public String getSy_name() {
		return sy_name;
	}
	public void setSy_name(String sy_name) {
		this.sy_name = sy_name;
	}
	public Integer getHz_id() {
		return hz_id;
	}
	public void setHz_id(Integer hz_id) {
		this.hz_id = hz_id;
	}
	public String getHz_name() {
		return hz_name;
	}
	public void setHz_name(String hz_name) {
		this.hz_name = hz_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String submit() throws Exception{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		YPOrder yp=new YPOrder();
		yp.setPid(pid);
		yp.setCid(cid);
		yp.setTel(tel);
		yp.setUser_name(user_name);
		yp.setTime(time);
		yp.setBz(bz);
		yp.setIscheck(false);
		if(sy_id==null){
			yp.setSy_name("无");
		}
		else{
			yp.setSy_id(sy_id);
			yp.setSy_name(sy_name);
		}
		if(hz_id==null){
			yp.setHz_name("无");
		}
		else{
			yp.setHz_id(hz_id);
			yp.setHz_name(hz_name);
		}
		try {
			yps.save(yp);
			response.getWriter().print("预约成功");
		} catch (Exception e) {
			
		}
		
		return null;
				
	}
	
	public String list(){
		this.pageBean=yps.queryForPage(15, page);
		return "list";
	}
	public String del(){
		yps.del(id);
		return "success";
	}
	public String check() throws Exception{
		
		YPOrder yp=yps.findById(id);
		yp.setIscheck(true);
		yps.save(yp);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("处理成功");
		return null;
	}
}
