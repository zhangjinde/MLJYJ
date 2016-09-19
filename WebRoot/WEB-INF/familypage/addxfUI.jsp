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

    
    <title>添加消费信息</title>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<sx:head/>
  	</head>
  <body>


   <s:form action="familyAction_savexf" namespace="/family" method="post">
   <table width="100%" border="1">
  			<tr><td>消费项目：</td><td><s:textfield name="xf.xf_project"/></td></tr>
  			<tr><td>消费金额：</td><td><s:textfield name="xf.xf_money"/></td></tr>
  			<tr><td>消费备注：</td><td><s:textarea name="xf.xf_other"/></td></tr>
  			
  			<s:hidden name="xf.xf_family.family_id" value="%{family_id}"/>
  			
  			<s:token/>
  			<tr><td><input type="submit" value="添加"/></td></tr>
  		</table>
  		</s:form>
  		
  </body>
  
</html>

