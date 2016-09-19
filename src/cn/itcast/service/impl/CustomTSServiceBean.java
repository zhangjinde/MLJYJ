package cn.itcast.service.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.CustomTS;
import cn.itcast.service.CustomTSService;
@Service @Transactional
public class CustomTSServiceBean implements CustomTSService {
	@Resource SessionFactory factory;
	
	
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public CustomTS findbyStudioid(Integer id) {
		String hql="from CustomTS where ts_studioid=:id";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setInteger("id", id);
		CustomTS ts=(CustomTS) query.uniqueResult();
		if(ts!=null){
			return ts;
		}
		return null;
	}

	public void saveandeupdate(CustomTS ts) {
		factory.getCurrentSession().merge(ts);
	}

}
