<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>添加影楼</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
   <s:form action="studioAction_add" namespace="/studio" method="post">
    <table width="100%" border="1">
  			<tr><td>影楼名称：</td><td><s:textfield name="studio.studio_name"/></td></tr>
  			<tr><td>影楼介绍：</td><td><s:textfield name="studio.studio_instructions"/></td></tr>
  			<tr><td>影楼地址：</td><td><s:textfield name="studio.studio_address"/></td></tr>
  			<tr><td>影楼电话：</td><td><s:textfield name="studio.studio_phone"/></td></tr>
  			<s:token/>
  			<tr><td><input type="submit" value="加入"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
