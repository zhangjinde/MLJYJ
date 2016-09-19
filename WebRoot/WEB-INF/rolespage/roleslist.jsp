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
    
    <title>角色列表</title>
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
   <button type="button" class="btn btn-success" id="addnew" style="margin-left: 25px;">添加角色</button>
   <script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/roles/rolesAction_addUI.action";
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
            <a href="rolesActionList?page=1">第一页</a>
            <a href="rolesActionList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="rolesActionList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="rolesActionList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else></div>
  <s:action name="rolesActionList" namespace="/roles"></s:action><!-- executeResult="true"//处理结果包含到本页 -->
   <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   <tr>
   	<th>角色名</th>
   	<th>角色描述</th>
   	<th>修改与赋权</th>
   	<th>删除</th>
   </tr>
  <s:iterator value="pageBean.list">
  <tr>
            <td><s:property value="role_name"/></td>
           <td> <s:property value="role_instructions"/></td>
            <s:url action="rolesAction_del" namespace="/roles" var="delurl">
             <s:param name="role_id" value="role_id"/>
            </s:url>
            <s:url action="rolesAction_update" namespace="/roles" var="updateurl">
              <s:param name="role_id" value="role_id"/>
            </s:url>
            <td><a href='<s:property value="updateurl"/>'>修改与赋权</a></td>
            <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
            </tr>
        </s:iterator>
        </table>
      
        
  </body>
</html>
