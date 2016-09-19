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
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册</title>

<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<link href="css/jquery.fullPage.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.fullPage.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $('#mod-list-box').fullpage({
                'navigation': true
            });
            var ht1 = $("#mod-list-box").html();
            if (ht1 == "" || ht1 == null) {
                $("#mod-list-box").html($("#nopic").html());
            }
        });
    </script>
</head>

<body>
<s:url action="cancelAction" namespace="/login" var="cancel"/>
<s:url action="memberAction" namespace="/login" var="member"/>


	<div class="top">
	<div style="float:left;" class="left">
	<div class="welcome" style="float: inherit;margin-top: 0px;">欢迎访问家印记！</div>
	<div class="topone">
	
	</div>
	</div>
    	<div class="topcon">
        	
            <div class="logo" ><a href=""><img src="images/logo.png" border="none" width="134" height="78" /></a></div>
        </div>
        <s:if test="%{#request.session.usermain==null}">
            <div class="loginreg"><a href="login.jsp">登陆</a> <a href="#">注册</a></div>
            </s:if>
            <s:else><div class="loginreg"><a href='<s:property value="member"/>'><s:property value="%{#request.session.usermain.username }"/></a> <a href='<s:property value="cancel"/>'>注销</a></div></s:else>
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
    <div class="content">
    	<div class="lefts">
        	<ul>
            	<li><a href='<s:property value="member"/>' class="act">相&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</a></li>
                <s:url action="userCenter_goUI" namespace="/usercenter" var="goui"/>
                <li><a href='<s:property value="goui"/>'>修改资料</a></li>
				
                <li><a href='hometree/hometree.jsp'>创建家谱</a></li>
                <s:url action="userStatus_index" namespace="/usercenter" var="index"/>
                <li><a href='<s:property value="index"/>'>个人中心</a>
            </ul>
        </div>
        <div class="rights">
        	<div class="xiangcedata">
                <div class="mod-list-container">
                    <div id="mod-list-box">
                    	<div class="section">
                    	
                    	<s:iterator value="list" status="st" var="p">
                    	
                    	<s:url action="userPicAction" namespace="/login" var="findpic">
                    		<s:param name="pa_id" value="pa_id"/>
                    	</s:url>
                        <a href='<s:property value="findpic"/>' class='list'><!-- 如果加上target='_blank'则打开新窗口 -->
                        <s:if test="#p.pa_url==null"><img src='images/xcpic1.jpg' alt=''/></s:if>
                        <s:else><img src='<s:property value="#p.pa_url"/>' alt='' /></s:else>
                        <span class='info-title'><span class='name'><span><s:property value="#p.pa_pac.pac_name"/><br/><span class='yb'><s:property value="#p.pa_name"/></span></span></span></span></span>
                        </a>
                        </s:iterator>
                    </div>
                    	
                </div>
            </div>
        </div>
    </div></div>
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
         <div class="erweima" id="ewm"><img src="images/erweima.jpg" width="200" height="200" /></div>
    </div>
   
    <script>
    $("#wx").hover(function() {
        $(".erweima").show();
        $(".erweima").css({" margin-right":"100px","margin-top":"-200px"});
    }, function() {
    $(".erweima").hide();
    });</script>
  </body>
</html>

