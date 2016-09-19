<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
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
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
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


    </style>
    
    <title>商城订单列表</title>
  
  </head>
  
  <body>
  
  <font color="red"><s:property value="#message"/><br/></font>
   <div class="inline pull-right page">共<s:property value="pageBean.allRow"/> 条记录
        共<s:property value="pageBean.totalPage"/> 页
        当前第<s:property value="pageBean.currentPage"/>页
        
        <s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页
        </s:if>
        <s:else>
            <a href="backorder/backOrderList?page=1">第一页</a>
            <a href="backorder/backOrderList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="backorder/backOrderList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="backorder/backOrderList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else></div>
   <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   <tr>
   	<th>订单编号</th>
   	<th>订单名称</th>
   	<th>订单价格</th>
   	<th>用户姓名</th>
   	<th>用户手机</th>
   	<th>备注</th>
   	<th>是否支付</th>
   	<th>是否处理</th>
   	<th>处理</th>
   	<th>删除</th>
   	
   </tr>
  <s:iterator value="pageBean.list">
  <tr>
  			<td style="display:none;"><s:property value="id"/></td>
            <td><s:property value="ordernum"/></td>
            <td><s:property value="ordername"/></td>
            <td><s:property value="ordermoney"/></td>
            <td><s:property value="order_username"/></td>
            <td><s:property value="order_usertel"/></td>
            <td><s:property value="orderinfo"/></td>
           	<s:if test="ispay==false">
           	<td>未支付</td></s:if>
           	<s:else><td>完成支付</td></s:else>
           	<s:if test="ischeck==false">
           	<td>未处理</td></s:if>
           	<s:else><td>已处理</td></s:else>
            <td><a href='javascript:void(0);' class="check">处理</a></td>
            <td><a href='javascript:void(0);' class="del">删除</a></td>
            </tr>
        </s:iterator>
        </table>
      <script>
      	$(".check").click(function(){
			//$(this).parent().parent().children().eq(0).text()----得到id
			var $check=$(this);
			$.post("backorder/backOrder_check.action",{id:$(this).parent().parent().children().eq(0).text()},function(date, textStatus){
				 if (textStatus == 'success') {
				 	if (date != null) {
				 			//$(this).parent().prev().text("已处理");
							$check.parent().prev().text("已处理");
							
				 	}
				 }
				
			});
		});
		 $(".del").click(function(){
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
		else{
			var $del=$(this);
			$.post("backorder/backOrder_del.action",{id:$(this).parent().parent().children().eq(0).text()},function(date, textStatus){
				 if (textStatus == 'success') {
				 	if (date != null) {
							$del.parent().parent().remove();
							
				 	}
				 }
				
			});
			
		}
    });
      </script>
        
  </body>
</html>