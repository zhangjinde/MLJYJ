package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.City;
import cn.itcast.service.CityService;
@Service @Transactional
public class CityServiceBean implements CityService {
@Resource SessionFactory sf;
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<City> findcity(Integer id) {
		String hql="from City where province_id="+id;
		return sf.getCurrentSession().createQuery(hql).list();
	}

}
