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
	
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //�����ֲ���Ϣ��bean
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
			ActionContext.getContext().put("message", "����ɹ�");
			return "success";
		}
		public String del(){
			photoAlbumClassService.del(photoAlbumClass_id);
			ActionContext.getContext().put("message", "ɾ���ɹ�");
			return "success";
		}
	   public String update(){
		   photoAlbumClass=photoAlbumClassService.find(photoAlbumClass_id);
		   ActionContext.getContext().put("photoAlbumClass", photoAlbumClass);
		   return "update";
	   }
	   public String updatedo(){
		   
		   photoAlbumClassService.update(photoAlbumClass);
		   ActionContext.getContext().put("message", "���³ɹ�");
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

    public void setPage(int page) {        //��URL���޴˲���,��Ĭ��Ϊ��1ҳ
        this.page = page;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }
    
    
   
	
}



