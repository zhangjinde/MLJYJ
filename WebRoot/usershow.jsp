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
<script type="text/javascript" src="./js/usershow/jquery.smint.js"></script>
<script type="text/javascript" src="./js/usershow/animate.js"></script>
<script type="text/javascript" src="./js/usershow/zzsc.js"></script>
<link rel="stylesheet" type="text/css" href="./css/usershow/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/usershow/common.css" />
<style>
#main{width:1000px; margin:auto; margin-top:15px; min-height:400px; margin-bottom:20px;}

#main .title{width:100%; margin:auto; margin-top:15px; text-align:center; margin-bottom:10px;}

#main ul{width:100%; margin:auto;}
#main ul li{width:333px; height:510px; float:left; text-align:center;background-color:#000; margin-top:10px;}
#main ul li img{width:333px; height:510px;}
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
    <br/>
    <br/>
    		<div id="main">
	<div class="title"><img src="./images/usershow/product-01.png" width="400" height="43" border="0" /></div>
	<ul class="box">
			<li>
			<a href="usershowpage/1.jsp"><img src="./images/usershow/be4ad3e282dced501c054189e9f46736.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/2.jsp"><img src="./images/usershow/241f6039b02a24089ab83f92a1fa4af4.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/3.jsp"><img src="./images/usershow/c5f4a72a37d6c049c8bd4129f2258163.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/4.jsp"><img src="./images/usershow/0c1b44a6a249893213728e4804a553db.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/5.jsp"><img src="./images/usershow/fd6a5872852f9922c13dd418c87a3920.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/6.jsp"><img src="./images/usershow/344d59550d930e385e01d1d16710a2ea.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/7.jsp"><img src="./images/usershow/e69edec52685d33a2d11bca7d399f68e.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/8.jsp"><img src="./images/usershow/0bc5cb480f5fab826d909ff5a10960de.jpg" border="0" /></a>
		</li>
			<li>
			<a href="usershowpage/9.jsp"><img src="./images/usershow/a59270f599c545df2e4a67590d0ee5e2.jpg" border="0" /></a>
		</li>
		</ul>
	<div style="clear:both"></div>	
	
</div>

    <!-- ****************************foot******************************* -->
 <div class="footer">
    	<div class="foocon">
            <div class="banquan">
                <a href="jiayinji.jsp">关于我们</a> | <a href="common.jsp">常见问题</a> | <a href="law.jsp">法律声明</a> | <a href="contactus.jsp">联系我们</a><br />
    Copyright © 2003-2015家印记 All Rights Reserved
            </div>
            <div class="footlogo"><img src="images/footlogo.png" alt="footlogo"/></div>
            <div class="link">
            
            	<a href="javascript:void(0)" id="wx"><img src="images/weixin.png" border="none" width="36" height="33" /></a>
                <a href="http://weibo.com/u/5592645081" target="_blank" rel="nofollow" title="家印记官方微博" class="wb"><img src="images/weibo.png" border="none" width="40" height="33" /></a>
                <a href="http://wpa.qq.com/msgrd?v=3&uin=800018109&site=qq&menu=yes" target="_blank"><img src="images/qq.png" border="none" width="30" height="32" /></a>
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
