package cn.itcast.action.family;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.geom.Ellipse2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import sun.misc.BASE64Decoder;

import cn.itcast.domain.Child;
import cn.itcast.domain.Relation;
import cn.itcast.domain.TreeContent;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.ChildService;
import cn.itcast.service.ReleationService;
import cn.itcast.service.TreeContentService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;
import cn.itcast.web.util.CompressPic;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.abel533.echarts.Label;
import com.github.abel533.echarts.LabelLine;
import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.code.Baseline;
import com.github.abel533.echarts.code.BrushType;
import com.github.abel533.echarts.code.LinkType;
import com.github.abel533.echarts.code.Position;
import com.github.abel533.echarts.code.Roam;
import com.github.abel533.echarts.code.Symbol;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.code.X;
import com.github.abel533.echarts.code.Y;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Effect;
import com.github.abel533.echarts.series.Effect.Type;
import com.github.abel533.echarts.series.Force;
import com.github.abel533.echarts.series.MarkPoint;
import com.github.abel533.echarts.series.Series;
import com.github.abel533.echarts.series.force.Link;
import com.github.abel533.echarts.series.force.Node;

import com.github.abel533.echarts.style.AreaStyle;
import com.github.abel533.echarts.style.ItemStyle;
import com.github.abel533.echarts.style.LinkStyle;
import com.github.abel533.echarts.style.NodeStyle;

import com.github.abel533.echarts.style.TextStyle;
import com.opensymphony.xwork2.ActionContext;


@Controller
@Scope("prototype")
public class HomeTree {
	@Resource
	UsermainService us;
	@Resource
	UserviceService uvs;
	@Resource
	ChildService cs;
	@Resource ReleationService rs;
	private Integer um_id;
	private String img; 
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getUm_id() {
		return um_id;
	}

	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}

	public String getinfo() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
		response.addHeader(
				"Access-Control-Allow-Headers",
				"Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");
		// 组装数据判断登陆状态 没有则提示登陆
		Usermain um ;
		
		if (um_id==0){
		um= (Usermain) ActionContext.getContext().getSession()
				.get("usermain");
		um_id = um.getUm_id();
		
		}else{
			um=us.findById(um_id);
		}
		/* 组装本人数据 */
		Uservice userv = um.getUservice();
		int family_id = um.getUservice().getFy().getFamily_id();
		/* 亲人数据 */
		// 老婆
		List<Uservice> listuv = uvs.findByfamilyid(family_id);
		Uservice userv_lp = new Uservice();
		if (listuv.size() == 2) {
			for (Uservice uv : listuv) {
				if (uv.getUv_id() != um_id) {
					userv_lp = uv;
				}
			}
		}
//		List<Child> userc = cs.findByfamilyid(family_id);
		/*********************************************/
		// option
		Option option = new GsonOption();
		option.title().text("人物关系：" + userv.getUv_name()).subtext("数据来自家印记")
				.x(X.right).y(Y.bottom);
		option.tooltip().trigger(Trigger.axis).formatter("{a} : {b}");
//		option.toolbox().show(true).feature(Tool.restore, Tool.saveAsImage);
		option.toolbox().show(true).feature(Tool.restore);
		option.legend("亲人", "朋友").legend().x(X.left);
		// 数据
		Force force = new Force("人物关系");
		force.categories("人物", "亲人", "朋友");
		
		force.itemStyle()
				.normal()
				// normal:{shapeStyle:{label:{color:"#000",textColor:"#fff"},outline:{lineWidth:1,strokeColor:"#e4e9f2"}}}
				.label(new Label().show(true).color("#000").position(Position.bottom)
						.textStyle(new TextStyle().color("#3CB6AC")))
				.linkStyle(new LinkStyle().type(LinkType.curve)).nodeStyle()
				.brushType(BrushType.both).color("#e4e9f2").borderWidth(1);
		force.itemStyle()
				.emphasis()
				.label(new Label().show(true).color("#000")
						.textStyle(new TextStyle().color("#ff860d")))
				.linkStyle(new LinkStyle().type(LinkType.curve).borderColor("#ff860d").borderWidth(10)).nodeStyle()
				.brushType(BrushType.both).borderWidth(1).borderColor("#ff860d");
		force.hoverable(true).useWorker(false).minRadius(15).maxRadius(25)
				.gravity(1.1).scaling(1.5).roam(Roam.move).calcuable(true);
		
			
				/*
													 * .linkSymbol(Symbol.arrow)
													 * 这个为箭头形
													 */;
		// force.nodes(new Node(0, "乔布斯", 10),
		// new Node(1, "丽萨-乔布斯", 2),
		// new Node(1, "保罗-乔布斯", 3),
		// new Node(1, "克拉拉-乔布斯", 3),
		// new Node(1, "劳伦-鲍威尔", 7),
		// new Node(2, "史蒂夫-沃兹尼艾克", 5),
		// new Node(2, "奥巴马", 8),
		// new Node(2, "比尔-盖茨", 9),
		// new Node(2, "乔纳森-艾夫", 4),
		// new Node(2, "蒂姆-库克", 4),
		// new Node(2, "龙-韦恩", 1));
		String head=userv.getHeadportrait_url()==null?"http://www.jyj.me/img/defaulthead.png":userv.getHeadportrait_url();
		force.nodes()
				.add(new Node(0, userv.getUv_name(), userv.getUv_id())
						.symbol("image://"+head)
						.symbolSize(55).draggable(true));
		// 设置样式
