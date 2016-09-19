<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>添加公告</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
   <s:form action="ggAction_add" namespace="/gonggao" method="post">
    <table width="100%" border="1">
  			<tr><td>公告标题：</td><td><s:textfield name="gbean.title"/></td></tr>
  			<tr><td>公告内容：</td><td><s:textarea name="gbean.gg"/></td></tr>
  			<s:hidden name="gbean.ischeck" value="0"></s:hidden>
  			<s:token/>
  			<tr><td><input type="submit" value="添加公告"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
