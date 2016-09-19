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
		<h1>南通摄影狂欢节启东战盛大开幕</h1>
		<p class="menu">
			<cite></cite>
			<em>2015-02-06 16:57:22</em>
		</p>
		<div class="body">
<p>&nbsp;<span style="font-size: 14pt; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">【快讯】南通地区六县市</span><em><span style="font-size: 14pt; font-family: 宋体; font-style: normal; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">影楼联合举行</span></em><em><span style="font-size: 14pt; font-family: 宋体; color: rgb(204, 0, 0); font-style: normal; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">&ldquo;南通摄影狂欢节&rdquo;</span></em><span style="font-size: 14pt; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">。一线品牌，全城联动！</span><span style="font-size: 14pt; font-family: Arial, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"> <span lang="EN-US">2</span></span><span style="font-size: 14pt; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">月</span><span lang="EN-US" style="font-size: 14pt; font-family: Arial, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">7</span><span style="font-size: 14pt; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">日启东首站率先开场！全城大街小巷，邀您互动，各种礼品参与即送！数量不限！大品牌</span><span lang="EN-US" style="font-size: 14pt; font-family: Arial, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">~</span><span style="font-size: 14pt; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">大手笔</span><span lang="EN-US" style="font-size: 14pt; font-family: Arial, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">~</span><span style="font-size: 14pt; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">大优惠！活动期间</span><span style="font-size: 14pt; font-family: 'Helvetica Neue'; color: rgb(62, 62, 62); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">情侣照，闺密照，宝宝照，个人写真，全家福，婚纱照等，</span><span style="font-size: 14pt; font-family: 宋体; color: rgb(62, 62, 62); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">各大系列全为历史最优价格！机会仅此一次！启东的朋友们千万不要错过了啦</span><span lang="EN-US" style="font-size: 14pt; font-family: 'Helvetica Neue'; color: rgb(62, 62, 62); background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">~</span></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15px; line-height: 24px; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="./images/jiayinji/news/1/4cdeda3f022d8c3bc3ac6ccd6dd83b53.jpg" alt="11" width="700" height="1449" /></p>
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15px; line-height: 24px; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="./images/jiayinji/news/1/50e2443dc3219608aa05699f14e50b68.jpg" alt="12" width="700" height="1176" /></p>
<p><img src="./images/jiayinji/news/1/4a4f9882cecd885c98295d7f763872fb.jpg" alt="13" width="700" height="1131" />&nbsp;</p>
<p style="margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', &Icirc;&cent;&Egrave;&iacute;&Ntilde;&Aring;&ordm;&Uacute;, Arial, sans-serif; font-size: 15px; line-height: 24px; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>		</div>
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
