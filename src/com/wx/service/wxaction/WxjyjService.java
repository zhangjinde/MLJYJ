package com.wx.service.wxaction;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.faces.application.Application;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.domain.Uservice;
import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;
import cn.itcast.service.UsermainService;
import cn.itcast.service.UserviceService;

import com.alibaba.fastjson.JSON;
import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSErrorCode;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.ServiceException;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.ObjectMetadata;
import com.opensymphony.xwork2.ActionContext;
import com.wx.model.BackMessage;
import com.wx.model.UserInfo;
import com.wx.model.VerifyResult;
import com.wx.untils.BaseActionSupport;
import com.wx.untils.ConfigUtil;
import com.wx.untils.HttpRequestUrl;
import com.wx.untils.WxUtil;

@Controller
@Scope("propotype")
public class WxjyjService extends BaseActionSupport {
	private String city;
	private String username;
	private String sex;
	private String country;
	private String openid;
	private String imgurl;
	private List<PhotoAlbum> palist;
	private Integer pa_id;
	private PhotoAlbum pa;
	private Integer android = 0;

	public Integer getAndroid() {
		return android;
	}

	public void setAndroid(Integer android) {
		this.android = android;
	}

	public PhotoAlbum getPa() {
		return pa;
	}

	public void setPa(PhotoAlbum pa) {
		this.pa = pa;
	}

	private List<Pictures> piclist;

	public List<Pictures> getPiclist() {
		return piclist;
	}

	public void setPiclist(List<Pictures> piclist) {
		this.piclist = piclist;
	}

	public Integer getPa_id() {
		return pa_id;
	}

	public void setPa_id(Integer pa_id) {
		this.pa_id = pa_id;
	}

	public List<PhotoAlbum> getPalist() {
		return palist;
	}

