package cn.itcast.service.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.StudioUrl;
import cn.itcast.service.StudioUrlService;
@Service
@Transactional
public class StudioUrlServiceImpl implements StudioUrlService {
	@Resource SessionFactory factory;
	@Override
	public void saveorupdate(StudioUrl su) {
		factory.getCurrentSession().merge(su);

	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public StudioUrl findByStudioId(Integer id) {
		String hql="from StudioUrl where studioid=:id";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setInteger("id", id);
		return (StudioUrl) query.uniqueResult();
	}

}
