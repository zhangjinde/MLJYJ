package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.ScrollMode;
import org.hibernate.ScrollableResults;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.android.Release;


import cn.itcast.service.ReleaseService;

@Service @Transactional
public class ReleaseServiceBean implements ReleaseService {
	@Resource SessionFactory sf;

	//新增心情
	@Override
	public void save(Release re) {
		sf.getCurrentSession().persist(re);

	}
	//删除心情
	@Override
	public void del(Integer... id) {
		for(Integer re_id:id){
			sf.getCurrentSession().delete(sf.getCurrentSession().load(Release.class,re_id));
		}

	}
	
	
	
	@Override
	public void update(Release re) {
		sf.getCurrentSession().merge(re);

	}
	
	//查询单个
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Release find(Integer re_id) {
		
		String hql="from Release where re_id=:re_id";
		
		Query query=sf.getCurrentSession().createQuery(hql);
		query.setInteger("re_id", re_id);
		return (Release) query.uniqueResult();
	}
	
	//读取的发布心情列表
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Release> returnlist(String city) {
		
	      String hql ="from Release where city=:city";
	      Query query = sf.getCurrentSession().createQuery(hql);
		query.setString("city", city);
		return query.list();
	}
	
	public Integer gettotal() {
		Query query = sf.getCurrentSession().createQuery("from Release"); 
		ScrollableResults scrollableResults = query.scroll(ScrollMode.SCROLL_SENSITIVE);
		scrollableResults.last();
		//rowNumber从0开始，为空时则为-1,因此计算totalCount时应+1
		int totalCount = scrollableResults.getRowNumber() + 1;
		return totalCount;
	}
	
	@SuppressWarnings("unchecked")
	public List<Release> listall(Integer offset, Integer limitnum) {
		String hql="from Release order by re_time desc";
		Query query=sf.getCurrentSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(limitnum);
		return (List<Release>)query.list();
	}

}
