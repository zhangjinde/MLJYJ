package cn.itcast.action.yp;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSErrorCode;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.ServiceException;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.ObjectMetadata;
import com.opensymphony.xwork2.ActionContext;

import cn.itcast.domain.Employees;

import cn.itcast.service.EmployeesService;

@Controller
@Scope("prototype")
public class EmployeesAction {
	@Resource
	EmployeesService es;
	private Integer e_id;
	private Employees em;
	private File[] image; // 上传的文件
	private String[] imageFileName; // 文件名称
	private String[] imageContentType; // 文件类型
	private static final String ACCESS_ID = "IHE3Rao9r4cPeiMI";
	private static final String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
	private static final String OSS_ENDPOINT = "http://oss.aliyuncs.com/";
	public Employees getEm() {
		return em;
	}

	public void setEm(Employees em) {
		this.em = em;
	}

	public File[] getImage() {
		return image;
	}

	public void setImage(File[] image) {
		this.image = image;
	}

	public String[] getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String[] imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String[] getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String[] imageContentType) {
		this.imageContentType = imageContentType;
	}

	public Integer getE_id() {
		return e_id;
	}

	public void setE_id(Integer e_id) {
		this.e_id = e_id;
	}

	public String eUI() {
		return "eUI";
	}

	public String save() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("utf-8");
		String savePath = "http://employee.oss-cn-hangzhou.aliyuncs.com";// OSS根路径
		int random=(int) (100*Math.random());
		String randomName=em.getE_name()+random;
		savePath = savePath + "/" + randomName;
		String fwqurl=ServletActionContext.getServletContext().getRealPath("/uploadFile");
		String message="";
		if(image!=null){
			for(int i=0;i<image.length;i++){
			// 服务器中转地址
						image[i].renameTo(new File(fwqurl+"/"+ imageFileName[i]));
						String fullurl = savePath + "/" + imageFileName[i];
//						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//时间模式
						if(i==0){
							em.setImg_one(fullurl);
						}
						if(i==1){
							em.setImg_two(fullurl);
						}
						if(i==2){
							em.setImg_three(fullurl);
						}
						if(i==3){
							em.setImg_four(fullurl);
						}
						if(i==4){
							em.setImg_five(fullurl);
						}
						if(i==5){
							em.setImg_six(fullurl);
						}
						if(i==6){
							em.setImg_head(fullurl);
						}

						// ///OSS根目录////
						String bucketName = "employee";
						// OSS创建文件夹
						String objectName = randomName + "/";
						OSSClient client = new OSSClient(OSS_ENDPOINT, ACCESS_ID,
								ACCESS_KEY);
						ObjectMetadata objectMeta = new ObjectMetadata();
						/*
						 * �����sizeΪ0,ע��OSS����û���ļ��еĸ���,���ﴴ�����ļ��б�������һ��sizeΪ0��Object,
						 * dataStream��Ȼ���������
						 * ��������ϴ�����,ֻ�ǿ���̨�����"/"��β��Object���ļ��еķ�ʽչʾ,�û������������ַ�ʽ��ʵ��
						 * �ļ���ģ�⹦��,������ʽ�ϵ��ļ���
						 */
						byte[] buffer = new byte[0];
						ByteArrayInputStream in = new ByteArrayInputStream(buffer);
						objectMeta.setContentLength(0);
						try {
							client.putObject(bucketName, objectName, in, objectMeta);//创建文件夹
							/*上传文件*/
							
							String key = randomName + "/"+imageFileName[i];

					        String uploadFilePath = fwqurl+"/"+imageFileName[i];
					        @SuppressWarnings("deprecation")
							OSSClient client_save = new OSSClient(ACCESS_ID, ACCESS_KEY);
					        ensureBucket(client_save, bucketName);
					        setBucketPublicReadable(client_save, bucketName);
				            uploadFile(client_save, bucketName, key, uploadFilePath);
						} finally {
							in.close();
							File file=new File(fwqurl+"/"+imageFileName[i]);  
					        file.delete();  
					        
						}
						
						message+=imageFileName[i]+"OK"+"|";

					}
			/********************************/
			try {
				es.save(em);
			} catch (Exception e) {
				e.printStackTrace();
			}
			message="图片："+message+"信息保存成功。";
			ActionContext.getContext().put("message", message);
		}
		return "success";
	}
	//删除
	public String del() {
		
		em=es.findById(e_id);
		//OSS删除对象
		String bucketName = "employee";
		String ACCESS_ID = "IHE3Rao9r4cPeiMI";
		String ACCESS_KEY = "YPMpfOPT0txwtzZSVbmXn2PLFnnml7";
		@SuppressWarnings("deprecation")
		OSSClient client = new OSSClient(ACCESS_ID, ACCESS_KEY);
		//删除6张作品图片 deleteobjects没找到合适案例
		
		try {
			String url1=em.getImg_one();
			int start=url1.indexOf("/", 10)+1;
			String key1=url1.substring(start);
			client.deleteObject(bucketName, key1);
			//2
			String url2=em.getImg_two();
			String key2=url2.substring(start);
			client.deleteObject(bucketName, key2);
			//3
			String url3=em.getImg_three();
			String key3=url3.substring(start);
			client.deleteObject(bucketName, key3);
			//4
			String url4=em.getImg_four();
			String key4=url4.substring(start);
			client.deleteObject(bucketName, key4);
			//5
			String url5=em.getImg_five();
			String key5=url5.substring(start);
			client.deleteObject(bucketName, key5);
			//6
			String url6=em.getImg_six();
			String key6=url6.substring(start);
			client.deleteObject(bucketName, key6);
			//head
			String url7=em.getImg_head();
			String key7=url7.substring(start);
			client.deleteObject(bucketName, key7);
//删除文件夹
			int end =url1.indexOf("/", start);
			String key=url1.substring(start,end)+"/";
			client.deleteObject(bucketName, key);
			//删除数据库
			es.del(e_id);
			ActionContext.getContext().put("message", "全部资料删除成功");
		} catch (OSSException e) {
			ActionContext.getContext().put("message", "OSS错误");
		} catch (ClientException e) {
			ActionContext.getContext().put("message", "Client错误");
		}
		return "success";
	}
	

	public String findbyname() {
		return null;
	}
	
	public String findbyid() throws Exception{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		em=es.findById(e_id);
		JSONArray json=JSONArray.fromObject(em);
		response.getWriter().print(json.toString());
		return null;
	}
	private static void ensureBucket(OSSClient client, String bucketName)
			throws OSSException, ClientException {

		try {
			// 创建bucket
			client.createBucket(bucketName);
		} catch (ServiceException e) {
			if (!OSSErrorCode.BUCKET_ALREADY_EXISTS.equals(e.getErrorCode())) {
				// 如果存在则不创建
//				throw e;
			}
		}
	}


	// 设置Bucket共有读
	private static void setBucketPublicReadable(OSSClient client,
			String bucketName) throws OSSException, ClientException {
		// 创建bucket
		client.createBucket(bucketName);

		// 设置bucket为public-read-write共有读写
		client.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
	}

	//上传对象
	private static void uploadFile(OSSClient client, String bucketName,
			String key, String

			filename) throws OSSException, ClientException,
			FileNotFoundException {
		File file = new File(filename);

		ObjectMetadata objectMeta = new ObjectMetadata();
		objectMeta.setContentLength(file.length());
		// 设置上传的metadata类型
		objectMeta.setContentType("image/jpeg");
		
		InputStream input = new FileInputStream(file);
		client.putObject(bucketName, key, input, objectMeta);
	}

}
