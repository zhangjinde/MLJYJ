package cn.itcast.action.index;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import cn.itcast.service.FamilyService;

@Controller
public class InIndex {
	@Resource FamilyService fs;
	public String familycount() throws IOException{
		int count=fs.familycount();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.addHeader("Access-Control-Allow-Origin", "*");  
		response.addHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");  
		response.addHeader("Access-Control-Allow-Headers", "Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");  
		response.getWriter().print(count);
		return null;
	}
}
