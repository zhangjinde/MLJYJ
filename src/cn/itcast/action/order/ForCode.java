package cn.itcast.action.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.wx.untils.GenerateQrCodeUtil;



@Controller @Scope("propotype")
public class ForCode {
	
	private String code_url;
	private String ordermoney;
	private String ordername;
	private String ordernum;
	private String nowtime;
	
	public String getNowtime() {
		return nowtime;
	}

	public void setNowtime(String nowtime) {
		this.nowtime = nowtime;
	}

	public String getOrdermoney() {
		return ordermoney;
	}

	public void setOrdermoney(String ordermoney) {
		this.ordermoney = ordermoney;
	}

	public String getOrdername() {
		return ordername;
	}

	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	public String getCode_url() {
		return code_url;
	}

	public void setCode_url(String code_url) {
		this.code_url = code_url;
	}

	public String execute() throws IOException{
		HttpServletRequest r=ServletActionContext.getRequest();
		ordermoney=String.valueOf(Integer.parseInt(ordermoney)/100);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		nowtime=(df.format(new Date()));// new Date()为获取当前系统时间
		return "code";
	}
	
	
	
}
