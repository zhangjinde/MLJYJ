<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>

    
    <title>更新消费信息</title>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<sx:head/>
	
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


   <s:form action="familyAction_updatexf" namespace="/family" method="post">
   
    <div class="title"><h3>消费信息</h3></div>
   <table width="100%"  border="1" cellpadding="0" cellspacing="0" >
   			<s:hidden name="xf.xf_id"/>
  			<tr><th class="Left_td" width="8%">消费项目：</th><td class="right_td"><s:textfield name="xf.xf_project" style="width:20%;line-height:26px;height:30px; border-radius:5px;"/></td></tr>
  			<tr><th class="Left_td">消费金额：</th><td class="right_td"><s:textfield name="xf.xf_money" style="width:20%;line-height:26px;height:30px; border-radius:5px;"/></td></tr>
  			<tr><th class="Left_td">消费备注：</th><td class="right_td"><s:textarea name="xf.xf_other" style="width:20%;line-height:26px;height:30px; border-radius:5px;"/></td></tr>
  			<s:hidden name="xf.xf_family.family_id"/>
  			
  			<s:token/>
  			<tr><td colspan="2" ><input type="submit" value="更  新" style="cursor:pointer; color:#fff;line-height:26px;border-radius:5px;display:block;width:180px;text-align:center;margin-left:5px;background:#164FE4;font-size:16px; font-family:微软雅黑；; line-height:30px; font-weight:bold;  " /></td></tr>
  		</table>
  		</s:form>
  		
  </body>
  
</html>

