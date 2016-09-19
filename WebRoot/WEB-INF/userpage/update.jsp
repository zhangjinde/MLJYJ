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

	<s:form action="userAction_updatedo" namespace="/user" method="post">
			<s:hidden name="umbean.um_id"/>
			<table>
			<tr><td>用户账号：</td><td><s:textfield name="umbean.username"/></td></tr>
  			<tr><td>用户密码：</td><td><s:textfield name="umbean.user_password"/></td></tr>
  			<tr><td>用户昵称：</td><td><s:textfield name="umbean.user_nickname"/></td></tr>
  			<tr><td>用户消费：</td><td><s:textfield name="umbean.integral"/></td></tr>
  			<s:if test="#session.usermain.role.role_id!=1">
  			<s:hidden name="umbean.role.role_id"/></s:if>
  			<s:else>
  				<tr><td>角色：</td><td><s:select name="umbean.role.role_id" list="rolelist" listKey="role_id" listValue="role_name" value="role_id" headerKey="%{#umbean.role.role_id}" headerValue="%{#umbean.role.role_name}"/></td></tr>
  			</s:else>
			<s:hidden name="umbean.uservice.openid"/>
  			<tr><td>用户姓名：</td><td><s:textfield name="umbean.uservice.uv_name"/></td></tr>
  			<tr><td>性别：</td><td><s:radio name="umbean.uservice.gender" list="%{#{'MAN':'男','WOMAN':'女'}}" theme="simple"/></td></tr>
  			<tr><td>生日：</td><td><sx:datetimepicker name="umbean.uservice.birthday" displayFormat="yyyy-MM-dd" displayWeeks="4" toggleType="explode" toggleDuration="200"/><s:radio name="umbean.uservice.islun" list="%{#{'1':'阴历','0':'阳历'}}" theme="simple"/></td></tr>
  			<tr><td>电话：</td><td><s:textfield name="umbean.uservice.tel"/></td></tr>
  			<tr><td>微信：</td><td><s:textfield name="umbean.uservice.weixin"/></td></tr>
  			<tr><td>QQ：</td><td><s:textfield name="umbean.uservice.qq"/></td></tr>
  			<tr><td>工作单位：</td><td><s:textfield name="umbean.uservice.workunit"/></td></tr>
  			<s:hidden name="umbean.uservice.fy.family_id"/>
  			<s:hidden name="umbean.uservice.uv_id"/>
  			<tr><td>父母：</td><td><s:checkbox name="umbean.uservice.isparent"  value="true" fieldValue="1"/></td></tr>
			<tr><td><input type="submit" value="更新"/></td></tr>
		</table>
		
		<!-- 动态生成表单 -->
	</s:form><!--  
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
