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
<p><img alt="十周岁_01.jpg" width="1000" height="196" src="./images/usershow/7/85a1b79bfbfe5d1fc13cf1667edc49c9.jpg" /><img alt="十周岁_02.jpg" width="1000" height="191" src="./images/usershow/7/f55fd7ed01ae475679a647900e0c8ed6.jpg" /><img alt="十周岁_03.jpg" width="1000" height="247" src="./images/usershow/7/6399e4e63fcf81a40a35c2ae6041f39b.jpg" /><img alt="十周岁_04.jpg" width="1000" height="215" src="./images/usershow/7/afff407cff0efd3451a965455ebf22d3.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/7/414fa878204fa49a6f34a9aaa3c0fd51.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/7/54bc64fdbf7bab3a1825398b0e947e79.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/7/b8aa371efcaca553eac5d8e68b35c56a.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/7/e65e219d44ba3ed20e0fe2a133757f28.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/7/b78ef9e61af4b14f9c1fd74a860f44d4.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/7/0216b538ab7fbe0f0ce2faee75f1de19.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/7/1f7fe402f96ca037823e2e282ca5c93f.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/7/8cf0b831fae0e6076942e142d70f8619.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/7/0dcf5a12e270eb62d2332356b5dfdf93.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/7/84a772cd2deb49b81198a666eaadf84e.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/7/109124b5b85ebd534f4dbeadccdb9441.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/7/1509d38bad74035c4125723a0241ca94.jpg' width='132' height='76' /></a></li>
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