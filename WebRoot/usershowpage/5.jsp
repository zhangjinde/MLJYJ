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
	background-color:#9a8b78;
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
<p><img alt="宝贝百日_01.jpg" width="1000" height="231" src="./images/usershow/5/edfd91827b80e0f894a1abdb934eac49.jpg" /><img alt="宝贝百日_02.jpg" width="1000" height="261" src="./images/usershow/5/36b7ee0c5138730165c8b9b1c55634db.jpg" /><img alt="宝贝百日_03.jpg" width="1000" height="240" src="./images/usershow/5/37cbd2988e907156b9473edad2b80528.jpg" /><img alt="宝贝百日_04.jpg" width="1000" height="299" src="./images/usershow/5/b80081de1fe056f9d297eef17bd08ac4.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/5/2b08803990ee62f8ad61a1df4a477c14.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/5/f6718e57d8d411ffb88dd7d85bc0068b.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/5/f30dfa6c61ce7f615c593392c9a6b0bd.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/5/4b88b22600ef61ce8f3fdf8a238b07c2.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/5/8a6daf4e98f4c75d34b6380dd5cbf20e.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/5/50c4cfe5e464808ce0aee25290045a05.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/5/c5037e5c3e5b984102f56767eb126ec1.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/5/77298e65d8dee045147e7cde4d4487a3.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/5/c37b34a97ff701cec90ea0c241ac9d31.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/5/33cc6cf0b02e2464b700a43c621830e8.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/5/86d0e0d2aeed3ae08de234cc885ba4d9.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/5/92ec795249a7aac7f9fae63ffdd562c2.jpg' width='132' height='76' /></a></li>
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