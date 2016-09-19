<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>forward</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/buttons/buttons.css">
	 <link href="css/buttons/font-awesome.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script src="js/buttons/jquery.min.js"></script>
	<script type="text/javascript" src="js/buttons/buttons.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		html,body{margin:0;height:100%}
		#main{height:100%;margin:0 30%;width:40%;}
		#left,#right{width:30%;height:100%;}
		#left{float:left;}
		#right{float:right;}
		div{
			text-align: center;
		}
		.tx {
			margin-top: 20%;		
		}
	</style>
	<script>
		function remind(){
			layer.msg("奔跑吧服务器！请勿重复点击，耐心等待，亲。",{time:10000});
		}
		function develop(){
			layer.msg("马上与您见面，耐心等待",{time:3500});
		}
		function todaytj(){
			layer.msg("暂时统计家庭个数",{time:3500});
		}
	</script>
  </head>
  
  <body>
  	<div id="left">
    	<div class="tx">
    	 <a href="javascript:void(0)" class="button button-3d button-action button-pill" onclick="develop()">今日信息</a>
    	</div>
  	</div>
	<div id="right">
	<s:url action="tongjiAction_today" namespace="/remind" var="tongji"/>
    	<div class="tx">
    	 <a href="<s:property value="tongji"/>" class="button button-3d button-action button-pill" onclick="todaytj()">今日统计</a>
    	</div>
	</div>
    <div id="main">
    	<s:url action="remindAction" namespace="/remind" var="remind"/>
    	<div class="tx">
    	 <a href="<s:property value="remind"/>" class="button button-3d button-action button-pill" onclick="remind()">今日提醒</a>
    	</div>
    </div>
	
	
  </body>
</html>
