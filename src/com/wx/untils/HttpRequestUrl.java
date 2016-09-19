package com.wx.untils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
public class HttpRequestUrl {
	/*
	 * 通过get 访问链接
	 */
	public static InputStream httpRequeseGet(String urlStr){
		InputStream inputStream = null;
		try{
			URL url = new URL(urlStr);
			HttpURLConnection httpURLConn = (HttpURLConnection) url.openConnection();
			httpURLConn.setDoOutput(true);
			httpURLConn.setRequestMethod("GET");
			httpURLConn.connect();
			inputStream = httpURLConn.getInputStream();
		}catch(Exception e){
			e.printStackTrace();
		}
		return inputStream;
	}
	/*
	 * 将输入流转换成字符串
	 */
public static String getStringFromFlow(InputStream in) throws IOException{
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	int i = -1;
	while ((i = in.read())!=-1){
		baos.write(i);
	}
	return baos.toString();
}
}
