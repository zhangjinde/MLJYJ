package cn.itcast.action.photoalbumclass;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import cn.itcast.domain.PhotoAlbumClass;
import cn.itcast.service.PhotoAlbumClassService;
import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class PhotoAlbumClassActionList {
@Resource private PhotoAlbumClassService pacService;
	
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //�����ֲ���Ϣ��bean
	private PhotoAlbumClass pac;
	
	

	public PhotoAlbumClassService getPacService() {
		return pacService;
	}

	public void setPacService(PhotoAlbumClassService pacService) {
		this.pacService = pacService;
	}

	public PhotoAlbumClass getPac() {
		return pac;
	}

	public void setPac(PhotoAlbumClass pac) {
		this.pac = pac;
	}

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

	

	public String execute(){
        //��ҳ��pageBean,����pageSize��ʾÿҳ��ʾ��¼��,pageΪ��ǰҳ
        this.pageBean = pacService.queryForPage(15, page);
        return "list";
    }
}
