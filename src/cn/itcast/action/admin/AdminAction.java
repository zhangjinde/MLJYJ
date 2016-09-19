package cn.itcast.action.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;

import cn.itcast.web.util.JdbcUtils;

@Controller
@Scope("prototype")
public class AdminAction {
	private Integer sid;
	Connection conn = null;
	Statement st = null;  
	ResultSet rs=null;
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String execute(){
		return "page";
	}
	public String doquery() throws IOException{
		String totalsql="select count(*) as total from Family where family_studio="+sid;
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String total="";
		String today="";
		String mouth="";
		String prevmouth="";
		try {
			conn=JdbcUtils.getConnection();
			st=conn.createStatement();
			rs = st.executeQuery(totalsql);
			while(rs.next()){
				total=rs.getString("total");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection();
			conn = null;
			st = null;  
			rs=null;
		}
		String todaysql="select count(*) as today from Family where family_studio="+sid+" and date(regtime) = curdate()";
		try {
			conn=JdbcUtils.getConnection();
			st=conn.createStatement();
			rs = st.executeQuery(todaysql);
			while(rs.next()){
				today=rs.getString("today");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection();
			conn = null;
			st = null;  
			rs=null;
		}
		String thismouthsql="select count(*) as mouth from Family where family_studio="+sid+" and date_format(regtime,'%Y-%m')=date_format(now(),'%Y-%m')";
		try {
			conn=JdbcUtils.getConnection();
			st=conn.createStatement();
			rs = st.executeQuery(thismouthsql);
			while(rs.next()){
				mouth=rs.getString("mouth");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection();
			conn = null;
			st = null;  
			rs=null;
		}
		String prevmouthsql="select count(*) as prevmouth from Family where family_studio="+sid+" and period_diff(date_format(now() , '%Y%m') , date_format(regtime, '%Y%m')) =1 ";
		try {
			conn=JdbcUtils.getConnection();
			st=conn.createStatement();
			rs = st.executeQuery(prevmouthsql);
			while(rs.next()){
				prevmouth=rs.getString("prevmouth");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection();
			conn = null;
			st = null;  
			rs=null;
		}
		String json="{total:"+total+",today:"+today+",mouth:"+mouth+",prevmouth:"+prevmouth+"}";
		response.getWriter().print(json);
		return null;
	}
	public String studioranking() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Ranking r;
		List<Ranking> list=new ArrayList<Ranking>();
		int i=1;
		String rankingsql="select studio_name,COUNT(*) as num from Family RIGHT JOIN Studio on Family.family_studio=Studio.studio_id where DATE_FORMAT(regtime, '%Y-%m-%d')=date_sub(curdate(),interval 1 day) GROUP BY family_studio ORDER BY num DESC";
		try {
			conn=JdbcUtils.getConnection();
			st=conn.createStatement();
			rs = st.executeQuery(rankingsql);
			while(rs.next()){
				r=new Ranking();
				r.num="No."+i;
				r.studioname=rs.getString("studio_name");
				r.count=rs.getInt("num");
				list.add(r);
				i++;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection();
			conn = null;
			st = null;
			rs=null;
		}
		String json=JSONArray.toJSONString(list);
		response.getWriter().print(json);
		
		return null;
	}
	class Ranking{
		public String num;
		public String studioname;
		public Integer count;
	}
}
