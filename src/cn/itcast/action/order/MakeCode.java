package cn.itcast.action.order;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.wx.untils.GenerateQrCodeUtil;

@Controller @Scope("propotype")
public class MakeCode {
	private String code_url;
	
	public String getCode_url() {
		return code_url;
	}

	public void setCode_url(String code_url) {
		this.code_url = code_url;
	}

	public String viewImages(){
		HttpServletResponse response=ServletActionContext.getResponse();
		GenerateQrCodeUtil.encodeQrcode(code_url, response);
		return null;
	}
}
