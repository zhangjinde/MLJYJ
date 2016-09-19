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
	background-color:#683417;
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
<p><img alt="pic_01.jpg" width="1000" height="181" src="./images/usershow/4/89ed0a7290adf1519ca546823a07ea76.jpg" /><img alt="pic_02.jpg" width="1000" height="221" src="./images/usershow/4/53736152eaea6000b4b4a0409550f771.jpg" /><img alt="pic_03.jpg" width="1000" height="207" src="./images/usershow/4/02136cfd602d1969fa00687b4b245dc0.jpg" /><img alt="pic_04.jpg" width="1000" height="245" src="./images/usershow/4/56463eabeb695e4245229623404412f2.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/4/285183f5ebd84a90855c04820a35117e.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/4/8d5902e3e2f096bc5ca8b0a7d2b45615.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/4/acdaf07a17779c52f47af6502493cdd3.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/4/0fcb7af0bf0e14d6fd680fe05dcca69d.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/4/812aeea256efac4a1ceffcdb96a6e6fb.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/4/2311731a987aa230e948bfb973a3ea2e.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/4/6b2c30d55c655e098d049b99de240641.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/4/07c2197807dd8de91e8bf4380192c4e0.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/4/96c3a19c04e6ff81e126255f9812afef.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/4/fd5d9dcfa63493a27635708907131517.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/4/e8d4de1a4ab4ec6ba387dfd217ea157b.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/4/1f4c3f53bbb20e10e84c274aa0c80abe.jpg' width='132' height='76' /></a></li>
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
