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
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员登录</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div class="top">
    	<div class="topcon">
            <div class="login"><a href="">返回首页</a></div>
            <div class="logo"><a href=""><img src="images/logo.png" border="none" width="134" height="78" /></a></div>
        </div>
    </div>
    <s:form action="loginAction" namespace="/login" method="post" name="form1">
    <div class="logindiv">
    ${message}
    	<div class="logincon">
    		
        	<div class="username"><input name="username" type="text" placeholder="请输入用户名"  onkeydown="if(event.keyCode==13){document.form1.submit();}"/></div>
            <div class="passward"><input name="password" type="password" placeholder="请输入密码" onkeydown="if(event.keyCode==13){document.form1.submit();}" /></div>
            <div class="button"><a href="javascript:document.form1.submit();"><img src="images/button.png" border="none" width="342" height="60" /></a></div>
            <div class="fuxuan"><input name="" type="checkbox" value="" /> 自动登录</div>
            <div class="wjmm"><a href="#">忘记密码</a> | <a href="#">注册新用户</a></div>
        </div>
    </div>
    </s:form>
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
