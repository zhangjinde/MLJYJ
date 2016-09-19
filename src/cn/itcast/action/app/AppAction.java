package cn.itcast.action.app;

import java.io.IOException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.aliyun.oss.OSSClient;



import cn.itcast.app.serivce.AppActivityService;
import cn.itcast.app.serivce.AppCountsService;
import cn.itcast.app.serivce.AppPhotoAlbumService;
import cn.itcast.app.serivce.AppPrivacyService;
import cn.itcast.app.serivce.AppUsermainService;
import cn.itcast.app.serivce.AppUserviceService;
import cn.itcast.app.serivce.AppVersionService;
import cn.itcast.app.serivce.XmppCustomService;
import cn.itcast.domain.AppPrivacy;
import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.PhotoAlbumClass;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.StandInsideLetter;
import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.domain.app.AppActivity;
import cn.itcast.domain.app.FamilyVideo;
import cn.itcast.domain.app.XmppUser;
import cn.itcast.service.FamilyService;
import cn.itcast.service.FamilyVideoService;
import cn.itcast.service.PhotoAlbumClassService;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;
import cn.itcast.service.SILService;
import cn.itcast.service.StudioService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

@Controller
@Scope("prototype")
public class AppAction {
	@Resource UserviceService uvs;
	@Resource FamilyVideoService fvs;
	@Resource AppPhotoAlbumService apas;
	@Resource PhotoAlbumClassService pacs;
	private Integer um_id;
	private FamilyVideo fv;
	private Integer limit;
	private String token;
	private Integer fv_id;
	private String albumAnswer;//相册问题
	private String albumProblem;//相册答案
	private String albumInstr;//相册说明
	private String albumName;//相册名
	private Integer state;
	

	public Integer getState() {
		return state;
	}



	public void setState(Integer state) {
		this.state = state;
	}



	public String getAlbumAnswer() {
		return albumAnswer;
	}



	public void setAlbumAnswer(String albumAnswer) {
		this.albumAnswer = albumAnswer;
	}



	public String getAlbumProblem() {
		return albumProblem;
	}



	public void setAlbumProblem(String albumProblem) {
		this.albumProblem = albumProblem;
	}



	public String getAlbumInstr() {
		return albumInstr;
	}



	public void setAlbumInstr(String albumInstr) {
		this.albumInstr = albumInstr;
	}



