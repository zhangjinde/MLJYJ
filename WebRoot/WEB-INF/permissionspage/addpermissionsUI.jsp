<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>添加权限</title>


</head>

<body>
	<s:form action="permissionsAction_add" namespace="/permissions"
		method="post">
		<table width="100%" border="1">
			<tr>
				<td>权限名称：</td>
				<td><s:textfield name="permissions.permission_name" />
				</td>
			</tr>
			<tr>
				<td>权限介绍：</td>
				<td><s:textfield name="permissions.permission_describe" />
				</td>
			</tr>
			<s:token />
			<tr>
				<td><input type="submit" value="添加权限" />
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
