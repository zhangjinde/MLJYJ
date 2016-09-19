package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Userstatus;
import cn.itcast.domain.UserstatusComments;
import cn.itcast.service.UserStatusService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class UserStatusServiceimpl implements UserStatusService {
	@Resource SessionFactory sf;
	@Resource private MemberDao memberDao;
	@Override
	public void save(Userstatus us) {
		sf.getCurrentSession().persist(us);

	}

	@Override
	public void savers(UserstatusComments usc) {
		sf.getCurrentSession().persist(usc);

	}

	
	@Override
	public void del(Integer... id) {
		for(Integer us_id:id){
			sf.getCurrentSession().delete(sf.getCurrentSession().load(Userstatus.class,us_id));
		}
		

	}
	
	
	//点赞有问题
	@Override
	public void updatedz(Integer id) {

			String hql="update Userstatus set acceptgood=acceptgood+1 where ust_id="+id;
			
			Query query=sf.getCurrentSession().createSQLQuery(hql);
			query.executeUpdate();
		

		

	}


	@Override
	public void update(Userstatus us) {
		sf.getCurrentSession().merge(us);

	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Userstatus find(String title) {
		String hql="from Userstatus where title=:title";
		Query query=sf.getCurrentSession().createQuery(hql);
		query.setString("title", title);
		return (Userstatus) query.uniqueResult();
	}
	
	
	

	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<UserstatusComments> returnlist(Integer id, Integer num) {
		String hql="select * from UserstatusComments where usc_ust_id="+id+" order by usc_id desc";
		
		Query query=sf.getCurrentSession().createSQLQuery(hql);
		//query.setInteger("num", num);
		//query.setInteger("ustid", id);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page,Integer um_id) {
		String hql="from Userstatus where ust_um_id="+um_id+" order by ust_id desc";
		
        int allRow = memberDao.getAllRowCount(hql);    //总行数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //
        final int length = pageSize;    //一页多少条数据
        final int currentPage = PageBean.countCurrentPage(page);//当前页码
		List<Userstatus> list =memberDao.queryForPage(hql,offset, length);        //返回列表
        
        //设置返回的页面bean
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);    
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(list);
        pageBean.init();
        return pageBean;
	}

}
