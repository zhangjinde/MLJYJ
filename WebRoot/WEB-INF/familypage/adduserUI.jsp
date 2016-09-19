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

    <base href="<%=basePath%>"/>
    <title>添加家庭</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
	<script src="js/jquery.datetimepicker.js"></script>
	
	<script language="javascript">
	function btn(){
		//数据校验、处理
		var name=$("#username").val();
  		if(name==""){alert("账号不能为空");
  		return false;}
  		var pwd=$("#pwd").val();
  		if(pwd==""){alert("密码不能为空");
  		return false;}
  		var lun=document.getElementsByName("uv.islun");
  		var boollun=false;
  		for(var i=0;i<lun.length;i++){
  			if(lun[i].checked==true){
  				boollun=true;
  			}
  		}
  		if(boollun==false){
  			alert("请选择阴阳历");
  			return false;
  		}
		var tel=$("#tel").val();
		var integral=$("#integral").val();
		var uv_name=$("#uv_name").val();
		var birthday=$("#birthday").val();
		if(birthday==""){alert("生日不能为空会导致微信绑定不上");return false;}
		if($("#check").text()=="用户已存在，请更换用户名"){
			alert("请更换用户名");
	  		return false;
		}
		name=$.trim(name);pwd=$.trim(pwd);tel=$.trim(tel);integral=$.trim(integral);uv_name=$.trim(uv_name);birthday=$.trim(birthday);
		$("#username").val(name);$("#pwd").val(pwd);$("#tel").val(tel);$("#integral").val(integral);$("#uv_name").val(uv_name);$("#birthday").val(birthday);
		var sel=document.getElementsByName("um.role.role_id")[0];
		var selvalue= sel.options[sel.options.selectedIndex].value;//你要的值
		if (selvalue=="0"){
  		alert("请选择角色");
  		return false;}
		
}
	$().ready(function(){
		//检查用户名是否存在
		$("#username").blur( function () {
			$.post("family/familyAction_checkusername", { username: $("#username").val()},function(data,textStatus){
				 if (textStatus == "success") {
					 	if (data != null) {
					 			if(data==1){
					 				$("#check").text("用户已存在，请更换用户名");
					 				$("#check").attr("style","color:red;");
					 			}
					 			else{
					 				$("#check").text("用户名可用");
					 				$("#check").attr("style","color:green;");
					 			}
					 		}
					 	}
					   });
		});
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
	
	
	<style type="text/css">
	table {border: 1px solid #BABEF1;border-collapse:collapse; color:#8080CC} 
		.Left_td { text-align:left;padding-left:10px;height:40px;  }
		.title{ width:100%;text-align:center; margin:0 auto;}
		.span_td { font-size:14px;}
		.right_td {padding-left:10px; }
		#check {font-size:12px; }
	</style>
	
	
  	</head>
  <body>
     <div class="title"><h3>添加成员帐号</h3></div>
  <table width="100%"  border="1" cellpadding="0" cellspacing="0" >
	<tr><th colspan="2" style="border-right:0px;background:none;" class="Left_td">家庭ID：<span class="span_td"><s:property value="#ff.family_id"/></span></th><th colspan="2" class="Left_td" style="border-left:0px;background:none;">家庭地址为：
	<span class="span_td" ><s:property value="#ff.family_address"/> 的家庭</span></th></tr>
   <s:form action="familyAction_adduser" namespace="/family" method="post" onsubmit="return btn()">
  			<tr><th class="Left_td">用户账号：</th><td class="right_td"  colspan="3"><s:textfield name="um.username" id="username" style="width:20%;line-height:26px;border-radius:5px;" /><span id="check"></span></td></tr>
  			<tr><th class="Left_td">用户密码：</th><td class="right_td"  colspan="3"><s:textfield name="um.user_password" id="pwd" style="width:20%;line-height:26px;border-radius:5px;"/></td></tr>
  			<tr><th class="Left_td">用户昵称：</th><td class="right_td"  colspan="3"><s:textfield name="um.user_nickname" style="width:20%;line-height:26px;border-radius:5px;"/></td></tr>
  			<tr><th class="Left_td">用户消费：</th><td  class="right_td" colspan="3"><s:textfield name="um.integral" id="integral" style="width:20%;line-height:26px;border-radius:5px;"/></td></tr>
  			<s:if test="#session.usermain.role.role_id!=1">
  			<s:hidden name="um.role.role_id" value="3"/></s:if>
  			<s:else>
  				<tr><th class="Left_td">角色：</th><td class="right_td"  colspan="3"><s:select name="um.role.role_id" style="width:20%;line-height:26px;height:30px; border-radius:5px;" list="rolelist" listKey="role_id" listValue="role_name" value="role_id" headerKey="0" headerValue="请选择"/></td></tr>
  			</s:else>
  			<tr><th class="Left_td">用户姓名：</th><td class="right_td" colspan="3"><s:textfield name="uv.uv_name" id="uv_name" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">性别：</th><td class="right_td" colspan="3"><s:radio name="uv.gender" list="%{#{'MAN':'男','WOMAN':'女'}}" theme="simple"/></td></tr>
  				<script> document.getElementsByName('uv.gender')[0].checked=true;</script> <!--默认选中男 -->
  			<tr><th width="5%" class="Left_td">生日：</th><td width="40%" class="right_td"  colspan="3"><s:textfield name="uv.birthday" id="birthday" placeholder="点我选择时间" style="width:20%;line-height:26px;border-radius:5px;" /><input type="radio" name="uv.islun" value="1" >阴历    <input type="radio" name="uv.islun" value="0"/>阳历(客户生日是以阴历还是阳历。)<font style="color:red;font-size:12px;">格式：2001-01-01</font></td></tr>
  			<tr><th class="Left_td">电话：</th><td class="right_td"  colspan="3"><s:textfield name="uv.tel" id="tel" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">微信：</th><td  class="right_td" colspan="3"><s:textfield name="uv.weixin" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">QQ：</th><td class="right_td"  colspan="3"><s:textfield name="uv.qq" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">工作单位：</th><td class="right_td"  colspan="3"><s:textfield name="uv.workunit" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<s:hidden name="uv.fy.family_id" value="%{#request.ff.family_id}"/>
  			<tr><th class="Left_td">父母：</th><td class="right_td"  colspan="3"><s:checkbox name="uv.isparent"  value="true" fieldValue="1"/></td></tr>
			
  			<s:token/>
  			
  			<tr><td height="36px" colspan="4"><input type="submit"  value="添  加" style="cursor:pointer; color:#fff;line-height:26px;border-radius:5px;display:block;width:180px;text-align:center;margin-left:5px;background:#164FE4;font-size:16px; font-family:微软雅黑；; line-height:30px; font-weight:bold;  "/></td></tr>
  		
  		</s:form>
  		<script type="text/javascript">
		document.getElementsByName('uv.islun')[1].checked=true;//--默认选中阳历 --
	</script>
  		</table>
  </body>
</html>
