package junit.text;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.geom.Ellipse2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.stereotype.Service;
import org.sword.wechat4j.message.CustomerMsg;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.oss.OSSClient;
import com.wx.bean.Token;
import com.wx.model.TemplateData;
import com.wx.model.WxTemplate;
import com.wx.untils.CommonUtil;
import com.wx.untils.ConfigUtil;
import com.wx.untils.WxUtil;


import cn.itcast.domain.ShopOrder;
import cn.itcast.domain.StandInsideLetter;
import cn.itcast.domain.Uservice;
import cn.itcast.service.SILService;
import cn.itcast.service.ShopOrderService;
import cn.itcast.service.UserviceService;
import cn.itcast.service.impl.ShopOrderServiceBean;
import cn.itcast.web.util.JdbcUtils;
import cn.itcast.web.util.Lunar;
@Service
public class test {
	@Resource SILService sils;
	StandInsideLetter sil;
	@Test
	public void save(){
		sil.setIsread(false);
		sil.setSil_content("��ӡ��");
		sil.setSil_title("����1");
		sil.setSil_user_accept("sawffh");
		sil.setSil_user_send("sawffh2");
		sils.save(sil);
	}
	@Test
	public void time() throws ParseException{
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// �������ڸ�ʽ
//		Date d1 = sdf.parse("2009-02-02");
//		Date d2 = sdf.parse("2009-02-01");
//		System.out.println(d1.getTime() - d2.getTime());
		Date d=new Date();
		System.out.println(d);
	}
	@Test
	@SuppressWarnings("static-access")
	public  void L_C(){
		Lunar l=new Lunar();
		String date="1986-04-04";
		String d=l.lunarTosolar(date);
		System.out.println(d);
	}
	
	@Test
	
	public void shopsave(){
		ShopOrderService sos=new ShopOrderServiceBean();
		ShopOrder so=new ShopOrder();
		so.setIscheck(false);
		so.setIspay(false);
		so.setOrder_username("T����");
		so.setOrdermoney("4999");
		so.setOrdername(" ���Զ���");
		so.setOrdernum("201506241458000013");
		sos.update(so);
	}
	@Test
	public void random(){
		int random=(int) (100*Math.random());
		System.out.println(random);
	
	}
	@Test
	public void indexof(){
		String url="http://employee.oss-cn-hangzhou.aliyuncs.com/樊飞宏22/11.jpg";
		int start=url.indexOf("/", 10)+1;
		int end =url.indexOf("/", start);
		String key=url.substring(start,end);
		System.out.println(key);
	}
	private static final String ACCESS_ID = "IHE3Rao9r4cPeiMI";
	private static final String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
	private static final String OSS_ENDPOINT = "http://oss.aliyuncs.com/";
	@Test
	public void deleteoss(){
				//OSS删除对象
				String bucketName = "employee";
				OSSClient client = new OSSClient(OSS_ENDPOINT,ACCESS_ID, ACCESS_KEY);
				String key="樊飞宏23/";
				client.deleteObject(bucketName, key);
				System.out.println("完成");
				
	}
	
	@Test
	public void sysfont(){
		           String encoding = System.getProperty("file.encoding");
		           System.out.println("Default System Encoding:" + encoding);
		    
		
	}
	
