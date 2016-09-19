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
	background-color:#0055a7;
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
<p><img alt="pic_01.jpg" width="1000" height="201" src="./images/usershow/2/b2ef5156385a074d3c878597d4f8a2c5.jpg" /><img alt="pic_02.jpg" width="1000" height="220" src="./images/usershow/2/03e88ab771d25f9f429eb4538c04e18e.jpg" /><img alt="pic_03.jpg" width="1000" height="193" src="./images/usershow/2/029c3cca154aa29d402318a144274577.jpg" /><img alt="pic_04.jpg" width="1000" height="240" src="./images/usershow/2/3cb6dd09c75c6dd41d4c16e8766f630f.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/2/30b36c81719531590fc918f86fbc861c.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/2/1b20cec3bde6ab3a5fdbbd02dd5c64b2.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/2/a7d3794bd359047bef59d4f3639ca5ef.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/2/42b4424d733bce5bcd39c11021142203.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/2/04ff672f3d335b01864a4434331d47e2.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/2/7e921131fef056652ae514910e9cdca6.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/2/2b27eb1b8cf24993dbeaeb6019454418.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/2/b8d8997316f7a084dbd30116c5ff1823.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/2/1f0e0b9d8754a774126e7ae670e16844.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/2/bc561e1fa1817f9404c411b812eb85d4.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/2/621e8daf815e24cb8dccf115d6c54886.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/2/0883d5b2bd700abfbcd1628db388d403.jpg' width='132' height='76' /></a></li>
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
