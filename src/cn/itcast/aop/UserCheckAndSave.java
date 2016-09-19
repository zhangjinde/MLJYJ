package cn.itcast.aop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.aspectj.lang.annotation.Before;

import com.opensymphony.xwork2.ActionContext;


import cn.itcast.domain.OperationRecords;
import cn.itcast.domain.Permissions;

import cn.itcast.domain.Usermain;

import cn.itcast.service.RecordsService;
import cn.itcast.service.UsermainService;

@Aspect @Component
public class UserCheckAndSave {
	private Usermain um;
	private Usermain umbean;
	@Resource RecordsService rs;
	@Resource UsermainService us;
	private boolean have=false;
	/*************************************usermainsave*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.UsermainServiceBean.save(..))")
	private void usermainsaveMethod() {}
	@Before("usermainsaveMethod() && args(usermain)")
	public void doumCheck(Usermain usermain){
		this.umbean=usermain;
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==4){
				have=true;
			}
			
		}
	
	}
	@Around("usermainsaveMethod()")
	public Object umsavearound(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "创建用户成功");
			have=false;
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("创建用户："+umbean.getUsername()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权限操作");
			}
			return result;
			
	}
	/******************************************************************************/
	/*************************************usermainupdate*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.UsermainServiceBean.update(..))")
	private void umupdateMethod() {}
	@Before("umupdateMethod() && args(usermain)")
	public void doumupdate(Usermain usermain){
		this.umbean=usermain;
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==5){
				have=true;
			}
			
		}
	
	}
	@Around("umupdateMethod()")
	public Object umupdatearound(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "更新用户成功");
			have=false;
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("更新用户："+umbean.getUsername()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权限操作");
			}
			return result;
			
	}
	/******************************************************************************/
	/*************************************usermaindel*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.UsermainServiceBean.del(..))")
	private void umdelMethod() {}
	@Before("umdelMethod() && args(um_ids)")
	public void dofamildel(Integer... um_ids){
		if (um_ids.length==1){
			this.umbean=us.findById(um_ids[0]);
		}
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==6){
				have=true;
			}
			
		}
	
	}
	@Around("umdelMethod()")
	public Object umdelaround(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "删除用户成功");
			have=false;
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("删除用户："+umbean.getUsername()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权限操作");
			}
			return result;
			
	}
	/******************************************************************************/
}
