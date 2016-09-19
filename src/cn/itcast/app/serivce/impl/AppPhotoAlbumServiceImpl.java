package cn.itcast.app.serivce.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.app.serivce.AppPhotoAlbumService;
import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.web.util.MemberDao;
@Service @Transactional
public class AppPhotoAlbumServiceImpl implements AppPhotoAlbumService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	
	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void save(PhotoAlbum pa) {
		factory.getCurrentSession().persist(pa);

	}

	@Override
	public void del(Integer pa_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(PhotoAlbum.class,pa_id));

	}

	@Override
	public void update(PhotoAlbum pa) {
		factory.getCurrentSession().merge(pa);

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public PhotoAlbum find(Integer pa_id) {
		
		return (PhotoAlbum)factory.getCurrentSession().get(PhotoAlbum.class,pa_id);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<PhotoAlbum> findall(Family fy) {
		String hql="from PhotoAlbum where pa_family="+fy.getFamily_id();
		return (List<PhotoAlbum>)factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<PhotoAlbum> findall(Integer fy_id) {
		String hql="from PhotoAlbum where pa_family=?";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString(0, fy_id.toString());
		List<PhotoAlbum> list=query.list();
		return list;
	}

	@Override
	public void updatewx(PhotoAlbum pa) {
		factory.getCurrentSession().merge(pa);
		
	}

//	@Override
//	public List<PhotoAlbum> findall(Studio studio) {
//		String hql="from PhotoAlbum where pa_family="+fy.getFamily_id();
//		return (List<PhotoAlbum>)factory.getCurrentSession().createQuery(hql).list();
//	}


}
