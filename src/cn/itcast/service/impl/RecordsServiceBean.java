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
		final String hql = "from OperationRecords";        //��ѯ���
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<OperationRecords> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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

}