	public void setPalist(List<PhotoAlbum> palist) {
		this.palist = palist;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	/*
	 * 传openid 根据openid查uservice中是否存在 如果存在，则返回family下的相册集合 并将授权信息一并传回前端
	 */
	@Resource
	UserviceService us;
	@Resource
	PhotoAlbumService pas;

	public String myphoto() {
		String openid=(String) ActionContext.getContext().getSession().get("openid");
		ActionContext.getContext().getSession().clear();
		ActionContext.getContext().getSession().put("openid", openid);
		Uservice uv = us.findByOpenId(openid.trim());
		if (uv != null) {
			int familyid = uv.getFy().getFamily_id();
			palist = pas.findall(familyid, 1);
			ActionContext.getContext().put("openid", openid);
			return "photo";
		} else {
			return "nobinding";
		}
	}

	public String getopenid() throws IOException {
		// 第1步得到用户同意授权，得到code
		String code = this.getRequest().getParameter("code");
		// 第2步通过code换取网页授权access_token
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
				+ ConfigUtil.APPID + "&secret=" + ConfigUtil.APP_SECRECT
				+ "&code=" + code + "&grant_type=authorization_code";
		InputStream in = HttpRequestUrl.httpRequeseGet(url);
		String jsonString = HttpRequestUrl.getStringFromFlow(in);
		BackMessage message = JSON.parseObject(jsonString, BackMessage.class);
		// 第四步：拉取用户信息
		String userInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token="
				+ message.getAccess_token()
				+ "&openid="
				+ message.getOpenid()
				+ "&lang=zh_CN";
		HttpMethod method = new PostMethod(userInfoUrl);
		HttpClient httpclient = new HttpClient();
		httpclient.executeMethod(method);
		String userInfoStr = new String(method.getResponseBody(), "utf-8");
		UserInfo userInfo = JSON.parseObject(userInfoStr, UserInfo.class);
		// 第5步：检验授权凭证（access_token）是否有效
		String verifyUrl = "https://api.weixin.qq.com/sns/auth?access_token="
				+ message.getAccess_token() + "&openid=" + userInfo.getOpenid();
		InputStream verifyIS = HttpRequestUrl.httpRequeseGet(verifyUrl);
		String verifyStr = HttpRequestUrl.getStringFromFlow(verifyIS);
		VerifyResult veResult = JSON.parseObject(verifyStr, VerifyResult.class);
		String city = new String(userInfo.getCity().getBytes(), "UTF-8");
		String username = new String(userInfo.getNickname().getBytes(), "UTF-8");
		String sex = userInfo.getSex();
		String country = new String(userInfo.getCountry().getBytes(), "UTF-8");
		String openid = userInfo.getOpenid();
		ActionContext.getContext().getSession().put("openid", openid);// 本人
		// System.out.println(userInfo.getUnionid());
		String imgurl = userInfo.getHeadimgurl();
		System.out.println("错误代码：" + veResult.getErrcode() + "错误信息："
				+ veResult.getErrmsg() + "");
		if (veResult.getErrcode().equals("0")
				&& veResult.getErrmsg().equals("ok")) {
			city = URLEncoder.encode(city, "UTF-8");
			username = URLEncoder.encode(username, "UTF-8");
			country = URLEncoder.encode(country, "UTF-8");
			if (openid != null) {
				this.getResponse().sendRedirect(
						"http://www.jyj.me/wxjyjService_myphoto.action?openid="
								+ openid);
			}
		}
		return null;
	}

	/*
	 * 根据pa_id查询出所有照片，并返回 参数：@pa_id
	 */
	@Resource
	PicturesService ps;

	public String pics() {
		piclist = ps.findall(pa_id);
		pa = pas.find(pa_id);
		if (android == 1 && android != null) {
			return "androidshare";
		}
		return "pic";
	}

	private File fileInput;
	private String fileInputFileName;
	private Pictures pic;
	private static final String ACCESS_ID = "IHE3Rao9r4cPeiMI";
	private static final String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
	private static final String OSS_ENDPOINT = "http://oss.aliyuncs.com/";

	public File getFileInput() {
		return fileInput;
	}

	public void setFileInput(File fileInput) {
		this.fileInput = fileInput;
	}

	public String getFileInputFileName() {
		return fileInputFileName;
	}

	public void setFileInputFileName(String fileInputFileName) {
		this.fileInputFileName = fileInputFileName;
	}

	public String upload() throws Exception {

		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("pa_id");
		Integer pa_id = Integer.valueOf(id).intValue();
		PhotoAlbum pabean = pas.find(pa_id);
		Family fy = pabean.getPa_family();
		Integer fy_id = fy.getFamily_id();
		Studio s = fy.getFamily_studio();
		Integer s_id = s.getStudio_id();
		String savePath = "http://mljyj.oss-cn-hangzhou.aliyuncs.com";// OSS根路径
		savePath = savePath + "/" + s_id.toString() + "/" + fy_id.toString()
				+ "/" + pa_id.toString();
		String fwqurl = ServletActionContext.getServletContext().getRealPath(
				"/uploadFile");
		UUID uuid = UUID.randomUUID();
		fileInputFileName = uuid + fileInputFileName;
		if (fileInput != null) {
			// 服务器中转地址
			fileInput.renameTo(new File(fwqurl + "/" + fileInputFileName));
			String fullurl = savePath + "/" + fileInputFileName;
			pic = new Pictures();
			pic.setPic_url(savePath);
			pic.setPic_realname(fileInputFileName);

			pic.setPic_relurl(fullurl);// ����·��
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// �������ڸ�ʽ
			pic.setUpload_time(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
			pic.setPic_pa(pas.find(pa_id));

			// ///OSS�д����ļ���////
			String bucketName = "mljyj";
			// Ҫ�������ļ������,������Object���������������"/"��β
			String objectName = s_id.toString() + "/" + fy_id.toString() + "/"
					+ pa_id.toString() + "/";// ceshi为测试时本地使用
			pic.setPic_fullurl(objectName + fileInputFileName);// �˴�����ΪOSS�е�KEY
			OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID,
					ACCESS_KEY);
			ObjectMetadata objectMeta = new ObjectMetadata();
			/*
			 * �����sizeΪ0,ע��OSS����û���ļ��еĸ���,���ﴴ�����ļ��б�������һ��sizeΪ0��
			 * Object, dataStream��Ȼ���������
			 * ��������ϴ�����,ֻ�ǿ���̨�����"/"��β��
			 * Object���ļ��еķ�ʽչʾ,�û������������ַ�ʽ��ʵ��
			 * �ļ���ģ�⹦��,������ʽ�ϵ��ļ���
			 */
			byte[] buffer = new byte[0];
			ByteArrayInputStream in = new ByteArrayInputStream(buffer);
			objectMeta.setContentLength(0);
			try {
				client.putObject(bucketName, objectName, in, objectMeta);// �����ļ���
				/* ��ʼ�ϴ��ļ� */

				String key = s_id.toString() + "/" + fy_id.toString() + "/"
						+ pa_id.toString() + "/" + fileInputFileName;

				String uploadFilePath = fwqurl + "/" + fileInputFileName;
				@SuppressWarnings("deprecation")
				OSSClient client_save = new OSSClient(ACCESS_ID, ACCESS_KEY);
				ensureBucket(client_save, bucketName);
				setBucketPublicReadable(client_save, bucketName);
				uploadFile(client_save, bucketName, key, uploadFilePath);
			} finally {
				in.close();
				File file = new File(fwqurl + "/" + fileInputFileName);
				file.delete();

			}

			/********************************/
			try {
				ps.save(pic);
			} catch (Exception e) {
				e.printStackTrace();
			}
			ActionContext.getContext().put("message", "上传照片成功");

		}
		return "successupload";
	}

	// ����Bucket.
	private static void ensureBucket(OSSClient client, String bucketName)
			throws OSSException, ClientException {

		try {
			// ����bucket
			client.createBucket(bucketName);
		} catch (ServiceException e) {
			if (!OSSErrorCode.BUCKET_ALREADY_EXISTS.equals(e.getErrorCode())) {
				// ���Bucket�Ѿ����ڣ������
				// throw e;
			}
		}
	}

	// ��Bucket����Ϊ�����˿ɶ�
	private static void setBucketPublicReadable(OSSClient client,
			String bucketName) throws OSSException, ClientException {
		// ����bucket
		client.createBucket(bucketName);

		// ����bucket�ķ���Ȩ�ޣ�public-read-writeȨ��
		client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
	}

	// �ϴ��ļ�
	private static void uploadFile(OSSClient client, String bucketName,
			String key, String

			filename) throws OSSException, ClientException,
			FileNotFoundException {
		File file = new File(filename);

		ObjectMetadata objectMeta = new ObjectMetadata();
		objectMeta.setContentLength(file.length());
		// ������metadata�б���ļ�����
		objectMeta.setContentType("image/jpeg");

		InputStream input = new FileInputStream(file);
		client.putObject(bucketName, key, input, objectMeta);
	}

	private Integer pic_id;

	public Integer getPic_id() {
		return pic_id;
	}

	public void setPic_id(Integer pic_id) {
		this.pic_id = pic_id;
	}

	public String del() throws IOException {
		Pictures p = ps.find(pic_id);
		String filePath = p.getPic_relurl();
		if (filePath != null) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			try {
				// OSS删除对象
				String bucketName = "mljyj";
				String ACCESS_ID = "IHE3Rao9r4cPeiMI";
				String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
				OSSClient client = new OSSClient(ACCESS_ID, ACCESS_KEY);
				String key = p.getPic_fullurl();
				client.deleteObject(bucketName, key);
				pa_id = p.getPic_pa().getPa_id();
				ps.del(pic_id);

				response.getWriter().print("ok");
			} catch (IOException e) {
				response.getWriter().print("err");
				e.printStackTrace();
			}
		}
		return null;
	}

