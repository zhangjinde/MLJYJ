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
	background-color:#f6c50d;
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
<p><img alt="成人礼_01.jpg" width="1000" height="195" src="./images/usershow/8/9981bd46037e24676b7d277f5f623f06.jpg" /><img alt="成人礼_02.jpg" width="1000" height="239" src="./images/usershow/8/7c4ea42f1b218468d3e29a38deea14b1.jpg" /><img alt="成人礼_03.jpg" width="1000" height="250" src="./images/usershow/8/6486397750136462093c322b577c4c06.jpg" /><img alt="成人礼_04.jpg" width="1000" height="293" src="./images/usershow/8/a3136b2e845e02caf2e570535b1c1032.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/8/67938ac690219d48bc227369df5dc764.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/8/f3470c80e0356314684251bc9030bb55.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/8/8cc51073b5e3ec8f1d20ef752dc2c173.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/8/b7acba6bd70a07ef0b9dc0f2358aaeab.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/8/eeee2165e813009c02cae30b8895b002.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/8/1233329eb256bb859490cd086c5f4ba2.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/8/8eed1218fab659347c05fba3ff39bc96.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/8/df762f4fd7d4d90a335965a2a8e3a567.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/8/e95a73b3286ca0824a978174afdb99a9.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/8/34dc2ee473cd009b10581304fc1c531e.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/8/22141a5fc07592b80b9eebcffdd11dcf.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/8/738b7adef454f30503b9ba78bdfe0e88.jpg' width='132' height='76' /></a></li>
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