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
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	 <link rel="stylesheet" type="text/css" href="css/bCss/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bCss/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/bCss/style.css" />
    <script type="text/javascript" src="js/bJs/jquery.js"></script>
    <script type="text/javascript" src="js/bJs/jquery.sorted.js"></script>
    <script type="text/javascript" src="js/bJs/bootstrap.js"></script>
    <script type="text/javascript" src="js/bJs/ckform.js"></script>
    <script type="text/javascript" src="js/bJs/common.js"></script>
 <style type="text/css">
 body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
		#studioname{
			margin-left: 30px;
		}
		.msg{
			margin-left: 30px;
		}
		#addnew{
			margin-left: 30px;
		}
</style>
<title>用户相册列表</title>
<script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<font color="red"><s:property value="#message"/><br/></font>
	
	<button type="button" class="btn btn-success" id="addnew">添加相册</button>
	<script>


    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/user/paAction_addpaUI.action";
		 });
	
    });
</script>
	<table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
	<tr>
	<th>相册名称</th>
	<th>相册描述</th>
	<th>相册问题</th>
	<th>相册答案</th>
	<th>相册分类</th>
	<th>修改相册资料</th>
	<th>删除相册</th>
	<th>添加相册照片</th>
	<th>编辑相册照片</th>
	</tr>
	<s:iterator value="palist">
	<tr>
		<s:hidden value="pa_id"/>
		<td><s:property value="pa_name"/></td>
		<td><s:property value="pa_instructions"/></td>
		<td><s:property value="pa_problem"/></td>
		<td><s:property value="pa_answer"/></td>
		<td><s:property value="pa_pac.pac_name"/></td>
		 <s:url action="paAction_del" namespace="/user" var="delurl">
             <s:param name="pa_id" value="pa_id"/>
            </s:url>
            <s:url action="paAction_update" namespace="/user" var="updateurl">
              <s:param name="pa_id" value="pa_id"/>
            </s:url>
			<s:url action="paAction_addpic" namespace="/user" var="addpic">
              <s:param name="pa_id" value="pa_id"/>
             
            </s:url>	
            <s:url action="allpicAction" namespace="/user" var="allpic">
              <s:param name="pa_id" value="pa_id"/>
            </s:url>
 			<td><a href='<s:property value="updateurl"/>'>修改</a></td>
            <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
            <td><a href='<s:property value="addpic"/>' >添加照片</a></td>
            <td><a href='<s:property value="allpic"/>' >编辑相册照片</a></td>
</tr>
	</s:iterator>
	</table>
<br/>
</body>
</html>
