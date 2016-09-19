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
<link rel="stylesheet" type="text/css" href="./css/usershow/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/usershow/common.css" />
<style>
#main{width:55%; margin:auto; margin-top:15px; min-height:400px; background-image:url(/skin/jiayinji/images/show_news_bg.png); margin-bottom:20px;}

#main_left{width:720px; float:left; margin-left:20px;}
#main_left h1{ color:#962653; font-size:36px; font-weight:bold;}
#main_left .menu{height:18px; margin:6px 0 4px 0; display:block; line-height:18px;}
#main_left .menu cite{float:left; display:block; background-image:url(/skin/jiayinji/images/about_news_01.png); padding-left:24px; background-repeat:no-repeat; font-size:14px; padding-right:20px; font-style:normal;}
#main_left .menu em{float:left; display:block; background-image:url(/skin/jiayinji/images/about_news_02.png); padding-left:24px; background-repeat:no-repeat; font-size:14px; font-style:normal;}

#main_left .body{margin:12px 0;}

#main_left .body img{
    max-width:720px;
	width:expression(document.body.clientWidth > 720? "720px": "auto" );
	height:auto;
}

#main_right{width:219px; float:right; margin-right:20px;}

#main_right ul li img{width:219px; height:100px; margin-bottom:5px; border:0;}
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
    		<div id="main">
	<div id="main_left">
		<h1>家，很平淡； 爱，很简单</h1>
		<p class="menu">
			<cite></cite>
			<em>2015-01-18 14:21:30</em>
		</p>
		<div class="body">
<p><strong><span style="font-size: large;"><span style="font-family: 新宋体;"><span style="color: rgb(153, 51, 0);">&nbsp;</span></span></span></strong></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">家，很平淡，只要每天都能看见亲人的笑脸，就是幸福的展现；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">爱，很简单，只要每天都会彼此挂念，就是踏实的情感。幸福并不缥缈，在于心的感受；爱情并不遥远，在于两心知的默契。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<blockquote style="margin: 10px 0px; padding: 2px; max-width: 100%; border: 0px solid rgb(241, 241, 241); color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 33.3333320617676px; text-align: center; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(172, 189, 134);">
<p style="margin: 0px auto; padding: 4px 2px 0px; max-width: 100%; clear: both; min-height: 1.5em; white-space: pre-wrap; border: 0px solid rgb(165, 165, 165); line-height: 2em; color: rgb(147, 137, 83); border-radius: 2%; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(1, 37, 48);"><img src="./images/jiayinji/news/4/93bd30512789b39b67f70633a5e40260.jpg" alt="20120617203136_5uTmC.thumb.600_0.jpg" width="500" height="307" /></p>
</blockquote>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">心，只有一颗，不要装的太多；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">人，只有一生，不要追逐的太累。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">心灵的愉悦，来自精神的富有；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">简单的快乐，来自心态的知足。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;">&nbsp;</p>
<blockquote style="margin: 10px 0px; padding: 2px; max-width: 100%; border: 0px solid rgb(241, 241, 241); color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 33.3333320617676px; text-align: center; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(172, 189, 134);">
<p style="margin: 0px auto; padding: 4px 2px 0px; max-width: 100%; clear: both; min-height: 1.5em; white-space: pre-wrap; border: 0px solid rgb(165, 165, 165); line-height: 2em; color: rgb(147, 137, 83); border-radius: 2%; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(1, 37, 48);"><img src="./images/jiayinji/news/4/78781535ef599de18112fe9e80b7a29b.jpg" alt="2425040_135919068_2.jpg" width="0" height="0" /><img src="./images/jiayinji/news/4/17a13994d5bbed8952c22900cf9b4e52.jpg" alt="2425040_135919068_2.jpg" width="667" height="966" /></p>
</blockquote>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">时间，会沉淀最真的情感；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">风雨，会考验最暖的陪伴。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">走远的，只是过眼云烟；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">留下的，才是值得珍惜的情缘。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">来得热烈，未必守得长久；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">爱得平淡，未必无情无义。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<blockquote style="margin: 10px 0px; padding: 2px; max-width: 100%; border: 0px solid rgb(241, 241, 241); color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 33.3333320617676px; text-align: center; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(172, 189, 134);">
<p style="margin: 0px auto; padding: 4px 2px 0px; max-width: 100%; clear: both; min-height: 1.5em; white-space: pre-wrap; border: 0px solid rgb(165, 165, 165); line-height: 2em; color: rgb(147, 137, 83); border-radius: 2%; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(1, 37, 48);"><img src="./images/jiayinji/news/4/816a0f742842c80cbdd10ae0b2003f0d.jpg" alt="21.jpg" width="500" height="307" /></p>
</blockquote>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">眼睛看到的许是假象，心的感受才最真实；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">耳朵听到的许是虚幻，心的聆听才最重要。</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<blockquote style="margin: 10px 0px; padding: 2px; max-width: 100%; border: 0px solid rgb(241, 241, 241); color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 33.3333320617676px; text-align: center; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(172, 189, 134);">
<p style="margin: 0px auto; padding: 4px 2px 0px; max-width: 100%; clear: both; min-height: 1.5em; white-space: pre-wrap; border: 0px solid rgb(165, 165, 165); line-height: 2em; color: rgb(147, 137, 83); border-radius: 2%; -webkit-transform: rotate(0deg); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(1, 37, 48);"><img src="./images/jiayinji/news/4/30a76763e0c725c1759426a3f4b38fc9.jpg" alt="22.jpg" width="500" height="307" /></p>
</blockquote>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: justify; box-sizing: border-box !important;">&nbsp;</p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">时间会告诉我们，简单的喜欢，最长远；</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: normal; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(255, 214, 160); font-family: 微软雅黑; font-size: 15.1999998092651px; line-height: 25px; text-align: center; box-sizing: border-box !important;"><span style="color: rgb(51, 102, 255);">平凡中的陪伴，最心安；懂你的人，最温暖。</span></p>
<div>&nbsp;</div>		</div>
	</div>
	
	<div style="clear:both"></div>
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
