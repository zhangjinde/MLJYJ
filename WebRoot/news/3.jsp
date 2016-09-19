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
		<h1>幸福是包容，而不是忍耐</h1>
		<p class="menu">
			<cite></cite>
			<em>2015-01-20 14:49:16</em>
		</p>
		<div class="body">
<p>&nbsp;<section class="tn-Powered-by-XIUMI" style="margin: 1em 0px 0.8em; padding: 0px; max-width: 100%; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 1em; line-height: 19.2000007629395px; text-align: center; vertical-align: middle; box-sizing: border-box !important; word-wrap: break-word !important;"><section class="tn-Powered-by-XIUMI" style="margin: 0px 1em; padding: 0px; max-width: 100%; height: 0px; border-top-color: rgb(249, 110, 87); border-bottom-color: rgb(249, 110, 87); border-top-width: 1.5em; border-bottom-width: 1.5em; border-top-style: solid; border-bottom-style: solid; box-sizing: border-box !important; word-wrap: break-word !important; border-right-color: transparent !important; border-left-color: transparent !important; border-right-width: 1.5em !important; border-left-width: 1.5em !important; border-right-style: solid !important; border-left-style: solid !important;"></section><section class="tn-Powered-by-XIUMI" style="margin: -2.75em 1.65em; padding: 0px; max-width: 100%; border-width: 1.3em; border-style: solid; border-color: rgb(255, 255, 255) transparent; height: 0px; box-sizing: border-box !important; word-wrap: break-word !important;"></section><section class="tn-Powered-by-XIUMI" style="margin: 0.45em 2.1em; padding: 0px; max-width: 100%; height: 0px; vertical-align: middle; border-top-color: rgb(249, 110, 87); border-bottom-color: rgb(249, 110, 87); border-top-width: 1.1em; border-bottom-width: 1.1em; border-top-style: solid; border-bottom-style: solid; box-sizing: border-box !important; word-wrap: break-word !important; border-right-color: transparent !important; border-left-color: transparent !important; border-right-width: 1.1em !important; border-left-width: 1.1em !important; border-right-style: solid !important; border-left-style: solid !important;"><section class="tn-Powered-by-XIUMI" style="margin: -0.5em 0px 0px; padding: 0px; max-width: 100%; color: rgb(255, 255, 255); line-height: 1em; overflow: hidden; font-family: inherit; font-size: 1.2em; max-height: 1em; box-sizing: border-box !important; word-wrap: break-word !important;">婚姻是一双鞋</section></section></section></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>
<p><section class="tn-Powered-by-XIUMI" style="margin: 0.8em 1em; padding: 1em; max-width: 100%; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; border-radius: 0.3em; border: 1px solid rgb(192, 200, 209); box-shadow: rgb(170, 170, 170) 0px 0px 0.6em; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(250, 250, 239);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word; border: currentcolor; color: rgb(51, 51, 51); line-height: 1.4em; font-family: inherit; font-size: 1em; word-break: break-all; box-sizing: border-box !important; background-image: none;">
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">逛街的时候看上了一双鞋</span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">鞋的颜色款式你都特别喜欢</span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">你就认定了这双鞋</span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">可是老板告诉你鞋子只有36码</span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">你犹豫再三还是决定要买</span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">你想慢慢适应穿久了就会好的</span><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<span style="margin: 0px; padding: 0px; max-width: 100%; font-family: 微软雅黑, sans-serif; font-size: 15px; box-sizing: border-box !important; word-wrap: break-word !important;">于是你把鞋子买回了家</span></span></p>
</section></section><section class="tn-Powered-by-XIUMI" style="margin: 0.8em 1em; padding: 1em; max-width: 100%; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; border-radius: 0.3em; border: 1px solid rgb(192, 200, 209); box-shadow: rgb(170, 170, 170) 0px 0px 0.6em; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(250, 250, 239);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word; border: currentcolor; color: rgb(51, 51, 51); line-height: 1.4em; font-family: inherit; font-size: 1em; word-break: break-all; box-sizing: border-box !important; background-image: none;">
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">穿了一个星期<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
小了一码的鞋子磨得你满脚泡<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你脚虽然很痛但心里还是很满意很满足<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
特别是当身边的朋友不停的夸赞这双鞋好看时<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
穿了两个星期<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你开始偶尔抱怨这双鞋让你走路很累<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
但还是很喜欢这双鞋<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
只是渐渐减少了穿它的次数<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
穿了一个月<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
鞋子终于不磨脚了<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
那是因为你的脚磨起的泡已经成茧<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你感觉不到疼了</span></p>
</section></section><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; width: 668.400024414063px; clear: both; word-wrap: break-word !important;"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important; height: 0px !important; color: transparent !important;">Powered by xiumi.us</section></section><section class="tn-Powered-by-XIUMI" style="margin: 0.8em 1em; padding: 1em; max-width: 100%; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; border-radius: 0.3em; border: 1px solid rgb(192, 200, 209); box-shadow: rgb(170, 170, 170) 0px 0px 0.6em; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(250, 250, 239);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word; border: currentcolor; color: rgb(51, 51, 51); line-height: 1.4em; font-family: inherit; font-size: 1em; word-break: break-all; box-sizing: border-box !important; background-image: none;">
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">有一天<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你打开柜子准备穿这双鞋时你惊讶的发现<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
这双鞋没有从前那么好看了<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
是它确实没有从前好看了<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你的脚把它撑的变了形<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
鞋帮有些裂缝鞋头也蹭掉了皮<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你抚摸着这双鞋心里失落后悔无奈很多情绪<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你开始感慨这一个月以来为它受的罪<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
你甚至开始后悔当时为什么不选双别的37码的鞋子<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
它不一定特别漂亮但舒服合脚</span></p>
</section></section><section class="tn-Powered-by-XIUMI" style="margin: 0.8em 1em; padding: 1em; max-width: 100%; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; border-radius: 0.3em; border: 1px solid rgb(192, 200, 209); box-shadow: rgb(170, 170, 170) 0px 0px 0.6em; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(250, 250, 239);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word; border: currentcolor; color: rgb(51, 51, 51); line-height: 1.4em; font-family: inherit; font-size: 1em; word-break: break-all; box-sizing: border-box !important; background-image: none;">
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">你伤心的把鞋子放进了柜子里从此一次也没有再穿过<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
以后你再买鞋子无论多么好看只要不合脚你都不会买<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
鞋子婚姻学<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
那双36的鞋子让你明白<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
喜不喜欢和适不适合是两码事。</span></p>
</section></section><section class="tn-Powered-by-XIUMI" style="margin: 0.8em 1em; padding: 1em; max-width: 100%; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; border-radius: 0.3em; border: 1px solid rgb(192, 200, 209); box-shadow: rgb(170, 170, 170) 0px 0px 0.6em; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(250, 250, 239);"><section class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; word-wrap: break-word; border: currentcolor; color: rgb(51, 51, 51); line-height: 1.4em; font-family: inherit; font-size: 1em; word-break: break-all; box-sizing: border-box !important; background-image: none;">
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;">婚姻是一双鞋。不论什么鞋，最重要的是合脚；不论什么样的姻缘，最美妙的是和谐。切莫只贪图鞋的华贵，而委屈了自己的脚。别人看到的是鞋，自己感受到的是脚。脚比鞋重要，这是一条真理，许许多多的人却常常忘记。<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
找一个能包容你的人，可能他不是你喜欢的类型，但他能包容你的一切，就像鞋子一样，漂亮的穿着不一定舒服，会挤脚、会破皮、会流血，但合适的鞋子就不一样，他可能没有漂亮的外表，但他能包容你，任你蹬、任你踹，你会觉得舒服，会感到幸福。<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
<br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;" />
幸福不是忍耐，而是包容。</span></p>
</section></section></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15.1999998092651px; line-height: 19.2000007629395px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>		</div>
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
