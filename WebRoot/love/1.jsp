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
	<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="love/css/jsized.carousel.css">
<script src="love/js/jquery-1.3.2.js" type="text/javascript"></script>
<script src="love/js/merged-without-jquery.js" type="text/javascript"></script>
<script>
		jQuery(function($){
            // this lines create a carousel when the page finishes loading
            $('.example1').jsizedCarousel({
                // disable slideshow
                changeInterval: 0
            });
            
	        $('.example2').jsizedCarousel({
                // size of the biggest slide
                front : {
                    width: 800,
                    height: 600
                },
                // determinies how much the slides decrease
                // from distance
                // default 0.15
                sizeDecrease : 0.2,
	            // distance between slides in px
                distanceBetween: 25,
                changeInterval: 5
            });            
		});
	</script>
<style>
/* 
        Styles for this demo only, you probably won't need them
        Look into jsized.carousel.css to customize gallery 
        */
        body { background: #ffffff; }
.wr { width: 200px;height:600px; margin: 0 auto; padding: 30px 100px; background: #fff;  border: 1px solid background: #DBDAD9;
}
h2 { margin: 30px; text-align: center; font-size: 18px; font-weight: normal; font-family: Verdana; }
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
    		<div class="wr">
  
  <div class="jsizedCarousel example2">
  <img src="love/1/1.jpg" alt="Title for an image" />
  <img src="love/1/2.jpg" alt="Title for an image" /> 
  <img src="love/1/3.jpg" alt="Title for an image" /> 
  <img src="love/1/4.jpg" alt="Title for an image" />
  <img src="love/1/5.jpg" alt="Title for an image" /> 

  </div>
  
 
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
