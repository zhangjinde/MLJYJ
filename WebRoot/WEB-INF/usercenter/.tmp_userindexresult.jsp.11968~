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
<script language="javascript" src="js/jquery-1.9.1.min.js"></script>
<sx:head />
<style type="text/css">

<!--
*{ margin:0; padding:0;}
ul,li{ list-style-type:none;}
body{ font-size:13px; background-color:#999999;}
#con{ width:580px; height:900px; margin:10px auto; position:relative; border:1px #666 solid; background-color:#FFFFFF; 
overflow:hidden;}
#con ul{ position:absolute; margin:10px; top:0; left:0; padding:0;}
#con ul li{ width:100%;  border-bottom:1px #333333 dotted; padding:20px 0; overflow: }
#con ul li a{ float:left;  border:1px #333333 solid; padding:2px;}
#con ul li p{ margin-left:68px;line-height:1.5;  padding:10px;}
 -->
</style>

<script language="javascript">



$(function(){

	
	var canshu=window.location.href.split("?")[1];
		var um_id=canshu.split("=")[1];
	$("#rs_id").val(um_id);
	var scrtime;
 	$("#con").hover(function(){
		clearInterval(scrtime);
	
	},function(){
	
	scrtime = setInterval(function(){
		var $ul = $("#con ul");
		var liHeight = $ul.find("li:last").height();
		$ul.animate({marginTop : liHeight+40 +"px"},1000,function(){
		
		$ul.find("li:last").prependTo($ul)
		$ul.find("li:first").hide();
		$ul.css({marginTop:0});
		$ul.find("li:first").fadeIn(1000);
		});	
	},3000);
	
	}).trigger("mouseleave");
	
	
	
	
});
</script>

</head>

<body>
<div id="con">
<!--<s:hidden id="rs_id" name="usc_um_id" value=""></s:hidden>-->
  <ul>
     <!-- <s:iterator value="resultui">-->
    <!--<li> <a href="#"><img src="http://tp3.sinaimg.cn/1696357270/50/1282628065/1" /><s:property value="usc_um_id"/></a>-->
      <!--  <p class="vright"><s:property value="str"/>-->
      <!--   </p>-->
   <!-- </li>-->
     <!-- </s:iterator>-->
     <li> <a href="#"><img src="http://tp3.sinaimg.cn/1696357270/50/1282628065/1" /></a>
        <p class="vright">第一最好不相见，如此便可不相恋。第二最好不相知，如此便可不相思。 </p>
    </li>
    <li> <a href="#"><img src="http://tp3.sinaimg.cn/1696357270/50/1282628065/1" /></a>
        <p class="vright">第一最好不相见，如此便可不相恋。第二最好不相知，如此便可不相思。
          第三最好不相伴，如此便可不相欠。第四最好不相惜，如此便可不相忆。 </p>
    </li>
    <li> <a href="#"><img src="http://tp3.sinaimg.cn/1696357270/50/1282628065/1" /></a>
        <p class="vright">第一最好不相见，如此便可不相恋。第二最好不相知，如此便可不相思。
          第三最好不相伴，如此便可不相欠。第四最好不相惜，如此便可不相忆。
          第五最好不相爱，如此便可不相弃。 第六最好不相对，如此便可不相会。 
          第七最好不相误，如此便可不相负。第八最好不相许，如此便可不相续。
        </p>
    </li>
    <li> <a href="#"><img src="http://tp3.sinaimg.cn/1696357270/50/1282628065/1" /></a>
        <p class="vright">第一最好不相见，如此便可不相恋。第二最好不相知，如此便可不相思。
          第三最好不相伴，如此便可不相欠。第四最好不相惜，如此便可不相忆。
          第五最好不相爱，如此便可不相弃。 第六最好不相对，如此便可不相会。 
          第七最好不相误，如此便可不相负。第八最好不相许，如此便可不相续。
          第九最好不相依，如此便可不相偎。第十最好不相遇，如此便可不相聚。
          但曾相见便相知，相见何如不见时。安得与君相诀绝，免教生死作相思。 </p>
    </li>
  
    
  </ul>
</div>
</body>
</html>