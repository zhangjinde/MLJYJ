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

import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;
@Service @Transactional
public class UsermainServiceBean implements UsermainService{
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	@Override
	public void save(Usermain um) {
		factory.getCurrentSession().persist(um);
		
	}

	@Override
	public void update(Usermain um) {
		factory.getCurrentSession().merge(um);
		
	}

	@Override
	public void del(Integer... ums) {
		for(Integer um:ums){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Usermain.class,um));
		}
		
	}

	@Override @Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Usermain findByName(String username,Integer id) {
		
		String hql="from Usermain where username=?";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString(0, username);
		Usermain um=(Usermain)query.uniqueResult();
		if(um.getUservice().getFy().getFamily_studio().getStudio_id().equals(id)){
			return um;
		}else{
			return null;
		}
		
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public Usermain findById(Integer um_id) {
		
		return (Usermain)factory.getCurrentSession().get(Usermain.class, um_id);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public PageBean queryForPage(int pageSize, int page, Usermain um) {
		Studio family_studio=um.getUservice().getFy().getFamily_studio();
		String hql;
		if(um.getRole().getRole_id()==1){
			hql="from Usermain order by um_id desc";
		}
		else{
			hql = "from Usermain where uservice.fy.family_studio.studio_id ="+family_studio.getStudio_id()+" order by um_id desc";
		}
		    
        int allRow = memberDao.getAllRowCount(hql);    //�ܼ�¼��
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //��ҳ��
        final int offset = PageBean.countOffset(pageSize, page);    //��ǰҳ��ʼ��¼
        final int length = pageSize;    //ÿҳ��¼��
        final int currentPage = PageBean.countCurrentPage(page);
        @SuppressWarnings("unchecked")
		List<Usermain> list =memberDao.queryForPage(hql,offset, length);        //"һҳ"�ļ�¼
        
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

	@Override
	public Usermain findByName(String username) {
		String hql="from Usermain where username=?";
		Query query=factory.getCurrentSession().createQuery(hql);
		query.setString(0, username);
		return (Usermain)query.uniqueResult();
	}

	@Override
	public void wxupdate(Usermain um) {
		factory.getCurrentSession().merge(um);
		
	}



}
