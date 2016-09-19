<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>增加相册分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
   <s:form action="photoAlbumClassAction_add" namespace="/photoAlbumClass" method="post">
   
    <table width="100%" border="1">
  			<tr><td>分类名称：</td><td><s:textfield name="photoAlbumClass.pac_name"/></td></tr>
  			<tr><td>分类描述：</td><td><s:textarea name="photoAlbumClass.pac_instructions"/></td></tr>
  			<s:token/>
  			<tr><td><input type="submit" value="加入"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