	public String getAlbumName() {
		return albumName;
	}



	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}



	public Integer getFv_id() {
		return fv_id;
	}



	public void setFv_id(Integer fv_id) {
		this.fv_id = fv_id;
	}



	public String getToken() {
		return token;
	}



	public void setToken(String token) {
		this.token = token;
	}



	public Integer getLimit() {
		return limit;
	}



	public void setLimit(Integer limit) {
		this.limit = limit;
	}



	public FamilyVideo getFv() {
		return fv;
	}



	public void setFv(FamilyVideo fv) {
		this.fv = fv;
	}



	public Integer getUm_id() {
		return um_id;
	}



	public void setUm_id(Integer um_id) {
		this.um_id = um_id;
	}



	public String familyVideoSave() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Uservice uv=uvs.findById(um_id);
		Integer familyid=uv.getFy().getFamily_id();
		fv.setFv_familyid(familyid);
		
		try {
			fvs.save(fv);
			response.getWriter().print("ok");
		} catch (Exception e) {
			
			response.getWriter().print("error");
		}
		
		return null;
	}
	public String familyVideoList() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		Uservice uv=uvs.findById(um_id);
		Integer familyid=uv.getFy().getFamily_id();
		List<FamilyVideo> list=fvs.findByFmilyID(familyid, limit,state);//1为默认状态
		if (list!=null){
			
			JSONArray jsonArray = JSONArray.fromObject(list);
			
			 //String json = JSONArray.toJSONString(list);
			response.getWriter().print(jsonArray);
		}else{
			response.getWriter().print("nothing");
		}
		return null;	
	}
	public String familyVideoDel()  throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String res = new String(decodeBase64(token));
		Integer a=um_id+1986;
		if(a==Integer.parseInt(res)){
			//更改视频状态为2 回收站状态
			FamilyVideo fv=fvs.findById(fv_id);
			fv.setState(2);
			fvs.update(fv);
			response.getWriter().print("ok");
		}else{
			response.getWriter().print("don't do this");
		}
		return null;
	}
	public String back_familyVideoDel() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String res = new String(decodeBase64(token));
		Integer a=um_id+1986;
		if(a==Integer.parseInt(res)){
			//彻底删除视频
			try {
				//http://mljyj.oss-cn-hangzhou.aliyuncs.com/
				FamilyVideo fv=fvs.findById(fv_id);
				//删除OSS对象
				String bucketName = "mljyj";
				String ACCESS_ID = "IHE3Rao9r4cPeiMI";
				String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
				OSSClient client = new OSSClient(ACCESS_ID, ACCESS_KEY);
				String filePath = fv.getFv_videourl();
				if (filePath != null) {
					String key = filePath.replace("http://mljyj.oss-cn-hangzhou.aliyuncs.com/", "");
					client.deleteObject(bucketName, key);//删除OSS上视频
					ps.del(fv_id);//删除数据库上视频对象
				}
				fvs.del(fv_id);
				response.getWriter().print("ok");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().print("error");
			}
		}else{
			response.getWriter().print("don't do this");
		}
		return null;
	}
	public String restorevideo() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			FamilyVideo fv=fvs.findById(fv_id);
			fv.setState(1);
			fvs.update(fv);
			response.getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().print("error");
		}
		
		return null;
	}
	/*** 
     * encode by Base64 
     */  
    public static String encodeBase64(byte[]input) throws Exception{  
        Class clazz=Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");  
        Method mainMethod= clazz.getMethod("encode", byte[].class);  
        mainMethod.setAccessible(true);  
         Object retObj=mainMethod.invoke(null, new Object[]{input});  
         return (String)retObj;  
    }  
    /*** 
     * decode by Base64 
     */  
    public static byte[] decodeBase64(String input) throws Exception{  
        Class clazz=Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");  
        Method mainMethod= clazz.getMethod("decode", String.class);  
        mainMethod.setAccessible(true);  
         Object retObj=mainMethod.invoke(null, input);  
         return (byte[])retObj;
    }  
    /*
     * APP端相册相关
     * 
     * 
     * */
    public String createpa() throws IOException{
    	HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Family f=uvs.findById(um_id).getFy();
		PhotoAlbum pa=new PhotoAlbum();
		pa.setPa_family(f);
		pa.setPa_answer(albumAnswer);
		pa.setPa_instructions(albumInstr);
		pa.setPa_problem(albumProblem);
		pa.setPa_name(albumName);
		try {
			PhotoAlbumClass pac=pacs.find(9);//9为数据库中固定id----自定义相册类型
			pa.setPa_pac(pac);
			apas.save(pa);
			response.getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().print("error");
		}
		
    	return null;
    }
    private Integer paid;
    
    public Integer getPaid() {
		return paid;
	}



	public void setPaid(Integer paid) {
		this.paid = paid;
	}
	@Resource PicturesService ps;
	public String delpa() throws IOException{
    	HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			//安全性检查
			Family f=uvs.findById(um_id).getFy();
			PhotoAlbum pa=apas.find(paid);
			if(pa.getPa_family().getFamily_id()!=f.getFamily_id()){
				response.getWriter().print("非法操作");
				return null;
			}
			//更改相册状态为回收站状态 即state为2
			pa.setState(2);
			apas.update(pa);
			response.getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().print("error");
		}
		
    	return null;
    }
	public String back_delpa() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		//------------------------------------
		List<Pictures> list=ps.findall(paid);
		//删除数据库数据和oss对象-----照片
		String bucketName = "mljyj";
		String ACCESS_ID = "IHE3Rao9r4cPeiMI";
		String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
		OSSClient client = new OSSClient(ACCESS_ID, ACCESS_KEY);
		if(list!=null){
		for (Pictures p:list){
			String filePath = p.getPic_relurl();
			if (filePath != null) {
				String key = p.getPic_fullurl();
				client.deleteObject(bucketName, key);//删除OSS上照片对象
				ps.del(p.getPic_id());//删除数据库上照片对应数据
			}
		}
		}
		//清空相册中照片后删除相册
		apas.del(paid);
		response.getWriter().print("ok");
		return null;
	}
	public String restorepa() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			//安全性检查
			Family f=uvs.findById(um_id).getFy();
			PhotoAlbum pa=apas.find(paid);
			if(pa.getPa_family().getFamily_id()!=f.getFamily_id()){
				response.getWriter().print("非法操作");
				return null;
			}
			//更改相册状态为回收站状态 即state为1
			pa.setState(1);
			apas.update(pa);
			response.getWriter().print("ok");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().print("error");
		}
		
    	return null;
	}
	private Integer pa_id;
	
	public Integer getPa_id() {
		return pa_id;
	}



	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}



	public String getossuploadimgurl() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		try {
			PhotoAlbum pabean = apas.find(pa_id);
			Family fy = pabean.getPa_family();
			Integer fy_id = fy.getFamily_id();
			Studio s = fy.getFamily_studio();
			Integer s_id = s.getStudio_id();
			String url = s_id.toString() + "/" + fy_id.toString()
					+ "/" + pa_id.toString();
			response.getWriter().print(url);
		} catch (Exception e) {
			response.getWriter().print("error");
			e.printStackTrace();
		}
		return null;
	}
	private Pictures pic;
	private Integer pic_pa;
	public Pictures getPic() {
		return pic;
	}



	public void setPic(Pictures pic) {
		this.pic = pic;
	}



	public Integer getPic_pa() {
		return pic_pa;
	}



	public void setPic_pa(Integer pic_pa) {
		this.pic_pa = pic_pa;
	}



	public String appsavepic() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		try {
			PhotoAlbum pa=apas.find(pic_pa);
			pic.setPic_pa(pa);
			ps.save(pic);
			response.getWriter().print("ok");
		} catch (Exception e) {
			response.getWriter().print("error");
			e.printStackTrace();
		}
		return null;
				
	}
	private StandInsideLetter sil;
	
	public StandInsideLetter getSil() {
		return sil;
	}



	public void setSil(StandInsideLetter sil) {
		this.sil = sil;
	}

