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
    
    <title>My JSP 'ceshi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
li{
	display: block;
width: 21px;
color: #f60;
position: relative;
float: left;
display: block;
font-size: 21px;
height: 21px;
line-height: 21px;
text-align: center;
margin: 0 2px;
border-radius: 1px;
border: 1px solid #e4e4e4;
overflow: hidden;
}
li.num{
background: #fff;

}
cite em{
	font: 16px/1.5 "\5FAE\8F6F\96C5\9ED1",Arial;
}
</style>
<script>
$().ready(function(){
	$("#click").click(function(){
		var num=$("#num").val();
		var yset=$(this).offset().top;
		$("em").each(function (index, domEle){
			if(num==$(this).attr("t")){
				var offset=$(this).offset();
				var ynew=offset.top;
				//cite的整体移动效果
				
				$("#cite").animate({top:-num*21});
				
			}
		});
	});
});

</script>
  </head>
  
  <body><div class="search_cart_wrap fr">
  	<ul>
  	<li class="num">
  		<cite id="cite" style="position: relative;">
  			<em t="0">0</em>
  			<em t="1">1</em>
  			<em t="2">2</em>
  			<em t="3">3</em>
  			<em t="4">4</em>
  			<em t="5">5</em>
  			<em t="6">6</em>
  			<em t="7">7</em>
  			<em t="8">8</em>
  			<em t="9">9</em>
  		</cite>
  	</li>
  	</ul>
  	</div>
    <s:textfield id="num"></s:textfield>
    <button id="click">点我</button>
  </body>
</html>
