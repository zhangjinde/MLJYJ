<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"><title>today</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js">
        </script>
        <script type="text/javascript" src="js/zzsc.js">
        </script>
		<style>
			#zzsc{width:920px;margin:100px auto;}
			.tj,#month{
				font-size: 35px;
			}
		</style>
		<script>
			$().ready(function(){
				$("#month").change(function(){
					if($(this).val()!=""){
					$.post("remind/tongjiAction_month",{month:$(this).val()},function(data,textStatus){
						if(textStatus=="success"){
							if(data!=null){
								$("#monthcount").text(data);
								
							}
						}
					});
					}
				});
			});
		</script>
    </head>
    <body>
        <!-- ***************************************时间插件 -->
        <div id="zzsc">
        </div>
        <!-- *************************************** -->
		
		<div style="margin-left: 42%;" class='tj'>今日录入：<span id="numdate"><s:property value="todaycount"/></span></div>
		<div style="margin-left: 42%;" class='tj'>按月统计：<select id="month">
			<option value=""></option>
			<option value="01">1月</option>
			<option value="02">2月</option>
			<option value="03">3月</option>
			<option value="04">4月</option>
			<option value="05">5月</option>
			<option value="06">6月</option>
			<option value="07">7月</option>
			<option value="08">8月</option>
			<option value="09">9月</option>
			<option value="10">10月</option>
			<option value="11">11月</option>
			<option value="12">12月</option>
		</select>
		<span id="monthcount"></span></div>
    </body>
</html>
