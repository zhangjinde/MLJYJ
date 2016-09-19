<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>后台管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/main-min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
	<script>
var mh = 30;//最小高度
var step = 5;//每次变化的px量
var ms = 10;//每隔多久循环一次
function toggle(o){
  if (!o.tid)o.tid = "_" + Math.random() * 100;
  if (!window.toggler)window.toggler = {};
  if (!window.toggler[o.tid]){
    window.toggler[o.tid]={
      obj:o,
      maxHeight:o.scrollHeight+mh, //这里改动处
      minHeight:mh,
      timer:null,
       action:-1 //这里改动处
    };
  }
  o.style.height = o.offsetHeight + "px";
  if (window.toggler[o.tid].timer)clearTimeout(window.toggler[o.tid].timer);
  window.toggler[o.tid].action *= -1;
  window.toggler[o.tid].timer = setTimeout("anim('"+o.tid+"')",ms );
}
function anim(id){
  var t = window.toggler[id];
  var o = window.toggler[id].obj;
  if (t.action < 0){
    if (o.offsetHeight <= t.minHeight){
      clearTimeout(t.timer);
      return;
    }
  }
  else{
    if (o.offsetHeight >= t.maxHeight){
      clearTimeout(t.timer);
      return;
    }
  }
  o.style.height = (parseInt(o.style.height, 10) + t.action * step) + "px";
  window.toggler[id].timer = setTimeout("anim('"+id+"')",ms );
}
</script>
    <style type="text/css">
    .gg{
    	width:500px;
    	height:20px;
    	float:left;
    	margin-top:9px;
    	background-color: transparent;
    }
