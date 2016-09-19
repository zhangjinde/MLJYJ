package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Family;
import cn.itcast.domain.Gg;
import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.service.GgService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class GgServiceBean implements GgService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	@Override
	public void save(Gg g) {
		factory.getCurrentSession().persist(g);

	}

	@Override
	public void del(Integer id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(Gg.class,id));

	}

	@Override
	public void update(Gg g) {
		factory.getCurrentSession().merge(g);

	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page) {
		
		String hql="from Gg";
		
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<Gg> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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
	public Gg find(Integer id) {
		
		return (Gg)factory.getCurrentSession().get(Gg.class, id);
	}

	@SuppressWarnings("unused")
	@Override
	public Gg findischeck() {
		String hql="from Gg where ischeck=1";
		Gg g=(Gg)factory.getCurrentSession().createQuery(hql).uniqueResult();
		return g;
	}
}
