<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<sx:head />
<style type="text/css">
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
}

.bordered {
    border: solid #FCD5D6 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #FCD5D6; 
    -moz-box-shadow: 0 1px 1px #FCD5D6; 
    box-shadow: 0 1px 1px #FCD5D6;         
}

.bordered tr:hover {
    background:#FCD5D6;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #FCD5D6;
    border-top: 1px solid #FCD5D6;
    padding: 10px;
    text-align: left;    
}



.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}
.bordered input{
	font-size: 18px;
}

</style>
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
			<li><a href="index.jsp">首页</a>
			</li>
			<li><a href="jiayinji.jsp">家印记</a>
			</li>
			<li><a href="active.jsp">最新活动</a>
			</li>
			<li><a href="404.html">定制约拍</a>
			</li>
			<li><a href="404.html">网络商城</a>
			</li>
			<li><a href="usershow.jsp">客照展示</a>
			</li>
			<li><a href="contactus.jsp">联系我们</a>
			</li>
			<li><a href='<s:property value="member"/>'>会员服务</a>
			</li>
		</ul>
	</div>
	<div class="content">
		<div class="lefts">
			<ul>
				<li><a href='<s:property value="member"/>'>相&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</a>
				</li>
				<s:url action="userCenter_goUI" namespace="/usercenter" var="goui" />
				<li><a href='<s:property value="goui"/>' class="act">修改资料</a>
				</li>
				<li><a href="#">创建家谱</a>
				</li>
				<li><a href="#">个人中心</a>
				</li>
			</ul>
		</div>
		<div class="rights">
		<img src='<s:property value="p.pic_relurl"/>' height="500px;" alt=''/>
		<s:form action="userCenter_updatepic" namespace="/usercenter" method="post">
			<table class="bordered">
			<s:hidden name="p.pic_id"/>
			<s:hidden name="p.pic_uuid"/>
			<s:hidden name="p.pic_realname"/>
			<s:hidden name="p.pic_fullurl"/>
			<s:hidden name="p.pic_url"/>
			<s:hidden name="p.pic_relurl"/>
			<s:hidden name="p.upload_time"/>
			<s:hidden name="p.upload_userid"/>
			<s:hidden name="p.pic_pa.pa_id"/>
			<tr><td>照片寄语：</td><td><s:textfield name="p.pic_instructions"/></td></tr>
			<tr><td>是否设为相册首页</td><td><input type="radio" name="index" checked="checked" value="0">否
			<input type="radio" name="index" value="1">是</td></tr>
			
			<tr><td><input type="submit" value="保存"/></td><td><s:property value="message"/></td></tr>
			</table>
		</s:form>
		
		
		</div>
	</div>
	<div class="footer">
		<div class="foocon">
			<div class="banquan">
				<a href="jiayinji.jsp">关于我们</a> | <a href="common.jsp">常见问题</a> | <a
					href="law.jsp">法律声明</a> | <a href="contactus.jsp">联系我们</a><br />
				Copyright © 2003-2015家印记 All Rights Reserved
			</div>
			<div class="footlogo">
				<img src="images/footlogo.png" alt="footlogo" />
			</div>
			<div class="link">

				<a href="javascript:void(0)" id="wx"><img
					src="images/weixin.png" border="none" width="36" height="33" />
				</a> <a href="http://weibo.com/u/5592645081" target="_blank"
					rel="nofollow" title="家印记官方微博" class="wb"><img
					src="images/weibo.png" border="none" width="40" height="33" />
				</a> <a
					href="http://wpa.qq.com/msgrd?v=3&uin=800018109&site=qq&menu=yes"
					target="_blank"><img src="images/qq.png" border="none"
					width="30" height="32" />
				</a>
			</div>
		</div>
		<div class="erweima" id="ewm">
			<img src="images/erweima.jpg" width="200" height="200" />
		</div>
	</div>
	
	<script>
		$("#wx").hover(function() {
			$(".erweima").show();
			$(".erweima").css({" margin-right":"100px","margin-top":"-200px"});
		}, function() {
			$(".erweima").hide();
		});
	</script>
</body>
</html>
