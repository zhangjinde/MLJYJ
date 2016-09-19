package cn.itcast.action.user;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionContext;



import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.PicsSorting;
import cn.itcast.domain.Pictures;
import cn.itcast.service.PicturesService;
import cn.itcast.web.util.PageBean;

@Controller @Scope("prototype")
public class AllpicAction {
	private PageBean pageBean;
	@Resource
	PicturesService ps;

	private int page;
	private Integer pa_id;
	private Integer pic_id;
	
	private String json;
	
	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public Integer getPic_id() {
		return pic_id;
	}

	public void setPic_id(Integer pic_id) {
		this.pic_id = pic_id;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Integer getPa_id() {
		return pa_id;
	}

	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}

	public String execute() {
		this.pageBean = ps.queryForPage(32, page, pa_id);
		return "allpic";
	}
	public String sorting() throws IOException{
		List<PicsSorting> list=JSON.parseArray(json, PicsSorting.class);
		for(PicsSorting p:list){
			Pictures pic=ps.find(p.getPid());
			pic.setPic_index(p.getIndex());
			ps.update(pic);
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("ok");
		return null;
	}
}
