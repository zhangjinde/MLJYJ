package cn.itcast.action.order;

import java.io.IOException;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.LogMF;
import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.jdom.JDOMException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.ServletWebRequest;



import com.wx.untils.CommonUtil;
import com.wx.untils.ConfigUtil;
import com.wx.untils.GenerateQrCodeUtil;
import com.wx.untils.PayCommonUtil;
import com.wx.untils.XMLUtil;

import cn.itcast.domain.ShopOrder;
import cn.itcast.service.ShopOrderService;

@Controller @Scope("propotype")
public class WxPay {
	private String ordernum;
	private String ordername;
	private String ordermoney;
	private String order_username;
	private String order_usertel;
	@Resource ShopOrderService sos;
	
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
	public String execute() throws JDOMException, IOException{
		/*
		 * 生成订单（未支付状态）
		 * 并预生成订单信息请求微信服务器
		 * 
		 * */
		/**************************************************/
		//生成订单
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
		//订单结束（未支付）
		/**************************************************/
		//生成请求数据
		ordermoney=String.valueOf(Integer.parseInt(ordermoney)*100);
		SortedMap<Object,Object> paramMap = new TreeMap<Object,Object>();
		paramMap.put("trade_type", "NATIVE"); //交易类型
		paramMap.put("spbill_create_ip",localIp()); //本机的Ip
		paramMap.put("product_id", ordername); // 商户根据自己业务传递的参数 必填
		paramMap.put("body", "三亚旅拍4999网络套餐");         //描述
		paramMap.put("out_trade_no", ordernum); //商户 后台的贸易单号
		paramMap.put("total_fee", "" + "1"); //金额必须为整数  单位为分
		paramMap.put("notify_url", ConfigUtil.NOTIFY_URL); //支付成功后，回调地址     
		paramMap.put("appid",ConfigUtil.APPID ); //appid
		paramMap.put("mch_id", ConfigUtil.MCH_ID); //商户号      
		paramMap.put("nonce_str", PayCommonUtil.CreateNoncestr());  //随机数  
		String sign = PayCommonUtil.createSign("UTF-8", paramMap);
		paramMap.put("sign", sign);//根据微信签名规则，生成签名 
		String requestXML =  PayCommonUtil.getRequestXml(paramMap);;//把参数转换成XML数据格式
		
		//将这些参数以POST方式调用微信统一支付接口
		String result =CommonUtil.httpsRequest(ConfigUtil.UNIFIED_ORDER_URL, "POST", requestXML);
		//解析result
		Map<String, String> map = XMLUtil.doXMLParse(result);
		
		Document dd = null;
		 String code_url=null;
		 try {
		      dd = DocumentHelper.parseText(result);
		    } catch (DocumentException e) {
		         return ""; 
		  }
		  if (dd != null) {
		     Element root = dd.getRootElement();
		     if (root == null) {
		     return "";
		     }
		     Element codeUrl = root.element("code_url");
		     if (codeUrl == null) {
		     return "";
		     }  
		     code_url = codeUrl.getText();  //解析 xml 获得 code_url
		  }
		  int total_fee=1;
		  List<String> list=new ArrayList<String>();
		  list.add(code_url);
		  list.add(ordermoney);
		  list.add(ordername);
		  list.add(ordernum);
		  JSONArray json = JSONArray.fromObject(list);
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setContentType("text/html;charset=utf-8");
		  response.getWriter().print(json.toString());
		return null;
	}
	 /**
	 * 获取本机Ip 
	 *  
	 *  通过 获取系统所有的networkInterface网络接口 然后遍历 每个网络下的InterfaceAddress组。
	 *  获得符合 <code>InetAddress instanceof Inet4Address</code> 条件的一个IpV4地址
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	 private String localIp(){
	String ip = null;
	Enumeration allNetInterfaces;
	try {
	allNetInterfaces = NetworkInterface.getNetworkInterfaces();            
	while (allNetInterfaces.hasMoreElements()) {
	NetworkInterface netInterface = (NetworkInterface) allNetInterfaces.nextElement();
	 List<InterfaceAddress> InterfaceAddress = netInterface.getInterfaceAddresses();
	for (InterfaceAddress add : InterfaceAddress) {
	InetAddress Ip = add.getAddress();
	 if (Ip != null && Ip instanceof Inet4Address) {
	  ip = Ip.getHostAddress();
	       }
	     }
	    }
	  } catch (SocketException e) {
	       // TODO Auto-generated catch block        
	         LogMF.warn(null, "获取本机Ip失败:异常信息:"+e.getMessage(), e);
	    }
	    return ip;
	 }
}