div.ranking{border:solid 1px;overflow:hidden; height:/*这里改动处*/30px;z-index:99;top:100px;position:absolute;float:right;right:20px;}
div.ranking h5{border:solid 1px;border-width:0 0 1px;padding:0;margin:0;height:30px;line-height:30px;cursor:pointer;background:#b2b2b2;}

    </style>
  
</head>
<body>

<div class="header">
	
    <div class="dl-title">
   		 家印记全球客户服务管理系统
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>
    <!-- 公告栏 -->
    <div class="gg">
    	<marquee onmousemove="stop()" onmouseout="start()"><font style="color:#fff;"><s:property value="%{#request.session.gg }"/></font></marquee>
    </div>
	昨日排名：
	<!-- 录入排名 -->
	<div class="ranking"><h5 onclick="toggle(this.parentNode)" id="rankhead"></h5>
			
	</div>
	<script>
		$.get("/SSH2_MLJYJ/admin/adminAction_studioranking",function(data,textStatus){
			if(textStatus=="success"){
				if(data!=null){
					
					var list=eval("("+data+")");
					$("#rankhead").text("排名："+list[0].num+"店名："+list[0].studioname+"建档数："+list[0].count);
					for(var i=1;i<list.length;i++){
						$pnode=$("<p></p>");
						$pnode.text("排名："+list[i].num+"店名："+list[i].studioname+"建档数："+list[i].count);
						$(".ranking").append($pnode);
					}
				}
				
			}
		});
	</script>
    
<!-- *************************************** -->
	<s:url action="cancelAction" namespace="/login" var="cancel"/>
	<s:url action="sILActionAcceptList" namespace="/sil" var="mail"/>
    <div class="dl-log"><a href='<s:property value="mail"/>' target="MainPage"><img src="../images/mail.png" width="25" height="12" onmouseover="this.src='../images/onmail.png'" onmouseout="this.src='../images/mail.png'"/></a>[<s:property value="#noreadmail"/>]欢迎管理员：<span class="dl-log-user"><s:property value="%{#request.session.usermain.username }"/></span><a href='<s:property value="cancel"/>' title="退出系统" class="dl-log-quit">[注销]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
        	<s:if test="#session.role_id==8">
        	<li class="nav-item dl-selected"><div class="nav-item-inner nav-home">查询统计</div></li>
        	</s:if>
        	<s:else>
        	<s:if test="#session.role_id==1">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">全局管理</div></li>
            </s:if>
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">影楼管理</div></li>
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">使用帮助</div></li>
			</s:else>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
		
    </ul>
</div>

<script type="text/javascript" src="../assets/js/bui-min.js"></script>
<script type="text/javascript" src="../assets/js/common/main-min.js"></script>
<script type="text/javascript" src="../assets/js/config-min.js"></script>
<script>
    BUI.use('common/main',function(){
    	var ul=document.getElementById("J_Nav");
    	var	lis=ul.getElementsByTagName("li");
    	if(lis.length==3){
        var config = [{id:'1',menu:[{text:'全局管理',items:[{id:'12',text:'影楼管理',href:'/SSH2_MLJYJ/studio/studioActionList.action'},{id:'3',text:'角色管理',href:'/SSH2_MLJYJ/roles/rolesActionList.action'},{id:'4',text:'权限管理',href:'/SSH2_MLJYJ/permissions/permissionsActionList.action'},{id:'6',text:'相册类型',href:'/SSH2_MLJYJ/photoAlbumClass/photoAlbumClassActionList.action'},{id:'10',text:'操作记录',href:'/SSH2_MLJYJ/records/recordsActionList.action'},{id:'8',text:'公告管理',href:'/SSH2_MLJYJ/gonggao/ggActionList.action'},{id:'12',text:'全局统计',href:'/SSH2_MLJYJ/admin/adminAction.action'},{id:'13',text:'订单管理',href:'/SSH2_MLJYJ/backorder/backOrderList.action'},{id:'19',text:'约拍管理',href:'/SSH2_MLJYJ/back/yp.jsp'},{id:'20',text:'总搜索',href:'/SSH2_MLJYJ/search/searchAction_admin'}]}]},{id:'7',menu:[{text:'影楼管理',items:[{id:'9',text:'家庭管理',href:'/SSH2_MLJYJ/family/familyActionList.action'},{id:'15',text:'用户管理',href:'/SSH2_MLJYJ/user/userActionList.action'},{id:'17',text:'收件箱',href:'/SSH2_MLJYJ/sil/sILActionAcceptList.action'},{id:'18',text:'今日提醒',href:'/SSH2_MLJYJ/remind/goRemindAction.action'},{id:'31',text:'个性设置',href:'/SSH2_MLJYJ/settings/settingsAction.action'}]}]},{id:'2',menu:[{text:'使用帮助',items:[{id:'17',text:'帮助文档',href:'/SSH2_MLJYJ/help.html'}]}]}];
        }
    	if(lis.length==2)
        {
        	var config = [{id:'7',menu:[{text:'影楼管理',items:[{id:'14',text:'家庭管理',href:'/SSH2_MLJYJ/family/familyActionList.action'},{id:'15',text:'用户管理',href:'/SSH2_MLJYJ/user/userActionList.action'},{id:'17',text:'收件箱',href:'/SSH2_MLJYJ/sil/sILActionAcceptList.action'},{id:'18',text:'今日提醒',href:'/SSH2_MLJYJ/remind/goRemindAction.action'},{id:'30',text:'个性设置',href:'/SSH2_MLJYJ/settings/settingsAction.action'}]}]},{id:'2',menu:[{text:'帮助',items:[{id:'17',text:'使用帮助',href:'/SSH2_MLJYJ/help.html'}]}]}];
        }
    	if(lis.length==1)
        {
    		var config = [{id:'1',menu:[{text:'全局管理',items:[{id:'8',text:'公告管理',href:'/SSH2_MLJYJ/gonggao/ggActionList.action'},{id:'12',text:'全局统计',href:'/SSH2_MLJYJ/admin/adminAction.action'},{id:'20',text:'总搜索',href:'/SSH2_MLJYJ/search/searchAction_admin'}]}]}];
        }
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
    
</script>

<div style="text-align:center;">
<p>技术支持：<a href="#" target="_blank">上海善智网络有限公司</a></p>
<br/>
<br/>
<br/>
</div>
</body>
</html>
