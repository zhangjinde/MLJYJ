package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.android.RePicture;
import cn.itcast.service.RePictureService;

@Service @Transactional
public class RePictureServiceBean implements RePictureService {

	@Resource SessionFactory factory;
	
	
	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}


	@Override
	public void save(RePicture rpic) {
		factory.getCurrentSession().persist(rpic);

	}
	

	@Override
	public void del(Integer rep_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().get(RePicture.class, rep_id));
		
	}
	

	@Override
	public void update(RePicture rpic) {
		factory.getCurrentSession().merge(rpic);
		
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public RePicture find(Integer rep_id) {
		
		return (RePicture)factory.getCurrentSession().get(RePicture.class,rep_id);
	}

	//查询返回发布心情上传对应的图片，re_id 为发布心情表的id
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<RePicture> findall(Integer re_id) {
		String hql="from RePicture where rep_reid="+re_id;
		
		List<RePicture> piclist=factory.getCurrentSession().createQuery(hql).list();
		
		return piclist;
	}

	

}
