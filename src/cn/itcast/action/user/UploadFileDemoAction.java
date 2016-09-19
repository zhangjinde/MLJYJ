package cn.itcast.action.user;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
import cn.itcast.domain.Pictures;
import cn.itcast.domain.Studio;

import cn.itcast.service.PhotoAlbumService;
import cn.itcast.service.PicturesService;

@Controller
@Scope("prototype")
public class UploadFileDemoAction {
	@Resource
	PhotoAlbumService pas;
	@Resource
	PicturesService ps;
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

	public String uploadFile() throws Exception {

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
		String fwqurl=ServletActionContext.getServletContext().getRealPath("/uploadFile");
		
		if (fileInput != null) {
			// 服务器中转地址
			fileInput.renameTo(new File(fwqurl+"/"+ fileInputFileName));
			String fullurl = savePath + "/" + fileInputFileName;
			pic = new Pictures();
			pic.setPic_url(savePath);
			pic.setPic_realname(fileInputFileName);
			
			pic.setPic_relurl(fullurl);//����·��
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// �������ڸ�ʽ
			pic.setUpload_time(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��
			pic.setPic_pa(pas.find(pa_id));

			// ///OSS�д����ļ���////
			String bucketName = "mljyj";
			// Ҫ�������ļ������,������Object���������������"/"��β
			String objectName = s_id.toString() + "/" + fy_id.toString() + "/"
					+ pa_id.toString() +"/ceshi"+ "/";//ceshi为测试时本地使用
			pic.setPic_fullurl(objectName+fileInputFileName);//�˴�����ΪOSS�е�KEY
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
				client.putObject(bucketName, objectName, in, objectMeta);//�����ļ���
				/*��ʼ�ϴ��ļ�*/
				
				String key = s_id.toString() + "/" + fy_id.toString() + "/"
						+ pa_id.toString() + "/"+fileInputFileName;

		        String uploadFilePath = fwqurl+"/"+fileInputFileName;
		        @SuppressWarnings("deprecation")
				OSSClient client_save = new OSSClient(ACCESS_ID, ACCESS_KEY);
		        ensureBucket(client_save, bucketName);
		        setBucketPublicReadable(client_save, bucketName);
	            uploadFile(client_save, bucketName, key, uploadFilePath);
			} finally {
				in.close();
				File file=new File(fwqurl+"/"+fileInputFileName);  
		        file.delete();  
		        
			}
			
			/********************************/
			try {
				ps.save(pic);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ajax
			response.getWriter().println("上传" + fileInputFileName + "成功");

		}
		return null;
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
//				throw e;
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

}
