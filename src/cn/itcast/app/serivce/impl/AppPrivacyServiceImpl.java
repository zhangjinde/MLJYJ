package cn.itcast.app.serivce.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.app.serivce.AppPrivacyService;
import cn.itcast.domain.AppPrivacy;
@Service @Transactional
public class AppPrivacyServiceImpl implements AppPrivacyService {
	@Resource SessionFactory factory;
	@Override
	public void save(AppPrivacy ap) {
		factory.getCurrentSession().persist(ap);

	}

	@Override
	public void update(AppPrivacy ap) {
		factory.getCurrentSession().merge(ap);
	}

	@Override
	public AppPrivacy findByUid(Integer uid) {
		String hql="from AppPrivacy where uid=:uid";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setInteger("uid", uid);
		return (AppPrivacy) query.uniqueResult();
	}

}
