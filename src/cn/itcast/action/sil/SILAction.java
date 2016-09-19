package cn.itcast.action.sil;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.StandInsideLetter;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.SILService;
import cn.itcast.service.UsermainService;

@Controller @Scope("prototype")
public class SILAction {
	private Integer sil_id;
	private StandInsideLetter sil;
	
	@Resource SILService sils;
	@Resource UsermainService ums;
	private String fromstudio;
	private Integer[] accept;
	public Integer[] getAccept() {
		return accept;
	}
	public StandInsideLetter getSil() {
		return sil;
	}
	public void setSil(StandInsideLetter sil) {
		this.sil = sil;
	}
	public void setAccept(Integer[] accept) {
		this.accept = accept;
	}
	public String getFromstudio() {
		return fromstudio;
	}
	public void setFromstudio(String fromstudio) {
		this.fromstudio = fromstudio;
	}
	
	public Integer getSil_id() {
		return sil_id;
	}
	public void setSil_id(Integer sil_id) {
		this.sil_id = sil_id;
	}
	
	public String writeUI(){
		
		
		return "writeUI";
	}
	
	public String write(){
		sil.setIsread(false);
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		sil.setSil_user_send(um.getUsername());
		sils.save(sil);
		ActionContext.getContext().put("message", "发送成功");
		return "success";
	}
	
	public SILService getSils() {
		return sils;
	}
	public void setSils(SILService sils) {
		this.sils = sils;
	}
	public String findaccept(){
		
		sil=sils.findaccept(sil_id);
		sil.setIsread(true);
		sils.save(sil);
		Usermain um=ums.findByName(sil.getSil_user_send());
		Uservice uv=um.getUservice();
		fromstudio=uv.getFy().getFamily_studio().getStudio_name();
		return "findaccept";
	}
	public String delaccept(){
			if(accept!=null)
			{
			sils.del(accept);
			ActionContext.getContext().put("message", "删除成功");
			}
		return "delaccept";
	}
}
