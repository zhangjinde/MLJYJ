package cn.itcast.action.user;

import javax.annotation.Resource;


import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Usermain;

import cn.itcast.service.UsermainService;

import cn.itcast.web.util.PageBean;
@Controller @Scope("prototype")
public class UserActionList {
@Resource private UsermainService ums;


	private int page;    //�ڼ�ҳ
    private PageBean pageBean;  //�����ֲ���Ϣ��bean
	private Usermain usermain;

	

	public UsermainService getUms() {
		return ums;
	}

	public void setUms(UsermainService ums) {
		this.ums = ums;
	}

	public Usermain getUsermain() {
		return usermain;
	}

	public void setUsermain(Usermain usermain) {
		this.usermain = usermain;
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
		Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		if (um!=null){
        this.pageBean = ums.queryForPage(15, page,um);//�����ѹ� Ӱ¥ID familybean.getFamily_studio().getStudio_id()
        return "list";
		}
		else{
			return "loginagain";
		}
    }
}
