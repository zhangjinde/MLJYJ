package cn.itcast.app.serivce.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.app.serivce.AppActivityService;
import cn.itcast.domain.app.AppActivity;
@Service @Transactional
public class AppActivityServiceImpl implements AppActivityService {
	@Resource SessionFactory factory;
	@Override
	public void save(AppActivity aa) {
		factory.getCurrentSession().persist(aa);

	}

	@Override
	public void update(AppActivity aa) {
		factory.getCurrentSession().merge(aa);

	}

	@Override
	public void del(Integer id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(AppActivity.class,id));

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@SuppressWarnings("unchecked")
	@Override
	public List<AppActivity> allList(Integer studioid,Integer isuse) {
		String hql="from AppActivity where studioid=:studioid and isuse=:isuse";
		Query query =factory.getCurrentSession().createQuery(hql);
		query.setInteger("studioid", studioid);
		query.setInteger("isuse", isuse);
		return query.list();
	}

}
