<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>

    
    <title>添加孩子信息</title>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
	<script src="js/jquery.datetimepicker.js"></script>
	
	
	<style type="text/css">
	table {border: 1px solid #BABEF1;border-collapse:collapse; color:#8080CC} 
		.Left_td { text-align:left;padding-left:10px;height:40px;  }
		.title{ width:100%;text-align:center; margin:0 auto;}
		.span_td { font-size:14px;}
		.right_td {padding-left:10px; }
		#check {font-size:12px; }
	</style>
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


   <s:form action="fuserAction_updatechilddo" namespace="/family" method="post">
   <div class="title"><h3>孩子信息</h3></div>
   <table width="100%"  border="1" cellpadding="0" cellspacing="0">
   			<s:hidden name="child.child_id"/>
  			<tr><th class="Left_td" width="8%">孩子姓名：</th><td class="right_td"><s:textfield name="child.child_name" style="width:20%;line-height:26px;height:30px; border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">性别：</th><td class="right_td"><s:radio name="child.child_gender" list="%{#{'MAN':'男','WOMAN':'女'}}" theme="simple"/></td></tr>
  			
  			<tr><th class="Left_td">生日：</th><td class="right_td"><s:textfield name="child.child_birthday" id="birthday" placeholder="点我选择时间"/><s:radio name="child.islun" list="%{#{'1':'阴历','0':'阳历'}}" theme="simple"/></td></tr>
  			<s:hidden name="child.child_family.family_id"/>
  			
  			<s:token/>
  			<tr><td class="Left_td" colspan="2" ><input type="submit" value="更新" style="cursor:pointer; color:#fff;line-height:26px;border-radius:5px;display:block;width:180px;text-align:center;margin-left:5px;background:#164FE4;font-size:16px; font-family:微软雅黑；; line-height:30px; font-weight:bold;  " /></td></tr>
  		</table>
  		</s:form>
  		
  </body>
  
</html>

