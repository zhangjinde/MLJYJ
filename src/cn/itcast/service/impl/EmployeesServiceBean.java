package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;



import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import cn.itcast.domain.Employees;
import cn.itcast.service.EmployeesService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;

@Service @Transactional
public class EmployeesServiceBean implements EmployeesService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	public void save(Employees e) {
		factory.getCurrentSession().persist(e);
	}

	
	public void update(Employees e) {
		factory.getCurrentSession().merge(e);

	}

	
	public void del(Integer e_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(Employees.class, e_id));

	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Employees> findByName(String e_name) {
		String hql="from Employees where e_name="+e_name;
		return factory.getCurrentSession().createQuery(hql).list();
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page) {
		String hql="from Employees order by e_id desc";
        int allRow = memberDao.getAllRowCount(hql);    //总行数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页条数
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<Employees> list =memberDao.queryForPage(hql,offset, length);        //返回列表
        
        //设置页面bean
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
	public Employees findById(Integer e_id) {
		
		return (Employees) factory.getCurrentSession().get(Employees.class, e_id);
	}


	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Employees> serach(Integer pid,Integer cid,String professional) {
		String hql="from Employees where province_id="+pid+" and city_id="+cid+" and professional='"+professional+"'";
		
		return factory.getCurrentSession().createQuery(hql).list();
	}

}
