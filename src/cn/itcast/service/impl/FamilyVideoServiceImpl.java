package cn.itcast.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.CustomTS;
import cn.itcast.domain.app.FamilyVideo;
import cn.itcast.service.FamilyVideoService;
@Service @Transactional
public class FamilyVideoServiceImpl implements FamilyVideoService {
	@Resource SessionFactory factory;
	@Override
	public void save(FamilyVideo fv) {
		factory.getCurrentSession().persist(fv);

	}

	@Override
	public void del(Integer... ids) {
		for(Integer id:ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(FamilyVideo.class,id));
		}

	}

	@Override
	public void update(FamilyVideo fv) {
		factory.getCurrentSession().merge(fv);

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public FamilyVideo findById(Integer id) {
		String hql="from FamilyVideo where fv_id=:id";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setInteger("id", id);
		FamilyVideo fv=(FamilyVideo) query.uniqueResult();
		if(fv!=null){
			return fv;
		}
		return null;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FamilyVideo> findByFmilyID(Integer id,Integer limit,Integer state) {
		String hql="select * from FamilyVideo where fv_familyid=:id and state=:state order by fv_id desc";
		Query query=factory.getCurrentSession().createSQLQuery(hql).addEntity(FamilyVideo.class);
		query.setInteger("id", id);
		query.setInteger("state", state);
		query.setFirstResult(limit);
		query.setMaxResults(5);
//		query.setInteger("limit", limit);
		List<FamilyVideo> list=(ArrayList<FamilyVideo>)query.list();
		if (list!=null){
			return list;
		}
		return null;
	}

}
