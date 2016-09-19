package com.wx.service.wxaction;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.sword.wechat4j.event.EventType;
import org.sword.wechat4j.exception.WeChatException;
import org.sword.wechat4j.menu.Menu;
import org.sword.wechat4j.menu.MenuButton;
import org.sword.wechat4j.menu.MenuManager;
import org.sword.wechat4j.message.CustomerMsg;
import org.sword.wechat4j.token.AccessToken;

import cn.itcast.domain.CustomTS;
import cn.itcast.domain.Family;
import cn.itcast.domain.StudioUrl;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.CustomTSService;
import cn.itcast.service.StudioUrlService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import com.mysql.jdbc.log.Log;
import com.opensymphony.xwork2.ActionContext;
import com.wx.bean.Token;
import com.wx.model.BackMessage;
import com.wx.model.TemplateData;
import com.wx.model.UserInfo;
import com.wx.model.VerifyResult;
import com.wx.model.WxTemplate;
import com.wx.untils.BaseActionSupport;
import com.wx.untils.CommonUtil;
import com.wx.untils.ConfigUtil;
import com.wx.untils.HttpRequestUrl;
import com.wx.untils.MyWechat;
import com.wx.untils.WxUtil;

@Controller
@Scope("propotype")
public class WxTextService extends BaseActionSupport {
	HttpServletRequest request;
	HttpServletResponse response;
	private static final long serialVersionUID = 1L;
	private File attachment;//
	private String attachmentFileName;//
	private String attachmentContentType;//
	@Resource
	UserviceService us;
	@Resource
	UsermainService ums;
	private String mobile;
	private String openid;
	private String name;
	private String remindclass;
	private Usermain um;
	public Usermain getUm() {
		return um;
	}

	public void setUm(Usermain um) {
		this.um = um;
	}

	public String getRemindclass() {
		return remindclass;
	}

