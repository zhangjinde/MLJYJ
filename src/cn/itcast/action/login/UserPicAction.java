package cn.itcast.action.login;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Pictures;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;




@Controller @Scope("prototype")
public class UserPicAction {
	private Integer pa_id;
	private List<Pictures> piclist;
	@Resource PicturesService ps;
	@Resource PhotoAlbumService pas;
	public Integer getPa_id() {
		return pa_id;
	}

	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}

	public List<Pictures> getPiclist() {
		return piclist;
	}

	public void setPiclist(List<Pictures> piclist) {
		this.piclist = piclist;
	}

	public String execute() {
		piclist=ps.findall(pa_id);
		ActionContext.getContext().put("pa_id", pa_id);
		return "piclist";
	}
	
	public String editpic(){
		piclist=ps.findall(pa_id);
		ActionContext.getContext().put("pa_id", pa_id);
		ActionContext.getContext().getSession().put("role_id", 3);
		return "editpic";
	}
	public String getjson_pa_pics() throws IOException{
		piclist=ps.findall(pa_id);
		PhotoAlbum pa=pas.find(pa_id);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		//组装json
		/*
		 * {
  "title": "", //相册标题
  "id": 123, //相册id
  "start": 0, //初始显示的图片序号，默认0
  "data": [   //相册包含的图片，数组格式
    {
      "alt": "图片名",
      "pid": 666, //图片id
      "src": "", //原图地址
      "thumb": "" //缩略图地址
    }
  ]
}
		 * 
		 * 
		 * 
		 * */
		String json="{\"title\":\""+pa.getPa_name()+"\",\"id\":"+pa.getPa_id()+",\"start\":0"+",\"data\":[";
		String liststr="";
		String instr="";
		for(Pictures p:piclist){
			instr=p.getPic_instructions()==null?"":p.getPic_instructions();
			liststr+="{\"alt\":\""+instr+"\",\"pid\":"+p.getPic_id()+",\"src\":\""+p.getPic_relurl()+"\",\"thumb\":\"\""+"},";
		}
		int num=liststr.lastIndexOf(",");
		liststr=liststr.substring(0, num);
		json=json+liststr+"]}";
		response.getWriter().print(json);
		return null;
	}
}
