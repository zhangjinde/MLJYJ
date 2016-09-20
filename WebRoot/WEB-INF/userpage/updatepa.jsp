<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>更新用户</title>

<sx:head />
</head>

<body>
	
	
	<s:form action="paAction_updatedo" namespace="/user" method="post">
	 <table width="100%" border="1">
		<s:hidden name="pa.pa_id" />
			<tr><td>相册名称：</td><td><s:textfield name="pa.pa_name" /></td></tr>
		<tr><td>相册说明：</td><td><s:textfield name="pa.pa_instructions" /></td></tr>
		<tr><td>相册问题：</td><td><s:textfield name="pa.pa_problem" /></td></tr>
		<tr><td>验证答案：</td><td><s:textfield name="pa.pa_answer" /></td></tr>
		<s:hidden name="pa.pa_family.family_id"/>
		<s:hidden name="pa.state"/>
		<tr><td>相册类型：</td><td><s:select name="pa.pa_pac.pac_id" list="pac" listKey="pac_id" listValue="pac_name" value="pac_id" /></td></tr>
		<tr><input type="submit" value="更新"/></tr>
		<!-- 动态生成表单 -->
		</table>
	</s:form>
	<!--  
	<script language="javascript">
		function AddElement(mytype) {
			var mytype, TemO = document.getElementById("add");
			var newInput = document.createElement("input");
			newInput.type = mytype;
			newInput.name = "input1";
			TemO.appendChild(newInput);
			var newline = document.createElement("br");//创建一个BR标签是为能够换行！ 
			TemO.appendChild(newline);
		}
	</script>
	-->
</body>
</html>
