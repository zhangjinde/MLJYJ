package cn.itcast.action.records;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.service.RecordsService;

import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class RecordsAction {
	private Integer[] jilu;
	@Resource RecordsService rs;
	public Integer[] getJilu() {
		return jilu;
	}

	public void setJilu(Integer[] jilu) {
		this.jilu = jilu;
	}

	public String del(){
		if(jilu!=null)
		{
		rs.delete(jilu);
		ActionContext.getContext().put("message", "É¾³ý³É¹¦");
		}
		return "success";
	}

}