	public String checkisself() throws IOException {
		String openid = (String) ActionContext.getContext().getSession()
				.get("openid");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PhotoAlbum pa = pas.find(pa_id);
		Integer fid = pa.getPa_family().getFamily_id();
		List<Uservice> list = us.findByfamilyid(fid);
		boolean isself = false;
		if (openid != null) {
			for (Uservice u : list) {
				if (u.getOpenid() != null) {
					if (openid.equals(u.getOpenid())) {
						isself = true;
					}
				}
			}
		}
		if (isself) {
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}

		return null;
	}
	private String wxheadurl;
	private String wxusernickname;
	private String wxcountry;
	private String wxcity;
	private Integer howdays;
	private String wxsex;
	private String wxopenid;
	
	public String getWxsex() {
		return wxsex;
	}

	public void setWxsex(String wxsex) {
		this.wxsex = wxsex;
	}

	public String getWxopenid() {
		return wxopenid;
	}

	public void setWxopenid(String wxopenid) {
		this.wxopenid = wxopenid;
	}

	public Integer getHowdays() {
		return howdays;
	}

	public void setHowdays(Integer howdays) {
		this.howdays = howdays;
	}

	public String getWxheadurl() {
		return wxheadurl;
	}

	public void setWxheadurl(String wxheadurl) {
		this.wxheadurl = wxheadurl;
	}

	public String getWxusernickname() {
		return wxusernickname;
	}

	public void setWxusernickname(String wxusernickname) {
		this.wxusernickname = wxusernickname;
	}

	public String getWxcountry() {
		return wxcountry;
	}

	public void setWxcountry(String wxcountry) {
		this.wxcountry = wxcountry;
	}

	public String getWxcity() {
		return wxcity;
	}

	public void setWxcity(String wxcity) {
		this.wxcity = wxcity;
	}
	@Resource UsermainService ums;
	private String userinfoper;
	
	public String getUserinfoper() {
		return userinfoper;
	}

	public void setUserinfoper(String userinfoper) {
		this.userinfoper = userinfoper;
	}

