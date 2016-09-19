package cn.itcast.app.serivce.impl;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.app.serivce.AppCountsService;
@Service @Transactional
public class AppCountsServiceImpl implements AppCountsService {
	@Resource SessionFactory factory;
	@Override
	public Object getcounts(Integer id) {
		String hql="select count(*) as counts from Uservice as a,PhotoAlbum as b where a.family=b.pa_family and a.uv_id=:id "+"union all "
				+"select count(*) as counts from Uservice as a,FamilyVideo as b where a.family=b.fv_familyid and a.uv_id=:id "+"union all "
				+"select 0 "+"union all "
				+"select count(*) as counts from StandInsideLetter where sil_user_send=(select username from Usermain where um_id=:id)";
		Query query=factory.getCurrentSession().createSQLQuery(hql);
		query.setInteger("id", id);
		return query.list();
	}

}
