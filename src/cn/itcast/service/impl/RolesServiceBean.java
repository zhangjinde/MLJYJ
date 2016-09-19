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

        final String hql = "from Roles";        //��ѯ���
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<Roles> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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
	@SuppressWarnings("unchecked")
	@Override
	public List<Roles> findall() {
		
		return factory.getCurrentSession().createQuery("from Roles").list();
	}
	

	

}
