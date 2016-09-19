<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<head>
<base href="<%=basePath%>">
<script src="js/jquery-1.8.3.min.js" type="text/javascript">
</script>
<link href="css/treeindex.css" rel="stylesheet" type="text/css" />
<link href="css/buttons/buttons.css" rel="stylesheet" type="text/css" />
  <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.autocomplete.js" type="text/javascript">
</script>
<script src="layer/layer.js" type="text/javascript">
</script>

    <script src="zrender/asset/js/esl/esl.js"></script>
	<link href="zrender/asset/css/bootstrap.css" rel="stylesheet">
    <link href="zrender/asset/css/bootstrap-responsive.css" rel="stylesheet">
<meta charset="utf-8">
<title>家印记圈子</title>

</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div style="position:relative">
	<div id="main"></div>
	<div id="zmain"></div>
	</div>
	<!-- ECharts单文件引入 -->
	
	<script src="js/echarts/echarts.js" type="text/javascript">
	</script>
	<script src="js/tree.js" type="text/javascript">
	</script>
	<div class="selectinfo" style="display:none;">
		<div class="topinfo">
			<div class="bkg-person-info">
				<a href="javascript:void(0)" id="uploadhead"><img id="head">
				</a> <label id="headrem" style="display:none;"> </label> <label id="uid"
					style="display:none;"> </label>
			</div>
			<div class="bkg-person-description" style="margin-top: 20px;">
				<p style="margin-top: 5px;">
					<!--简介-->
					<span style="color:#3385ff;font-size:22px;" id="username"></span> <br />
					性别：<span id="sex"></span> <br />
				</p>
			</div>
		</div>
		<div class="bkg-sidebar-content">
			<div id="btns">
				<button id="edit" title="记录心情日志"></button>
			</div>
		</div>
		<div id="list" style="margin-top: 30px;margin-left: 10px;"></div>
		<div class="bkg-sidebar-close" id="closelayer" title="关闭"></div>
		<div class="releation">
			<button class="button button-primary button-circle button-small"
				title="添加关系/绑定关系" id="releation">
				<i class="fa fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="editui" style="display:none;text-align: center;z-index:5;">
		<div style="margin-top: 20px;">
			标题：
			<s:textfield id="title"></s:textfield>
			<br />
			<br /> 内容：
			<s:textarea id="content"></s:textarea>
			<br /> <a href="javascript:void(0);"
				class="button button-glow button-border button-rounded button-primary"
				id="editdo">记录</a>
		</div>
	</div>
	<div class="addreleation" style="display:none;text-align: left;z-index:5;">
		关系:&nbsp&nbsp&nbsp&nbsp&nbsp
		<s:textfield id="r_label" placeholder="如舅舅，舅妈，伯父，爷爷等。"></s:textfield>
		<br /> 姓名：&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" id="r_uname" placeholder="（定义测试中）"><br />
		联系方式：
		<s:textfield id="r_tel" placeholder="通讯录匹配暂不开放"></s:textfield>
		<br /> 对他印象：
		<s:textarea id="r_eval"></s:textarea>
		<br /> 绑定用户：
		<s:label id="realman"></s:label><a href="javascript:void(0);" class="button button-rounded button-tiny" id="clearbtn" title='手误点选了推荐用户点我'>清除绑定</a><br/>
		分组：
		<s:select list="#{1:'家人',2:'朋友'}" listKey="key" listValue="value"
			headerKey="0" headerValue="选择" id="r_whichgroup"></s:select>
		<a href="javascript:void(0);"
			class="button button-primary button-rounded button-small" id="addrel">提交</a>
	</div>
	
	<div class="userthings" style="z-index:3;">
		<div class="usertitle">用户相册列表</div>
		<div class="userpalist">
		<s:iterator value="list" status="st" var="p">
                    	<span style="display:none;"><s:property value="pa_id"/></span>
                    	<span class='info-title'><span class='name'><span><s:property value="#p.pa_name"/><br/></span></span></span></span>
                        <a href='javascript:void(0)' class='list'><!-- 如果加上target='_blank'则打开新窗口 -->
                        <s:if test="#p.pa_url==null"><img src='images/xcpic1.jpg' alt=''/><br/></s:if>
                        <s:else><img src='<s:property value="#p.pa_url"/>' alt='' /><br/></s:else>
                        </a>
                        </s:iterator>
		
		</div>
	</div>

</body>
