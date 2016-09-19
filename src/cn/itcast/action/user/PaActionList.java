package cn.itcast.action.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Usermain;
import cn.itcast.service.PhotoAlbumService;

@Controller
@Scope("prototype")
public class PaActionList {
	
	@Resource PhotoAlbumService pas;
	
	List<PhotoAlbum> palist;
	

	public PhotoAlbumService getPas() {
		return pas;
	}

	public void setPas(PhotoAlbumService pas) {
		this.pas = pas;
	}

	public List<PhotoAlbum> getPalist() {
		return palist;
	}

	public void setPalist(List<PhotoAlbum> palist) {
		this.palist = palist;
	}

	public String execute() {
		Family fy=(Family)ActionContext.getContext().getSession().get("fy");
		palist=pas.findall(fy);
		return "palist";
	}
	
}
