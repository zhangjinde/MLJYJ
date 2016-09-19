package cn.itcast.app.serivce.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.app.serivce.AppVersionService;
@Service @Transactional
public class AppVersionServiceImpl implements AppVersionService {
	@Resource SessionFactory factory;
	@Override
	public String getversion() {
		String hql="select * from Appversion";
		Query query=factory.getCurrentSession().createSQLQuery(hql);
		Object obj=query.uniqueResult();
		String str=obj.toString();
		return str;
	}

}
