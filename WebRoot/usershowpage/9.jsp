<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./js/usershow/jquery.min.js"></script>
    <script type="text/javascript" src="./js/usershow/jquery.cycle.all.min.js"></script>
    <script type="text/javascript" src="./js/usershow/jquery.cycle.cs.js"></script>
<link rel="stylesheet" type="text/css" href="./css/usershow/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/usershow/product.css" />
<style>
body {
	background-color:#411507;
}

.foot_color{ color:#ed135a;}
.foot_colorzs{ color:#ffffff;}
</style>








  </head>
  
  <body>    <!-- ****************************head******************************* -->
   <s:url action="cancelAction" namespace="/login" var="cancel"/>
<s:url action="memberAction" namespace="/login" var="member"/>
	<div class="top">
    	<div class="topcon">
        	<div class="welcome">欢迎访问名流影像馆！</div>
            <s:if test="%{#request.session.usermain==null}">
            <div class="loginreg"><a href="login.jsp">登陆</a> <a href="#">注册</a></div>
            </s:if>
            <s:else><div class="loginreg"><a href='<s:property value="member"/>'><s:property value="%{#request.session.usermain.username }"/></a> <a href='<s:property value="cancel"/>'>注销</a></div></s:else>
            <div class="logo"><a href=""><img src="images/logo.png" border="none" width="134" height="78" /></a></div>
        </div>
    </div>
    <div class="navi">
    	<ul>
        	<li><a href="index.jsp">首页</a></li>
            <li><a href="jiayinji.jsp">家印记</a></li>
            <li><a href="active.jsp">最新活动</a></li>
            <li><a href="yuepai.jsp">定制约拍</a></li>
            <li><a href="shop.jsp">网络商城</a></li>
            <li><a href="usershow.jsp">客照展示</a></li>
            <li><a href="contactus.jsp">联系我们</a></li>
            <li><a href='<s:property value="member"/>'>会员服务</a></li>
        </ul>
    </div>
    <!-- ***************************************************************** -->
    		<div id="wrapper">
<p><img alt="全家福_01.jpg" width="1000" height="196" src="./images/usershow/9/e70ee929ce2a08657cea66959f08d75d.jpg" /><img alt="全家福_02.jpg" width="1000" height="244" src="./images/usershow/9/2ec6bbf4efa85108b20f1677d3a1560d.jpg" /><img alt="全家福_03.jpg" width="1000" height="270" src="./images/usershow/9/7f61e8c0f8a05c6bef7bb35c9db637bf.jpg" /><img alt="全家福_04.jpg" width="1000" height="267" src="./images/usershow/9/b38c2ba89a39d3a916f4de5c7d476af8.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/9/8861d58d4996acfcad3c053f062eb288.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/9/92a30be53bd6944b6fe4e8c68d877a45.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/9/df491641b5f38b78a7256c0890dfd9f2.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/9/a2160f12e00043f0277f547eee1cbac2.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/9/0a4320bc7e16784ba2e239cfd6e8dd14.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/9/86b858ab8c8de186d1d957f1295d4bf3.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/9/10678b3ef3a3b92427c4dc1fd6cde091.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/9/c2edc7f179e7d8704f40e01a43349f30.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/9/d5b58903f5092d7d7bbe634273402e9e.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/9/4c27cab97b8531c5d7fc1a39b4d7cbc6.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/9/09e648acdb830c22871bf70df1ed782f.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/9/ac266a00ecc1d12ab18ec57437006343.jpg' width='132' height='76' /></a></li>
				</ul>
			</div>
		</div>
		<div class="clr"></div>
	</div>
	
	<div style="clear:both; height:100px;"></div>
</div>

 <!-- ****************************foot******************************* -->
    <div class="footer">
    	<div class="foocon">
            <div class="banquan">
                <a href="jiayinji.jsp">关于我们</a> | <a href="#">常见问题</a> | <a href="#">法律声明</a> | <a href="contactus.jsp">联系我们</a><br />
    Copyright © 2003-2015名流家印记 All Rights Reserved
            </div>
             <div class="link">
            	<a href="javascript:void(0)" id="wx"><img src="images/weixin.png" border="none" width="36" height="33" /></a>
                <a href="#"><img src="images/weibo.png" border="none" width="40" height="33" /></a>
                <a href="#"><img src="images/qq.png" border="none" width="30" height="32" /></a>
            </div>
        </div>
    </div>
    <div class="erweima" id="ewm"><img src="images/erweima.jpg" width="200" height="200" /></div>
    <script>
    $("#wx").hover(function() {
        $(".erweima").show();
    }, function() {
    $(".erweima").hide();
    });</script>
  </body>
</html>