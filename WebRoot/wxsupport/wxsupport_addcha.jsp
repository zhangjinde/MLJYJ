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
    
    <title>添改相册描述</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/buttons/buttons.css">
<script src="layer/layer.js" type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#pastr{
		border:solid 1px #7B72E9; border-radius:20px; resize:none;
		width:80%;
		height:70%;
	}
</style>
<script>
	$().ready(function(){
		var index = parent.layer.getFrameIndex(window.name);
		var info=parent.$("#info").text();
		var canshu=window.location.href.split("?")[1];
		var oid=parent.$("#openid").text();
		var pid=canshu.split("=")[1];
		$("#pastr").text(info);
		$("#next").click(function(){
			$.post("wxSupport_pastr", { pastr: $("#pastr").val(), pid: pid,openid:oid },function(data,textStatus){
					     if(textStatus=="success"){
					    	 if(data!=null){
					    		 if(data=="ok"){
					    			 	parent.$('#info').text($('#pastr').val());
					    			    parent.layer.tips('描述更新成功', '#info', { style: ['background-color:#78BA32; color:#fff;font-size:2em;', '#78BA32'],maxWidth:500,time: 5000});
					    			    parent.layer.close(index);
					    		 }
					    		 else{
					    			 layer.msg('描述更新不成功');
					    		 }
					    	 }
					     }
					   });
		});
	});
	
</script>

  </head>
  
  <body>
    <div style="text-align: center;">
    	<s:textarea name="pastr" id="pastr" style="font-size:2em;"></s:textarea><br/>
    	<button class="button button-royal button-pill button-giant" id="next"><i class="fa fa-plus">添改</button>
	</div>
  </body>
</html>
