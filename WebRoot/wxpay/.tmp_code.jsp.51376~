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

<title>code</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.9.1.min.js">
        </script>
<script src="layer/layer.js" type="text/javascript"></script>

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	$().ready(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引;
		});
	</script>
	<style type="text/css">
		div{text-align: center;
			
		}
	</style>
	</head>
	
<body>
<div>
   <p> 订单编号：<s:property value="ordernum"/></p>
    <p>订单金额:<s:property value="ordermoney"/></p>
    
    <s:url action="makeCode" namespace="/order" var="makecode">
					<s:param name="code_url" value="code_url" />
				</s:url>
				<p>请使用微信扫描完成支付，完成后客服会主动联系您</p>
				<p>客服热线：0513-83121890</p>
  	<p><img alt="微信二维码" src='<s:property value="makecode"/>'/></p>
	</body>
  </div>
</html>

