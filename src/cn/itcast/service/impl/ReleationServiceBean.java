package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Relation;
import cn.itcast.service.ReleationService;
@Service @Transactional
public class ReleationServiceBean implements ReleationService {
	@Resource SessionFactory factory;
	
	public void save(Relation rel) {
		factory.getCurrentSession().persist(rel);

	}

	
	public void del(Integer r_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(Relation.class, r_id));

	}

	public void update(Relation rel) {
		factory.getCurrentSession().merge(rel);

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Relation findbyid(Integer r_id) {
		
		return (Relation) factory.getCurrentSession().load(Relation.class, r_id);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Relation> findbyumid(Integer umid) {
		String hql="from Relation where r_umid=:r_umid";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setInteger("r_umid", umid);
		@SuppressWarnings("unchecked")
		List<Relation> list=query.list();
		return list;
	}

}
