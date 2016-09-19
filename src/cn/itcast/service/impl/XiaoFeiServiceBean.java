package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import cn.itcast.domain.XiaoFei;
import cn.itcast.service.XiaoFeiService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class XiaoFeiServiceBean implements XiaoFeiService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	@Override
	public void save(XiaoFei xf) {
		factory.getCurrentSession().persist(xf);

	}

	@Override
	public void update(XiaoFei xf) {
		factory.getCurrentSession().merge(xf);

	}

	@Override
	public void del(Integer xf_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(XiaoFei.class, xf_id));
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize,int page,Integer family_id){

        final String hql = "from XiaoFei where xf_family="+family_id;        //��ѯ���
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        List<XiaoFei> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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
	@Override
	public XiaoFei findById(Integer xf_id) {
		
		return (XiaoFei) factory.getCurrentSession().get(XiaoFei.class, xf_id);
	}

}
