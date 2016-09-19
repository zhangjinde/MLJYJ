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
	background-color:#ffffff;
}

.foot_color{ color:#ed135a;}
.foot_colorzs{ color:#000000;}
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
<p><img alt="pic_01.jpg" width="1000" height="244" src="./images/usershow/6/c87f1c629dec94c4dde5756d00c68006.jpg" /><img alt="pic_02.jpg" width="1000" height="252" src="./images/usershow/6/1caa11fa5a5f1d4e6ed88b63019c11b0.jpg" /><img alt="pic_03.jpg" width="1000" height="257" src="./images/usershow/6/f454352cb33773d8864a5ec4a629faf7.jpg" /><img alt="pic_04.jpg" width="1000" height="279" src="./images/usershow/6/7d65df38f9d71c21a2b249b31eee58f0.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/6/9aa1b6ee41c88fabda9c9ac225afab16.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/6/8fecfba053d213378f0d0081b934a846.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/6/33be1faeba398ef6fb0754b64d594aaf.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/6/b2d6f2a661430b8d5452c8153302c753.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/6/b2354a07a186c09a9ddbf7e7dd933727.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/6/2c411babdafb266f35611de3004c9ea1.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/6/e3fd57d279c19bbbf86bc9e961108ad1.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/6/aecc413a18ff1d02e8f0262305d16371.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/6/8b1eecab66ac673160c054fef63f03b1.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/6/e7a844af4fd420bd1972e176aabfb21b.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/6/8a19c5558064961f0d907617f8183cbf.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/6/6ff6a91bbcefda921cfd395d8ea3d575.jpg' width='132' height='76' /></a></li>
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