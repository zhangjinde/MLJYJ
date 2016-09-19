<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>积分</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
     <link rel="stylesheet" type="text/css" href="css/bCss/bootstrap.css" />
     <script type="text/javascript" src="layer/layer.js"></script>
     <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
  用户积分信息：<br/>
 <div id="um_id"> 用户ID：<span><s:property value="um_id"/></span></div>
  用户姓名：<s:property value="username"/><br/>
   <div id="jf"> 用户积分：<span><s:property value="jf"/></span></div>
    <div id="alter"></div>
    <button class="btn btn-primary" id="changejf">修改积分</button>
    
    <script>
	$("#changejf").click(function(){
				
				$input = $("<input></input>");
                $input.attr("type", "text");
                $input.attr("id", "intjf");
                $input.attr("value", $("#jf span").text());
                $input.attr("style", "width:50px;");
                $("#alter").append($input);
                $button=$("<input></input>");
                $button.attr("type", "button");
                $button.attr("value", "确认");
                $button.attr("class", "btn btn-primary");
                $button.attr("id", "check");
                $button.attr("onclick", "check()");
                $("#alter").append($button);
				$("#changejf").attr("style","display:none");
	});
	function check(){
		$.post("user/userAction_changejf.action", {um_id:$("#um_id span").text(),jf:$("#intjf").val()}, function(date, textStatus){
                            if (textStatus == 'success') {
                                if (date != null) {
                                			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                                			parent.layer.msg('修改成功');
    										parent.layer.close(index);
                                		}
                                	}
                                });
	}
</script>
  </body>
</html>
