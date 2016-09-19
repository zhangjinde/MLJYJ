package cn.itcast.domain;

public class ShopOrder {
	private Integer id;
	private String ordernum;
	private String ordername;
	private String ordermoney;
	private String order_username;
	private String order_usertel;
	private boolean ispay;
	private String orderinfo;
	private boolean ischeck;// «∑Ò¥¶¿Ì
	
	public ShopOrder() {
		
	}
	public ShopOrder(Integer id, String ordernum, String ordername,
			String ordermoney, String order_username, String order_usertel,
			boolean ispay, String orderinfo, boolean ischeck) {
		super();
		this.id = id;
		this.ordernum = ordernum;
		this.ordername = ordername;
		this.ordermoney = ordermoney;
		this.order_username = order_username;
		this.order_usertel = order_usertel;
		this.ispay = ispay;
		this.orderinfo = orderinfo;
		this.ischeck = ischeck;
	}
	public boolean isIscheck() {
		return ischeck;
	}
	public void setIscheck(boolean ischeck) {
		this.ischeck = ischeck;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderinfo() {
		return orderinfo;
	}
	public void setOrderinfo(String orderinfo) {
		this.orderinfo = orderinfo;
	}
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
	public boolean isIspay() {
		return ispay;
	}
	public void setIspay(boolean ispay) {
		this.ispay = ispay;
	}
	
}
