<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>更新影楼</title>
    

  </head>
  
  <body>
  
   <s:form action="studioAction_updatedo" namespace="/studio" method="post">
    <table width="100%" border="1">
   			<s:hidden name="studio.studio_id"/>
  			<tr><td>影楼名称：</td><td><s:textfield name="studio.studio_name" /></td></tr>
  			<tr><td>影楼介绍：</td><td><s:textfield name="studio.studio_instructions" /></td></tr>
  			<tr><td>影楼地址：</td><td><s:textfield name="studio.studio_address" /></td></tr>
  			<tr><td>影楼电话：</td><td><s:textfield name="studio.studio_phone"/></td></tr>
  			<tr><td><input type="submit" value="更新"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
