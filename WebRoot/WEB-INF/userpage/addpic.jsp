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

<title>上传照片</title>
<style type="text/css">
body {
 font: 12px/16px Arial, Helvetica, sans-serif;
}
#fileQueue {
 width: 400px;
 height: 300px;
 overflow: auto;
 border: 1px solid #E5E5E5;
 margin-bottom: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文件上传演示</title>
<link href="css/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery1.6.1.js" ></script>
<script language="javascript"  src="js/swfupload.js"></script>
<script language="javascript"  src="js/jquery.uploadify.v2.1.0.min.js"></script>
  
    <script type="text/javascript"> 
    //IE内核
    function getfolder() {
    var fileinput = document.getElementById("fileInput");
    fileinput.select();fileinput.blur();
    document.getElementById("folder").value = document.selection.createRange().text;
    alert(document.getElementById("folder").value);
	}
     function showResult(){//删除显示的上传成功结果   
          $("#result").html("");   
        }   
    
    $(document).ready(function() {
        $('#fileInput').uploadify({
        
 		'uploader': 'js/swf/uploadify.swf',
        'script': 'uploadifyAction!uploadFile.action',   //指定服务端处理类的入口
        //'folder': 'uploadFile',
 		'cancelImg': 'images/cancel.png',
        'fileDataName': 'fileInput', //和input的name属性值保持一致就好，Struts2就能处理了   
        'scriptData':{'pa_id':$('#pa_id').val()},
        'queueID': 'fileQueue',   
        'auto': false,//是否选取文件后自动上传   
        'multi': true,//是否支持多文件上传
        'simUploadLimit' : 1,//每次最大上传文件数   
        'buttonText': 'Browse Files',//按钮上的文字   
        'displayData': 'percentage',//有speed和percentage两种，一个显示速度，一个显示完成百分比    
        'onComplete': function (event, queueID, fileObj, response, data){   
                   $("#result").html(response);//显示上传成功结果   可注释
                  setInterval("showResult()",2000);//两秒后删除显示的上传成功结果   可注释
                  
          } 
          
           
        });   
           
    });  

</script> 
<style>
	.btns {
	color: #fef4e9;
	background: #fa558f;
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
	-webkit-border-radius: .5em;
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
}

.btns:hover {
	text-decoration: none;
}

.btns:active {
	position: relative;
	top: 1px;
}
</style>
</head>

<body>
	
<s:if test="#session.role_id!=3">
<s:url action="paActionList" namespace="/user" var="backpa"/>
	<a href='<s:property value="backpa"/>'><h3>返回</h3></a><br/>
	</s:if>
	<table>
	<tr>
<td width="100%"><input type="file" name="fileInput" id="fileInput" />  &nbsp;&nbsp;&nbsp;&nbsp; 
<div>
<div style="display: inline;"><input type="hidden" name="pa_id" id="pa_id" value='<s:property value="pa_id"/>'/></div>
<div style="display: inline;"><a href="javascript:$('#fileInput').uploadifyUpload();" ><button class="btns">开始上传</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div style="display: inline;"><a href="javascript:$('#fileInput').uploadifyClearQueue();"><button class="btns">取消上传</button></a></td></tr></div>
</div>
照片上传大小限制3M以内
    <tr><div id="result"></div><!--显示结果-->   
       <div id="fileQueue"></div></tr>
       
</table>

</body>
</html>
