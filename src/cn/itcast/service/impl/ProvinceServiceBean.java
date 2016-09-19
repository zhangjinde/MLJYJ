package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Province;
import cn.itcast.service.ProvinceService;
@Service @Transactional
public class ProvinceServiceBean implements ProvinceService {
	@Resource SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Province> findall() {
		String hql="from Province";
		return factory.getCurrentSession().createQuery(hql).list();
	}

}
