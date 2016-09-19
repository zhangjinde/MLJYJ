package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Pictures;
import cn.itcast.domain.Studio;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class PicturesServiceBean implements cn.itcast.service.PicturesService {
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
	public void save(Pictures pic) {
		factory.getCurrentSession().persist(pic);

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public PageBean queryForPage(int pageSize, int page, Integer pa_id) {
		 final String hql = "from Pictures where pic_pa="+pa_id+" order by pic_index";        //��ѯ���
	        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
	        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
	        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
	        final int length = pageSize;    //ÿҳ��¼��
	        final int currentPage = PageBean.countCurrentPage(page);
	        @SuppressWarnings("unchecked")
			List<Pictures> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
	        
	        //�ѷ�ҳ��Ϣ���浽Bean��
	        PageBean pageBean = new PageBean();
	        pageBean.setPageSize(pageSize);    
	        pageBean.setCurrentPage(currentPage);
	        pageBean.setAllRow(allRow);
	        pageBean.setTotalPage(totalPage);
	        pageBean.setList(list);
	        pageBean.init();
	        return pageBean;
	}

	@Override
	public void del(Integer pic_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().get(Pictures.class, pic_id));
		
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public Pictures find(Integer pic_id) {
		
		return (Pictures)factory.getCurrentSession().get(Pictures.class,pic_id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pictures> findall(Integer pa_id) {
		String hql="from Pictures where pic_pa="+pa_id+" order by pic_index";
		List<Pictures> piclist=factory.getCurrentSession().createQuery(hql).list();
		return piclist;
	}

	@Override
	public void update(Pictures pic) {
		factory.getCurrentSession().merge(pic);
		
	}
	
	
	

}