@Resource UsermainService ums;
@Resource SILService ss;
@Resource StudioService sts;
	private Integer isandroid;
	



	public Integer getIsandroid() {
		return isandroid;
	}



	public void setIsandroid(Integer isandroid) {
		this.isandroid = isandroid;
	}



	public String sendletter() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		if(isandroid==1){
			sil.setSil_title(new String(sil.getSil_title().getBytes("ISO-8859-1"),"UTF-8"));
			sil.setSil_content(new String(sil.getSil_content().getBytes("ISO-8859-1"),"UTF-8"));
		}
		try {
			Usermain um=ums.findById(um_id);
			sil.setSil_user_send(um.getUsername());
			Integer sid=um.getUservice().getFy().getFamily_studio().getStudio_id();
			List<Usermain> list=sts.findadminByStudioid(sid);
			String name=list.get(0).getUsername();
			sil.setSil_user_accept(name);
			ss.save(sil);
			response.getWriter().print("ok");
		} catch (Exception e) {
			response.getWriter().print("error");
			e.printStackTrace();
		}
		return null;
	}
	
	public String getuserinfo() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Usermain um=ums.findById(um_id);
		Uservice uv=uvs.findById(um_id);
		String json="{";
		json+="\"account\":\""+um.getUsername()+"\",\"password\":\""+um.getUser_password()+"\",\"nickname\":\""+um.getUser_nickname();
		String email=uv.getEmail()==null?"":uv.getEmail();
		String birth=uv.getBirthday().toString();
		birth=birth.substring(0, 10);
		json+="\",\"birth\":\""+birth+"\",\"tel\":\""+uv.getTel()+"\",\"weixin\":\""+uv.getWeixin()+"\",\"qq\":\""+uv.getQq()+"\",\"workunit\":\""+uv.getWorkunit()+"\",\"email\":\""+email+"\"}";
		response.getWriter().print(json);
		return null;
	}
	private Integer index;
	private String updatefield;
	public Integer getIndex() {
		return index;
	}



	public void setIndex(Integer index) {
		this.index = index;
	}



	public String getUpdatefield() {
		return updatefield;
	}



	public void setUpdatefield(String updatefield) {
		this.updatefield = updatefield;
	}
	@Resource AppUsermainService aums;
	@Resource AppUserviceService auvs;
	public String updateuserinfo() throws IOException, ParseException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Usermain um=ums.findById(um_id);
		Uservice uv=uvs.findById(um_id);
		try {
			switch (index) {
			case 0:
				um.setUser_password(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			case 1:
				um.setUser_nickname(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			case 2:
				DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
				Date date=df.parse(updatefield);
				uv.setBirthday(date);
				aums.update(um);
				auvs.update(uv);
				break;
			case 3:
				uv.setTel(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			case 4:
				uv.setWeixin(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			case 5:
				uv.setQq(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			case 6:
				uv.setWorkunit(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			case 7:
				uv.setEmail(updatefield);
				aums.update(um);
				auvs.update(uv);
				break;
			
			}
			response.getWriter().print("ok");
		} catch (Exception e) {
			response.getWriter().print("error");
			e.printStackTrace();
		}
		return null;
	}
	@Resource AppPrivacyService aps;
	public String getprivacy() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		AppPrivacy ap=aps.findByUid(um_id);
		String json =JSON.toJSONString(ap);
		response.getWriter().print(json);
		return null;
	}
	private boolean addmecheck;
	private boolean searchmefromtel;
	private boolean searchmefromaccount;
	public boolean isAddmecheck() {
		return addmecheck;
	}



	public void setAddmecheck(boolean addmecheck) {
		this.addmecheck = addmecheck;
	}



	public boolean isSearchmefromtel() {
		return searchmefromtel;
	}



	public void setSearchmefromtel(boolean searchmefromtel) {
		this.searchmefromtel = searchmefromtel;
	}



	public boolean isSearchmeaccount() {
		return searchmefromaccount;
	}



	public void setSearchmeaccount(boolean searchmeaccount) {
		this.searchmefromaccount = searchmeaccount;
	}


	
	public String saveorupdateprivacy() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		AppPrivacy ap=aps.findByUid(um_id);
		try {
			if(ap==null){
				AppPrivacy newap=new AppPrivacy();
				newap.setUid(um_id);
				newap.setAddmecheck(addmecheck);
				newap.setSearchmefromaccount(searchmefromaccount);
				newap.setSearchmefromtel(searchmefromtel);
				aps.save(newap);
			}else{
				ap.setUid(um_id);
				ap.setAddmecheck(addmecheck);
				ap.setSearchmefromaccount(searchmefromaccount);
				ap.setSearchmefromtel(searchmefromtel);
				aps.update(ap);
			}
			response.getWriter().print("ok");
		} catch (Exception e) {
			response.getWriter().print(e);
			e.printStackTrace();
		}
		
		return null;
	}
	private String username;
	
	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getheadimgurlbyusername() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String headurl;
		try {
			Usermain um=ums.findByName(username);
			headurl = um.getUservice().getHeadportrait_url();
			if(headurl==null||headurl==""){
				response.getWriter().print("noset");
			}else{
				response.getWriter().print("http://www.jyj.me"+headurl);
			}
		} catch (Exception e) {
			response.getWriter().print("noset");
			e.printStackTrace();
		}
		
		return null;
	}
	private String jidstr;
	
	public String getJidstr() {
		return jidstr;
	}



	public void setJidstr(String jidstr) {
		this.jidstr = jidstr;
	}


	@Resource XmppCustomService xcs;
	//XMPP获得用户信息
	public String getxmppuser() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String json;
		try {
			Object xu=xcs.getxmppuser(jidstr);
			json = JSON.toJSONString(xu);
			json=json.replace("[", "");
			json=json.replace("]", "");
			String[] strs=json.split(",");
			json="{\"username\":"+strs[0]+",\"name\":"+strs[1]+",\"headurl\":"+strs[2]+"}";
			response.getWriter().print(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().print("error");
			e.printStackTrace();
		}
		
		return null;
	}
	@Resource AppActivityService aas;
	@Resource FamilyService fs;
	public String getusingactivity() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Uservice uv=uvs.findById(um_id);
		Integer familyid=uv.getFy().getFamily_id();
		Integer studioid=fs.find(familyid).getFamily_studio().getStudio_id();
		try {
			List<AppActivity> list=aas.allList(studioid, 1);
			String json=JSON.toJSONString(list);
			response.getWriter().print(json);
		} catch (Exception e) {
			response.getWriter().print("null");//数据为空 没有设置
			e.printStackTrace();
		}
		return null;
	}
	@Resource AppVersionService avs;
	public String getversion() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		String version=avs.getversion();
		response.getWriter().print(version);
		
		return null;
		
	}
	/*select count(*) as counts from Uservice as a,PhotoAlbum as b where a.family=b.pa_family and a.uv_id=11706
union all 
select count(*) as counts from Uservice as a,FamilyVideo as b where a.family=b.fv_familyid and a.uv_id=11706
union all 
select 0
union all 
select count(*) as counts from StandInsideLetter where sil_user_send=(select username from Usermain where um_id=11706)
	 * 
	 * 
	 * */
	
	@Resource AppCountsService acs;
	public String getmycounts() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		Object obj=acs.getcounts(um_id);
		String json=obj.toString();
		json=json.replace("[", "");
		json=json.replace("]", "");
		response.getWriter().print(json);
		return null;
	}
}
