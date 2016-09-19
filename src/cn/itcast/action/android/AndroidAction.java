package cn.itcast.action.android;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import cn.itcast.domain.AndroidRemind;
import cn.itcast.domain.Child;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.Relation;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.domain.android.PhotoListBean;
import cn.itcast.domain.android.PicturesBean;
import cn.itcast.domain.android.RePicture;
import cn.itcast.domain.android.Release;
import cn.itcast.service.ChildService;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;
import cn.itcast.service.RePictureService;
import cn.itcast.service.ReleaseService;
import cn.itcast.service.ReleationService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;
import cn.itcast.web.util.ConvertResultSetToEntity;
import cn.itcast.web.util.JdbcUtils;

@Controller
@Scope("prototype")
public class AndroidAction {
	private Integer um_id;
	private Integer pa_id;
	private Integer state;
	

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getPa_id() {
		return pa_id;
	}

	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}

	@Resource
	UserviceService us;
	@Resource
	UsermainService ums;
	@Resource
	PhotoAlbumService pas;
	@Resource
	PicturesService ps;
	@Resource RePictureService rps;
	public Integer getUm_id() {
		return um_id;
	}

	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}

	public String getinfo() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Uservice u = us.findById(um_id);
		String result = u.getHeadportrait_url();
		if (result == null)
			result = "";
		result += "," + u.getUv_name();
		Integer i = ums.findById(um_id).getJf();
		if (i == null)
			i = 0;
		result += "," + i;
		response.getWriter().print(result);
		return null;
	}
	
	public String getinfo_ios() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Uservice uv = us.findById(um_id);
		String json =JSON.toJSONString(uv);
		Usermain um=ums.findById(um_id);
		json=json.substring(0,json.length()-1)+",\"nickname\":"+"\""+um.getUser_nickname()+"\"}";
		response.getWriter().print(json);
		return null;
	}

	public String getpalist() throws IOException {
		// 组装数据
		int fy_id = us.findById(um_id).getFy().getFamily_id();
		List<PhotoAlbum> list = pas.findall(fy_id,state);//1为默认状态
		List<PhotoListBean> palist = new ArrayList<PhotoListBean>();
		PhotoListBean pa = null;
		for (PhotoAlbum p : list) {
			pa = new PhotoListBean();
			pa.setPa_answer(p.getPa_answer());
			pa.setPa_family_id(fy_id);
			pa.setPa_id(p.getPa_id());
			pa.setPa_instructions(p.getPa_instructions());
			pa.setPa_name(p.getPa_name());
			pa.setPa_problem(p.getPa_problem());
			pa.setPa_url(p.getPa_url());
			pa.setPa_time(p.getPa_time());
			palist.add(pa);
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		JSONArray json = JSONArray.fromObject(palist);
		response.getWriter().print(json.toString());

		return null;
	}

	public String getpics() throws IOException {
		List<Pictures> list = ps.findall(pa_id);
		List<PicturesBean> piclist=new ArrayList<PicturesBean>();
		PicturesBean pic=null;
		for(Pictures p:list){
			pic=new PicturesBean();
			pic.setPic_id(p.getPic_id());
			pic.setPic_instructions(p.getPic_instructions());
			pic.setPic_realname(p.getPic_realname());
			pic.setPic_relurl(p.getPic_relurl());
			piclist.add(pic);
		}
				
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		JSONArray json = JSONArray.fromObject(piclist);
		response.getWriter().print(json.toString());
		return null;
	}
	@Resource ReleaseService rs;
	public String getmaxpage(){
		int total=rs.gettotal();
		int page=total%8 == 0 ? total/8 : total/8+1;
		try {
			ServletActionContext.getResponse().getWriter().print(page);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	private Integer offset;
	private Integer limitnum;
	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public Integer getLimitnum() {
		return limitnum;
	}

	public void setLimitnum(Integer limitnum) {
		this.limitnum = limitnum;
	}
	
	public String getmarkall() throws IOException{
		List<Release> list = rs.listall(offset,limitnum);
		List<Release> relist=new ArrayList<Release>();
		List<RePicture> piclist=new ArrayList<RePicture>();
		HashMap<Integer, ArrayList<RePicture>> picmap=new HashMap<Integer, ArrayList<RePicture>>();
		for(Release r:list){
			piclist=(ArrayList<RePicture>) rps.findall(r.getRe_id());
			if(piclist!=null){
			picmap.put(r.getRe_id(),(ArrayList<RePicture>) piclist);
			}
			relist.add(r);
		}
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("relist", relist);
		map.put("picmap", picmap);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		//解决fastjson循环
		SerializerFeature feature = SerializerFeature.DisableCircularReferenceDetect;  
		 String jsonStrng = JSON.toJSONString(map,feature);
		response.getWriter().print(jsonStrng);
		return null;
	}
	@Resource ReleationService rls;
	@Resource ChildService cs;
	public String birthremind() throws Exception{
		Integer f_id=us.findById(um_id).getFy().getFamily_id();
		List<Uservice> listuv=us.findByfamilyid(f_id);
		List<Relation> listrl=rls.findbyumid(um_id);
		List<Child> listc=cs.findByfamilyid(f_id);
		String ustr="";
		for(Uservice u:listuv){
			ustr+=u.getUv_id()+",";
		}
		for(Relation r:listrl){
			if(r.getRealman()!=null){
			ustr+=r.getRealman()+",";
			}
		}
		int a=ustr.lastIndexOf(",");
		ustr=ustr.substring(0,a);
		String sql1="select headportrait_url as head_url,uv_name as name,islun,birthday from Uservice where uv_id in ("+ustr+")";
		String cstr="";
		for(Child c:listc){
			cstr+=c.getChild_id()+",";
		}
		int b=cstr.lastIndexOf(",");
		String sql;
		if(b!=-1){
		sql1=sql1+" UNION  ALL ";
		cstr=cstr.substring(0,b);
		String sql2="select headurl as head_url,child_name as name,islun,child_birthday as birthday from Child where child_id in ("+cstr+")";
		sql=sql1+sql2;
		}else{
			sql=sql1;
		}
		Connection conn = null;
		Statement st = null;  
		ResultSet rs;
		List<AndroidRemind> list=new ArrayList<AndroidRemind>();
		try {
			conn=JdbcUtils.getConnection();
			st=conn.createStatement();
			rs = st.executeQuery(sql);
			ConvertResultSetToEntity crs=new ConvertResultSetToEntity();
			Object[] obj=crs.parseDataEntityBeans(rs, "cn.itcast.domain.AndroidRemind");
			for(int i=0;i<obj.length;i++){
				AndroidRemind ar=(AndroidRemind) obj[i];
				System.out.println(ar);
				list.add(ar);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JdbcUtils.closeConnection();//改用这个
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String json=JSON.toJSONString(list,SerializerFeature.WriteDateUseDateFormat);
		
		response.getWriter().print(json);
		return null;
	}
}
