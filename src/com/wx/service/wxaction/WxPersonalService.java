package com.wx.service.wxaction;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Uservice;
import cn.itcast.service.UserviceService;

import com.wx.model.UserInfo;
import com.wx.untils.WxUtil;

@Controller @Scope("propotype")
public class WxPersonalService {
	@Resource UserviceService us;
	public String giveuserinfo(){
		UserInfo wxuser=WxUtil.getuserinfo();
		Uservice uv=us.findByOpenId(wxuser.getOpenid());
		if(uv==null){
			//未绑定
			return "nobinding";
		}
		
		return null;
	}

}
