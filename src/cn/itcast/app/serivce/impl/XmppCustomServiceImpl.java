package cn.itcast.app.serivce.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.app.serivce.XmppCustomService;
@Service @Transactional
public class XmppCustomServiceImpl implements XmppCustomService {
	@Resource SessionFactory factory;
	@Override
	public Object getxmppuser(String jidstr) {
		String hql="select a.username,uv_name,headportrait_url from ofUser as a LEFT JOIN Uservice as b on a.username=b.tel where username=:username";
		Query query=factory.getCurrentSession().createSQLQuery(hql);
		query.setString("username", jidstr);
		return query.uniqueResult();
	}

}
