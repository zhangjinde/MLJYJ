package cn.itcast.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Roles;
import cn.itcast.service.PermissionsService;
import cn.itcast.service.RolesService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class RolesServiceBean implements RolesService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;	
	@Resource private PermissionsService ps;
	
	
	public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
	@Override
	public void save(Roles sd) {
		factory.getCurrentSession().persist(sd);

	}

	
	@Override
	public void update(Roles sd) {
//		String sql="delete from RolesPermissions where rp_role_id="+sd.getRole_id().toString();
//		factory.getCurrentSession().createSQLQuery(sql).list();
		
		factory.getCurrentSession().merge(sd);
		
	}

	@Override
	public void del(Integer... sds) {
		for(Integer sd:sds){
			factory.getCurrentSession().delete(factory.getCurrentSession().get(Roles.class, sd));
		}

	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Roles find(Integer sd) {
		return (Roles)factory.getCurrentSession().get(Roles.class,sd);
		
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page) {

        final String hql = "from Roles";        //查询语句
        int allRow = memberDao.getAllRowCount(hql);    //总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<Roles> list =memberDao.queryForPage(hql,offset, length);        //"一页"的记录
        
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
	@SuppressWarnings("unchecked")
	@Override
	public List<Roles> findall() {
		
		return factory.getCurrentSession().createQuery("from Roles").list();
	}
	

	

}