//		 force.itemStyle().normal().nodeStyle().borderColor("#333").borderWidth(1);
		
		if (userv_lp != null) {
			 head=userv_lp.getHeadportrait_url()==null?"http://www.jyj.me/img/defaulthead.png":userv_lp.getHeadportrait_url();
			force.nodes().add(
					new Node(1, "另一伴\n" + userv_lp.getUv_name(), userv_lp.getUv_id()).symbol("image://"+head).symbolSize(35));
			;
			
			force.links().add(
					new Link("另一伴\n" + userv_lp.getUv_name(), userv.getUv_name(), userv.getUv_id()));
		}
//		if (userc != null) {
//			for (Child c : userc) {
//				head=c.getHeadurl()==null?"http://www.jyj.me/img/defaulthead.png":c.getHeadurl();
//				force.nodes().add(new Node(1, "子女\n" + c.getChild_name(), c.getChild_id()).symbol("image://"+head).symbolSize(35));
//				force.links().add(new Link("子女\n" + c.getChild_name(),userv.getUv_name(),userv.getUv_id()));
//			}
//		}
		
		//查Relation表组装数据
		List<Relation> relations=rs.findbyumid(userv.getUv_id());
		if(relations!=null){//自定义关系的连接线长度控制
			for(Relation r:relations){
				if(r.getRealman()==null){
					String r_head=r.getR_head()==null?"http://www.jyj.me/img/defaulthead.png":r.getR_head();
					String text=r.getR_label();
					Integer num_fu=text.indexOf("父");
					Integer num_mu=text.indexOf("母");
					Integer num_ma=text.indexOf("妈");
					Integer num_ba=text.indexOf("爸");
					Integer num_zu=text.indexOf("祖");
					Integer num_jie=text.indexOf("姐");
					Integer num_di=text.indexOf("弟");
					Integer num_ge=text.indexOf("哥");
					Integer num_mei=text.indexOf("妹");
					Integer num_xiong=text.indexOf("兄");
					Integer num_er=text.indexOf("儿");
					Integer num_you=text.indexOf("友");
					Integer num=0;
					//关系比例为4的倍数
					
					force.nodes().add(
							new Node(r.getR_whichgroup(), r.getR_label()+"\n" +r.getR_uname(), 0).symbol("image://"+r_head).symbolSize(25));//在r.getRealman()==null 传出去value=0并且头像默认
					force.links().add(
							new Link(r.getR_label()+"\n" + r.getR_uname(), userv.getUv_name(), 1));
				}else{
					Uservice uv=uvs.findById(r.getRealman());
					head=uv.getHeadportrait_url()==null?"http://www.jyj.me/img/defaulthead.png":"http://www.jyj.me"+uv.getHeadportrait_url();
					force.nodes().add(
							new Node(r.getR_whichgroup(), r.getR_label()+"\n" + uv.getUv_name(), uv.getUv_id()).symbol("image://"+head).symbolSize(25));
					force.links().add(
							new Link(r.getR_label()+"\n" + uv.getUv_name(), userv.getUv_name(), userv.getUv_id()));
				}
					
			}
		}
