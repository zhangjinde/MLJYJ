package cn.itcast.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;





import cn.itcast.domain.Child;
import cn.itcast.domain.Family;
import cn.itcast.domain.Remind;
import cn.itcast.domain.Studio;
import cn.itcast.domain.UserageFX;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.XiaofeiFamily;
import cn.itcast.domain.XiaofeiY;

import cn.itcast.service.FamilyService;
import cn.itcast.web.util.JdbcUtils;
import cn.itcast.web.util.MemberDao;
import cn.itcast.web.util.PageBean;

@Service @Transactional
public class FamilyServiceBean implements FamilyService{
	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	ResultSet rs;
	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void save(Family family) {
		factory.getCurrentSession().persist(family);
		
	}

	@Override
	public void del(Integer... family_ids) {
		for(Integer family_id:family_ids){
			factory.getCurrentSession().delete(factory.getCurrentSession().load(Family.class,family_id));
		}
		
	}

	@Override
	public void update(Family family) {
		factory.getCurrentSession().merge(family);//������saveorupdate
		
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Family find(Integer family_id) {
		
		return (Family)factory.getCurrentSession().get(Family.class,family_id);
	}


	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean queryForPage(int pageSize, int page,Usermain um) {
		Studio family_studio=um.getUservice().getFy().getFamily_studio();
		int id=um.getUm_id();
		String hql;
		if(um.getRole().getRole_id()==1){
			hql="from Family order by family_id desc";
		}
		else if(um.getRole().getRole_id()==7){
			hql = "from Family where family_studio="+family_studio.getStudio_id()+" and um_id="+id+" order by family_id desc";
		}
		else{
			hql = "from Family where family_studio="+family_studio.getStudio_id()+" order by family_id desc";
		}
		    
        int allRow = memberDao.getAllRowCount(hql);    //总行数
        int totalPage = PageBean.countTotalPage(pageSize, allRow);    //总页数
        final int offset = PageBean.countOffset(pageSize, page);    //
        final int length = pageSize;    //一页多少条数据
        final int currentPage = PageBean.countCurrentPage(page);//当前页码
        @SuppressWarnings("unchecked")
		List<Family> list =memberDao.queryForPage(hql,offset, length);        //返回列表
        
        //设置返回的页面bean
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
	
	public List<Family> findlikelovepwd(String pwd,Integer s_id) {
		
		return factory.getCurrentSession().createQuery("from Family where lovepwd like '%"+pwd+"%' and family_studio="+s_id).list();
	}

	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Family> marryremind(Integer s_id) {
		
		String hql ="from Family where family_studio="+s_id;
		
		return factory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Family> findBychildname(String name, Integer s_id) {
		List<Child> c=factory.getCurrentSession().createQuery("from Child where child_name like '%"+name+"%'").list();
		List<Family> ff=new ArrayList<Family>();
		for(Child child:c){
			Integer id=child.getChild_family().getFamily_id();
			Family f=(Family) factory.getCurrentSession().createQuery("from Family where family_id="+id+" and family_studio="+s_id).uniqueResult();
			if(f!=null){
				ff.add(f);
			}
		}
		return ff;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Integer familycount() {
		String sql="select count(*) from Family";
		int count=(new Integer(factory.getCurrentSession().createSQLQuery(sql).uniqueResult().toString())).intValue();
		return count;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Integer familycount(Integer s_id,String time) {
		String sql="select count(regtime) from Family where regtime like '%"+time+"%' and family_studio="+s_id;
		int count=(new Integer(factory.getCurrentSession().createSQLQuery(sql).uniqueResult().toString())).intValue();
		return count;
	}

	 public Connection conn = null;  
	 public Statement st = null;  
	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Remind> marryremind1(Integer s_id) {
	
		 List<Remind> remindlist = new ArrayList<Remind>();
		try {
			
			
			conn=JdbcUtils.getConnection();

			String hql ="select  remindclass1,remindclass2,remindclass3,homeaddress,sex_name, tel as phone,xf_project from (  " +
					"select remindclass1,remindclass2,remindclass3,homeaddress, sex_name,phone as tel,xf_project,family_studio FROM ( SELECT '(阳历)婚期还有' as remindclass1,'3' as remindclass2,'天' AS remindclass3, family_address AS homeaddress,marrydate,family_id,family_studio " +
					" FROM Family WHERE islun=0 and TIMESTAMPDIFF(DAY,CURDATE(),marrydate)=3) a " +
					"LEFT JOIN  " +
					"(select  group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) b on a.family_id=b.family  " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=a.family_id   "+


					" UNION ALL " +
					
					"select remindclass1,remindclass2,remindclass3,homeaddress, sex_name,phone as tel,xf_project,family_studio FROM ( SELECT '(阴历)婚期还有' as remindclass1,'3' as remindclass2,'天' AS remindclass3, family_address AS homeaddress,marrydate,family_id,family_studio " +
					"  FROM Family WHERE islun=1 and TIMESTAMPDIFF(DAY,  (select nldate from calendar where yldate=CURDATE()),marrydate)=3) aa " +
					" LEFT JOIN  " +
					" (select  group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) bb1 on aa.family_id=bb1.family   " +
					
" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=aa.family_id    "+

					" UNION ALL " +
					
					" select  remindclass1,remindclass2,remindclass3,homeaddress, sex_name,phone,xf_project,family_studio FROM ( SELECT  " +
					" '(阳历)结婚' as  remindclass1,IFNULL(TIMESTAMPDIFF(YEAR,marrydate,CURDATE()),0) as  remindclass2,'周年纪念' AS remindclass3,  " +
					" family_address AS homeaddress,marrydate,family_id,family_studio FROM Family WHERE islun=0 " +
					" and IFNULL(TIMESTAMPDIFF(YEAR,marrydate,CURDATE()),0)>0 and  " +
					" DATEDIFF(CAST(CONCAT(YEAR(NOW()),DATE_FORMAT(marrydate,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR(NOW())+1,DATE_FORMAT(marrydate,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3 " +
					" ) a1 " +
					" LEFT JOIN " +
					" (select group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) b1 on a1.family_id=b1.family  " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=a1.family_id    "+
					
					" UNION ALL " +
					" select  remindclass1,remindclass2,remindclass3,homeaddress, sex_name,phone,xf_project,family_studio FROM ( SELECT  " +
					"  '(阴历)结婚' as  remindclass1,IFNULL(TIMESTAMPDIFF(YEAR,marrydate,(select nldate from calendar where yldate=CURDATE())),0) as  remindclass2,'周年纪念' AS remindclass3, " +
					"  family_address AS homeaddress,marrydate,family_id,family_studio FROM Family WHERE islun=1 " +
					"  and IFNULL(TIMESTAMPDIFF(YEAR,marrydate,(select nldate from calendar where yldate=CURDATE())),0)>0 and " +
					" DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE())),DATE_FORMAT(marrydate,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE()))+1,DATE_FORMAT(marrydate,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3 " +
					" ) aa1 " +
					" LEFT JOIN  " +
					" (select group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) bb1 on aa1.family_id=bb1.family   " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=aa1.family_id    "+
					
					" UNION ALL " +
					" select remindclass1,remindclass2,remindclass3,homeaddress, sex_name,phone,xf_project,family_studio FROM ( SELECT " +
					" '预产期还有' as  remindclass1,'40' as  remindclass2,'天' AS remindclass3,  " +
					" family_address AS homeaddress,marrydate,family_id,family_studio FROM Family WHERE islun=0 and TIMESTAMPDIFF(DAY,CURDATE(),childbirth)=40 ) a2 " +
					" LEFT JOIN  " +
					" (select group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) b2 on a2.family_id=b2.family  " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=a2.family_id    "+
					
					" UNION ALL " +
					" select  '(阳历)还有' as remindclass1,'3' as remindclass2,'天生日' AS remindclass3 ,family_address as homeaddress, concat(GENDER,':', uv_name) AS sex_name ,tel as phone,xf_project,family_studio  from Uservice a3 LEFT JOIN Family b3 on   a3.family=b3.family_id " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=b3.family_id    "+
					
					
					" WHERE  a3.islun=0 and  DATEDIFF(CAST(CONCAT(YEAR(NOW()),DATE_FORMAT(birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR(NOW())+1,DATE_FORMAT(birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3   " +
					
					" UNION ALL " +
					" select  '(阴历)还有' as remindclass1,'3' as remindclass2,'天生日' AS remindclass3 ,family_address as homeaddress, concat(GENDER,':', uv_name) AS sex_name ,tel as phone,xf_project,family_studio  from Uservice aa3 LEFT JOIN Family bb3 on   aa3.family=bb3.family_id " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=bb3.family_id    "+
					
					" WHERE  aa3.islun=1 and  DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE())),DATE_FORMAT(birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE()))+1,DATE_FORMAT(birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3    " +
					
					" UNION ALL " +
				 	" select '(阳历)孩子生日还有' as remindclass1, '3' as remindclass2,'天' remindclass3,homeaddress,  concat('监护人：',sex_name,'--',child_name) as sex_name,phone as tel,xf_project,family_studio  FROM  " +
					" (SELECT   concat('孩子姓名', child_name ) as child_name,child_family  from Child where " +
					" islun=0 AND  DATEDIFF(CAST(CONCAT(YEAR(NOW()),DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR(NOW())+1,DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3)  c1 LEFT JOIN " +

					" (select homeaddress, sex_name,phone,family_id,xf_project,family_studio FROM ( SELECT  family_address AS homeaddress,family_id,family_studio " +
					" FROM Family ) a55 LEFT JOIN (select group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) b55 on a55.family_id=b55.family " +
					" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=a55.family_id    "+
					
					" WHERE a55.family_id IN(SELECT  child_family  from Child where " +
					" islun=0 AND  DATEDIFF(CAST(CONCAT(YEAR(NOW()),DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR(NOW())+1,DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT(NOW(),'%y-%m-%d') AS DATE))=3)) d1 " +
					" on c1.child_family=d1.family_id    " +
					
					" UNION ALL " +

					" select '(阴历)孩子生日还有' as remindclass1, '3' as remindclass2,'天' remindclass3,homeaddress,  concat('监护人：',sex_name,'--',child_name) as sex_name,phone as tel,xf_project,family_studio  FROM  " +
					" (SELECT   concat('孩子姓名:', child_name ) as child_name,child_family  from Child where " +
					" islun=1 AND  DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE())),DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE()))+1,DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3)  cc1 LEFT JOIN " +

					" (select homeaddress, sex_name,phone,family_id,xf_project,family_studio FROM ( SELECT  family_address AS homeaddress,family_id,family_studio " +
					" FROM Family ) aa55 LEFT JOIN (select group_concat(concat(GENDER,':', uv_name) ) AS sex_name ,group_concat(TEL) as phone,family FROM Uservice  GROUP BY family ORDER BY GENDER) bb55 on aa55.family_id=bb55.family " +
					
" LEFT JOIN (select   group_concat(xf_project) as xf_project ,xf_family from XiaoFei  GROUP BY xf_family ) mm1 ON mm1.xf_family=aa55.family_id    "+
					" WHERE aa55.family_id IN(SELECT  child_family  from Child where " +
					" islun=1 AND  DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE())),DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3 " +
					" OR DATEDIFF(CAST(CONCAT(YEAR((select nldate from calendar where yldate=CURDATE()))+1,DATE_FORMAT(child_birthday,'-%m-%d'))AS DATE),CAST(DATE_FORMAT((select nldate from calendar where yldate=CURDATE()),'%y-%m-%d') AS DATE))=3)) dd1 " +
					" on cc1.child_family=dd1.family_id " +

					"  ) czf    where czf.family_studio="+s_id;
			
			st=conn.createStatement();
			rs = st.executeQuery(hql);
			
			while (rs.next()) // 判断是否还有下一个数据

			 {    
				 Remind r = new Remind();

					r.setHomeaddress(rs.getString("homeaddress"));
					r.setRemindclass(rs.getString("remindclass1")+rs.getString("remindclass2")+rs.getString("remindclass3"));
					r.setSex_name(rs.getString("sex_name"));
					r.setPhone(rs.getString("phone"));
					
					r.setXf_project(rs.getString("xf_project"));
					remindlist.add(r);
			    
			 }
						
//			 conn.close();    //关闭数据库连接线程多了 会奔溃
			 JdbcUtils.closeConnection();//改用这个
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}
		
		
		
		
		
		return remindlist;
		//return factory.getCurrentSession().createSQLQuery(hql).list();
		
		
	
		
	}
	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<XiaofeiY> xiaofeilistY(Integer s_id,Integer year) {
		
		 List<XiaofeiY> xiaofeilist = new ArrayList<XiaofeiY>();
		try {
			conn=JdbcUtils.getConnection();

			String hql ="select  date_format(CREATETIME,'%Y-%m') as YYYYMM,xf_project,SUM(xf_money) as cmoney,COUNT(xf_money) as chishu  from XiaoFei  LEFT JOIN Family ON XiaoFei.xf_family=Family.family_id "
			+" where family_studio="+s_id+" and YEAR(CREATETIME)="+year
			+" GROUP BY xf_project,YYYYMM ORDER BY CREATETIME ,xf_project ";
	
			st=conn.createStatement();
			rs = st.executeQuery(hql);
			String yy="";
			while (rs.next()) // 判断是否还有下一个数据

			 {    
				XiaofeiY xy = new XiaofeiY();
				
				if(yy!=rs.getString("YYYYMM"))
				{
					xy.setYyyymm(rs.getString("YYYYMM"));
				}
				else
				{
					xy.setYyyymm("");
				}
				
				yy=rs.getString("YYYYMM");
				
				xy.setXf_projcet(rs.getString("xf_project"));
				xy.setCmoney(rs.getString("cmoney"));
				xy.setChishu(rs.getString("chishu"));
					
					
				xiaofeilist.add(xy);
			    
			 }
						
//			 conn.close();    //关闭数据库连接线程多了 会奔溃
			 JdbcUtils.closeConnection();//改用这个
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}
		
		
		
		
		
		return xiaofeilist;
	}
	
	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<XiaofeiY> xiaofeilistM(Integer s_id,String year) {
		
		 List<XiaofeiY> xiaofeilist = new ArrayList<XiaofeiY>();
		try {
			conn=JdbcUtils.getConnection();

			String hql ="select  date_format(CREATETIME,'%Y-%m') as YYYYMM,xf_project,SUM(xf_money) as cmoney,COUNT(xf_money) as chishu  from XiaoFei  LEFT JOIN Family ON XiaoFei.xf_family=Family.family_id "
			+" where family_studio="+s_id+" and date_format(CREATETIME,'%Y-%m')='"+year+"'"
			+" GROUP BY xf_project,YYYYMM ORDER BY CREATETIME ,xf_project ";
	
			st=conn.createStatement();
			rs = st.executeQuery(hql);
			while (rs.next()) // 判断是否还有下一个数据

			 {    
				XiaofeiY xy = new XiaofeiY();
				
	
					xy.setYyyymm(rs.getString("YYYYMM"));
				
				xy.setXf_projcet(rs.getString("xf_project"));
				xy.setCmoney(rs.getString("cmoney"));
				xy.setChishu(rs.getString("chishu"));
					
					
				xiaofeilist.add(xy);
			    
			 }
						
//			 conn.close();    //关闭数据库连接线程多了 会奔溃
			 JdbcUtils.closeConnection();//改用这个
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}
		
		
		
		
		
		return xiaofeilist;
	}

	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<XiaofeiFamily> xiaofeiFDY(Integer s_id) {


		 List<XiaofeiFamily> xiaofeilist = new ArrayList<XiaofeiFamily>();
			try {
				conn=JdbcUtils.getConnection();

				String hql ="select family_id, date_format(CREATETIME,'%Y-%m') as YYYYMM,max(family_address) as family_address,max(home_phone) as home_phone,max(home_instructions) as home_instructions, SUM(xf_money) as cmoney,COUNT(xf_money) as chishu  from XiaoFei  LEFT JOIN Family ON XiaoFei.xf_family=Family.family_id "
				+" where family_studio="+s_id+" AND date_format(CREATETIME,'%Y-%m')=date_format(CURDATE(),'%Y-%m') GROUP BY xf_project,YYYYMM,family_id ORDER BY cmoney DESC  limit 0,5 ";
				
		
				st=conn.createStatement();
				rs = st.executeQuery(hql);
				while (rs.next()) // 判断是否还有下一个数据

				 {    
					XiaofeiFamily xy = new XiaofeiFamily();
					
					xy.setFamily_id(Integer.parseInt(rs.getString("family_id")) );
					xy.setYyyymm(rs.getString("YYYYMM"));
					xy.setFamily_adderss(rs.getString("family_address"));
					xy.setHome_phone(rs.getString("home_phone"));
					xy.setHome_instructions(rs.getString("home_instructions"));
					xy.setCmoney(rs.getString("cmoney"));
					xy.setChishu(rs.getString("chishu"));
						
						
					xiaofeilist.add(xy);
				    
				 }
							
//				 conn.close();    //关闭数据库连接线程多了 会奔溃
				 JdbcUtils.closeConnection();//改用这个
			} catch (SQLException e) {
				System.out.println("查询失败");
				e.printStackTrace();
			}
			
			
			
			
			
			return xiaofeilist;
	}

	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<XiaofeiFamily> xiaofeiFDN(Integer s_id) {

		 List<XiaofeiFamily> xiaofeilist = new ArrayList<XiaofeiFamily>();
			try {
				conn=JdbcUtils.getConnection();

				String hql ="select family_id, date_format(CREATETIME,'%Y') as YYYYMM,max(family_address) as family_address,max(home_phone) as home_phone,max(home_instructions) as home_instructions,SUM(xf_money) as cmoney,COUNT(xf_money) as chishu  from XiaoFei  LEFT JOIN Family ON XiaoFei.xf_family=Family.family_id "
				+" where family_studio="+s_id+"  AND date_format(CREATETIME,'%Y')=date_format(CURDATE(),'%Y') GROUP BY xf_project,YYYYMM,family_id ORDER BY cmoney DESC  limit 0,10; ";
				
		
				st=conn.createStatement();
				rs = st.executeQuery(hql);
				while (rs.next()) // 判断是否还有下一个数据

				 {    
					XiaofeiFamily xy = new XiaofeiFamily();
					
					xy.setFamily_id(Integer.parseInt(rs.getString("family_id")) );
					xy.setYyyymm(rs.getString("YYYYMM"));
					xy.setFamily_adderss(rs.getString("family_address"));
					xy.setHome_phone(rs.getString("home_phone"));
					xy.setHome_instructions(rs.getString("home_instructions"));
					xy.setCmoney(rs.getString("cmoney"));
					xy.setChishu(rs.getString("chishu"));
						
						
					xiaofeilist.add(xy);
				    
				 }
							
//				 conn.close();    //关闭数据库连接线程多了 会奔溃
				 JdbcUtils.closeConnection();//改用这个
			} catch (SQLException e) {
				System.out.println("查询失败");
				e.printStackTrace();
			}
			
			
			
			
			
			return xiaofeilist;
	}

	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<XiaofeiFamily> xiaofeiFYX(Integer s_id) {
		 List<XiaofeiFamily> xiaofeilist = new ArrayList<XiaofeiFamily>();
			try {
				conn=JdbcUtils.getConnection();

				String hql ="select family_id,family_address,home_phone,home_instructions from Family  "
				+" where family_studio="+s_id+"  AND (consumption is NULL or consumption=0) and date_sub(curdate(), INTERVAL 30 DAY) <= date(regtime) ";
				
		
				st=conn.createStatement();
				rs = st.executeQuery(hql);
				while (rs.next()) // 判断是否还有下一个数据

				 {    
					XiaofeiFamily xy = new XiaofeiFamily();
					
					xy.setFamily_id(Integer.parseInt(rs.getString("family_id")) );
					xy.setFamily_adderss(rs.getString("family_address"));
					xy.setHome_phone(rs.getString("home_phone"));
					xy.setHome_instructions(rs.getString("home_instructions"));
					
						
						
					xiaofeilist.add(xy);
				    
				 }
							
//				 conn.close();    //关闭数据库连接线程多了 会奔溃
				 JdbcUtils.closeConnection();//改用这个
			} catch (SQLException e) {
				System.out.println("查询失败");
				e.printStackTrace();
			}
			
			
			
			
			
			return xiaofeilist;
	}

	@Override
	public List<UserageFX> userfx(Integer s_id) {
		List<UserageFX> useragelist = new ArrayList<UserageFX>();
		try {
			conn=JdbcUtils.getConnection();

			String hql ="select COUNT(*) as usercount,'20岁以下用户' as Groups from (select  (year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age  from   Uservice LEFT JOIN Family on Uservice.family=Family.family_id where family_studio="+s_id+" ) a where  a.age<20  "
			+" UNION ALL "
			+" select COUNT(*) as usercount,'20岁至24岁用户' as Groups from (select  (year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age  from   Uservice LEFT JOIN Family on Uservice.family=Family.family_id where family_studio="+s_id+" ) a where  a.age>=20 and a.age<=24 "	
			+" UNION ALL "
			+"  select COUNT(*) as usercount,'25岁至30岁用户' as Groups from (select  (year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age  from   Uservice LEFT JOIN Family on Uservice.family=Family.family_id where family_studio="+s_id+" ) a where  a.age>=25 and a.age<=30 "
			+" UNION ALL "
			+"  select COUNT(*) as usercount,'30岁至40岁用户' as Groups from (select  (year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age  from   Uservice LEFT JOIN Family on Uservice.family=Family.family_id where family_studio="+s_id+" ) a where  a.age>=30 and a.age<=40 "
			+" UNION ALL "
			
			+" select COUNT(*) as usercount,'40岁以上用户' as Groups from (select  (year(now())-year(birthday)-1) + ( DATE_FORMAT(birthday, '%m%d') <= DATE_FORMAT(NOW(), '%m%d') ) as age  from   Uservice LEFT JOIN Family on Uservice.family=Family.family_id where family_studio="+s_id+" ) a where  a.age>=40 ";
			
	
			st=conn.createStatement();
			rs = st.executeQuery(hql);
			while (rs.next()) // 判断是否还有下一个数据

			 {    
				UserageFX xy = new UserageFX();
				
				xy.setUsercount(Integer.parseInt(rs.getString("usercount")) );
				xy.setGroups(rs.getString("Groups"));
				
				
					
					
				useragelist.add(xy);
			    
			 }
						
//			 conn.close();    //关闭数据库连接线程多了 会奔溃
			 JdbcUtils.closeConnection();//改用这个
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}
		

		return useragelist;
	}


}
