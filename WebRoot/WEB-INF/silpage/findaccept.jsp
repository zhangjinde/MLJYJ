<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>站内收信</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  	<link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/style.css" />
    <script type="text/javascript" src="../js/bJs/jquery.js"></script>
    <script type="text/javascript" src="../js/bJs/jquery.sorted.js"></script>
    <script type="text/javascript" src="../js/bJs/bootstrap.js"></script>
    <script type="text/javascript" src="../js/bJs/ckform.js"></script>
    <script type="text/javascript" src="../js/bJs/common.js"></script>

  </head>
  
  <body>
 
    <button type="button" class="btn btn-success" id="addnew" style="margin-left: 25px;">返回</button>
   <script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/sil/sILActionAcceptList.action";
		 });


    });
    </script>
   	<table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   	<tr><td width="15%">标题：</td><td><s:property value="sil.sil_title"/></td></tr>
   	<tr><td width="15%">写信人：</td><td><s:property value="sil.sil_user_send"/></td></tr>
   	<tr><td width="15%">来自影楼：</td><td><s:property value="fromstudio"/></td></tr>
   	<tr><td width="15%">内容：</td><td><s:property value="sil.sil_content"/></td></tr>
   		
   	</table>
  </body>
</html>
