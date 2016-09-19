package cn.itcast.action.order;



import java.io.IOException;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alipay.util.UtilDate;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class GetOrderInfo extends ActionSupport{
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	public String execute(){
		UtilDate ud=new UtilDate();
		String ordernum=ud.getOrderNum()+ud.getThree();
		try {
			ServletActionContext.getResponse().getWriter().print(ordernum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
