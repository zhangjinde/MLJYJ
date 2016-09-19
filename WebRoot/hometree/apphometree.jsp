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
    
    <title>家印记圈子</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script src="zrender/asset/js/jquery.js"></script>
<link href="css/buttons/buttons.css" rel="stylesheet" type="text/css" />
<link href="css/treeindex.css" rel="stylesheet" type="text/css"/>
  <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.autocomplete.js" type="text/javascript">
</script>
<script src="layer/layer.js" type="text/javascript">
</script>

    <script src="zrender/asset/js/esl/esl.js"></script>
	<link href="zrender/asset/css/bootstrap.css" rel="stylesheet">
    <link href="zrender/asset/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="zrender/src/zrender.js"></script>
	<link href="css/video-js.min.css" rel="stylesheet">
	<script src="js/video.min.js"></script>
  </head>
  
  <body>
    <div id="main"></div>
    
    <div class="simpleinfo" id="simpleinfo">
    	<span id=simple_name></span>
    	<img alt="" src="" id="simplehead">
    </div>
    <button class="button button-glow button-border button-rounded button-primary" style="width:30px;padding:0px;" id="showbtn">详细</button>
    <div id="userinfos">
    <div class="selectinfo" id="selectinfo">
		<div class="topinfo">
			<div class="bkg-person-info">
				<a href="javascript:void(0)" id="uploadhead"><img id="head">
				<span>更换头像</span>
				</a> <label id="headrem" style="display:none;"> </label> <label id="uid"
					style="display:none;"> </label>
			</div>
		</div>
		<ul class="tabs">
<li>
<input type="radio" name="tabs" id="tab1" checked />
<label for="tab1">视频列表</label>
<div id="tab-content1" class="tab-content">
<div id="videolist"></div>
</div>
</li>

<li>
<input type="radio" name="tabs" id="tab2" />
<label for="tab2">相册列表</label>
<div id="tab-content2" class="tab-content">
<p>相册列表(权限未开放)</p>
</div>
</li>
</ul>
		
		
		
	</div>
	</div>
	<div class="releation">
			<button class="button button-primary button-circle button-small"
				title="添加关系/绑定关系" id="releation">
				<i class="fa fa-plus"></i>
			</button>
		</div>
    <script type="text/javascript" src="js/apptree.js"></script>
  </body>
</html>
