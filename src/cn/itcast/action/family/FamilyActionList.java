package cn.itcast.action.family;

import javax.annotation.Resource;


import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Family;
import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.service.FamilyService;
import cn.itcast.service.StudioService;
import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class FamilyActionList {
@Resource private FamilyService familyService;

	private int page;    
    private PageBean pageBean;  
	private Family familybean;
	private Usermain um;
	

	public FamilyService getfamilyService() {
		return familyService;
	}

	public void setfamilyService(FamilyService familyService) {
		this.familyService = familyService;
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



	public FamilyService getFamilyService() {
		return familyService;
	}

	public void setFamilyService(FamilyService familyService) {
		this.familyService = familyService;
	}

	public Family getFamilybean() {
		return familybean;
	}

	public void setFamilybean(Family familybean) {
		this.familybean = familybean;
	}

	public String execute(){
        //��ҳ��pageBean,����pageSize��ʾÿҳ��ʾ��¼��,pageΪ��ǰҳ
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		if (um!=null){
        this.pageBean = familyService.queryForPage(15, page,um);//�����ѹ� Ӱ¥ID familybean.getFamily_studio().getStudio_id()
        return "list";
		}
		else{
			
			return "loginagain";
		}
    }
}
