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

        final String hql = "from PhotoAlbumClass";        //查询语句
        int allRow = memberDao.getAllRowCount(hql);    //总记录数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //当前页开始记录
        final int length = pageSize;    //每页记录数
        final int currentPage = PageBean.countCurrentPage(page);
        List<PhotoAlbumClass> list =memberDao.queryForPage(hql,offset, length);        //"一页"的记录
        
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
	public List<PhotoAlbumClass> findall() {
		
		return factory.getCurrentSession().createQuery("from PhotoAlbumClass").list();
	}

}
