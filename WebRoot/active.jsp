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

#main ul{width:990px; margin:auto;}
#main ul li{width:320px; height:360px; float:left; text-align:center; background-color:#000; margin:5px;}
#main ul li img{width:320px; height:360px;}

#huodong{background-color:#a34a76; width:100%; height:120px;}
#huodong_main{width:560px; text-align:left; margin:auto; padding-left:300px; padding-top:15px;}
#huodong_main h1{color:#fbbf98; font-size:18px; font-weight:bold;}
#huodong_main p{color:#fff; font-size:16px; font-weight:bold; line-height:180%; padding-top:6px;}

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
	<ul class="box">
		<li>
			<a href="active/1.jsp"><img src="./images/active/titlepic1.jpg" width="320" height="360" border="0" /></a>
		</li>
		<li>
			<a href="active/2.jsp"><img src="./images/active/titlepic2.jpg" width="320" height="360" border="0" /></a>
		</li>
		<li>
			<a href="active/3.jsp"><img src="./images/active/titlepic3.jpg" width="320" height="360" border="0" /></a>
		</li>
		<li>
			<a href="active/4.jsp"><img src="./images/active/titlepic4.jpg" width="320" height="360" border="0" /></a>
		</li>
		<li>
			<a href="active/5.jsp"><img src="./images/active/titlepic5.jpg" width="320" height="360" border="0" /></a>
		</li>
		<li>
			<a href="active/6.jsp"><img src="./images/active/titlepic6.jpg" width="320" height="360" border="0" /></a>
		</li>
	</ul>
	<div style="clear:both"></div>	
</div>
<div id="huodong">
	<div id="huodong_main">
		<h1>活动、档期、风格、礼服免租、免费试妆体验、礼服租赁抵用券</h1>
		<p>
		活动限时抢订，限量100名，数量有限。<br />
		请抓紧时间联系客服，咨询网络客服。
		</p>
	</div>
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
