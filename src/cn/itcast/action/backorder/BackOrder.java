package cn.itcast.action.backorder;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.ShopOrder;
import cn.itcast.service.ShopOrderService;

@Controller @Scope("prototype")
public class BackOrder {
	@Resource ShopOrderService sos;
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String check(){
		
		try {
			ShopOrder so=sos.findById(id);
			so.setIscheck(true);
			sos.update(so);
			ServletActionContext.getResponse().getWriter().print("checksuccess");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String del(){
		try {
			sos.del(id);
			ServletActionContext.getResponse().getWriter().print("delsuccess");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
