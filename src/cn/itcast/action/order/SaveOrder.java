package cn.itcast.action.order;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.ShopOrder;
import cn.itcast.service.ShopOrderService;

@Controller @Scope("prototype")
public class SaveOrder {
	private String ordernum;
	private String ordername;
	private String ordermoney;
	private String order_username;
	private String order_usertel;
	
	
	
	public String getOrdernum() {
		return ordernum;
	}



	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}



	public String getOrdername() {
		return ordername;
	}



	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}



	public String getOrdermoney() {
		return ordermoney;
	}



	public void setOrdermoney(String ordermoney) {
		this.ordermoney = ordermoney;
	}



	public String getOrder_username() {
		return order_username;
	}



	public void setOrder_username(String order_username) {
		this.order_username = order_username;
	}



	public String getOrder_usertel() {
		return order_usertel;
	}



	public void setOrder_usertel(String order_usertel) {
		this.order_usertel = order_usertel;
	}


@Resource ShopOrderService sos;
	public String execute(){
		ShopOrder so=new ShopOrder();
		so.setIscheck(false);
		so.setIspay(false);
		so.setOrder_username(order_username);
		so.setOrder_usertel(order_usertel);
		so.setOrderinfo("");
		so.setOrdermoney(ordermoney);
		so.setOrdername(ordername);
		so.setOrdernum(ordernum);
		sos.save(so);
		return null;
				
	}
}
