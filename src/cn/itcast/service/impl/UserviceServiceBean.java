package cn.itcast.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import cn.itcast.domain.Family;
import cn.itcast.domain.Uservice;
import cn.itcast.service.UserviceService;

@Service @Transactional
public class UserviceServiceBean implements UserviceService{
	@Resource SessionFactory factory;
	

	@Override
	public void update(Uservice uv) {
		factory.getCurrentSession().merge(uv);
		
	}


	@Override
	public void save(Uservice um) {
		factory.getCurrentSession().persist(um);
		
	}


	@Override
	public void del(Integer... ums) {
		for(Integer uv:ums){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Uservice.class,uv));
		}
		
	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public List<Uservice> findByName(String username,Integer id) {
		List<Uservice> list=factory.getCurrentSession().createQuery("from Uservice where uv_name like '%"+username+"%'").list();
		List<Uservice> returnlist=new ArrayList<Uservice>();
		for(Uservice uv:list)
		{
			if(uv.getFy().getFamily_studio().getStudio_id().equals(id)){
				returnlist.add(uv);
			}
		}
		return returnlist;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public Uservice findById(Integer uv_id) {
		
		return (Uservice)factory.getCurrentSession().get(Uservice.class,uv_id);
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public Uservice findByTel(String tel,Integer id) {
			String hql="from Uservice where tel=?";
			Query query=factory.getCurrentSession().createQuery(hql);
			query.setString(0, tel);
			query.setCacheMode(CacheMode.IGNORE);//设置成CacheMode.IGNORE模式，在读取数据的时候，不和二级缓存交换数据，直接读取数据库。
			Uservice uv=(Uservice)query.uniqueResult();
			if(uv!=null){
			if(uv.getFy().getFamily_studio().getStudio_id().equals(id))
			{return uv;}
			else
			{return null;}
			}else{
				return null;
			}
	}


	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Uservice> findByfamilyid(Integer family_id) {
		
		return factory.getCurrentSession().createQuery("from Uservice where fy="+family_id).list();
	}


	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Uservice findByTelOnly(String tel) {
		String hql="from Uservice where tel=?";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString(0, tel);
		query.setCacheMode(CacheMode.IGNORE);//设置成CacheMode.IGNORE模式，在读取数据的时候，不和二级缓存交换数据，直接读取数据库。
		Uservice uv=(Uservice)query.uniqueResult();
		if(uv!=null)
		{return uv;}
		else
		{return null;}
	}


	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Uservice findByOpenId(String openid) {
		factory.getCurrentSession().clear();
		String hql="from Uservice where openid=?";
		Query query=factory.getCurrentSession().createQuery(hql).setCacheMode(CacheMode.IGNORE);//设置成CacheMode.IGNORE模式，在读取数据的时候，不和二级缓存交换数据，直接读取数据库。
		query.setString(0, openid);
		Uservice uv=(Uservice)query.uniqueResult();
		if(uv!=null)
		{return uv;}
		else
		{return null;}
	}


	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Uservice> findbylickname(String name) {
		@SuppressWarnings("unchecked")
		List<Uservice> list=factory.getCurrentSession().createQuery("from Uservice where uv_name like '%"+name+"%'").list();
		return list;
	}

}
