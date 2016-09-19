package cn.itcast.aop;

import java.util.Set;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;



import cn.itcast.domain.Permissions;
import cn.itcast.domain.Usermain;

@Aspect @Component
public class FamilyListCheck {
	private boolean have=false;
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.FamilyServiceBean.queryForPage(..))")
	private void familyListMethod() {}
	@Before("familyListMethod()")
	public void permissionCheck(){
		Usermain um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==10){
				have=true;
			}
			
		}
	}
	
	@Around("familyListMethod()")
	public Object familylistaround(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have){
			result = pjp.proceed();
			have=false;
			}
			else{
				ActionContext.getContext().put("message", "无权限查看客户资料");
			}
			return result;
			
	}
}
