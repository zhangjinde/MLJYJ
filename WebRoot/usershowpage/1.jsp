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
	background-color:#734772;
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
<p><img alt="pic_01.jpg" width="1000" height="205" src="./images/usershow/1/29a29c6e65e00feb1f7b01c2eb7a53a9.jpg" /><img alt="pic_02.jpg" width="1000" height="215" src="./images/usershow/1/f058f6a4193b168f3e27d6bff6fe10ec.jpg" /><img alt="pic_03.jpg" width="1000" height="208" src="./images/usershow/1/470b02921dc9ab7b61118cdef85db34e.jpg" /><img alt="pic_04.jpg" width="1000" height="226" src="./images/usershow/1/d558fedbdb4e553ec9af8e13ec5d547c.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/1/857e60a4d50378009ae09da478407fdf.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/1/4b6db9f62d9342d654d45c95c571178d.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/1/8d6ecdadd841a1704d928479b0ed2c32.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/1/3cf0f573cc33b28a773d0b8b28a3f9a0.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/1/76ff48a212221034562b2d274f5a959a.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/1/7e18104a73b074c90b30b4c72c8033fb.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/1/49bc727b9a19f9ec6109807009a9b189.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/1/5cd7d2e7a59647cce1f770a13f0b0ca5.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/1/0df3182fc539fa4b423d7d1a9c2c30be.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/1/0cc5fc1648ac88d765f4a6300f050204.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/1/bb204281cfc73daa8a30d4cbb91e2872.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/1/46d58e740e3e192a48dd708ffa02739b.jpg' width='132' height='76' /></a></li>
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