	Connection conn;
	Statement st;
	@Test
	public void jdbc() {
		try {
			conn=JdbcUtils.getConnection();
			String sql="select * from gg where id=2";
			st=conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			 while (rs.next()) // 判断是否还有下一个数据

			 {    
			     // 根据字段名获取相应的值

			     String title = rs.getString("title");
			     System.out.println(title);
			 }
			 
			 conn.close();    //关闭数据库连接
		} catch (SQLException e) {
			System.out.println("查询失败");
			e.printStackTrace();
		}
	}
	
	
	public void text11(){
		CustomerMsg customerMsg = new CustomerMsg("outABsywX7s-Ot7U-8FlKS9jPsAI");
		customerMsg.sendText("测试");
	}
	@Test
	public void circletext() throws IOException{//画圆
		BufferedImage bi1 = ImageIO.read(new File("E:/JAVA_workspace/.metadata/.me_tcat/webapps/SSH2_MLJYJ/uploadFile/headimg/4879/9279.jpg"));
		 
        // 根据需要是否使用 BufferedImage.TYPE_INT_ARGB
        BufferedImage bi2 = new BufferedImage(bi1.getWidth(), bi1.getHeight(),
                BufferedImage.TYPE_INT_RGB);
 
        Ellipse2D.Double shape = new Ellipse2D.Double(0, 0, bi1.getWidth(), bi1
                .getHeight());
 
        Graphics2D g2 = bi2.createGraphics();
//        g2.setBackground(Color.WHITE);
        g2.fill(new Rectangle(bi2.getWidth(), bi2.getHeight()));
        g2.setClip(shape);
        // 使用 setRenderingHint 设置抗锯齿
        g2.drawImage(bi1, 0, 0, null);
        g2.dispose();
 
        try {
            ImageIO.write(bi2, "png", new File("E:/JAVA_workspace/.metadata/.me_tcat/webapps/SSH2_MLJYJ/uploadFile/headimg/4879/9279.png"));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
	}
	@Resource UserviceService us;
	@Test
	public void wxuser(){
		String str="1,2,3,4,5,6,7,";
		int a=str.lastIndexOf(",");
		str=str.substring(0,a);
		System.out.println(str);
	}
	@Test
	public void timetest(){
		 Date date = new Date();	
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		                 date.setTime(590688000);
		 System.out.println(sdf.format(date));
		
	}
	@Test
	public void sendmsg(){
		CustomerMsg customerMsg = new CustomerMsg("outABswYZUEJsff71znMTm5yCTLM");
		customerMsg.sendText("后台已成功绑定，鉴于个别手机缓存问题，请完全退出微信或晚些时候再试。");
	}
	@Test
	public void sendtemplate(){
		Token token = CommonUtil.getToken(ConfigUtil.APPID, ConfigUtil.APP_SECRECT);
        String access_token = token.getAccessToken();
        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+access_token;
        WxTemplate temp = new WxTemplate();
        temp.setUrl("http://www.jyj.me");
        temp.setTouser("outABsywX7s-Ot7U-8FlKS9jPsAI");//openid
        temp.setTopcolor("#000000");
        temp.setTemplate_id("O9N27AW0wUUmgQwbB1NCLJi6eescVhoRxv4rxTvbFr8");//设置模板ID
        Map<String,TemplateData> m = new HashMap<String,TemplateData>();
        TemplateData first = new TemplateData();
        first.setColor("#ff3030");  
        first.setValue("颜色随意换啊");  
        m.put("first", first);  
        
        TemplateData name = new TemplateData();  
        name.setColor("#000000");  
        name.setValue("印记美美");  
        m.put("keyword1", name);
        
        TemplateData usertel = new TemplateData();  
        usertel.setColor("#000000");  
        usertel.setValue("10000");  
        m.put("keyword2", usertel);
        
        TemplateData activityname = new TemplateData();  
        activityname.setColor("#f5b");  
        activityname.setValue("生日提醒");  
        m.put("keyword3", activityname);
        
        TemplateData activitytime = new TemplateData();  
        activitytime.setColor("#000000");  
        activitytime.setValue("2016-09-16");  
        m.put("keyword4", activitytime);
        
        TemplateData remark = new TemplateData();  
        remark.setColor("#000000");  
        remark.setValue("还有三天，点我看福利");  
        m.put("remark", remark);
        
        temp.setData(m);
        String jsonString = JSONObject.toJSONString(temp);
        String json = CommonUtil.httpsRequest(url, "POST", jsonString);
        JSONObject jsonObject=JSONObject.parseObject(json);
        int result = 0;
        if (null != jsonObject) {  
             if (0 != jsonObject.getInteger("errcode")) {  
                 result = jsonObject.getInteger("errcode");
                 System.out.println("错误 errcode:"+jsonObject.getInteger("errcode")+" errmsg:"+jsonObject.getString("errmsg"));  
             }  
         }
        //System.out.println("模板消息发送结果："+result);
        
        //结束
	}
	@Test
	public void sendtemplatetest(){
		WxUtil.sendTempLate("http://www.jyj.me", "outABsywX7s-Ot7U-8FlKS9jPsAI", "O9N27AW0wUUmgQwbB1NCLJi6eescVhoRxv4rxTvbFr8", "测试哈4", "飞宏", "18912227377", "生日还有三天", "2016-09-17", "点我领取福利。");
	}
}

