<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  	<link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/style.css" />
    <script type="text/javascript" src="../js/bJs/jquery.js"></script>
    <script type="text/javascript" src="../js/bJs/jquery.sorted.js"></script>
    <script type="text/javascript" src="../js/bJs/bootstrap.js"></script>
    <script type="text/javascript" src="../js/bJs/ckform.js"></script>
    <script type="text/javascript" src="../js/bJs/common.js"></script>
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
    
    <title>公告列表</title>
   <script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
</script>
  </head>
  
  <body>
  
  <font color="red"><s:property value="#message"/><br/></font>
   <button type="button" class="btn btn-success" id="addnew" style="margin-left: 25px;">添加公告</button>
   <script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/gonggao/ggAction_addUI.action";
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
            <a href="ggActionList?page=1">第一页</a>
            <a href="ggActionList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="ggActionList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="ggActionList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else></div>
   <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   <tr>
   	<th>公告标题</th>
   	
   	<th>状态</th>
   	<th>应用</th>
   	<th>修改</th>
   	<th>删除</th>
   </tr>
  <s:iterator value="pageBean.list">
  <tr>
            <td><s:property value="title"/></td>
           	<s:if test="ischeck==0">
           	<td>未启用</td></s:if>
           	<s:else><td>启用</td></s:else>
            <s:url action="ggAction_del" namespace="/gonggao" var="delurl">
             <s:param name="id" value="id"/>
            </s:url>
            <s:url action="ggAction_update" namespace="/gonggao" var="updateurl">
              <s:param name="id" value="id"/>
            </s:url>
            <s:url action="ggAction_use" namespace="/gonggao" var="use">
              <s:param name="id" value="id"/>
            </s:url>
            <td><a href='<s:property value="use"/>'>应用</a></td>
            <td><a href='<s:property value="updateurl"/>'>修改</a></td>
            <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
            </tr>
        </s:iterator>
        </table>
      
        
  </body>
</html>
