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
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>

	<link rel="stylesheet" type="text/css" href="css/wxdefault.css">

	<link rel="stylesheet" type="text/css" href="css/wxstyles.css">
    <link rel="stylesheet" type="text/css" href="css/wxlayout.css"/>
<style type="text/css">
	html,body{height:100%;}

/* 条目总体样式 */
.item {display: table; height: 60px; width: 100%;border-bottom: 1px solid #D2D2D2;}
.item .itemlogo , .item .itemshelf {display: table-cell; vertical-align: middle;}
 
.item .itemlogo {width: 60px;}
.item .itemlogo img  {margin-left: 10px;width: 40px;}
.item .itemshelf .shelfinfo01 {font-size: 20px;color: #525255;}

/* 条目特例 */
.login { height: 70px;border-bottom: 2px solid #3993CF;}
.login .itemlogo {width: 120px;}
.login .userlogo img {width: 120px;}
.login .itemshelf .shelfinfo01 {font-size: 60px;color: #525255;}
.login .itemshelf .shelfinfo02 {font-size: 60px;color: #525255;margin-top: 5px;}



.foottable { max-width:90%;margin: 0 auto; text-align:center;}
.weibtn {text-align:center; margin:0 auto;}
@media screen and (max-device-width: 480px) { 
	.item{
		width:100%;height: 12%
	}
	.loader{
	width:80%}
	
}
</style>
</head>
<%
  String city = request.getParameter("city");
  city = new String(city.getBytes("ISO-8859-1"), "UTF-8");
  String username = request.getParameter("username");
  username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
  String country = request.getParameter("country");
  country = new String(country.getBytes("ISO-8859-1"), "UTF-8");
  String sex = request.getParameter("sex");
  String openid = request.getParameter("openid");
  if(sex.equals("1")){
	  sex="男";
  }
  else{
	  sex="女";
  }
  String imgurl = request.getParameter("imgurl");
 
%>

<body>
<div style="font-size: 5em;text-align: center;">授权成功</div>
<div class="item login"  id="topbar">
	<div class="itemlogo userlogo"><img alt="head" src="<%=imgurl%>"   id="headimg"></div>
	<div class="itemshelf">
		<div class="shelfinfo02">微信信息</div>
	</div>
</div>

<div class="item" >
	<div class="itemlogo"></div>
	<div class="itemshelf">
		<div class="shelfinfo01" style="font-size: 3.5em;">用户昵称：<%=username%></div>
		
	</div>
</div>
<div class="item" >
	<div class="itemlogo"></div>
	<div class="itemshelf">
		<div class="shelfinfo01" style="font-size: 3.5em;">所在城市：<%=city%></div>
		
	</div>
</div>
<div class="item"  >
	<div class="itemlogo"></div>
	<div class="itemshelf">
		<div class="shelfinfo01" style="font-size: 3.5em;">性&nbsp;&nbsp;&nbsp;&nbsp;别：<%=sex%></div>
	</div>
</div>
<div class="item"  >
	<div class="itemlogo"></div>
	<div class="itemshelf">
		<div class="shelfinfo01" style="font-size: 3.5em;">国&nbsp;&nbsp;&nbsp;&nbsp;家：<%=country%></div>
	</div>
</div>
<p id="id" style="display: none"><%=openid%></p>

<s:hidden name="openid" value="" id="openid"/>

  <div class="item"  >
	<div class="itemlogo"></div>
	<div class="itemshelf">
		<div class="shelfinfo01" style="font-size: 3.5em;">真实姓名：<input type="text" name="" class="frm_input name"  id="name" style="width:50%;font-size:50px;height: 1.5em;"/></div>
       
	</div>
</div>  
                      
 <div class="item">
	<div class="itemlogo"></div>
	<div class="itemshelf">
		<div class="shelfinfo01" style="font-size: 3.5em;">手机号码：<input type="text" name="" class="frm_input tel" maxlength="11" id="tel" style="width:50%;font-size:50px;height: 1.5em;"/></div>
	</div>
</div>                       
<div class="loader">Loading...</div>
				<div  class="weibtn">	 <button id="go" type="button" class="login__submit" style="width:50%;height: 3em;margin-top: 10px;">绑 定</button></div>
					<div id="userinfo"></div>
            <div id="footer" class="foottable">
            
			
		</div><!-- // footer end -->
				
	<script src='js/stopExecutionOnTimeout.js?t=1'></script>
	<script>
	$().ready(function(){
		$(".loader").hide();
		$(".foottable").hide();
$("#openid").attr("value",$("#id").text());
		
		$("#go").click(function(){
			$("#userinfo").empty();
			if($.trim($("#tel").val())==""){
				layer.msg("请正确填写信息。");
		        return false;
		    }else{
		    	
		    	$.post("wxTextService_wxfinduser.action", {mobile:$.trim($("#tel").val()),openid:$("#openid").val(),name:$.trim($("#name").val())}, function(data, textStatus){
					if (textStatus == 'success') {
                        if (data != null) {
                        	if(data=="nohave"){
                        		$("#userinfo").text("您的档案不存在，无法为您提供绑定服务");
                        		$("#userinfo").attr("style","color:red;font-size:50px;");
                        		window.scroll(0,80);
                        	}
                        	else if(data=="nomacth"){
                        		$("#userinfo").text("信息存在，但与录入信息不匹配，请确认信息或联系客服");
                        		$("#userinfo").attr("style","color:red;font-size:50px;");
                        		window.scroll(0,80);
                        	}else if(data=="noopenid"){
								$("#userinfo").text("无法获取用户微信唯一标识,请尝试重新登陆微信进行绑定");
                        		$("#userinfo").attr("style","color:red;font-size:50px;");
                        		window.scroll(0,80);
							}else if(data=="alreadydo"){
								$("#userinfo").text("已绑定过");
                        		$("#userinfo").attr("style","color:red;font-size:50px;");
                        		window.scroll(0,80);
							}else if(data=="repeat"){
								$("#userinfo").text("该微信号已绑定过，不允许一微信绑定多个账号");
                        		$("#userinfo").attr("style","color:red;font-size:50px;");
                        		window.scroll(0,80);
							}
                        	else{
                        	var dataobj = eval("(" + data + ")");
                        	$table = $("<table></table>");
                        	$tr1=$("<tr></tr>");
                        	$th1=$("<th></th>");
                        	$th1.text("姓名");
                        	$th1.attr("width","33%");
                        	$th2=$("<th></th>");
                        	$th2.text("生日");
                        	$th2.attr("width","33%");
                        	$th3=$("<th></th>");
                        	$th3.text("电话");
                        	$th3.attr("width","33%");
                        	 //第一行数据
                        	$tr2= $("<tr></tr>");
                        	$td1= $("<td></td>");
                        	$td1.text(dataobj.uv_name);//用fastjson做这里无需dataobj[0]
                        	$td2= $("<td></td>");
                        	$td2.text(dataobj.birthday);
                        	$td3= $("<td></td>");
                        	$td3.text(dataobj.tel);
                        	
                        	
                        	//绑定
                        	 $tr1.append($th1);
                        	 $tr1.append($th2);
                        	 $tr1.append($th3);
                        	$tr2.append($td1);
                        	$tr2.append($td2);
                        	$tr2.append($td3);
                        	$table.append($tr1);
                        	$table.append($tr2);
                        	$table.attr("width","100%");
                        	$table.attr("border","1");
                        	$table.attr("style","text-align: center;");
                        	$table.attr("class","table1");
                        	
                        	$("#userinfo").append($table);
                        	//表2
                        	$table2 = $("<table></table>");
                        	$tr3=$("<tr></tr>");
                        	$th4=$("<th></th>");
                        	$th4.text("账号");
                        	$th4.attr("width","33%");
                        	$th5=$("<th></th>");
                        	$th5.text("密码");
                        	$th5.attr("width","33%");
                        	$th6=$("<th></th>");
                        	$th6.text("状态");
                        	$th6.attr("width","33%");
                        	$tr4= $("<tr></tr>");
                        	$td4= $("<td></td>");
                        	$td4.text(dataobj.account);
                        	$td5= $("<td></td>");
                        	$td5.text(dataobj.pwd);
                        	$td6= $("<td></td>");
                        	$td6.text("绑定成功");
                        	$td6.attr("style","color:green");
                        	$tr3.append($th4);
                        	$tr3.append($th5);
                        	$tr3.append($th6);
                        	$tr4.append($td4);
                        	$tr4.append($td5);
                        	$tr4.append($td6);
                        	$table2.append($tr3);
                        	$table2.append($tr4);
                        	$table2.attr("width","100%");
                        	$table2.attr("border","1");
                        	$table2.attr("style","text-align: center;");
                        	$table2.attr("class","table1");
                        	$("#userinfo").append($table2);
                        	window.scroll(0,380);
                        	}
                        	
                        }
                      
                    }
                    
                });
		    }
		});
});


	</script>
</body>