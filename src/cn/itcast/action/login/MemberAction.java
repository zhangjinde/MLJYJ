package cn.itcast.action.login;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.PhotoAlbumService;


@Controller @Scope("prototype")
public class MemberAction {
	private List<PhotoAlbum> list;
	@Resource private PhotoAlbumService pas;
	public List<PhotoAlbum> getList() {
		return list;
	}

	public PhotoAlbumService getPas() {
		return pas;
	}

	public void setPas(PhotoAlbumService pas) {
		this.pas = pas;
	}

	public void setList(List<PhotoAlbum> list) {
		this.list = list;
	}

	public String execute(){
		Usermain um=(Usermain)ServletActionContext.getRequest().getSession().getAttribute("usermain");
		if(um!=null){
			Uservice uv=um.getUservice();
			Family fy=uv.getFy();
			list=pas.findall(fy);
			return "photo";
		}
		else{
			return "login";
		}
		
	}
}
