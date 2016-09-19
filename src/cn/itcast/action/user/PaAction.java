package cn.itcast.action.user;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.aliyun.oss.OSSClient;
import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.PhotoAlbumClass;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.Usermain;

import cn.itcast.service.PhotoAlbumClassService;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;
import cn.itcast.service.UsermainService;

@Controller
@Scope("prototype")
public class PaAction {
	private PhotoAlbum pa;
	@Resource
	PhotoAlbumService pas;
	@Resource
	PhotoAlbumClassService pacs;
	@Resource
	UsermainService ums;
	private List<PhotoAlbumClass> pac;
	private Integer pa_id;
	@Resource
	PicturesService ps;

	private Integer pic_id;

	public Integer getPic_id() {
		return pic_id;
	}

	public void setPic_id(Integer pic_id) {
		this.pic_id = pic_id;
	}

	public PicturesService getPs() {
		return ps;
	}

	public void setPs(PicturesService ps) {
		this.ps = ps;
	}

	public UsermainService getUms() {
		return ums;
	}

	public void setUms(UsermainService ums) {
		this.ums = ums;
	}

	public Integer getPa_id() {
		return pa_id;
	}

	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}

	public PhotoAlbum getPa() {
		return pa;
	}

	public void setPa(PhotoAlbum pa) {
		this.pa = pa;
	}

	public String addpaUI() {
		pac = pacs.findall();
		return "addpaUI";
	}

	public String add() {
		pa.setState(1);
		pas.save(pa);
		return "success";
	}

	public String del() {

		pas.del(pa_id);
		return "success";
	}

	public String update() {
		pa = pas.find(pa_id);
		pac = pacs.findall();
		return "updatepa";
	}

	public String updatedo() {
		pas.update(pa);
		return "success";

	}

	public String addpic() {

		return "addpic";
	}

	public String delpic() {
		//对操作用户判断
		
		
		//////////////
		Pictures p = ps.find(pic_id);
		String filePath = p.getPic_relurl();
		if (filePath != null) {
			//OSS删除对象
			String bucketName = "mljyj";
			String ACCESS_ID = "IHE3Rao9r4cPeiMI";
			String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
			OSSClient client = new OSSClient(ACCESS_ID, ACCESS_KEY);
			String key = p.getPic_fullurl();
			client.deleteObject(bucketName, key);
			pa_id=p.getPic_pa().getPa_id();
			ps.del(pic_id);
		}
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		if(um.getRole().getRole_id()==3){//如果是普通用户
			HttpServletResponse response=ServletActionContext.getResponse();
			try {
				response.getWriter().print("success");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return "picdel";
	}

	public PhotoAlbumService getPas() {
		return pas;
	}

	public void setPas(PhotoAlbumService pas) {
		this.pas = pas;
	}

	public PhotoAlbumClassService getPacs() {
		return pacs;
	}

	public void setPacs(PhotoAlbumClassService pacs) {
		this.pacs = pacs;
	}

	public List<PhotoAlbumClass> getPac() {
		return pac;
	}

	public void setPac(List<PhotoAlbumClass> pac) {
		this.pac = pac;
	}
}
