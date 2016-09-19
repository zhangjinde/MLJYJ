package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import cn.itcast.domain.YPOrder;
import cn.itcast.service.YPOrderService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class YPOrderServiceBean implements YPOrderService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	@Override
	public void save(YPOrder yp) {
		factory.getCurrentSession().persist(yp);

	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page) {
		String hql="from YPOrder"; 
        int allRow = memberDao.getAllRowCount(hql);    
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    
        final int offset = PageBean.countOffset(pageSize, page);    
        final int length = pageSize;   
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<YPOrder> list =memberDao.queryForPage(hql,offset, length);        
        
        
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
	public void del(Integer... ids) {
		for(Integer id:ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(YPOrder.class,id));
		}
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public YPOrder findById(Integer id) {
		
		return (YPOrder) factory.getCurrentSession().get(YPOrder.class, id);
	}

}
