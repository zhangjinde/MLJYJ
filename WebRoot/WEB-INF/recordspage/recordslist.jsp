<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>影楼列表</title>
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
    <script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
    function selectall() {
		var mycheckbox=document.getElementById('all');
		var checkboxs=document.getElementsByName('jilu');
		if(checkboxs.length>0){
			for(var i=0;i<checkboxs.length;i++)
			{
				checkboxs[i].checked=mycheckbox.checked;
			}
		}
	}
</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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
            <a href="recordsActionList?page=1">第一页</a>
            <a href="recordsActionList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="recordsActionList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="recordsActionList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else></div>
        <s:form action="recordsAction_del" namespace="/records" method="post">
   <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
   <tr><input type="submit" value="删除选中" class="btn btn-success" style="margin-left: 25px;"></tr>
   <tr>
   <th width="12%">全选<input type="checkbox" name="all" id="all" onclick="selectall()"></th>
   <th>操作影楼</th>
   <th>操作说明</th>
   <th>操作时间</th>
   <th>删除</th>
   </tr>
  <s:iterator value="pageBean.list">
  <tr>
  			<td><input type="checkbox" name="jilu" value='<s:property value="or_id"/>'></td>
            <td><s:property value="or_studio.studio_name"/></td>
            <td><s:property value="or_type"/></td>
            <td><s:property value="record_time"/></td>
            <s:url action="recordsAction_del" namespace="/records" var="delurl">
             <s:param name="or_id" value="or_id"/>
            </s:url>
            <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
            </tr>
        </s:iterator>
        </table>
        </s:form>
        
  </body>
</html>
