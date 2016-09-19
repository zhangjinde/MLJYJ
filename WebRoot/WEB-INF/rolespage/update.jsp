<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>更新影楼</title>
    

  </head>
  
  <body>

   <s:form action="rolesAction_updatedo" namespace="/roles" method="post">
   <table width="100%" border="1">
   			<s:hidden name="role.role_id"/>
  			<tr><td>角色名称：</td><td><s:textfield name="role.role_name" /></td></tr>
  			<tr><td>角色介绍：</td><td><s:textfield name="role.role_instructions" /></td></tr>
  			<tr><td>所有权限：</td></tr>
  			<tr><td><s:checkboxlist name="pnum" list="list" listKey="permissions_id" listValue="permission_name" theme="simple" value="role.permissions.{permissions_id}"/></td></tr>
  			<tr><td><input type="submit" value="更新"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
