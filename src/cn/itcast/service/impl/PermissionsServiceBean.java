package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Permissions;
import cn.itcast.service.PermissionsService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class PermissionsServiceBean implements PermissionsService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
	public void save(Permissions sd) {
		factory.getCurrentSession().persist(sd);

	}

	@Override
	public void update(Permissions sd) {
		factory.getCurrentSession().merge(sd);

	}

	@Override
	public void del(Integer... sds) {
		for(Integer sd:sds){
			factory.getCurrentSession().delete(factory.getCurrentSession().get(Permissions.class, sd));
		}
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public PageBean queryForPage(int pageSize, int page) {
		final String hql = "from Permissions";        //查询语句
        int allRow = memberDao.getAllRowCount(hql);    //总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        List<Permissions> list =memberDao.queryForPage(hql,offset, length);        //"一页"的记录
        
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
	@Override
	public Permissions find(Integer sd) {
		return (Permissions)factory.getCurrentSession().get(Permissions.class,sd);
	}
	@SuppressWarnings("rawtypes")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List findall() {
		
		return factory.getCurrentSession().createQuery("from Permissions").list();
	}

}
