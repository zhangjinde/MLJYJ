package cn.itcast.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import cn.itcast.domain.FamilyXiaoFei;
import cn.itcast.domain.XiaoFei;
import cn.itcast.domain.XiaoFeiFM;

import cn.itcast.service.FamilyXiaoFeiService;
import cn.itcast.web.util.JdbcUtils;
import cn.itcast.web.util.MemberDao;


@Service @Transactional
public class FamilyXiaoFeiServiceBean implements FamilyXiaoFeiService {

	@Resource SessionFactory factory;
	@Resource private MemberDao memberDao;
	ResultSet rs;
	@Override
	public void save(FamilyXiaoFei xf) {
		factory.getCurrentSession().persist(xf);

	}

	@Override
	public void update(FamilyXiaoFei xf) {
		factory.getCurrentSession().merge(xf);

	}

	@Override
	public void del(Integer xf_id) {
		factory.getCurrentSession().delete(factory.getCurrentSession().load(FamilyXiaoFei.class, xf_id));

	}

	 public Connection conn = null;  
	 public Statement st = null;  
	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<FamilyXiaoFei> fmxiaofeilist(Integer s_id,String home_instructions,String xfcount) {
		
		 List<FamilyXiaoFei> xiaofeilist = new ArrayList<FamilyXiaoFei>();
		try {
			conn=JdbcUtils.getConnection();

			String hql ="select * from ( Select family_id, family_address, home_phone,home_instructions,count(family_id) as xfcount,sum(xf_money) as smoney from Family INNER JOIN XiaoFei on Family.family_id=XiaoFei.xf_family "
			+" where family_studio="+s_id;
			home_instructions=home_instructions.trim();
			if(!home_instructions.equals("")&&home_instructions!=null)
			{
				hql	+=" and home_instructions like '%"+home_instructions+"%'";
			}

			hql	+=" Group by family_id,family_address,home_phone,home_instructions ) A  ";
			
			xfcount=xfcount.trim();
			if(!xfcount.equals("")&&xfcount!=null)
			{
				hql	+=" where  A.xfcount="+xfcount+"";
				
			}
			hql	+=" ORDER BY family_id  ";
			
			
			st=conn.createStatement();
			rs = st.executeQuery(hql);
			Integer num=1;
			while (rs.next()) // 判断是否还有下一个数据
			 {    
				FamilyXiaoFei fmxf = new FamilyXiaoFei();
				fmxf.setNum(num.toString());
				fmxf.setFamily_id(rs.getString("family_id"));
				fmxf.setFamily_address(rs.getString("family_address"));
				fmxf.setHome_phone(rs.getString("home_phone"));
				fmxf.setHome_instructions(rs.getString("home_instructions"));
				fmxf.setXfcount(rs.getString("xfcount"));
				fmxf.setSmoney(rs.getString("smoney"));
					
				xiaofeilist.add(fmxf);
				num++;
			 }
						
//			 conn.close();    //关闭数据库连接线程多了 会奔溃
			 JdbcUtils.closeConnection();//改用这个
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}
		return xiaofeilist;
	}
	
	@Override
	public FamilyXiaoFei findById(Integer xf_id) {
		return (FamilyXiaoFei) factory.getCurrentSession().get(FamilyXiaoFei.class, xf_id);
	}

	@SuppressWarnings({ "unchecked"})
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<XiaoFeiFM> xiaofeilist(Integer f_id) {
		
		 List<XiaoFeiFM> xiaofeilist = new ArrayList<XiaoFeiFM>();
			try {
				conn=JdbcUtils.getConnection();

				String hql ="select * from XiaoFei "
				+" where xf_family="+f_id+ " ORDER BY xf_id";
				
				 
		
				st=conn.createStatement();
				rs = st.executeQuery(hql);
				
				while (rs.next()) // 判断是否还有下一个数据

				 {    
					XiaoFeiFM fmxf = new XiaoFeiFM();

					fmxf.setXf_id(rs.getString("xf_id"));
					fmxf.setXf_project(rs.getString("xf_project"));
					fmxf.setXf_money(rs.getString("xf_money"));
					fmxf.setXf_other(rs.getString("xf_other"));
					fmxf.setCREATETIME(rs.getString("CREATETIME"));
					
						
					xiaofeilist.add(fmxf);
				    
				 }
							
//				 conn.close();    //关闭数据库连接线程多了 会奔溃
				 JdbcUtils.closeConnection();//改用这个
			} catch (SQLException e) {
				System.out.println("查询失败");
				e.printStackTrace();
			}
			return xiaofeilist;
	}

}
