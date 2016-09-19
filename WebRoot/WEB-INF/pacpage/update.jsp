<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>更新影楼</title>
    

  </head>
  
  <body>
  <s:debug/>
   <s:form action="photoAlbumClassAction_updatedo" namespace="/photoAlbumClass" method="post">
   <table width="100%" border="1">
   			<s:hidden name="photoAlbumClass.pac_id"/>
  			<tr><td>相册分类名称：</td><td><s:textfield name="photoAlbumClass.pac_name"/></td></tr>
  			<tr><td>分类描述：</td><td><s:textarea name="photoAlbumClass.pac_instructions"/></td></tr>
  			<tr><td><input type="submit" value="更新"/></td></tr>
  		</table>
  		</s:form>
  </body>
</html>