//		force.markPoint(new MarkPoint().effect(new Effect().show(true).type(Type.bounce).loop(true).period(20).scaleSize(2).color("#ff860d").bounceDistance(10).shadowColor(null).shadowBlur(1)).data(force.nodes()));//开启特效
		option.series(force);
		// option.exportToHtml("hometree.jsp");
		// option.view();
		JSONObject jsonObj = JSONObject.fromObject(option.toString());
		response.getWriter().print(jsonObj.toString());
		return null;
	}
	private String option;
	private Integer categoryid;
	

	public Integer getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	public String reloadoption() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		//绑定的用户这里进来先获得option
		GsonOption go=JSON.parseObject(option,GsonOption.class);
		Force force=JSON.parseObject(option,Force.class);
		
//		com.alibaba.fastjson.JSONObject map=com.alibaba.fastjson.JSONObject.parseObject(option);
//		List<Node> nodes= JSON.parseObject(option, );
//		List<Link> links=JSON.parseObject(option, Link.class);
		//进行人物判断 是本人还是其他 本人categoryid=0
		if(categoryid!=0){
//			Force force =go.getSeries().
//			go.series(force);
			// option.exportToHtml("hometree.jsp");
			// option.view();
			JSONObject jsonObj = JSONObject.fromObject(go.toString());
			response.getWriter().print(jsonObj.toString());
		}
		return null;
	}
	public String targetparent() throws IOException {//成人
		//此处um_id查成人表
		Uservice uv=uvs.findById(um_id);
		String json=JSON.toJSONString(uv);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(json);
		return null;
	}
	
	public String targetchild() throws IOException {//成人
		//此处um_id查成人表
		Child c=cs.findById(um_id);
		String json=JSON.toJSONString(c);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(json);
		return null;
	}
	
	public String headupload() throws IOException{
		  img=img.replace("data:image/png;base64,", "");
		  BASE64Decoder d = new BASE64Decoder();
	        byte[] bs = d.decodeBuffer(img);
	        for(int i=0;i<bs.length;++i)  
            {  
                if(bs[i]<0)  
                {//调整异常数据  
                    bs[i]+=256;  
                }  
            }  
	        try {
				uploadFile(um_id,bs);
				ServletActionContext.getResponse().getWriter().print("ok");
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		
		return null;
	}
	
	public void uploadFile(Integer um_id,byte[] bs) throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		Integer fid=uvs.findById(um_id).getFy().getFamily_id();
		String fwqurl=ServletActionContext.getServletContext().getRealPath("/uploadFile/headimg/"+fid.toString()+"/");
		File folder = new File(fwqurl);
		if(!folder.exists()){
			folder.mkdirs();
		}
		if (bs != null) {
			// 服务器中转地址
            File fwqfile = new File(fwqurl+"/"+um_id.toString()+".png");
            FileOutputStream os = new FileOutputStream(fwqfile);
            os.write(bs);
	        os.flush();
	        os.close();
	      //这里需要进行压缩和裁剪compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
	        //先裁剪再压缩
	        
	        CompressPic cp=new CompressPic();//压缩
	        cp.compressPic(fwqurl+"/"+um_id.toString()+".png", fwqurl+"/",
	        		um_id.toString()+".png", um_id.toString()+".png", 198, 198, true);
	        
	        cj(fwqurl+"/"+um_id.toString()+".png");//裁剪
			String fullurl = fwqurl+"/"+ um_id.toString()+".png";
	//http://www.jyj.me/yjdata/www/tomcat/webapps/ROOT/uploadFile/headimg/4879/9279.png
			fullurl=fullurl.replace("yjdata/www/tomcat/webapps/ROOT/", "");
			/********************************/
			try {
				//更新头像记录
				
				Uservice uv=uvs.findById(um_id);
				uv.setHeadportrait_url(fullurl);
				uvs.update(uv);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
public void cj(String path) throws IOException{
	BufferedImage bi1 = ImageIO.read(new File(path));
	 
    // 根据需要是否使用 BufferedImage.TYPE_INT_ARGB
    BufferedImage bi2 = new BufferedImage(bi1.getWidth(), bi1.getHeight(),
            BufferedImage.TYPE_INT_RGB);

    Ellipse2D.Double shape = new Ellipse2D.Double(0, 0, bi1.getWidth(), bi1
            .getHeight());

    Graphics2D g2 = bi2.createGraphics();
    bi2=g2.getDeviceConfiguration().createCompatibleImage(bi1.getWidth(), bi1.getHeight(), Transparency.TRANSLUCENT);
    g2 = bi2.createGraphics();
    g2.setComposite(AlphaComposite.Clear);
//    g2.setBackground(Color.WHITE);
    g2.fill(new Rectangle(bi2.getWidth(), bi2.getHeight()));
    g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC, 1.0f));
    g2.setClip(shape);
    // 使用 setRenderingHint 设置抗锯齿
    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
    g2.drawImage(bi1, 0, 0, null);
    g2.dispose();

    try {
        ImageIO.write(bi2, "PNG", new File(path));
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
}

private String content;
private String title;

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}
@Resource TreeContentService tcs;
public String editdo() throws IOException{
	TreeContent tc=new TreeContent();
	tc.setContent(content);
	tc.setTitle(title);
	tc.setUm_id(um_id);
	DateFormat df=new SimpleDateFormat( "yyyy-MM-dd HH");
	Date date=null;
	while(date==null){
		date=new Date();
	}
	tc.setDate(df.format(date));
	HttpServletResponse response = ServletActionContext.getResponse();
	response.setCharacterEncoding("utf-8");
	try {
		tcs.save(tc);
		response.getWriter().print("ok");
	} catch (Exception e) {
		response.getWriter().print("err");
		e.printStackTrace();
	}
	
	return null;
}
	public String getlist() throws IOException{
		List<TreeContent> list=tcs.findbyumid(um_id);
		String json =JSON.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(json);
		return null;
	}
	
	private Integer tc_id;
	public Integer getTc_id() {
		return tc_id;
	}

	public void setTc_id(Integer tc_id) {
		this.tc_id = tc_id;
	}

	public String deltc() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		Integer id=tcs.findbyid(tc_id).getUm_id();
		Usermain um=(Usermain) ActionContext.getContext().getSession().get("usermain");
		if(um.getUm_id().equals(id)){
		tcs.del(tc_id);
		response.getWriter().print("ok");
		}else{
			response.getWriter().print("hack");
		}
		
		return null;
				
	}
	
	//addreleation空了用模型驱动进行代码压缩
	private String r_label;
	private String r_uname;
	private String r_tel;
	private String r_eval;
	private Integer r_umid;
	private Integer r_whichgroup;
	private Integer realman;
	
	public Integer getRealman() {
		return realman;
	}

	public void setRealman(Integer realman) {
		this.realman = realman;
	}

	public String getR_label() {
		return r_label;
	}

	public void setR_label(String r_label) {
		this.r_label = r_label;
	}

	public String getR_uname() {
		return r_uname;
	}

	public void setR_uname(String r_uname) {
		this.r_uname = r_uname;
	}

	public String getR_tel() {
		return r_tel;
	}

	public void setR_tel(String r_tel) {
		this.r_tel = r_tel;
	}

	public String getR_eval() {
		return r_eval;
	}

	public void setR_eval(String r_eval) {
		this.r_eval = r_eval;
	}

	public Integer getR_umid() {
		return r_umid;
	}

	public void setR_umid(Integer r_umid) {
		this.r_umid = r_umid;
	}

	public Integer getR_whichgroup() {
		return r_whichgroup;
	}

	public void setR_whichgroup(Integer r_whichgroup) {
		this.r_whichgroup = r_whichgroup;
	}
	
	public String addreleation() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		Relation r=new Relation();
		r.setR_eval(r_eval);
		r.setR_label(r_label);
		r.setR_tel(r_tel);
		r.setR_umid(r_umid);
		r.setR_uname(r_uname);
		r.setR_whichgroup(r_whichgroup);
		r.setRealman(realman);
		try {
			rs.save(r);
			response.getWriter().print("ok");
		} catch (Exception e) {
			response.getWriter().print("err");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String gethints() throws IOException{
		//autocomplete数据需要中文解码js中已经修改好
		r_uname=new String(r_uname.getBytes("iso8859-1"),"UTF-8");//q为插件默认的参数名，为前台传过来的值  
		List<Uservice> list=uvs.findbylickname(r_uname);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		String json=JSON.toJSONString(list);
		response.getWriter().print(json);
		
		return null;
	}
	class PointObj {
		public String name;
		public Integer value;
		public Integer x;
		public Integer y;
		
	}
	class NodeandLink{
		public String name;
		public Integer category;
		public Integer value;
		public String symbol;
		public String linktext;
	}
	/*
	 * 获得他人节点
	 * 
	 * */
	public String getotherinfo() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		Usermain um=us.findById(um_id);
		if(um!=null){
			int family_id = um.getUservice().getFy().getFamily_id();
			/* 亲人数据 */
			// 老婆
			List<Uservice> listuv = uvs.findByfamilyid(family_id);
//			List<Child> userc = cs.findByfamilyid(family_id);
			Uservice userv_lp = new Uservice();
			if (listuv.size() == 2) {
				for (Uservice uv : listuv) {
					if (uv.getUv_id() != um_id) {
						userv_lp = uv;
					}
				}
			}
			List<NodeandLink> nllist=new ArrayList<NodeandLink>();
			NodeandLink nl=new NodeandLink();
			nl.name="另一伴\n"+userv_lp.getUv_name();
			nl.category=1;
			nl.value=userv_lp.getUv_id();
			///uploadFile/headimg/4879/9280.png
			nl.symbol=userv_lp.getHeadportrait_url()==null?"image://http://www.jyj.me/img/defaulthead.png":"image://http://www.jyj.me/"+userv_lp.getHeadportrait_url();
			nl.linktext="另一伴";
			nllist.add(nl);//添加老伴
			
//			if (userc != null) {
//				for (Child c : userc) {
//					nl=new NodeandLink();
//					nl.name="子女\n"+c.getChild_name();
//					nl.value=c.getChild_id();
//					nl.symbol=c.getHeadurl()==null?"image://http://www.jyj.me/img/defaulthead.png":c.getHeadurl();
//					nl.linktext="子女";
//					nl.category=1;
//					nllist.add(nl);//添加孩子
//				}
//			}
			//添加自定义信息
			List<Relation> relations=rs.findbyumid(um.getUm_id());
			if(relations!=null){//自定义关系的连接线长度控制
				for(Relation r:relations){
					nl=new NodeandLink();
					if(r.getRealman()!=null){
						Uservice realman=uvs.findById(r.getRealman());
						nl.name=r.getR_label()+"\n"+r.getR_uname();
						nl.category=r.getR_whichgroup();
						nl.value=r.getRealman();
						if(realman.getHeadportrait_url()!=null){
							nl.symbol="image://http://www.jyj.me"+realman.getHeadportrait_url();
						}else if(r.getR_head()!=null){
							nl.symbol="image://http://www.jyj.me"+r.getR_head();
						}else{
							nl.symbol="image://http://www.jyj.me/img/defaulthead.png";
						}
						nl.linktext=r.getR_label();
						nllist.add(nl);
					}else{
						nl.name=r.getR_label()+"\n"+r.getR_uname();
						nl.category=r.getR_whichgroup();
						String text=r.getR_label();
						Integer num_fu=text.indexOf("父");
						Integer num_mu=text.indexOf("母");
						Integer num_ma=text.indexOf("妈");
						Integer num_ba=text.indexOf("爸");
						Integer num_zu=text.indexOf("祖");
						Integer num_jie=text.indexOf("姐");
						Integer num_di=text.indexOf("弟");
						Integer num_ge=text.indexOf("哥");
						Integer num_mei=text.indexOf("妹");
						Integer num_xiong=text.indexOf("兄");
						Integer num_er=text.indexOf("儿");
						Integer num_you=text.indexOf("友");
						Integer num=0;
						//关系比例为4的倍数
						if (num_fu>0||num_mu>0||num_ma>0||num_ba>0){
							num=um.getUm_id();
						}
						if(num_zu>0){
							num=um.getUm_id()*16;
						}
						if(num_jie>0||num_di>0||num_ge>0||num_mei>0||num_xiong>0){
							num=um.getUm_id()*4;
						}
						if(num_er>0){
							num=um.getUm_id();
						}
						if(num_you>0){
							num=um.getUm_id()*64;
						}
//						nl.value=num;
						nl.value=0;
						if(r.getR_head()!=null){
							nl.symbol="image://http://www.jyj.me"+r.getR_head();
						}else{
							nl.symbol="image://http://www.jyj.me/img/defaulthead.png";
						}
						nl.linktext=r.getR_label();
						nllist.add(nl);
					}
				}
			}
			String json=JSON.toJSONString(nllist);
			response.getWriter().print(json);
		}
		return null;
	}
}
