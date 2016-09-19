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
	background-color:#988675;
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
<p><img alt="pic_01.jpg" width="1000" height="185" src="./images/usershow/3/2b1c7714e59949a9a0298a19830e035e.jpg" /><img alt="pic_02.jpg" width="1000" height="218" src="./images/usershow/3/c113460ae9122a12a7f27a3e14581a74.jpg" /><img alt="pic_03.jpg" width="1000" height="225" src="./images/usershow/3/d26f139334ddcce1c998c108b03850b1.jpg" /><img alt="pic_04.jpg" width="1000" height="226" src="./images/usershow/3/f2421a348dccd918625cc22fc2edcaed.jpg" /></p>
	<div id="slider">
		<div id="slideshow">
			<div class='slider-item'><img src='./images/usershow/3/91dbebafebceb407b8fb34f652de4a2b.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/3/f2dae3771fbdb4546e4dc2144e57c3fd.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/3/e05cd21ebbbfd76ae5b412357e8bab39.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/3/e36805ab3a3bb0ede94f35cf74ab20f9.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/3/9c803b6052ba696fe1d5d37c5c4e8281.jpg' /></div>
			<div class='slider-item'><img src='./images/usershow/3/22fae419e3a51afa9884f7aedb40cf4f.jpg' /></div>
		</div>
		<div class="controls-center">
			<div id="slider_controls">
				<ul id="slider_nav">
					<li><a href='#'><img src='./images/usershow/3/ac0505cf448532b6030270fd541ecb3d.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/3/1e45fea456559e1e8c702ff898306c70.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/3/ca1a4d76feea5949d66192a1a5008250.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/3/f9d2c19472432ca69006a3a10e8bbffa.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/3/4526bae9cf457128b3944212887e7275.jpg' width='132' height='76' /></a></li>
					<li><a href='#'><img src='./images/usershow/3/ba4bab2ca1a78c434788f9e64ba0814d.jpg' width='132' height='76' /></a></li>
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
