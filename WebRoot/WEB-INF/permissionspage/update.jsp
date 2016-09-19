<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>更新影楼</title>
    

  </head>
  
  <body>
 
   <s:form action="permissionsAction_updatedo" namespace="/permissions" method="post">
   <table width="100%" border="1">
   			<s:hidden name="permissions.permissions_id"/>
  			<tr><td>角色名称：</td><td><s:textfield name="permissions.permission_name" /></td></tr>
  			<tr><td>角色介绍：</td><td><s:textfield name="permissions.permission_describe" /></td></tr>
  			<tr><td><input type="submit" value="更新"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
