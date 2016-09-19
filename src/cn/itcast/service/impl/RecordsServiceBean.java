package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.OperationRecords;
import cn.itcast.domain.Roles;
import cn.itcast.service.RecordsService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class RecordsServiceBean implements RecordsService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;	
	public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
	@Override
	public void save(OperationRecords or) {
		factory.getCurrentSession().persist(or);

	}

	@Override
	public void delete(Integer... or_id) {
		for(Integer id:or_id){
			factory.getCurrentSession().delete(factory.getCurrentSession().get(OperationRecords.class, id));
		}

	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page) {
		final String hql = "from OperationRecords";        //查询语句
        int allRow = memberDao.getAllRowCount(hql);    //总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<OperationRecords> list =memberDao.queryForPage(hql,offset, length);        //"一页"的记录
        
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

}
