package cn.itcast.action.photoalbumclass;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import cn.itcast.domain.PhotoAlbumClass;
import cn.itcast.service.PhotoAlbumClassService;
import cn.itcast.web.util.PageBean;

import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class PhotoAlbumClassAction {
	
	@Resource private PhotoAlbumClassService photoAlbumClassService;
	
	private int page;    //第几页
    private PageBean pageBean;  //包含分布信息的bean
	private PhotoAlbumClass photoAlbumClass;
	private Integer photoAlbumClass_id;
	
	
	
	public Integer getPhotoAlbumClass_id() {
		return photoAlbumClass_id;
	}
	public void setPhotoAlbumClass_id(Integer photoAlbumClass_id) {
		this.photoAlbumClass_id = photoAlbumClass_id;
	}
	public String addUI(){
			return "addUI";
		}
		public String add(){
			photoAlbumClassService.save(photoAlbumClass);
			ActionContext.getContext().put("message", "保存成功");
			return "success";
		}
		public String del(){
			photoAlbumClassService.del(photoAlbumClass_id);
			ActionContext.getContext().put("message", "删除成功");
			return "success";
		}
	   public String update(){
		   photoAlbumClass=photoAlbumClassService.find(photoAlbumClass_id);
		   ActionContext.getContext().put("photoAlbumClass", photoAlbumClass);
		   return "update";
	   }
	   public String updatedo(){
		   
		   photoAlbumClassService.update(photoAlbumClass);
		   ActionContext.getContext().put("message", "更新成功");
		   return "success";
	   }
	   
	
    
    
    
    public PhotoAlbumClassService getPhotoAlbumClassService() {
		return photoAlbumClassService;
	}
	public void setPhotoAlbumClassService(
			PhotoAlbumClassService photoAlbumClassService) {
		this.photoAlbumClassService = photoAlbumClassService;
	}
	public PhotoAlbumClass getPhotoAlbumClass() {
		return photoAlbumClass;
	}
	public void setPhotoAlbumClass(PhotoAlbumClass photoAlbumClass) {
		this.photoAlbumClass = photoAlbumClass;
	}
	public int getPage() {
        return page;
    }

    public void setPage(int page) {        //若URL中无此参数,会默认为第1页
        this.page = page;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    
   
	
}



