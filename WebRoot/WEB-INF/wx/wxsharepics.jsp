<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>家印记客户相册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/buttons/buttons.css">
<script src="layer/layer.js" type="text/javascript"></script>
  </head>
  
  <body style="text-align: center;">
    <div style="clear:both; height:31px; background:url(images/bg_menu.jpg) no-repeat ;line-height:31px; color:#595959; width:100%; height:32px; font-size:2em; text-indent:10px;"><s:property value='pa.pa_name'/>
    </div>
 	<span style="display:none;"><s:property value='pa.pa_id'/></span>
 	<s:iterator value="piclist">
 		<div>
 		<img alt="" src='<s:property value="pic_relurl"/>' style="width: 80%"><br/>
 		<div style="color:#B937C8"><s:property value='pic_instructions'/></div>
		
 		</div>
 	</s:iterator>
  </body>
</html>
