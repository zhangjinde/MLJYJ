<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<!-- 表格样式 -->
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
		#familypwd{
			margin-left: 30px;
		}

    </style>
    
    <title>家庭列表</title>
    <script language="javascript">
    function delcfm() {
        if (!confirm("确认要删除？删除家庭将删除家庭相关所有资料，慎用")) {
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
    	var user=document.getElementById("familypwd").value;
    	alert
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
   <s:form class="form-inline definewidth m20"
		action="searchAction_family" method="post" namespace="/search" onsubmit="return sbtn()">

		<input type="text" name="familypwd" id="familypwd"
			class="abc input-default" placeholder="爱情密码/孩子姓名" value="">&nbsp;&nbsp;  
			<input type="radio" name="searchtype" value="爱情密码" class="radio"/>爱情密码
    	<input type="radio" name="searchtype" value="孩子姓名" class="radio"/>孩子姓名
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
 <button type="button" class="btn btn-success" id="addnew">添加家庭</button>
 </s:form>
   <script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/SSH2_MLJYJ/family/familyAction_addUI.action";
		 });


    });
    </script>
  
  <table width="100%" border="1" class="table table-bordered table-hover definewidth m10">
  <tr>
  		<th>家庭地址</th>
  		<th>家庭电话</th>
  		<th>家庭密码</th>
  		<th>家庭消费</th>
  		<th>结婚日期</th>
  		<th>家庭介绍</th>
  		<th>修改</th>
  		<th>删除</th>
  		<th>查看家庭成员</th>
  		<th>添加成员账号</th>
  		<th>添加孩子信息</th>
  		<th>消费管理</th>
  </tr>
  
  <s:iterator value="list_family">
    <tr>
           <td> <s:property value="family_address"/></td>
           <td> <s:property value="home_phone"/></td>
           <td> <s:property value="lovepwd"/></td>
            <td><s:property value="consumption"/></td>
           <td> <s:property value="marrydate"/></td>
            <td><s:property value="home_instructions"/></td>
            <s:hidden value="family_studio"/>
           
            <s:url action="familyAction_del" namespace="/family" var="delurl">
             <s:param name="family_id" value="family_id"/>
            </s:url>
            <s:url action="familyAction_update" namespace="/family" var="updateurl">
              <s:param name="family_id" value="family_id"/>
            </s:url>
            <s:url action="familyAction_adduserUI" namespace="/family" var="adduser">
              <s:param name="family_id" value="family_id"/>
            </s:url>
             <s:url action="familyAction_getusers" namespace="/family" var="getusers">
              <s:param name="family_id" value="family_id"/>
            </s:url>
             <s:url action="familyAction_addchild" namespace="/family" var="addchild">
              <s:param name="family_id" value="family_id"/>
            </s:url>
            <s:url action="familyAction_xflist" namespace="/family" var="xflist">
              <s:param name="family_id" value="family_id"/>
            </s:url>
           <td> <a href='<s:property value="updateurl"/>'>修改</a></td>
             <td><a href='<s:property value="delurl"/>' onClick="delcfm()">删除</a></td>
             <td><a href='<s:property value="getusers"/>'>查看家庭成员</a></td>
            <td><a href='<s:property value="adduser"/>'>添加成员账号</a></td>
            <td><a href='<s:property value="addchild"/>'>添加孩子信息</a></td>
            <td><a href='<s:property value="xflist"/>'>消费管理</a></td>
            </tr>
           
        </s:iterator>
        
        </table>
        
        
  </body>
</html>
