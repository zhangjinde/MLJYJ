package cn.itcast.service.impl;


import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.StudioService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class StudioServiceBean implements StudioService {
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
    public void setMemberDao(MemberDao memberDao) {
        this.memberDao = memberDao;
    }
	@Override
	public void save(Studio sd) {
		factory.getCurrentSession().persist(sd);
	}

	@Override
	public void update(Studio sd) {
		factory.getCurrentSession().merge(sd);

	}

	@Override
	public void del(Integer... sds) {
		for(Integer sd:sds){
			factory.getCurrentSession().delete(factory.getCurrentSession().get(Studio.class, sd));
		}

	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Studio find(Integer sd){
		return (Studio)factory.getCurrentSession().get(Studio.class,sd);
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize,int page){

        final String hql = "from Studio";        //��ѯ���
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        List<Studio> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Studio> findall() {
		
		return factory.getCurrentSession().createQuery("from Studio").list();
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Studio> findlikeName(String name) {
		
		return factory.getCurrentSession().createQuery("from Studio where studio_name like '%"+name+"%'").list();
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Usermain> findalladmin() {
		String hql="from Usermain um where um.role<>3 ";
		List<Usermain> umlist=factory.getCurrentSession().createQuery(hql).list();
		return umlist;
	}
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Usermain> findadminByStudioid(Integer sid) {
		String hql="SELECT Usermain.um_id,Usermain.username,Usermain.user_password,Usermain.user_nickname,Usermain.regtime,Usermain.lastlogtime,Usermain.prompt_problem,Usermain.answer,Usermain.log_num,Usermain.IP,Usermain.integral,Usermain.role,Usermain.jf FROM Usermain LEFT JOIN Uservice ON Usermain.um_id=Uservice.uv_id LEFT JOIN Family ON Uservice.family=Family.family_id where Usermain.role<>3 and Family.family_studio=:sid";
		Query query=factory.getCurrentSession().createSQLQuery(hql).addEntity(Usermain.class);
		query.setInteger("sid", sid);
		return (List<Usermain>)query.list();
	}
}
