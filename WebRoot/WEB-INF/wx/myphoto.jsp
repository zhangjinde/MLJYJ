<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
    response.setHeader("Pragma", "No-cache"); 
    response.setHeader("Cache-Control", "No-cache"); 
    response.setDateHeader("Expires", 0); 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户相册列表</title>
    <meta http-equiv="Cache" content="no-cache">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/buttons/buttons.css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
$().ready(function(){
	$(".button").click(function(){
		var pid=$(this).attr("id");
		layer.open({
		    type: 2,
		    title: ['相册信息添改', 'font-size:2em;text-align: center;'],
		    area: ['500px', '500px'],
		    fix: false, //不固定
		    maxmin: false,
		    offset:['400px', '250px'],
		    content: 'wxsupport/wxsupport_addcha.jsp?pid='+pid
		});
	});
	if($("#tag").text()=="true"){
		
		$(".addbtn").show();
	}
});

</script>

  </head>
  
  <body style="background-color: #494949;">
  <span style="display:none;" id="tag"><s:property value="#session.self"/></span>
  	<img src="images/photohead.jpg" style="width:100%;"/>
  	<span id="openid" style="display:none;"><s:property value='openid'/></span>
  	
 	<s:iterator value="palist">
 		<div style="text-align: center;">
 			<s:url action="wxjyjService_pics" var="pics">
 				<s:param value="pa_id" name="pa_id"></s:param>
 			</s:url>
			<span style="font-size:3.5em;FILTER: dropshadow(color=#f6f6f9, offx=0, offy=1);COLOR: #ffffff;">
			<s:property value="pa_name"/></span><br/>
 			<a href='<s:property value="pics"/>'>
 			<s:if test='%{#request.pa_url==null}'>
			<img alt="封面" src="images/nopaimg.jpg"></s:if>
			<s:else><img alt="封面" src='<s:property value="pa_url"/>' style="width:100%;height:auto;"></s:else><br/>
			</a>
			
			<span id="info" style="color:#ffffff;font-size:1.5em;"><s:property value="pa_instructions"/></span><br/>
			<span class="button-wrap">
    		<a href="javascript:void(0)" class="button button-pill button-raised button-primary addbtn" style="display:none;" id=<s:property value='pa_id'/>><span style="font-size:2em;">添改相册描述</span></a>
  			</span><br/>
			
 		</div>
 	</s:iterator>
  </body>
</html>
