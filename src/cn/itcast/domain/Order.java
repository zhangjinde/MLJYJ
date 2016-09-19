package cn.itcast.domain;



public class Order {
	private Integer order_id;
	private String order_num;
	private Integer order_price;
	private boolean ispay;
	private Usermain order_user;
	

	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Usermain getOrder_user() {
		return order_user;
	}
	public void setOrder_user(Usermain order_user) {
		this.order_user = order_user;
	}
	
	
	public Integer getOrder_price() {
		return order_price;
	}
	public void setOrder_price(Integer order_price) {
		this.order_price = order_price;
	}
	public boolean isIspay() {
		return ispay;
	}
	public void setIspay(boolean ispay) {
		this.ispay = ispay;
	}
	
}
