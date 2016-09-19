<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>写信</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  	<link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/style.css" />
    <script type="text/javascript" src="../js/bJs/jquery.js"></script>
    <script type="text/javascript" src="../js/bJs/jquery.sorted.js"></script>
    <script type="text/javascript" src="../js/bJs/bootstrap.js"></script>
    <script type="text/javascript" src="../js/bJs/ckform.js"></script>
    <script type="text/javascript" src="../js/bJs/common.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>

  </head>
  
  <body>
  <s:form action="sILAction_write" namespace="/sil" method="post">
   <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   	<tr><td width="15%">标题:</td><td><s:textfield name="sil.sil_title"/></td></tr>
   	<tr><td width="15%">收件人:</td><td><s:textfield name="sil.sil_user_accept"/></td></tr>
   	<tr><td width="15%">正文:</td><td><s:textarea name="sil.sil_content" rows="5"/></td></tr>
   
   	</table>
   	<input type="submit" value="发送" class="btn btn-success" style="margin-left: 25px;">
  
   
   
   </s:form>
  </body>
</html>