	public void setRemindclass(String remindclass) {
		this.remindclass = remindclass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getAttachmentContentType() {
		return attachmentContentType;
	}

	public void setAttachmentContentType(String attachmentContentType) {
		this.attachmentContentType = attachmentContentType;
	}

	public String getAttachmentFileName() {
		return attachmentFileName;
	}

	public void setAttachmentFileName(String attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

	public File getAttachment() {
		return attachment;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}

	public String getMessage() throws IOException {
		this.getResponse().sendRedirect("login_app.do");

		return null;
	}

	public String login() {
		/*
		 * String jsApiTicket = TokenProxy.jsApiTicket();
		 * System.out.println("js验证"+jsApiTicket);
		 */
		return "default";
	}

	public String upFile() {

		System.out.println(attachmentFileName);
		System.out.println(attachmentContentType);
		return null;
	}

	public String verify() throws WeChatException {
		MyWechat my = new MyWechat(this.getRequest());
		String result = my.execute();
		try {

			this.getResponse().getOutputStream().write(result.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String createMenu() {
		MenuManager menuManager = new MenuManager();
		MenuButton btnClick = new MenuButton();
		btnClick.setName("单击按钮");
		btnClick.setType(EventType.CLICK);
		btnClick.setKey("单击按钮");
		// 跳转URL
		MenuButton btnView = new MenuButton();
		btnView.setName("跳转URL");
		btnView.setType(EventType.VIEW);
		btnView.setUrl("");
		// 扫码推事件
		MenuButton btnScanCodePush = new MenuButton();
		btnScanCodePush.setName("扫码推事件");
		btnScanCodePush.setType(EventType.scancode_push);
		btnScanCodePush.setKey("扫码推事件");
		// 扫码带提示
		MenuButton btnScanCodeWaitMsg = new MenuButton();
		btnScanCodeWaitMsg.setName("扫码带提示");
		btnScanCodeWaitMsg.setType(EventType.scancode_waitmsg);
		btnScanCodeWaitMsg.setKey("扫码带提示");

		// 弹出系统拍照发图
		MenuButton btnPicSysPhoto = new MenuButton();
		btnPicSysPhoto.setName("拍照发图");
		btnPicSysPhoto.setType(EventType.pic_sysphoto);
		btnPicSysPhoto.setKey("拍照发图");
		// 弹出拍照或者相册发图
		MenuButton btnPicPhotoOrAlbum = new MenuButton();
		btnPicPhotoOrAlbum.setName("拍照/相册发图");
		btnPicPhotoOrAlbum.setType(EventType.pic_photo_or_album);
		btnPicPhotoOrAlbum.setKey("拍照/相册发图");
		// 弹出微信相册发图器
		MenuButton btnPicWeixin = new MenuButton();
		btnPicWeixin.setName("相册发图");
		btnPicWeixin.setType(EventType.pic_weixin);
		btnPicWeixin.setKey("相册发图");
		// 弹出地理位置选择器
		MenuButton btnLocationSelect = new MenuButton();
		btnLocationSelect.setName("地理位置");
		btnLocationSelect.setType(EventType.location_select);
		btnLocationSelect.setKey("地理位置");

		// 下发消息（除文本消息）
		// btnLocationSelect.setType(EventType.location_select);
		// MenuButton btnMediaId = new MenuButton();
		// btnMediaId.setName("");
		// btnMediaId.setType(EventType.media_id);
		// btnMediaId.setMediaId("");
		// // 跳转图文消息URL
		// MenuButton btnViewLimited = new MenuButton();
		// btnViewLimited.setName("");
		// btnViewLimited.setType(EventType.view_limited);
		// btnViewLimited.setMediaId("");

		List<MenuButton> subBut1 = new ArrayList<MenuButton>();
		subBut1.add(btnScanCodePush);
		subBut1.add(btnScanCodeWaitMsg);
		subBut1.add(btnPicSysPhoto);
		subBut1.add(btnPicPhotoOrAlbum);
		subBut1.add(btnPicWeixin);
		List<MenuButton> subBut2 = new ArrayList<MenuButton>();
		subBut2.add(btnClick);
		subBut2.add(btnView);
		// 二级菜单
		MenuButton subButScanCode = new MenuButton();
		subButScanCode.setName("扫码");
		subButScanCode.setSubButton(subBut1);
		MenuButton sub1 = new MenuButton();
		sub1.setName("单击");
		sub1.setSubButton(subBut2);

		List<MenuButton> button = new ArrayList<MenuButton>();
		button.add(sub1);
		button.add(subButScanCode);
		button.add(btnLocationSelect);
		Menu menu = new Menu();
		menu.setButton(button);

		try {
			menuManager.create(menu);
			System.out.println("菜单创建成功");
		} catch (WeChatException e) {
			System.out.println("菜单创建失败");
			e.printStackTrace();
		}
		return null;
	}

	public String callBackInterface() throws IOException {
		// 第1步得到用户同意授权，得到code
		String code = this.getRequest().getParameter("code");
		// 第2步通过code换取网页授权access_token
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
				+ ConfigUtil.APPID + "&secret=" + ConfigUtil.APP_SECRECT
				+ "&code=" + code + "&grant_type=authorization_code";
		InputStream in = HttpRequestUrl.httpRequeseGet(url);
		String jsonString = HttpRequestUrl.getStringFromFlow(in);
		BackMessage message = JSON.parseObject(jsonString, BackMessage.class);
		// 第四步：拉取用户信息
		String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="
				+ message.getAccess_token()
				+ "&openid="
				+ message.getOpenid()
				+ "&lang=zh_CN";
		HttpMethod method = new PostMethod(userInfoUrl);
		HttpClient httpclient = new HttpClient();
		httpclient.executeMethod(method);
		String userInfoStr = new String(method.getResponseBody(), "UTF-8");
		UserInfo userInfo = JSON.parseObject(userInfoStr, UserInfo.class);
		// 第5步：检验授权凭证（access_token）是否有效
		String verifyUrl = "https://api.weixin.qq.com/sns/auth?access_token="
				+ message.getAccess_token() + "&openid=" + userInfo.getOpenid()
				+ "";
		InputStream verifyIS = HttpRequestUrl.httpRequeseGet(verifyUrl);
		String verifyStr = HttpRequestUrl.getStringFromFlow(verifyIS);
		VerifyResult veResult = JSON.parseObject(verifyStr, VerifyResult.class);
		String city = userInfo.getCity();
		String username = userInfo.getNickname();
		String sex = userInfo.getSex();
		String country = userInfo.getCountry();
		String openid = userInfo.getOpenid();//
		// 判断用户是否已经绑定避免重复操作
		// System.out.println(userInfo.getUnionid());
		String imgurl = userInfo.getHeadimgurl();
		System.out.println("错误代码：" + veResult.getErrcode() + "错误信息："
				+ veResult.getErrmsg() + "");
		if (veResult.getErrcode().equals("0")
				&& veResult.getErrmsg().equals("ok")) {
			city = URLEncoder.encode(city, "UTF-8");
			username = URLEncoder.encode(username, "UTF-8");
			country = URLEncoder.encode(country, "UTF-8");
			this.getResponse().sendRedirect(
					"http://www.jyj.me/wxTextService_login.action?city=" + city
							+ "&username=" + username + "&sex=" + sex
							+ "&country=" + country + "&openid=" + openid
							+ "&imgurl=" + imgurl);

		}
		return null;
	}

	public String wxfinduser() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
		response.addHeader(
				"Access-Control-Allow-Headers",
				"Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");
		Uservice jyjuser = us.findByTelOnly(mobile);
		//校验openid是否存在
		Uservice openiduser=us.findByOpenId(openid);
		if(openiduser==null){//不存在才绑定 存在说明该微信绑定过了不允许重复绑定
		if (jyjuser != null && name.equals(jyjuser.getUv_name().trim())) {
			JSONObject infomap = new JSONObject();// 利用fastjson做
													// 服务器端jsonarrary不支持还是有问题
													// JSONObject infomap = new
													// JSONObject();infomap.put("uv_name",
													// jyjuser.getUv_name());infomap.toString()搞定
			infomap.put("uv_name", jyjuser.getUv_name());
			infomap.put("tel", jyjuser.getTel());
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String time = format.format(jyjuser.getBirthday());
			infomap.put("birthday", time);
			Usermain um = ums.findById(jyjuser.getUv_id());
			infomap.put("account", um.getUsername());
			infomap.put("pwd", um.getUser_password());
			// 写入用户openid到数据库
			if (openid != null) {
				if (jyjuser.getOpenid() == null || jyjuser.getOpenid().equals("")) {
					jyjuser.setOpenid(openid);
					us.update(jyjuser);
					response.getWriter().print(infomap.toString());
				}else{
					response.getWriter().print("alreadydo");//已绑定
				}
				
			} else {
				response.getWriter().print("noopenid");
			}

		} else {
			if (jyjuser == null) {

				response.getWriter().print("nohave");
			} else {
				response.getWriter().print("nomacth");
			}
		}
		}else{
			response.getWriter().print("repeat");//重复绑定
		}
			
		return null;
	}

	@Resource
	CustomTSService ctss;
	@Resource StudioUrlService sus;
	public String wxtousertext() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");// 服务器编码
		Usermain um = (Usermain) ActionContext.getContext().getSession()
				.get("usermain");
		Family fy = um.getUservice().getFy();
		Integer id = fy.getFamily_studio().getStudio_id();
		CustomTS ts = ctss.findbyStudioid(id);
		StudioUrl su=sus.findByStudioId(id);
		String studiourl="";
		if(su!=null){
			studiourl=su.getStudiourl();
		}else{
			studiourl="http://www.jyj.me";
		}
		String tsone = "";
		String tstwo = "";
		if (ts == null) {
			tsone = "家印记提醒您生命中重要的节日要到了：";
		} else {
			tsone = ts.getTs_one();
			tstwo = ts.getTs_two();
		}
		mobile = mobile.trim();
		
		//发送模板参数设置
		String templateId="O9N27AW0wUUmgQwbB1NCLJi6eescVhoRxv4rxTvbFr8";
		String firststr=tsone;
		String remarkstr="感谢您对家印记的支持。点我看活动。"+tstwo;
		
		
		if (mobile.length() == 11 || mobile.length() == 12) {
			String strmobile = mobile;
			if (mobile.length() == 12) {
				strmobile = mobile.substring(1);
			}
			Uservice jyjuser = us.findByTelOnly(strmobile);// 定向测试rem
			openid = jyjuser.getOpenid();
			if (openid != null) {
				// logger.info("提醒推送");
				// 获得关注者列表，发送给第一个人消息
				// UserManager userManager = new UserManager();
				// List<Object> userList = (List<Object>)
				// userManager.subscriberList();
				// if(userList.size() > 0){
				// String toUserOpenId = userList.get(0).toString();

				String namestr = name.replace("WO", "").trim();
				namestr = namestr.replace("MAN:", "");
				if (namestr.length() <= 3) {
//					String content = "亲爱的" + namestr + tsone + remindclass.trim()
//							+ tstwo;
//					
//					
//					CustomerMsg customerMsg = new CustomerMsg(openid);
//					customerMsg.sendText(content);
					//发送模板消息
					
					
			        WxUtil.sendTempLate(studiourl, openid, templateId, firststr, namestr, strmobile, remindclass.trim(), "提醒时间之前", remarkstr);
				}
			} else {
				response.getWriter().print("nobinding");
			}
		} else if (mobile.length() == 23) {
			String mobileone = mobile.substring(0, 11);
			String mobiletwo = mobile.substring(12);
			Uservice jyjuserone = us.findByTelOnly(mobileone);
			Uservice jyjusertwo = us.findByTelOnly(mobiletwo);
			String openidone = jyjuserone.getOpenid();
			String openidtwo = jyjusertwo.getOpenid();
			String msg = "";
			if (openidone != null) {
				String namestr = name.replace("WO", "");
				namestr = namestr.replace("MAN:", "");
//				String content = "亲爱的" + namestr + tsone + remindclass + tstwo;
//				CustomerMsg customerMsg = new CustomerMsg(openidone);
//				customerMsg.sendText(content);
				WxUtil.sendTempLate(studiourl, openidone, templateId, firststr, namestr, mobileone, remindclass.trim(), "提醒时间之前", remarkstr);

			} else {
				msg = "onenobinding";
			}
			if (openidtwo != null) {
				String namestr = name.replace("WO", "");
				namestr = namestr.replace("MAN:", "");
//				String content = "亲爱的" + namestr + tsone + remindclass + tsone;
//				CustomerMsg customerMsg = new CustomerMsg(openidtwo);
//				customerMsg.sendText(content);
				WxUtil.sendTempLate(studiourl, openidtwo, templateId, firststr, namestr, mobiletwo, remindclass.trim(), "提醒时间之前", remarkstr);

			} else {
				msg = msg + "twonobinding";
			}
			response.getWriter().print(msg);
		}
		return null;
	}
	
	public String userinfocallback() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
		response.addHeader(
				"Access-Control-Allow-Headers",
				"Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");
		UserInfo u=WxUtil.getuserinfo();
		Uservice uv=us.findByOpenId(u.getOpenid());
		if(uv!=null){
			um=ums.findById(uv.getUv_id());
			return "userinfo";
		}else{
			return "nobinding";
		}
		
	}
	private String username;
	private String password;
	private String nickname;
	private String uv_name;
	private String tel;
	private String qq;
	private String weixin;
	private String workunit;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUv_name() {
		return uv_name;
	}

	public void setUv_name(String uv_name) {
		this.uv_name = uv_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public String getWorkunit() {
		return workunit;
	}

	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}

	public String updateuser() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Usermain um=ums.findByName(username);
		Uservice uv=um.getUservice();
		um.setUser_password(password);
		um.setUser_nickname(nickname);
		uv.setUv_name(uv_name);
		uv.setTel(tel);
		uv.setQq(qq);
		uv.setWeixin(weixin);
		uv.setWorkunit(workunit);
		uv.setOpenid(openid);
		um.setUservice(uv);
		try {
			ums.wxupdate(um);
			response.getWriter().print("ok");
		} catch (Exception e) {
			response.getWriter().print("error");
			e.printStackTrace();
		}
		return null;
	}

}
