package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Family;
import cn.itcast.domain.StandInsideLetter;

import cn.itcast.service.SILService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class SILServiceBean implements SILService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	@Override
	public void save(StandInsideLetter sil) {
		factory.getCurrentSession().persist(sil);

	}

	@Override
	public void del(Integer... sil_id) {
		for(Integer id:sil_id){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(StandInsideLetter.class,id));
		}

	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean findaccept(int pageSize, int page, String username) {
		String hql="from StandInsideLetter where sil_user_accept='"+username+"' order by sil_id desc";
        int allRow = memberDao.getAllRowCount(hql);    //总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<StandInsideLetter> list =memberDao.queryForPage(hql,offset, length);        //"一页"的记录
        
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

	

	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Integer findnoread(String username) {
		String hql="from StandInsideLetter where sil_user_accept='"+username+"' and isread=0";
		
		@SuppressWarnings("unchecked")
		List<StandInsideLetter> list=factory.getCurrentSession().createQuery(hql).list();
		return list.size();
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public StandInsideLetter findaccept(Integer sil_id) {
		
		return (StandInsideLetter)factory.getCurrentSession().get(StandInsideLetter.class,sil_id);
	}

}
