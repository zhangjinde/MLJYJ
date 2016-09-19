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
<title>个人中心</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/CustomerIndex.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/CustomerIndex.js"></script>
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="layer/layer.js" type="text/javascript"></script>

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
	height: 200px;
}

.bordered tr:hover {
	background: #FCD5D6;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered td,.bordered th {
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

.bordered input {
	font-size: 18px;
}
.erweima{
	position:absolute;
	display:none;
	
	width:88%;
	padding-rigth:20%;
	text-align:right; 
}

</style>

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script>
	function addui() {
		//window.location.href = "/SSH2_MLJYJ/usercenter/userStatus_addui.action";

	}

	$(function() {
		var scrtime;
		$("#con").hover(function() {
			clearInterval(scrtime);

		}, function() {

			scrtime = setInterval(function() {
				var $ul = $("#con ul");
				var liHeight = $ul.find("li:last").height();
				$ul.animate({
					marginTop : liHeight + 40 + "px"
				}, 1000, function() {

					$ul.find("li:last").prependTo($ul)
					$ul.find("li:first").hide();
					$ul.css({
						marginTop : 0
					});
					$ul.find("li:first").fadeIn(1000);
				});
			}, 3000);

		}).trigger("mouseleave");

	});

	function calNum(txtobj, divobj, fg) {
		var str = txtobj.value;
		var n = 140;//初始化数字
		var tmp = str.replace(/[^\w\s]/g, "");//将文本框里面的字符中的中文全部替换成空的
		if (tmp != null)
			n = n - (str.length - tmp.length) - Math.floor(0.5 * tmp.length);//计算，一个中文是1个字符，2个英文是1个
		else
			n = n - Math.floor(0.5 * str.length);//计算，一个中文是1个字符，2个英文是1个
		if (n < 0) {
			divobj.style.color = "#969";//设置如果超了，变背景色为红色
		} else {
			if (fg == 1)//如果标记为1设置白色
				divobj.style.color = "#FFF";
			else
				//如果标记为0 设置为黑色
				divobj.style.color = "#000";
		}
		/* 将计算好的数存入div中 */
		divobj.innerHTML = n;
	}

	/* 点回复时显示原来的回复窗口 */
	function reXianShi(srcObj) {
		var getid = $(srcObj).parent().prev().text();
		$("#rs_id").val(getid);
		var rd_id = document.getElementById("mainBannerContent");
		var tmp = document.getElementById("mainBannerContent");
		var heights;
		/* 判断是回复里面点的回复还是在与那里的状态里面点的回复 */
		if (srcObj.parentNode.parentNode.parentNode == tmp) {//在原来的状态上回复
			hfObj = srcObj.parentNode.nextSibling;
			srcUser = hfObj.previousSibling.previousSibling.previousSibling.previousSibling;
		} else {//回复里面点的回复
			hfObj = srcObj.parentNode.parentNode.parentNode;

			//srcUser = srcObj.parentNode.previousSibling.previousSibling.previousSibling;

		}
		var divObj = document.getElementById("recieve");
		divObj.style.visibility = "visible";
		/* 如果是最后一个状态就点设置回复窗口在上面显示 */

		divObj.style.top = (event.y - hfObj.parentNode.offsetHeight) + "px";
		divObj.style.left = "40%";

		var txt = document.getElementById("ta1");
		txt.value = "";
		/* 取出点回复时的用户名 */
		//srcUser =  srcUser.childNodes[0].childNodes[0].childNodes[0].childNodes[1].childNodes[0];
		//srcUser = "&nbsp;@"+srcUser.innerHTML+"&nbsp;&nbsp;"
	}

	/* 点回复时显示原来的回复窗口 */
	function reXianShi1(srcObj) {

		var divObj = document.getElementById("huifu");
		divObj.style.visibility = "visible";
		/* 如果是最后一个状态就点设置回复窗口在上面显示 */

		divObj.style.top = (event.y - hfObj.parentNode.offsetHeight) + "px";
		divObj.style.left = "40%";

	}

	/* 点击回复时，将回复写入窗口 */
	function submitRstate() {
		var txtObj = document.getElementById("ta1");
		txtObj.value = trim(txtObj.value);
		if (txtObj.value.length > 0) {
			var str = changetxt(txtObj.value);//替换文本框中的表情
			var time = inittime();//取出当前时间
			var innerht = "<div class='stateRshow'><div class='stateRshowWord'><table width='720px' border='0' cellpadding='0' cellspacing='0' class='stateTable'><tr><td width='70' align='center' valign='top'><a href='#'><img src='images/MainRightFirstLineTitle.gif' alt='' width='48' height='48' /></a></td><td width='310' ><a href='#'>DarkDemon</a><img src='images/1.gif' align='absmiddle' style='border:none;' />"
					+ srcUser
					+ str
					+ "</td></tr></table></div><div class='stateRimgShow'></div><div class='stateRshowtime'> "
					+ time
					+ " </div><div class='stateOp'><a onclick='reXianShi(this)' class='opState'>回复</a><a class='opState'>转发</a><a class='opState' onclick='delState(this)'>删除</a></div></div>";
			var divObj = document.getElementById("mainBannerContent");
			hfObj.innerHTML = innerht + hfObj.innerHTML;
		}
		txtObj.value = "";//清空文本框
		changeDivHeight();
		var divObj = document.getElementById("recieve");
		divObj.style.visibility = "hidden";//发布成功之后清空文本框并隐藏
	}

	function jumpresult(srcObj) {
		var um_id = $(srcObj).parent().prev().text();

		layer.open({
			type : 2,
			title : '精彩评论。',
			shadeClose : true,
			offset : [ '200px', '666px' ],
			shade : false,
			maxmin : true, //开启最大化最小化按钮
			area : [ '600px', '650px' ],
			//content : 'usercenter/userindexresult.jsp?um_id=' + um_id
			content : '/SSH2_MLJYJ/usercenter/userStatus_goresultui.action'
		});
	}
</script>
</head>

<body id="totop">
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
				<li><a href='<s:property value="goui"/>'>修改资料</a>
				</li>
				<li><a href="#">创建家谱</a> <s:url action="userStatus_index"
						namespace="/usercenter" var="index" />
				<li><a href='<s:property value="index"/>'>个人中心</a>
				</li>
			</ul>
		</div>
		<div class="rights">
			<div class="container">
				<font color="red" class="msg"><s:property value="#message" /><br />
				</font>


				<div id="container">
					<s:form action="userStatus_Save" namespace="/usercenter"
						method="post">
						<table>
							<tr>
								<td align="left">心情寄语：</td>
								<td><div style="float:right;">
										您还可以输入<font id="counter1">140</font>字！
									</div></td>
							</tr>
							<tr>
								<td colspan="2"><s:textarea name="usst.instr" rows="4"
										class="Size" id="textfield2"
										onkeyup="calNum(this,counter1,0) "
										style="overflow:hidden;border:1px #0CF solid;width:800px; "></s:textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right"><input type="submit"
									style=" heigh:38px; width:60px; background-color:#3295E6; border:none"
									value="发布" /></td>
							</tr>
						</table>

					</s:form>

				</div>

				<div class="inline pull-right page">
					共
					<s:property value="pageBean.allRow" />
					条记录 共
					<s:property value="pageBean.totalPage" />
					页 当前第
					<s:property value="pageBean.currentPage" />
					页

					<s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页
        </s:if>
					<s:else>
						<a href="userStatus_index?page=1">第一页</a>
						<a
							href="userStatus_index?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
					</s:else>
					<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
						<a
							href="userStatus_index?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
						<a
							href="userStatus_index?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
					</s:if>
					<s:else>
            下一页 最后一页
        </s:else>
				</div>
				<BR>
				<div id="mainBannerContent">
					<s:iterator value="pageBean.list">
						<!--个人展示-->
						<div class="stateShow" onmouseover="stateMouseOver(this)"
							onmouseout="stateMouseOut(this)"
							style="border-bottom:1PX;border-color:#CCC"">
							<div class="stateShowWord">
								<table width="450" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="70" align="left" style=" color:red;" valign="top"><s:property
												value="ust_um_id" />:</td>

										<td><s:property value="instr" /></td>
									</tr>

									<tr>
										<td></td>
										<td colspan="2" align="right" height="40"><s:property
												value="time" /> <a class="opState"
											onclick="reXianShi(this)">评论</a> <s:url
												action="userStatus_goresultui" namespace="/usercenter"
												var="rsurl">
												<s:param name="ust_id" value="ust_id" />
											</s:url> <a class="opState" id="resultifam"
											onclick="jumpresult(this)">查看评论</a> <s:url
												action="userStatus_del" namespace="/usercenter" var="delurl">
												<s:param name="ust_id" value="ust_id" />
											</s:url> <a class="opState" href='<s:property value="delurl"/>'>赞</a>
										<s:property value="acceptgood" /></td>
									</tr>
								</table>
							</div>

						</div>
						<!--个人展示结束-->
						<BR>
					</s:iterator>
				</div>




				<div id="recieve">
					<div id="ff" style="float:left;">
						<font style="font-size:16px; color:#FDFDFD">&nbsp;&nbsp;&nbsp;&nbsp;评&nbsp;&nbsp;论</font>
					</div>
					<div id="left"
						style="float:right; margin-top:10px; color:#FFF; margin-right:10px;">
						您还有可以输入<font id="counter2" color="#ffffff">140</font>字！&nbsp;&nbsp;&nbsp;<img
							src="images/hongcha1.gif" alt="" width="14" height="13"
							align="absmiddle" title="" onclick="windowClose()" />
					</div>
					<br />
					<div id="wt">
						<s:form action="userStatus_Savers" namespace="/usercenter"
							method="post">
							<s:hidden id="rs_id" name="ussc.usc_ust_id" value=""></s:hidden>
							<s:textarea name="ussc.str" cols="" rows="" id="ta1"
								onkeyup="calNum(this,counter2,1)"
								style="overflow:hidden;border:1px #0CF solid;">
							</s:textarea>
							<br />
							<div
								style="float:right; margin-right:25px; margin-top:7px; text-align:right;">

								<input name="" type="submit" value=" 评论 " id="sub1"
									onclick="submitRstate()" />

							</div>
						</s:form>
					</div>
					<!-- 回复DIV 结束 -->
				</div>

				<!--总容器 container结束-->


			</div>
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
					src="images/weixin.png" border="none" width="36" height="33" /> </a> <a
					href="http://weibo.com/u/5592645081" target="_blank" rel="nofollow"
					title="家印记官方微博" class="wb"><img src="images/weibo.png"
					border="none" width="40" height="33" /> </a> <a
					href="http://wpa.qq.com/msgrd?v=3&uin=800018109&site=qq&menu=yes"
					target="_blank"><img src="images/qq.png" border="none"
					width="30" height="32" /> </a>
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