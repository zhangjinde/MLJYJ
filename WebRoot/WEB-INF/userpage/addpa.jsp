<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加用户相册</title>
<script language="javascript">
	function btn(){
		var sel=document.getElementsByName("pa.pa_pac.pac_id")[0];
		var selvalue= sel.options[sel.options.selectedIndex].value;//你要的值
		if (selvalue=="0"){
  		alert("请选择类型");
  		return false;}
}
		
	</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<table width="100%" border="1">
	<s:form action="paAction_add" namespace="/user" method="post" onsubmit="return btn()">
		<tr><td>相册名称：</td><td><s:textfield name="pa.pa_name"/></td></tr>
		<tr><td>相册说明：</td><td><s:textfield name="pa.pa_instructions"/></td></tr>
		<tr><td>相册问题：</td><td><s:textfield name="pa.pa_problem"/></td></tr>
		<tr><td>验证答案：</td><td><s:textfield name="pa.pa_answer"/></td></tr>
		<s:hidden name="pa.pa_family.family_id" value="%{#session.fy.family_id}"/>
		<tr><td>相册类型：</td><td><s:select name="pa.pa_pac.pac_id" list="pac" listKey="pac_id" listValue="pac_name" headerKey="0" headerValue="请选择" value="pac_id"/></td></tr>
		
		<!-- 批量插入照片 -->
		
		
		
		<tr><td><input type="submit" value="添加相册"/></td></tr>
	
	</s:form>
</table>
</body>
</html>
