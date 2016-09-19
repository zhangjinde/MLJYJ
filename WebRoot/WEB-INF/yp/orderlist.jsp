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
    
    <title>预约订单列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" type="text/css" href="css/bCss/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bCss/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/bCss/style.css" />
<script type="text/javascript" src="js/bJs/jquery.js"></script>
<script type="text/javascript" src="js/bJs/jquery.sorted.js"></script>
<script type="text/javascript" src="js/bJs/bootstrap.js"></script>
<script type="text/javascript" src="js/bJs/ckform.js"></script>
<script type="text/javascript" src="js/bJs/common.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js">
        </script>
        <script src="layer/layer.js" type="text/javascript"></script>

<script language="javascript">
	function delcfm() {
		if (!confirm("确认要删除预约信息吗？")) {
			window.event.returnValue = false;
		}
	}
</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<font color="red" class="msg"><s:property value="#message" /><br />
	</font>
	
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
			<a href="yp/placeOrderAction_list?page=1">第一页</a>
			<a
				href="yp/placeOrderAction_list?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
		</s:else>
		<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
			<a
				href="yp/placeOrderAction_list?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
			<a
				href="yp/placeOrderAction_list?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
		</s:if>
		<s:else>
            下一页 最后一页
        </s:else>
	</div>
	
	<!-- executeResult="true"//处理结果包含到本页 -->
	<table width="100%" border="1"
		class="table table-bordered table-hover definewidth m10">
		<tr>
			<th>预约ID</th>
			<th>用户姓名</th>
			<th>联系方式</th>
			<th>摄影师</th>
			<th>化妆师</th>
			<th>时间</th>
			<th>状态</th>
			<th>处理</th>
			<th>删除</th>
		</tr>

		<s:iterator value="pageBean.list">
			<tr>
				<td><s:property value="id" /></td>
				<td><s:property value="user_name" /></td>
				<td><s:property value="tel" /></td>
				<td><s:property value="sy_name" /></td>
				<td><s:property value="hz_name"/></td>
				<td><s:property value="time" /></td>
           	<s:if test="ischeck==false">
           	<td>未处理</td></s:if>
           	<s:else><td>已处理</td></s:else>
           		
				<s:url action="placeOrderAction_del" namespace="/yp" var="delurl">
					<s:param name="id" value="id" />
				</s:url>
				<td><a href='javascript:void(0);' class="check">处理</a></td>
				</td>
				<td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a>
				</td>
			
			</tr>

		</s:iterator>

	</table>
	<script>
	$(".check").click(function(){
			layer.load(2);
			$check=$(this);
			var id=$(this).parent().parent().children().eq(0).text();
			$.post("yp/placeOrderAction_check.action",{id:id},function(data, textStatus){
				 if (textStatus == 'success') {
				 	if (data != null) {
				 			
							$check.parent().prev().text("已处理");
							layer.alert(data, {icon: 6});
							layer.closeAll('loading');
				 	}
				 }
				
			});
	});
	</script>
  </body>
</html>
