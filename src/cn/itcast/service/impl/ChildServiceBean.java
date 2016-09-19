package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Child;
import cn.itcast.domain.Uservice;


import cn.itcast.service.ChildService;
@Service @Transactional
public class ChildServiceBean implements ChildService {
	@Resource SessionFactory factory;
	@Override
	public void save(Child child) {
		factory.getCurrentSession().persist(child);

	}

	@Override
	public void update(Child child) {
		factory.getCurrentSession().merge(child);

	}

	@Override
	public void delchild(Integer... child_id) {
		for(Integer cid:child_id){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Child.class, cid));
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Child> findByfamilyid(Integer family_id) {
		String hql="from Child where child_family="+family_id;
		
		return factory.getCurrentSession().createQuery(hql).list();
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Child findById(Integer child_id) {
		
		return (Child)factory.getCurrentSession().get(Child.class, child_id);
	}

	
}
