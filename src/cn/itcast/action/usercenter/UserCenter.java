package cn.itcast.action.usercenter;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.Usermain;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

@Controller @Scope("prototype")
public class UserCenter {
	private Usermain um;
	@Resource UsermainService ums;
	@Resource UserviceService uvs;
	@Resource PicturesService ps;
	@Resource PhotoAlbumService pas;
	private Pictures p;
	private Integer pic_id;
	private String index;
	
	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public Pictures getP() {
		return p;
	}

	public void setP(Pictures p) {
		this.p = p;
	}

	public Integer getPic_id() {
		return pic_id;
	}

	public void setPic_id(Integer pic_id) {
		this.pic_id = pic_id;
	}

	public Usermain getUm() {
		return um;
	}

	public void setUm(Usermain um) {
		this.um = um;
	}

	public String goUI(){
		Usermain user=(Usermain) ActionContext.getContext().getSession().get("usermain");
		um=ums.findById(user.getUm_id());
		return "UI";
	}
	public String update(){
		uvs.update(um.getUservice());
		ums.update(um);
		ActionContext.getContext().put("message", "更新成功");
		return "success";
	}
	public String changepic(){
		p=ps.find(pic_id);
		return "changepic";
	}
	
	
	public String updatepic(){
		if(index.equals("1")){
		Integer pa_id=p.getPic_pa().getPa_id();
		PhotoAlbum pa=pas.find(pa_id);
		pa.setPa_url(p.getPic_relurl());
		pas.save(pa);
		}
		ps.update(p);
		ActionContext.getContext().put("message", "更新成功");
		return "updatepic";
	}
	

}
