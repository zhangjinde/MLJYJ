package com.wx.untils;

public class ConfigUtil {
	/**
	 * 服务号相关信息
	 */
	//家印记
	 //public final static String APPID = "wx909b08d5b162e885";//服务号的应用号
	 //public final static String APP_SECRECT = "0e8170740301657e74b72b2084659f77";//服务号的应用密码
	 //public final static String TOKEN = "96uFHrPD6P6jkBF9SBLr";//服务号的配置token
	//善智网络
	public final static String APPID = "wx4ccaaf091159d8c1";//服务号的应用号
	public final static String APP_SECRECT = "444109c8646dbfecf01f82485603b525";//服务号的应用密码
	public final static String TOKEN ="83vbM2kqp3sB29BaANE6";
	/**********************************************************************************/
	 public final static String MCH_ID = "1241151402";//商户号
	 public final static String API_KEY = "Jiayinjiyingxiangjiapu1679966501";//API密钥
	 public final static String SIGN_TYPE = "MD5";//签名加密方式
	 public final static String CERT_PATH = "D:/apiclient_cert.p12";//微信支付证书存放路径地址
	//微信支付统一接口的回调action
	 public final static String NOTIFY_URL = "http://114.93.156.204:8080/order/wxPaysuccess.action";
	//微信支付成功支付后跳转的地址
	 public final static String SUCCESS_URL = "http://180.157.57.107:8080/wxweb/contents/config/pay_success.jsp";
	 //oauth2授权时回调action
	 public final static String REDIRECT_URI = "http://180.157.57.107:8080/GoMyTrip/a.jsp?port=8016";
	/**
	 * 微信基础接口地址
	 */
	 //获取token接口(GET)
	 public final static String TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	 //oauth2授权接口(GET)
	 public final static String OAUTH2_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	 //刷新access_token接口（GET）
	 public final static String REFRESH_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";
	// 菜单创建接口（POST）
	 public final static String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	// 菜单查询（GET）
	 public final static String MENU_GET_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	// 菜单删除（GET）
	public final static String MENU_DELETE_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
	/**
	 * 微信支付接口地址
	 */
	//微信支付统一接口(POST)
	public final static String UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	//微信退款接口(POST)
	public final static String REFUND_URL = "https://api.mch.weixin.qq.com/secapi/pay/refund";
	//订单查询接口(POST)
	public final static String CHECK_ORDER_URL = "https://api.mch.weixin.qq.com/pay/orderquery";
	//关闭订单接口(POST)
	public final static String CLOSE_ORDER_URL = "https://api.mch.weixin.qq.com/pay/closeorder";
	//退款查询接口(POST)
	public final static String CHECK_REFUND_URL = "https://api.mch.weixin.qq.com/pay/refundquery";
	//对账单接口(POST)
	public final static String DOWNLOAD_BILL_URL = "https://api.mch.weixin.qq.com/pay/downloadbill";
	//短链接转换接口(POST)
	public final static String SHORT_URL = "https://api.mch.weixin.qq.com/tools/shorturl";
	//接口调用上报接口(POST)
	public final static String REPORT_URL = "https://api.mch.weixin.qq.com/payitil/report";
}
