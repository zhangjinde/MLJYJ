package cn.itcast.aop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.aspectj.lang.annotation.Before;

import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Family;
import cn.itcast.domain.OperationRecords;
import cn.itcast.domain.Permissions;
import cn.itcast.domain.StandInsideLetter;
import cn.itcast.domain.Studio;
import cn.itcast.domain.XiaoFei;

import cn.itcast.domain.Usermain;
import cn.itcast.service.FamilyService;
import cn.itcast.service.RecordsService;
import cn.itcast.service.SILService;
import cn.itcast.service.StudioService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;
import cn.itcast.service.XiaoFeiService;


@Aspect @Component
public class FamilyCheckAndSave {
	private Usermain um;
	private Family f;
	private Integer family_id;
	private Studio family_s;
	@Resource RecordsService rs;
	@Resource FamilyService fs;
	@Resource UserviceService uvs;
	@Resource UsermainService ums;
	@Resource StudioService ss;
	@Resource SILService sils;
	private boolean have=false;
	/*************************************familysave*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.FamilyServiceBean.save(..))")
	private void familysaveMethod() {}
	@Before("familysaveMethod() && args(family)")
	public void dofamilyCheck(Family family){
		this.f=family;
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==1){
				have=true;
			}
			
		}
	
	}
	@Resource XiaoFeiService xfs;
	@Around("familysaveMethod()")
	public Object familysavearound(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();
			ActionContext.getContext().put("message", "添加成功");
			have=false;
			/*��Ӽ�ͥĬ�ϻ�ɴ����Ѽ�¼*/
			XiaoFei xf=new XiaoFei();
			xf.setXf_family(f);
			xf.setXf_money(f.getConsumption());
			xf.setXf_project("婚纱照");
			xfs.save(xf);
			
			/***************************/
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("建立家庭档案"+f.getLovepwd()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权创建家庭");
			}
			return result;
			
	}
	/******************************************************************************/
	/*************************************familyupdate*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.FamilyServiceBean.update(..))")
	private void familyupdateMethod() {}
	@Before("familyupdateMethod() && args(family)")
	public void dofamilyupdate(Family family){
		this.f=family;
		this.family_id=f.getFamily_id();
		this.family_s=f.getFamily_studio();
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==2){
				have=true;
			}
			
		}
	
	}
	@Around("familyupdateMethod()")
	public Object familyupdatearound(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			result = pjp.proceed();//��������ѱ���
			ActionContext.getContext().put("message", "更新成功");
			have=false;
			/*�鿴�Ƿ����ƽ�������������ƽ������Ͷ��ƽ�Ӱ¥�µ����й����˻������ʼ����ѡ�*/
			Family update_family=fs.find(family_id);//���º��Ӱ¥��
			if(!family_s.getStudio_id().equals(update_family.getFamily_studio().getStudio_id())){//�Ƚϱ���ǰ��Ӱ¥����Ƿ����
				//�����ж�Ϊ�ƽ�����վ����
				Usermain currentadmin=(Usermain) ActionContext.getContext().getSession().get("usermain");//��ǰ������˺���Ϣ
				Studio currentstudio=currentadmin.getUservice().getFy().getFamily_studio();
				Integer studio_id=family_s.getStudio_id();
				List<Usermain> umlist=ss.findalladmin();
				
				for(Usermain u:umlist){
					if(u.getUservice().getFy().getFamily_studio().getStudio_id().equals(studio_id)){
					StandInsideLetter s=new StandInsideLetter();
					s.setSil_user_send(currentadmin.getUsername());
					s.setSil_title("移交公户");
					s.setIsread(false);
					s.setSil_content("移交影楼："+currentstudio.getStudio_name()+"移交家庭的爱情密码（"+update_family.getLovepwd()+"成功接收后请回信");
					s.setSil_user_accept(u.getUsername());
					sils.save(s);
					ActionContext.getContext().put("message", "移交家庭成功");
					}
				}
				
			}
			/********************************/
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("更新家庭密码"+f.getLovepwd()+"成功");
			rs.save(or);
			}
			else{
				ActionContext.getContext().put("message", "无权更新家庭");
			}
			return result;
			
	}
	/******************************************************************************/
	/*************************************familydel*******************************/
	@SuppressWarnings("unused")
	@Pointcut("execution (* cn.itcast.service.impl.FamilyServiceBean.del(..))")
	private void familydelMethod() {}
	@Before("familydelMethod() && args(family_ids)")
	public void dofamildel(Integer... family_ids){
		if (family_ids.length==1){
			this.f=fs.find(family_ids[0]);
		}
		um=(Usermain)ActionContext.getContext().getSession().get("usermain");
		Set<Permissions> permissions=um.getRole().getPermissions();
		for (Permissions p:permissions){
			if(p.getPermissions_id()==3){
				have=true;
			}
			
		}
	
	}
	@Around("familydelMethod()")
	public Object famildelaround(ProceedingJoinPoint pjp) throws Throwable {
			Object result=null;
			if(have==true){
			if(!f.getFamily_id().equals(um.getUservice().getFy().getFamily_id())){//�ж��Ƿ��ǹ���Ա�Լ��ļ�ͥ�����Ƿ��У��ǲ�����ɾ��
				
			result = pjp.proceed();
			ActionContext.getContext().put("message", "删除家庭成功");
			have=false;
			/*��Ӳ�����¼*/
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String time=df.format(new Date());
			OperationRecords or=new OperationRecords();
			or.setRecord_time(time);
			or.setOr_studio(um.getUservice().getFy().getFamily_studio());
			or.setOr_type("删除家庭："+f.getLovepwd()+"成功");
			rs.save(or);
			}
			else {
				ActionContext.getContext().put("message", "不能删除影楼所在家庭组");
			}
			}
			else{
				ActionContext.getContext().put("message", "无权删除家庭");
			}
			return result;
			
	}
	/******************************************************************************/
}
