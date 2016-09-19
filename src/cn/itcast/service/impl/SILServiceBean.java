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
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<StandInsideLetter> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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
