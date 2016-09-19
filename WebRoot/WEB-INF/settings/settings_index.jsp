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
    
    <title>系统自定义设置页</title>
     <meta name="keywords" content="form">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" href="css/settings/amazeui.min.css"/>
  <link rel="stylesheet" href="css/settings/admin.css">
  
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="css/settings/amazeui.min.js"></script>
	<script src="css/settings/app.js"></script>
	<script src="layer/layer.js" type="text/javascript"></script>
	<script>
		//表单全部ajax处理
		function liclick(num){
			
				if(num==1){//推送
					$("#formnum").text("form1");
				}
				if(num==2){//其他
					$("#formnum").text("form2");
				}
			}
		$().ready(function(){
			//初始首页
			$.get("settings/settingsAction_getts",function(data,textStatus){
				if(textStatus=="success"){
					if(data!=null){
						var dataobj=eval("("+data+")");//如果用fastjson要eval("(["+data+"])")
						$("#tsone").val(dataobj[0].ts_one);
						$("#tstwo").val(dataobj[0].ts_two);
					}
				}
			});
			$.get("settings/settingsAction_getstudiourl",function(data,textStatus){
				if(textStatus=="success"){
					var dataobj=eval("("+data+")");
					$("#studiourl").val(dataobj[0].studiourl);
				}
			});
			$("#subbtn").click(function(){
			if($("#formnum").text()=="form1"){//表单1处的处理---推送
				$.post("settings/settingsAction_updatets",{tsone:$("#tsone").val(),tstwo:$("#tstwo").val()},function(data,textStatus){
					if(textStatus=="success"){
						if(data=="ok"){
							layer.msg("保存/更新成功");
						}
						if(data=="err"){
							layer.msg("系统错误请联系总部");
						}
					}
				});
			}
			if($("#formnum").text()=="form2"){//表单1处的处理---活动链接
				$.post("settings/settingsAction_saveorupdateurl",{studiourl:$("#studiourl").val()},function(data,textStatus){
					if(textStatus=="success"){
						if(data=="ok"){
							layer.msg("保存/更新成功");
						}
						if(data=="err"){
							layer.msg("系统错误请联系总部");
						}
					}
				});
			}	
			});
		});
		
	</script>
  </head>
  
  <body>
  	
    	<div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">影楼自定义设置</strong></div>
  </div>

  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs" id="tabul">
      <li class="am-active" onclick="liclick(1)"><a href="#tab1">推送</a></li>
      <li onclick="liclick(2)"><a href="#tab2" >活动链接</a></li>
    </ul>

    <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
        <div class="am-g am-margin-top">
        	<div>
         <img alt="tips" src="img/tips.jpg">
          </div>
          <div class="am-u-sm-8 am-u-md-10" style="padding-top: 10px;">
           	<input type="text" placeholder="自定义1" id="tsone"><br/><br/>
			<s:textarea placeholder="自定义2" id="tstwo"/>
          </div>
        </div>

      </div>

      <div class="am-tab-panel am-fade" id="tab2">
        <span style="color:red">请正确填写移动端网页地址，如有需求，可委托上海善智网络另行开发H5活动页面（低于市场价收费）。</span><br/>
        <span style="color:green">例：http://www.jyj.me</span><br/>
        	<input type="text" placeholder="自定义活动连接，http://开头" id="studiourl"><br/><br/>
        
      </div>

     

    </div>
  </div>

  <div class="am-margin">
    <button type="button" class="am-btn am-btn-primary am-btn-xs" id="subbtn">提交保存</button>
    <span style="display:none;" id="formnum">form1</span>
  </div>
</div>
  </body>
</html>
