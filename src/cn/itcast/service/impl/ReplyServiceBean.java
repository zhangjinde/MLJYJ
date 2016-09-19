package cn.itcast.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.android.Reply;

import cn.itcast.service.ReplyService;

@Service @Transactional
public class ReplyServiceBean implements ReplyService {
	@Resource SessionFactory sf;

	//新增回复
	@Override
	public void save(Reply re) {
		sf.getCurrentSession().persist(re);

	}
	
	//返回对应发布信息的回复列表 re_id 为发布心情表的id
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Reply> returnlist(Integer re_id) {
		
	      String hql ="from Reply where re_id="+re_id;
		
		return sf.getCurrentSession().createQuery(hql).list();
	}

	@Override
	public void del(Integer r_id) {
		
		sf.getCurrentSession().delete(sf.getCurrentSession().get(Reply.class, r_id));
		
	}

	@Override
	public void update(Reply r) {
		sf.getCurrentSession().merge(r);
		
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Reply find(Integer r_id) {
		return (Reply)sf.getCurrentSession().get(Reply.class,r_id);
	}

}
