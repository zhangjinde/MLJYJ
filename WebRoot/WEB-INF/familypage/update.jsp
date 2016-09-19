<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>


<title>更新家庭</title>
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
	$('#jhdate').datetimepicker({
      lang:"ch",           //语言选择中文
      format:"Y-m-d",      //格式化日期
      timepicker:false,    //关闭时间选项
      //yearStart：1900,     //设置最小年份
      yearEnd:2050,        //设置最大年份
      todayButton:false   //关闭选择今天按钮
      });//时间控件
		$('#ycdate').datetimepicker({
      lang:"ch",           //语言选择中文
      format:"Y-m-d",      //格式化日期
      timepicker:false,    //关闭时间选项
      //yearStart：1900,     //设置最小年份
      yearEnd:2050,        //设置最大年份
      todayButton:false   //关闭选择今天按钮
      });//时间控件
       //清除时间控件的数据
	  $("#clearone").click(function(){
	  	$("#jhdate").val("");
		return false;
	  });
	  $("#cleartwo").click(function(){
	  	$("#ycdate").val("");
		return false;
	  });
		});
		</script>
</head>

<body>
	<s:form action="familyAction_updatedo" namespace="/family" method="post">
	 <div class="title"><h3>家庭信息</h3></div>
	<table  width="100%"  border="1" cellpadding="0" cellspacing="0" >
			<s:hidden name="familybean.family_id" />
  			<tr><th class="Left_td" width="10%">家庭地址：</th><td class="right_td"><s:textfield name="familybean.family_address"  style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>
  			<tr><th class="Left_td">家庭电话：</th><td class="right_td"><s:textfield name="familybean.home_phone" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>		
  			<tr><th class="Left_td">爱情密码：</th><td class="right_td"><s:textfield name="familybean.lovepwd" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>	
  			<tr><th class="Left_td">护照编号：</th><td class="right_td"><s:textfield name="familybean.postnum" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>	
  			<tr><th class="Left_td">婚纱套系（价格）：</th><td class="right_td"><s:textfield name="familybean.consumption" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>		
  			<tr><th class="Left_td">结婚日期：</th><td class="right_td"><s:textfield id="jhdate" name="familybean.marrydate" placeholder="点我选择时间"/><button id="clearone">清除</button><s:radio name="familybean.islun" list="%{#{'1':'阴历','0':'阳历'}}" theme="simple"/></td></tr>
			<tr><th class="Left_td">预产日期：</th><td class="right_td"><s:textfield id="ycdate" name="familybean.childbirth" placeholder="点我选择时间"/><button id="cleartwo">清除</button></td></tr>
			<tr><th class="Left_td">家庭介绍：</th><td class="right_td"><s:textarea name="familybean.home_instructions" style="width:20%;border-radius:5px;"  /></td></tr>
			<tr><th class="Left_td">当前所属影楼：</th><td class="right_td"><s:property value="familybean.family_studio.studio_name"/></td></tr>
			<tr><th class="Left_td">移交影楼：</th><td class="right_td">如需移交请更改，否则默认即可。<s:select name="familybean.family_studio.studio_id" style="width:20%;line-height:26px;height:30px; border-radius:5px;" list="studios" listKey="studio_id" listValue="studio_name" value="studio_id" headerKey="%{#request.familybean.family_studio.studio_id}" headerValue="%{#request.familybean.family_studio.studio_name}"/></td></tr>			
		
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
