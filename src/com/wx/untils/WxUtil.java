package com.wx.untils;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.struts2.ServletActionContext;
import org.sword.wechat4j.token.TokenProxy;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.wx.bean.Token;
import com.wx.model.BackMessage;
import com.wx.model.TemplateData;
import com.wx.model.UserInfo;
import com.wx.model.VerifyResult;
import com.wx.model.WxTemplate;

public class WxUtil {
	public static UserInfo getuserinfo(){
			//第1步得到用户同意授权，得到code
			String code = ServletActionContext.getRequest().getParameter("code");
			//第2步通过code换取网页授权access_token
			UserInfo userInfo=null;
			try {
				String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+ConfigUtil.APPID+"&secret="+ConfigUtil.APP_SECRECT+"&code="+code+"&grant_type=authorization_code";
				InputStream in = HttpRequestUrl.httpRequeseGet(url);
				String jsonString = HttpRequestUrl.getStringFromFlow(in);
				BackMessage message = JSON.parseObject(jsonString,BackMessage.class);
				//第四步：拉取用户信息
				String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="+message.getAccess_token()+"&openid="+message.getOpenid()+"&lang=zh_CN";
				HttpMethod method = new PostMethod(userInfoUrl);
				HttpClient httpclient = new HttpClient();
				httpclient.executeMethod(method); 
				String userInfoStr = new String(method.getResponseBody(), "UTF-8");
				userInfo = JSON.parseObject(userInfoStr,UserInfo.class);
				//第5步：检验授权凭证（access_token）是否有效
				String verifyUrl = "https://api.weixin.qq.com/sns/auth?access_token="+message.getAccess_token()+"&openid="+userInfo.getOpenid()+"";
				InputStream verifyIS = HttpRequestUrl.httpRequeseGet(verifyUrl);
				String verifyStr = HttpRequestUrl.getStringFromFlow(verifyIS);
				VerifyResult veResult = JSON.parseObject(verifyStr,VerifyResult.class);
				if(veResult.getErrcode().equals("0") && veResult.getErrmsg().equals("ok")){
					return userInfo;
				}
			} catch (HttpException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}
	
	public static Integer sendTempLate(String clickUrl,String toUser,String templateId,String firststr,String username,String usertelstr,String activitynamestr,String activitytimestr,String remarkstr){
		String access_token = TokenProxy.accessToken();
		//System.out.println(access_token);
        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+access_token;
        WxTemplate temp = new WxTemplate();
        temp.setUrl(clickUrl);
        temp.setTouser(toUser);//openid
        temp.setTopcolor("#000000");
        temp.setTemplate_id(templateId);//设置模板ID
        Map<String,TemplateData> m = new HashMap<String,TemplateData>();
        TemplateData first = new TemplateData();
        first.setColor("#ff3030");  
        first.setValue(firststr);  
        m.put("first", first);  
        
        TemplateData name = new TemplateData();  
        name.setColor("#000000");  
        name.setValue(username);  
        m.put("keyword1", name);
        
        TemplateData usertel = new TemplateData();  
        usertel.setColor("#000000");  
        usertel.setValue(usertelstr);  
        m.put("keyword2", usertel);
        
        TemplateData activityname = new TemplateData();  
        activityname.setColor("#f5b");  
        activityname.setValue(activitynamestr);  
        m.put("keyword3", activityname);
        
        TemplateData activitytime = new TemplateData();  
        activitytime.setColor("#000000");  
        activitytime.setValue(activitytimestr);  
        m.put("keyword4", activitytime);
        
        TemplateData remark = new TemplateData();  
        remark.setColor("#000000");  
        remark.setValue(remarkstr);  
        m.put("remark", remark);
        
        temp.setData(m);
        String jsonString = JSONObject.toJSONString(temp);
        String json = CommonUtil.httpsRequest(url, "POST", jsonString);
        JSONObject jsonObject=JSONObject.parseObject(json);
        int result = 0;
        if (null != jsonObject) {  
             if (0 != jsonObject.getInteger("errcode")) {  
                 result = jsonObject.getInteger("errcode");
                 System.out.println("错误 errcode:"+jsonObject.getInteger("errcode")+" errmsg:"+jsonObject.getString("errmsg"));  
             }  
         }
        //System.out.println("模板消息发送结果："+result);
        return result;
        //结束
	}
	
}
