package cn.itcast.aop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;


import cn.itcast.domain.OperationRecords;
import cn.itcast.domain.Permissions;
import cn.itcast.domain.Usermain;
import cn.itcast.service.RecordsService;

//@Aspect @Component
public class UploadImage {
	private Usermain um;
	private boolean have=false;
	@Resource RecordsService rs;
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.action.user.UploadFileDemoAction.uploadFile())")
	private void uploadMethod() {}
	@Before("uploadMethod()")
	public void douploadCheck(){
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==10){
				have=true;
			}
			
		}
	
	}
	@Around("uploadMethod()")
	public Object uploadaround(ProceedingJoinPoint pjp) throws Throwable {
		Object result=null;
		if(have==true){
		result = pjp.proceed();
		have=false;
		/*添加操作记录*/
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		OperationRecords or=new OperationRecords();
		or.setRecord_time(time);
		or.setOr_studio(um.getUservice().getFy().getFamily_studio());
		or.setOr_type("上传图片");
		rs.save(or);
		}
		else{
			ActionContext.getContext().put("result", "无权限操作");
		}
		return result;
	}
}
