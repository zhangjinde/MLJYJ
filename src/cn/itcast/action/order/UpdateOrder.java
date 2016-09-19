package cn.itcast.action.order;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import cn.itcast.domain.ShopOrder;
import cn.itcast.service.ShopOrderService;

@Controller @Scope("prototype")
public class UpdateOrder extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource ShopOrderService sos;
	private String ordernum;

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	
		public String execute(){
		try {
			
			ShopOrder so=sos.findByNum(ordernum);
			so.setIspay(true);
			sos.update(so);
			HttpServletResponse response = ServletActionContext.getResponse(); 
			response.setContentType("text/html;charset=utf-8"); 
			response.getWriter().print("订单已成功支付,客服马上会联系你。");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return null;
	}
}
