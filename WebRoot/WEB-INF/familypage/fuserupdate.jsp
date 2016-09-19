<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>


<title>更新用户</title>
<base href="<%=basePath%>">

<style type="text/css">
	table {border: 1px solid #BABEF1;border-collapse:collapse; color:#8080CC} 
		.Left_td { text-align:left;padding-left:10px;height:40px;  }
		.title{ width:100%;text-align:center; margin:0 auto;}
		.span_td { font-size:14px;}
		.right_td {padding-left:10px; }
		#check {font-size:12px; }
	</style>
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
	<script src="js/jquery.datetimepicker.js"></script>
	<script>
	$().ready(function(){
	$('#birthday').datetimepicker({
      lang:"ch",           //语言选择中文
      format:"Y-m-d",      //格式化日期
      timepicker:false,    //关闭时间选项
      //yearStart：1900,     //设置最小年份
      yearEnd:2050,        //设置最大年份
      todayButton:false   //关闭选择今天按钮
      });//时间控件
		});
	</script>
</head>

<body>

	<s:form action="fuserAction_updatedo" namespace="/family" method="post">
	 <div class="title"><h3>成员帐号</h3></div>
			<s:hidden name="umbean.um_id"/>
			<table width="100%"  border="1" cellpadding="0" cellspacing="0">
			<tr><th class="Left_td">用户账号：</th><td class="right_td"><s:textfield name="umbean.username" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">用户密码：</th><td class="right_td"><s:textfield name="umbean.user_password" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">用户昵称：</th><td class="right_td"><s:textfield name="umbean.user_nickname" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">用户消费：</th><td class="right_td"><s:textfield name="umbean.integral" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<s:if test="#session.usermain.role.role_id!=1">
  			<s:hidden name="umbean.role.role_id"/></s:if>
  			<s:else>
  				<tr><th class="Left_td">角色：</th><td><s:select name="umbean.role.role_id" list="rolelist" listKey="role_id" style="width:20%;line-height:26px;height:30px; border-radius:5px;" listValue="role_name" value="role_id" headerKey="%{#umbean.role.role_id}" headerValue="%{#umbean.role.role_name}"/></td></tr>
  			</s:else>
			<s:hidden name="umbean.uservice.openid"/>
  			<tr><th class="Left_td" width="8%">用户姓名：</th><td class="right_td"><s:textfield name="umbean.uservice.uv_name" style="width:20%;line-height:26px;height:30px; border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">性别：</th><td class="right_td"><s:radio name="umbean.uservice.gender" list="%{#{'MAN':'男','WOMAN':'女'}}" theme="simple"/></td></tr>
  			<tr><th class="Left_td">生日：</th><td class="right_td"><s:textfield name="umbean.uservice.birthday" id="birthday" placeholder="点我选择时间"/><s:radio name="umbean.uservice.islun" list="%{#{'1':'阴历','0':'阳历'}}" theme="simple"/></td></tr>
  			<tr><th class="Left_td">电话：</th><td class="right_td"><s:textfield name="umbean.uservice.tel" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>
  			<tr><th class="Left_td">微信：</th><td class="right_td"><s:textfield name="umbean.uservice.weixin" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>
  			<tr><th class="Left_td">QQ：</th><td class="right_td"><s:textfield name="umbean.uservice.qq" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>
  			<tr><th class="Left_td">工作单位：</th><td class="right_td"><s:textfield name="umbean.uservice.workunit" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<s:hidden name="umbean.uservice.fy.family_id"/>
  			<s:hidden name="umbean.uservice.uv_id"/>
  			<tr><th class="Left_td">父母：</th><td class="right_td"><s:checkbox name="umbean.uservice.isparent"  value="true" fieldValue="1"/></td></tr>
			<tr><td colspan="2" ><input type="submit" value="更  新" style="cursor:pointer; color:#fff;line-height:26px;border-radius:5px;display:block;width:180px;text-align:center;margin-left:5px;background:#164FE4;font-size:16px; font-family:微软雅黑；; line-height:30px; font-weight:bold;  " /></td></tr>
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
