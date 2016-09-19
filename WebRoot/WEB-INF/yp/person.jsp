<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>摄影/化妆师设定</title>
    
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" type="text/css" href="css/bCss/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bCss/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/bCss/style.css" />
<script type="text/javascript" src="js/bJs/jquery.js"></script>
<script type="text/javascript" src="js/bJs/jquery.sorted.js"></script>
<script type="text/javascript" src="js/bJs/bootstrap.js"></script>
<script type="text/javascript" src="js/bJs/ckform.js"></script>
<script type="text/javascript" src="js/bJs/common.js"></script>
<script language="javascript">
	function delcfm() {
		if (!confirm("确认要删除员工资料吗？")) {
			window.event.returnValue = false;
		}
	}
</script>
<style type="text/css">
input{
	margin-left: 30px;
}
</style>
  </head>
  		
  <body>
  <s:action name="employeesActionList" namespace="/yp"></s:action>
   		<br />
	<font color="red" class="msg"><s:property value="#message" /><br />
	</font>
	<s:form class="form-inline definewidth m20"
		action="employeesAction_findbyname" method="post" namespace="/yp">

		<input type="text" name="familypwd" id="familypwd"
			class="abc input-default" placeholder="姓名" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
 <button type="button" class="btn btn-success" id="addnew">+摄影/化妆师</button>
	</s:form>
	<script>
		$(function() {

			$('#addnew')
					.click(
							function() {

								window.location.href = "/SSH2_MLJYJ/yp/employeesAction_eUI.action";
							});

		});
	</script>
	<div class="inline pull-right page">
		共
		<s:property value="pageBean.allRow" />
		条记录 共
		<s:property value="pageBean.totalPage" />
		页 当前第
		<s:property value="pageBean.currentPage" />
		页

		<s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页
        </s:if>
		<s:else>
			<a href="yp/employeesActionList?page=1">第一页</a>
			<a
				href="yp/employeesActionList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
		</s:else>
		<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
			<a
				href="yp/employeesActionList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
			<a
				href="yp/employeesActionList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
		</s:if>
		<s:else>
            下一页 最后一页
        </s:else>
	</div>
	
	<!-- executeResult="true"//处理结果包含到本页 -->
	<table width="100%" border="1"
		class="table table-bordered table-hover definewidth m10">
		<tr>
			<th>员工名字</th>
			<th>职业分工</th>
			<th>删除</th>
		</tr>

		<s:iterator value="pageBean.list">
			<tr>
				<td><s:property value="e_name" />
				</td>
				<td><s:property value="professional" />
				</td>
				

				<s:url action="employeesAction_del" namespace="/yp" var="delurl">
					<s:param name="e_id" value="e_id" />
				</s:url>
				
				</td>
				<td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a>
				</td>
			
			</tr>

		</s:iterator>

	</table>
  </body>
</html>
