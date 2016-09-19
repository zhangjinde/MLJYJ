package com.wx.untils;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.sword.wechat4j.WechatSupport;
public class MyWechat extends WechatSupport {

	public MyWechat(HttpServletRequest request) {
		super(request);
	}

	@Override
	protected void click() {
		// TODO Auto-generated method stub
		

	}

	@Override
	protected void location() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void locationSelect() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void onImage() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void onLink() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void onLocation() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void onText() {
		// TODO Auto-generated method stub
		String redirect_uri = "http://www.jyj.me/wxTextService_callBackInterface.action";
		
		try {
			redirect_uri = URLEncoder.encode(redirect_uri, "utf-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg = "ok";
		String text = this.wechatRequest.getContent();
		
		if(text.equals("个人")){
			String userinfo_uri="http://www.jyj.me/wxTextService_userinfocallback.action";
			msg = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx909b08d5b162e885&redirect_uri="+userinfo_uri+"&response_type=code&scope=snsapi_userinfo&state=cong#wechat_redirect"; 
			responseText(msg);
		}
		if(text.equals("myphoto")){
			//http://sawffh.vicp.cc/SSH2_MLJYJ/wxjyjService_myphoto.action
			String uri="http://www.jyj.me/wxjyjService_getopenid.action";
			String serviceuri="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx909b08d5b162e885&redirect_uri="+uri+"&response_type=code&scope=snsapi_userinfo&state=cong#wechat_redirect";
			responseNew("我的相册", "描述", "",serviceuri );
			
		}
		if(text.equals("测试相册")){
			//http://sawffh.vicp.cc/SSH2_MLJYJ/wxjyjService_myphoto.action
			String uri="http://sawffh.vicp.cc/SSH2_MLJYJ/wxjyjService_getopenid.action";
			String serviceuri="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4ccaaf091159d8c1&redirect_uri="+uri+"&response_type=code&scope=snsapi_userinfo&state=cong#wechat_redirect";
			responseNew("我的相册", "描述", "",serviceuri );
			
		}
		
	}

	@Override
	protected void onUnknown() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void onVideo() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void onVoice() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void picPhotoOrAlbum() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void picSysPhoto() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void picWeixin() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void scan() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void scanCodePush() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void scanCodeWaitMsg() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void subscribe() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void templateMsgCallback() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void unSubscribe() {
		// TODO Auto-generated method stub

	}

	@Override
	protected void view() {
		// TODO Auto-generated method stub

	}

	protected void kfCloseSession() {
		// TODO Auto-generated method stub
		
	}

	
	protected void kfCreateSession() {
		// TODO Auto-generated method stub
		
	}

	
	protected void kfSwitchSession() {
		// TODO Auto-generated method stub
		
	}

	
	protected void onShortVideo() {
		// TODO Auto-generated method stub
		
	}

}
