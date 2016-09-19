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
<title>家庭消费列表</title>
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
	
	<button type="button" class="btn btn-success" id="addnew">添加消费</button>
	<script>


    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/family/familyAction_addxfUI.action?family_id=${family_id}";
		 });
	
    });
</script>
  <div class="inline pull-right page">共<s:property value="pageBean.allRow"/> 条记录
        共<s:property value="pageBean.totalPage"/> 页
        当前第<s:property value="pageBean.currentPage"/>页
        
        <s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页
        </s:if>
        <s:else>
         <s:url action="familyAction_xflist" namespace="/family" var="list"></s:url>
            <a href="<s:property value="list"/>?page=1">第一页</a>
            <a href="<s:property value="list"/>?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="<s:property value="list"/>?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="<s:property value="list"/>?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else></div>
	<table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
	<tr>
	<th>消费项目</th>
	<th>消费金额</th>
	<th>消费备注</th>
	<th>修改</th>
	<th>删除</th>
	</tr>
	<s:iterator value="pageBean.list">
	<tr>
		<s:hidden value="xf_id"/>
		<td><s:property value="xf_project"/></td>
		<td><s:property value="xf_money"/></td>
		<td><s:property value="xf_other"/></td>
		 <s:url action="familyAction_delxf" namespace="/family" var="delxf">
             <s:param name="xf_id" value="xf_id"/>
            </s:url>
            <s:url action="familyAction_updatexfUI" namespace="/family" var="updatexfUI">
              <s:param name="xf_id" value="xf_id"/>
            </s:url>
 			<td><a href='<s:property value="updatexfUI"/>'>修改</a></td>
            <td><a href='<s:property value="delxf"/>' onClick="delcfm()">删除</a></td>
</tr>
	</s:iterator>
	</table>
<br/>
</body>
</html>