	public String newusercenter() throws ParseException{
		UserInfo user=WxUtil.getuserinfo();
		ServletActionContext.getContext().getSession().put("wxuser", user);
		//业务处理
		//第一步 先通过openid查找数据 看用户是否绑定或存在
		wxopenid=user.getOpenid();
		Uservice uv=us.findByOpenId(wxopenid);//附表对象
		Usermain umain=ums.findById(uv.getUv_id());//主表对象
		wxheadurl=user.getHeadimgurl();
		wxusernickname=user.getNickname();
		wxcountry=user.getCountry();
		wxcity=user.getCity();
		wxsex=user.getSex().equals("1")?"男":"女";
		if(uv==null){
			//第二步 如果未绑定去绑定
			return "gobinding";
		}else{
			//第三步 如果绑定去用户中心
			//找出用户对象uv
			Integer wxuserid=uv.getUv_id();
			String regtime="";
			while(regtime==null||regtime.equals("")&&wxuserid>1){
				//比较两个时间
				Usermain um=ums.findById(wxuserid);
				regtime=um.getRegtime();
				if(regtime==null){
					wxuserid=wxuserid-1;
					continue;
				}
				Date nowdate=new Date();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date reg=df.parse(regtime);
				Long cha=nowdate.getTime()-reg.getTime();
				howdays=(int) (cha/(24*60*60*1000));
				break;
			}
			//计算资料完成度
			double isset=9.00;
			double allsettings=9.00;
			if(umain.getUser_nickname()==null||umain.getUser_nickname().equals("")){
				isset=isset-1;
			}
			if(umain.getPrompt_problem()==null||umain.getPrompt_problem().equals("")){
				isset=isset-1;
			}
			if(uv.getBirthday()==null){
				isset=isset-1;
			}
			if(uv.getEmail()==null||uv.getEmail().equals("")){
				isset=isset-1;
			}
			if(uv.getGender()==null||uv.getGender().equals("")){
				isset=isset-1;
			}
			if(uv.getHeadportrait_url()==null||uv.getHeadportrait_url().equals("")){
				isset=isset-1;
			}
			if(uv.getQq()==null||uv.getQq().equals("")){
				isset=isset-1;
			}
			if(uv.getTel()==null||uv.getTel().equals("")){
				isset=isset-1;
			}
			if(uv.getWorkunit()==null||uv.getWorkunit().equals("")){
				isset=isset-1;
			}
			double f=isset/allsettings;
			String result;
			if(f==1.00)
				userinfoper="100";
			else{
				result= String.format("%.2f", f);
				userinfoper=result.substring(2);
			}
			
			return "wxusercenter";
		}
		
	}
	public String afterbd() throws ParseException{
		UserInfo user=(UserInfo) ServletActionContext.getContext().getSession().get("wxuser");
		wxopenid=user.getOpenid();
		wxheadurl=user.getHeadimgurl();
		wxusernickname=user.getNickname();
		wxcountry=user.getCountry();
		wxcity=user.getCity();
		wxsex=user.getSex().equals("1")?"男":"女";
		Uservice uv=us.findByOpenId(user.getOpenid());
		Usermain umain=ums.findById(uv.getUv_id());
		Integer wxuserid=uv.getUv_id();
		String regtime="";
		while(regtime==null||regtime.equals("")&&wxuserid>1){
			//比较两个时间
			Usermain um=ums.findById(wxuserid);
			regtime=um.getRegtime();
			if(regtime==null){
				wxuserid=wxuserid-1;
				continue;
			}
			Date nowdate=new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date reg=df.parse(regtime);
			Long cha=nowdate.getTime()-reg.getTime();
			howdays=(int) (cha/(24*60*60*1000));
			break;
		}
		//计算资料完成度
		double isset=9.00;
		double allsettings=9.00;
		if(umain.getUser_nickname()==null||umain.getUser_nickname().equals("")){
			isset=isset-1;
		}
		if(umain.getPrompt_problem()==null||umain.getPrompt_problem().equals("")){
			isset=isset-1;
		}
		if(uv.getBirthday()==null){
			isset=isset-1;
		}
		if(uv.getEmail()==null||uv.getEmail().equals("")){
			isset=isset-1;
		}
		if(uv.getGender()==null||uv.getGender().equals("")){
			isset=isset-1;
		}
		if(uv.getHeadportrait_url()==null||uv.getHeadportrait_url().equals("")){
			isset=isset-1;
		}
		if(uv.getQq()==null||uv.getQq().equals("")){
			isset=isset-1;
		}
		if(uv.getTel()==null||uv.getTel().equals("")){
			isset=isset-1;
		}
		if(uv.getWorkunit()==null||uv.getWorkunit().equals("")){
			isset=isset-1;
		}
		double f=isset/allsettings;
		String result;
		if(f==1.00)
			userinfoper="100";
		else{
			result= String.format("%.2f", f);
			userinfoper=result.substring(2);
		}
		
		return "wxusercenter";
	}
}
