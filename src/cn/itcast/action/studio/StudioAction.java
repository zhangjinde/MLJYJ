package cn.itcast.action.studio;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Studio;
import cn.itcast.service.StudioService;
import cn.itcast.web.util.PageBean;

import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class StudioAction {
	
	@Resource private StudioService studioService;
	
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //��ֲ���Ϣ��bean
	private Studio studio;
	private Integer studio_id;
	
	
	 public Integer getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}
	public String addUI(){
			return "addUI";
		}
		public String add(){
			studioService.save(studio);
			ActionContext.getContext().put("message", "保存成功");
			return "success";
		}
		public String del(){
			studioService.del(studio_id);
			ActionContext.getContext().put("message", "删除成功");
			return "success";
		}
	   public String update(){
		   studio=studioService.find(studio_id);
		   ActionContext.getContext().put("studio", studio);
		   return "update";
	   }
	   public String updatedo(){
		   
		   studioService.update(studio);
		   ActionContext.getContext().put("message", "更新成功");
		   return "success";
	   }
	   
	    
	public StudioService getStudioService() {
			return studioService;
		}
		public void setStudioService(StudioService studioService) {
			this.studioService = studioService;
		}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
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
    
	public String studioforlist() throws IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8"); 
		List<Studio> studiolist=studioService.findall();
		JSONArray json=JSONArray.fromObject(studiolist);
		response.getWriter().print(json.toString());
		return null;
	}
	
}



