package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import cn.itcast.domain.Gg;
import cn.itcast.domain.ShopOrder;
import cn.itcast.service.ShopOrderService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class ShopOrderServiceBean implements ShopOrderService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	public void save(ShopOrder so) {
		
		factory.getCurrentSession().persist(so);

	}

	
	public void update(ShopOrder so) {
		factory.getCurrentSession().merge(so);

	}

	
	public void del(Integer id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(ShopOrder.class, id));

	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public ShopOrder findByNum(String ordernum) {
		String hql="from ShopOrder where ordernum="+ordernum;
		
		return (ShopOrder) factory.getCurrentSession().createQuery(hql).uniqueResult();
	}


	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page) {
		
		String hql="from ShopOrder order by id desc";
		
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //页面大小
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<ShopOrder> list =memberDao.queryForPage(hql,offset, length);        //对象集合
        
        //页面信息
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);    
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(list);
        pageBean.init();
        return pageBean;
	}


	
	public ShopOrder findById(Integer id) {
		
		return (ShopOrder)factory.getCurrentSession().get(ShopOrder.class, id);
	}

}
