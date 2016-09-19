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
		
        int allRow = memberDao.getAllRowCount(hql);    //总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<Gg> list =memberDao.queryForPage(hql,offset, length);        //"一页"的记录
        
        //把分页信息保存到Bean中
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
