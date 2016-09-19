<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<link href="fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet"
	type="text/css" />
<link href="css/scroll.css" rel="stylesheet" type="text/css" />
<script src="fancybox/jquery.fancybox-1.3.4.js" type="text/javascript">
	
</script>
<link rel="stylesheet" href="css/lightbox.css" type="text/css"
	media="screen" />
	<script language="javascript">
    function delcfm(a) {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }else{
        	$.post("user/paAction_delpic",{pic_id:$(a).prev().text()},function(data, textStatus){
                if (textStatus == 'success') {
                	if(data=="success"){
                		$(a).parent().remove();
                	}
                }
        	});
        }
        
    }
</script>
</head>
<body>
	<s:url action="cancelAction" namespace="/login" var="cancel" />
	<s:url action="memberAction" namespace="/login" var="member" />
	<div class="top">
		<div class="topcon">
			<div class="welcome">欢迎访问家印记影像馆！</div>
			<s:if test="%{#request.session.usermain==null}">
				<div class="loginreg">
					<a href="login.jsp">登陆</a> <a href="#">注册</a>
				</div>
			</s:if>
			<s:else>
				<div class="loginreg">
					<a href='<s:property value="member"/>'><s:property
							value="%{#request.session.usermain.username }" />
					</a><a href='<s:property value="cancel"/>'>注销</a>
				</div>
			</s:else>
			<div class="logo">
				<a href=""><img src="images/logo.png" border="none" width="134"
					height="78" />
				</a>
			</div>
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
	<div class="content">
		<div class="lefts">
			<ul>
				<li><a href='<s:property value="member"/>' class="act">相&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</a>
				</li>
				<s:url action="userCenter_goUI" namespace="/usercenter" var="goui" />
				<li><a href='<s:property value="goui"/>'>修改资料</a></li>
				<li><a href="#">创建家谱</a></li>
			</ul>
		</div>
		<div class="rights">
		
			<table border="0">
				<s:iterator value="piclist" status="st">
					<s:if test="#st.index % 4 == 0">
						<tr>
					</s:if>
					<td>
						<div class="bigimg" style="padding: 10px;">
							<img src="<s:property value="pic_relurl"/>"
								alt='<s:property value="pic_realname"/>' width="150px"
								height="120">
						</div>
								<div style="display: none;"><s:property value="pic_id"/></div>
								<button class="btns" onclick="delcfm(this)" style="margin:0 0 0 40;">删除</button>
						</td>
					<s:if test="#st.index % 4 == 3 || #status.last">
						</tr>
					</s:if>
				</s:iterator>
			</table>
			<style>
.btns {
	color: #fef4e9;
	background: #fa558f;
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}

.btns:hover {
	text-decoration: none;
}

.btns:active {
	position: relative;
	top: 1px;
}
</style>
<br/>
<div  style="display: none;"><s:property value="pa_id"/></div>
<div id="upload" style="margin: auto;"><button class="btns">上传照片</button></div>

			<!-- <input type="button" value="设为封面" > -->
		</div><!-- 右侧结束 -->
	</div>
	<div class="footer" style="position: absolute;bottom: 0;">
		<div class="foocon">
			<div class="banquan">
				<a href="jiayinji.jsp">关于我们</a> | <a href="common.jsp">常见问题</a> | <a
					href="law.jsp">法律声明</a> | <a href="contactus.jsp">联系我们</a> <br />
				Copyright © 2003-2015家印记 All Rights Reserved
			</div>
			<div class="footlogo">
				<img src="images/footlogo.png" alt="footlogo" />
			</div>
			<div class="link">
				<a href="javascript:void(0)" id="wx"><img
					src="images/weixin.png" border="none" width="36" height="33" />
				</a><a href="http://weibo.com/u/5592645081" target="_blank"
					rel="nofollow" title="家印记官方微博" class="wb"><img
					src="images/weibo.png" border="none" width="40" height="33" />
				</a><a href="http://wpa.qq.com/msgrd?v=3&uin=800018109&site=qq&menu=yes"
					target="_blank"><img src="images/qq.png" border="none"
					width="30" height="32" />
				</a>
			</div>
		</div>
	</div>
	<div class="erweima" id="ewm">
		<img src="images/erweima.jpg" width="200" height="200" />
	</div>
	<script>
		$("#wx").hover(function() {
			$(".erweima").show();
		}, function() {
			$(".erweima").hide();

		});
	</script>
		<script>
		$(".bigimg").click(function(){
			var imgurl=$(this).children("img").attr("src");
			layer.open({
			    type: 1,
			    title: false,
			    closeBtn: false,
			    area: '600px',
			    skin: 'layui-layer-nobg', //没有背景色
			    shadeClose: true,
			    content: '<img src='+imgurl+' width=600px>'
			});
		});
		
		$(".bigimg").mouseenter(function(){
			layer.msg('点击我查看大图', {
			    offset: 0,
			    shift: 5
			});
			});
	</script>
	<script>
		$("#upload").click(function(){
			//iframe层-父子操作
			var pa_id=$(this).prev().text();
			layer.open({
				title:"上传图片",
			    type: 2,
			    area: ['400px', '500px'],
			    fix: false, //不固定
			    maxmin: true,
			    content: 'user/paAction_addpic?pa_id='+pa_id
			});
		});
	</script>
</body>
</html>
