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
    <script type="text/javascript" src="../layer/layer.js"></script>
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
		#user{
			margin-left: 30px;
		}
		.msg{
			margin-left: 30px;
		}
		.radio{
			margin-left: 30px;
		}
    </style>
    <title>家庭列表</title>
    <script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
    function sbtn(){
    	var radio=document.getElementsByName("searchtype");
    	var str;
    	for(i=0;i<radio.length;i++){
    		if(radio.item(i).checked){
    			str=radio.item(i).getAttribute("value");
    			break;
    		}
    		else{
  				continue;
 				 }
    	}
    	var user=document.getElementById("user").value;
    	if(user==""){
    		alert("请输入搜索信息");
     		return false;
    	}
    	if(str==undefined){
    		 alert("请选择搜索类型");
     		return false;
    		
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
  <br/>
  <font color="red" class="msg"><s:property value="#message"/><br/></font>
 <s:form class="form-inline definewidth m20" action="searchAction_user" method="post" namespace="/search" onsubmit="return sbtn()">  
    	
    <input type="text" name="user" id="user"class="abc input-default" placeholder="用户账号/姓名/手机" value="">&nbsp;&nbsp;  
    
   
    	<input type="radio" name="searchtype" value="账号" class="radio"/>账号
    	<input type="radio" name="searchtype" value="姓名" class="radio"/>姓名
    	<input type="radio" name="searchtype" value="手机" class="radio"/>手机
    	<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
  </s:form>
 
   <div class="inline pull-right page">共<s:property value="pageBean.allRow"/> 条记录
        共<s:property value="pageBean.totalPage"/> 页
        当前第<s:property value="pageBean.currentPage"/>页
        
        <s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页
        </s:if>
        <s:else>
            <a href="userActionList?page=1">第一页</a>
            <a href="userActionList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
            <a href="userActionList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="userActionList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
        </s:if>
        <s:else>
        下一页 最后一页
        </s:else></div>
  <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
  <tr>
  <th>用户姓名</th>
  <th>用户账号</th>
  <th>用户角色</th>
  <th>积分管理</th>
  <th>查看家庭成员</th>
  <th>修改用户资料</th>
  <th>删除用户</th>
  <th>用户相册</th>
  </tr>
  <s:iterator value="pageBean.list">
  <tr>
            <s:hidden value="um_id"/>
            <td style="display:none" class="id"><s:property value="um_id"/></td>
           <td> <s:property value="uservice.uv_name"/></td>
            <td><s:property value="username"/></td>
            <td><s:property value="role.role_name"/></td>
            <s:url action="userAction_del" namespace="/user" var="delurl">
             <s:param name="um_id" value="um_id"/>
            </s:url>
            <s:url action="userAction_update" namespace="/user" var="updateurl">
              <s:param name="um_id" value="um_id"/>
            </s:url>
			<s:url action="userAction_utof" namespace="/user" var="utof">
              <s:param name="um_id" value="um_id"/>
            </s:url>
            <s:url action="userAction_addpa" namespace="/user" var="addpa">
              <s:param name="um_id" value="um_id"/>
            </s:url>
            <td><button class="btn btn-primary jf">积分管理</button></td>
            <td><a href='<s:property value="utof"/>'>查看家庭成员</a></td>
           <td><a href='<s:property value="updateurl"/>'>修改</a></td>
           <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
           <td><a href='<s:property value="addpa"/>'>用户相册</a></td>
            </tr>
        </s:iterator>
        </table>
        <script>
        	$(".jf").click(function(){
        		var id=$(this).parent().parent().children(".id").text();
        		layer.open({
   						 	type: 2,
    						area: ['300px', '200px'],
    						fix: true, //不固定
   							 maxmin: false,
   							 content: 'user/userAction_jf.action?um_id='+id
					});
        	});
        </script>
        
  </body>
</html>
