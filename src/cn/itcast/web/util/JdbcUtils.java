package cn.itcast.web.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class JdbcUtils {
	private static DataSource ds;
	
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();  //map
	static{
		try{
			Properties prop = new Properties();
			InputStream in = JdbcUtils.class.getClassLoader().getResourceAsStream("dbcpconfig.properties");
			prop.load(in);
			BasicDataSourceFactory factory = new BasicDataSourceFactory();
			ds = factory.createDataSource(prop);
		}catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static DataSource getDataSource(){
		return ds;
	}
	
	public static Connection getConnection() throws SQLException{
		try{
			//�õ���ǰ�߳��ϰ󶨵�����
			Connection conn = tl.get();
			if(conn==null){  //����߳���û�а�����
				conn = ds.getConnection();
				tl.set(conn);
			}
			return conn;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public static void startTransaction(){
		try{
			//�õ���ǰ�߳��ϰ����ӿ�������
			Connection conn = tl.get();
			if(conn==null){  //����߳���û�а�����
				conn = ds.getConnection();
				tl.set(conn);
			}
			conn.setAutoCommit(false);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public static void commitTransaction(){
		try{
			Connection conn = tl.get();
			if(conn!=null){
				conn.commit();
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void closeConnection(){
		try{
			Connection conn = tl.get();
			if(conn!=null){
				conn.close();
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			tl.remove();   //ǧ��ע�⣬���ǰ�߳��ϰ󶨵����ӣ���threadlocal�������Ƴ��Ӧ��ǰ�̵߳����ӣ�
		}
	}
}
