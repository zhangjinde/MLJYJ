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
   <s:form action="rolesAction_add" namespace="/roles" method="post">
    <table width="100%" border="1">
  			<tr><td>角色名称：</td><td><s:textfield name="role.role_name"/></td></tr>
  			<tr><td>角色介绍：</td><td><s:textfield name="role.role_instructions"/></td></tr>
  			<s:token/>
  			<tr><td><input type="submit" value="添加角色"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
