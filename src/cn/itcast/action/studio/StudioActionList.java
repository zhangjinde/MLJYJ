package cn.itcast.action.studio;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Studio;
import cn.itcast.service.StudioService;
import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class StudioActionList {
@Resource private StudioService studioService;
	
	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //��ֲ���Ϣ��bean
	private Studio studio;
	
	public StudioService getStudioService() {
		return studioService;
	}

	public void setStudioService(StudioService studioService) {
		this.studioService = studioService;
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

	public Studio getStudio() {
		return studio;
	}

	public void setStudio(Studio studio) {
		this.studio = studio;
	}

	public String execute(){
        //��ҳ��pageBean,����pageSize��ʾÿҳ��ʾ��¼��,pageΪ��ǰҳ
        this.pageBean = studioService.queryForPage(15, page);
        return "list";
    }
	
}
