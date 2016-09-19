package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import cn.itcast.domain.TreeContent;
import cn.itcast.service.TreeContentService;
@Service @Transactional
public class TreeContentServicebean implements TreeContentService {
	@Resource SessionFactory factory;
	
	public void save(TreeContent tc) {
		factory.getCurrentSession().persist(tc);

	}

	
	public void del(Integer tc_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(TreeContent.class, tc_id));

	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TreeContent> findbyumid(Integer umid) {
		String hql="from TreeContent where um_id=:umid order by tc_id desc";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setInteger("umid", umid);
		@SuppressWarnings("unchecked")
		List<TreeContent> list=query.list();
		return list;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TreeContent findbyid(Integer tc_id) {
		
		return (TreeContent) factory.getCurrentSession().get(TreeContent.class, tc_id);
	}

}
