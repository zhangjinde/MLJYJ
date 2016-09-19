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
    function delchild() {
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
  <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
  <tr>
  <th>用户姓名</th>
  <th>用户账号</th>
  <th>用户角色</th>
  <th>修改用户资料</th>
  <th>删除用户</th>
  <th>用户相册</th>
  </tr>
  <s:iterator value="userlist">
  <tr>
            <s:hidden value="um_id"/>
           <td> <s:property value="uservice.uv_name"/></td>
            <td><s:property value="username"/></td>
            <td><s:property value="role.role_name"/></td>
            <s:url action="fuserAction_del" namespace="/family" var="delurl">
             <s:param name="um_id" value="um_id"/>
            </s:url>
            <s:url action="fuserAction_update" namespace="/family" var="updateurl">
              <s:param name="um_id" value="um_id"/>
            </s:url>
            <s:url action="fuserAction_addpa" namespace="/family" var="addpa">
              <s:param name="um_id" value="um_id"/>
            </s:url>
           
           <td><a href='<s:property value="updateurl"/>'>修改</a></td>
           <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
           <td><a href='<s:property value="addpa"/>'>用户相册</a></td>
            </tr>
        </s:iterator>
        </table>
        <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
        <tr><th>孩子姓名</th>
        <th>性别</th>
        <th>生日</th>
        <th>修改</th>
        <th>删除</th>
        </tr>
        <s:iterator value="childlist">
        <tr>
        	<td><s:property value="child_name"/></td>
        	<td><s:property value="child_gender"/></td>
        	<td><s:property value="child_birthday"/></td>
        	<s:url action="fuserAction_updatechild" namespace="/family" var="updatechild">
              <s:param name="child_id" value="child_id"/>
            </s:url>
            <s:url action="fuserAction_delchild" namespace="/family" var="delchild">
              <s:param name="child_id" value="child_id"/>
            </s:url>
        	<td><a href='<s:property value="updatechild"/>'>修改</a></td>
        	<td><a href='<s:property value="delchild"/>' onclick="delchild()">删除</a></td>
        	</tr>
        </s:iterator>
        </table>
        
  </body>
</html>
