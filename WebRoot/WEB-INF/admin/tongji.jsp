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

<title>全局统计</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script>
	$().ready(
			function() {
				$.get("studio/studioAction_studioforlist.action", function(
						data, textStatus) {
					if (textStatus == "success") {
						if (data != null) {
							var dataobj = eval("(" + data + ")");
							for ( var i = 0; i < dataobj.length; i++) {
								$option = $("<option></option>");
								$option.attr("value", dataobj[i].studio_id);
								$option.text(dataobj[i].studio_name);
								$("#studio").append($option);
							}
						}
					}
				});
				$("#query").click(function(){
					$("#total").text();
					$("#today").text();
					$("#mouth").text();
					$("#prevmouth").text();
					var sid=$("#studio").val();
					$.post("admin/adminAction_doquery",{sid:sid},function(data,textStatus){
						if(textStatus=="success"){
							var obj=eval("("+data+")");
							$("#total").text(obj.total);
							$("#today").text(obj.today);
							$("#mouth").text(obj.mouth);
							$("#prevmouth").text(obj.prevmouth);
						}
					});
				});
			});
</script>
</head>

<body>
	<div>
		<select name="studio" id="studio">
			<option value="">请选择</option>
		</select>
		<button id="query">查询</button>
	</div>
	<div>
		总计录入家庭：
		<span id="total"></span><br/>
		今日录入家庭：
		<span id="today"></span><br/>
		当月录入家庭：
		<span id="mouth"></span><br/>
		上月录入家庭：
		<span id="prevmouth"></span><br/>
	</div>
</body>
</html>
