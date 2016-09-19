<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>收件箱</title>
   <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  	<link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../css/bCss/style.css" />
    <script type="text/javascript" src="../js/bJs/jquery.js"></script>
    <script type="text/javascript" src="../js/bJs/jquery.sorted.js"></script>
    <script type="text/javascript" src="../js/bJs/bootstrap.js"></script>
    <script type="text/javascript" src="../js/bJs/ckform.js"></script>
    <script type="text/javascript" src="../js/bJs/common.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
    <script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
        }
        function selectall() {
		var mycheckbox=document.getElementById('all');
		var checkboxs=document.getElementsByName('accept');
		if(checkboxs.length>0){
			for(var i=0;i<checkboxs.length;i++)
			{
				checkboxs[i].checked=mycheckbox.checked;
			}
		}
	}
    
</script>
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
            <a href="sILActionAcceptList?page=1">第一页</a>
            <a href="sILActionAcceptList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="sILActionAcceptList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="sILActionAcceptList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else></div>
         <s:form action="sILAction_delaccept" namespace="/sil" method="post">
   <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   <tr>
   <td><input type="submit" value="删除选中" class="btn btn-success" style="margin-left: 25px;"></td>
   <td><button type="button" class="btn btn-success" id="addnew" style="margin-left: 25px;">写信</button>
   <script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/sil/sILAction_writeUI.action";
		 });


    });
    </script>
   </td>
   
   </tr>
   
   <tr>
   <th width="12%">全选<input type="checkbox" name="all" id="all" onclick="selectall()"></th>
   <th>标题</th>
   <th>来自</th>
   <th>查看</th>
   <th>删除</th>
   </tr>
  <s:iterator value="pageBean.list">
  <tr>
  			<td><input type="checkbox" name="accept" value='<s:property value="sil_id"/>'></td>
           <s:if test="isread==0">
            <td><font style="font-weight:bold;"><s:property value="sil_title"/></font></td></s:if>
            <s:else><td><s:property value="sil_title"/></td></s:else>
            <td><s:property value="sil_user_send"/></td>
            <s:url action="sILAction_findaccept" namespace="/sil" var="findurl">
             <s:param name="sil_id" value="sil_id"/>
            </s:url>
            <td><a href='<s:property value="findurl"/>'>查看</a></td>
            <s:url action="sILAction_delaccept" namespace="/sil" var="delurl">
             <s:param name="sil_id" value="sil_id"/>
            </s:url>
            <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
            </tr>
        </s:iterator>
        </table>
        </s:form>
  </body>
</html>
