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
import cn.itcast.domain.PhotoAlbum;

import cn.itcast.domain.Usermain;

import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.RecordsService;


@Aspect @Component
public class PhotoAlbumCheckAndSave {
	private Usermain um;
	private PhotoAlbum pa;
	@Resource RecordsService rs;
	@Resource PhotoAlbumService pas;
	private boolean have=false;
	/*************************************pasave*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.PhotoAlbumServiceBean.save(..))")
	private void pasaveMethod() {}
	@Before("pasaveMethod() && args(pa)")
	public void dopaCheck(PhotoAlbum pa){
		this.pa=pa;
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==7){
				have=true;
			}
			
		}
	
	}
	@Around("pasaveMethod()")
	public Object pasavearound(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "相册创建成功");
			have=false;
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("创建相册："+pa.getPa_name()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权限操作");
			}
			return result;
			
	}
	/******************************************************************************/
	/*************************************paupdate*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.PhotoAlbumServiceBean.update(..))")
	private void paupdateMethod() {}
	@Before("paupdateMethod() && args(pa)")
	public void dopaupdate(PhotoAlbum pa){
		this.pa=pa;
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==8){
				have=true;
			}
			
		}
	
	}
	@Around("paupdateMethod()")
	public Object paupdatearound(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "更新相册成功");
			have=false;
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("更新相册："+pa.getPa_name()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权限操作");
			}
			return result;
			
	}
	/******************************************************************************/
	/*************************************padel*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.PhotoAlbumServiceBean.del(..))")
	private void padelMethod() {}
	@Before("padelMethod() && args(pa_id)")
	public void dofamildel(Integer pa_id){
		this.pa=pas.find(pa_id);
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==9){
				have=true;
			}
			
		}
	
	}
	@Around("padelMethod()")
	public Object padelaround(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "删除相册成功");
			have=false;
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("删除相册："+pa.getPa_name()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权限操作");
			}
			return result;
			
	}
	/******************************************************************************/
}
