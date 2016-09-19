package cn.itcast.service.impl;


import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.PhotoAlbumClass;
import cn.itcast.service.PhotoAlbumClassService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class PhotoAlbumClassServiceBean implements PhotoAlbumClassService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
    public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
	
	public void save(PhotoAlbumClass sd) {
		factory.getCurrentSession().persist(sd);
	}

	
	public void update(PhotoAlbumClass sd) {
		factory.getCurrentSession().merge(sd);

	}

	
	public void del(Integer... sds) {
		for(Integer sd:sds){
			factory.getCurrentSession().delete(factory.getCurrentSession().get(PhotoAlbumClass.class, sd));
		}

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PhotoAlbumClass find(Integer sd){
		return (PhotoAlbumClass)factory.getCurrentSession().get(PhotoAlbumClass.class,sd);
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize,int page){

        final String hql = "from PhotoAlbumClass";        //��ѯ���
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        List<PhotoAlbumClass> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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
	public List<PhotoAlbumClass> findall() {
		
		return factory.getCurrentSession().createQuery("from PhotoAlbumClass").list();
	}

}
