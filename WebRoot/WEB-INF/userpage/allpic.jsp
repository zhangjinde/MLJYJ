<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户相册-照片列表</title>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<link href="css/btns.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function delcfm() {
		if (!confirm("确认要删除？")) {
			window.event.returnValue = false;
		}
	}
	function describe(anything) {
		var pic=$.trim($(anything).prev().text());//要去空格 妈的
		$.get("wxSupport_picstr_get",{picid:pic},function(data,textStatus){
			if(data=="null"){
				data="我是美美的照片";
			}
		layer.prompt({
			formType : 2,
			value : data,
			title : '照片描述'
		}, function(value, index, elem) {
			$.post("wxSupport_picstr",{picstr:value,picid:pic},function(data,textStatus){
				if(textStatus=="success"){
					if(data!=null){
						if(data=="ok"){
						layer.msg("描述添加成功");
						}
						if(data=="no"){
							layer.msg("");
						}
					}
					
				}
			});
		});
		});
	}
</script>
<script type="text/javascript">
//加载layer扩展方法
$().ready(function(){
	layer.config({
		extend : 'extend/layer.ext.js'
	});
	$("#sorting").click(function(){
		if($("#sorting").text()=="排序"){
			$("#sorting").text("保存");
			var a=1;
			jQuery('.textindex').each(function(key,value){
				$(this).children().val(a);
				a=a+1;
			});
		$(".textindex").show();
		}else{
			var ids=new Array();
			var indexs=new Array();
			jQuery('.idclass').each(function(key,value){
				ids[key]=$.trim($(this).text());
			});
			jQuery('.textindex').each(function(key,value){
				indexs[key]=$.trim($(this).children().val());
			});
			var json="[";
			for(var i=0;i<ids.length;i++){
				var str=
				json+="{pid:"+ids[i]+",index:"+indexs[i]+"},";
				
			}
			json=json.substring(0,json.length-1);
			json+="]";
			var paid=$.trim($("#paid").text());
			$.post("user/allpicAction_sorting",{json:json},function(data,textStatus){
				if(textStatus=="success"){
					if(data=="ok"){
						window.location.href="user/allpicAction?pa_id="+paid; 
					}
				}
			});
			
		}
	});
});
</script>
<style type="text/css">
.btns {
	color: #fef4e9;
	background: #80BCF9;
}

a {
	color: #fef4e9;
	text-decoration: none;
}

body {
	font-family: arial, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
}

.total a {
	color: #414DA7;
}
.msg {
	margin-left: 30px;
}
</style>
</head>

<body>
	<s:url action="paActionList" namespace="/user" var="backpa" />
	<s:url action="allpicAction" namespace="/user" var="allpic" />
	<div style="display:inline;float:left;">
		<a href='<s:property value="backpa"/>'><button class="btns">返回</button>
		<a href='javascript:void(0)'><button class="btns" id="sorting">排序</button>
		</a>
	</div>
	<div style="display: inline;float: right;" class="total">
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
			<a
				href="<s:property value="allpic"/>?page=1&pa_id=<s:property value="pa_id"/>">第一页</a>
			<a
				href="<s:property value="allpic"/>?page=<s:property value="%{pageBean.currentPage-1}"/>&pa_id=<s:property value="pa_id"/>">上一页</a>
		</s:else>
		<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
			<a
				href="<s:property value="allpic"/>?page=<s:property value="%{pageBean.currentPage+1}"/>&pa_id=<s:property value="pa_id"/>">下一页</a>
			<a
				href="<s:property value="allpic"/>?page=<s:property value="pageBean.totalPage"/>&pa_id=<s:property value="pa_id"/>">最后一页</a>
		</s:if>
		<s:else>
            下一页 最后一页
        </s:else>
	</div>

	</div>
	<br />
	<br />

	<table border="0">
		<s:iterator value="pageBean.list" status="st">
			<s:if test="#st.index % 8 == 0">
				<tr>
			</s:if>
			<td>
				<div class="bigimg">
					<img src="<s:property value="pic_relurl"/>"
						alt='<s:property value="pic_realname"/>' width="180px"
						height="160px">
					<s:url action="paAction_delpic" namespace="/user" var="delpic">
						<s:param name="pic_id" value="pic_id" />
					</s:url>
					<br />

				</div>
				<div class="textindex" style="display:none;text-align: center;"><s:textfield size="2"/></div>
				<div style="display: none;" class="idclass">
					<s:property value="pic_id" />
				</div>
				<button class="btns" style="width: 90px;" onClick="describe(this)">描述</button>
				<a href='<s:property value="delpic"/>' onClick="delcfm()"><button
						class="btns" style="width: 90px;">删除
			</a>
			</button>
			</td>
			<s:if test="#st.index % 8 == 7 || #status.last">
				</tr>
			</s:if>
		</s:iterator>
	</table>
	<div id="paid" style="display:none;"><s:property value="pa_id"/></div>
	<br />
	<script>
		$(".bigimg").click(function() {
			var imgurl = $(this).children("img").attr("src");
			layer.open({
				type : 1,
				title : false,
				closeBtn : false,
				area : '600px',
				skin : 'layui-layer-nobg', //没有背景色
				shadeClose : true,
				content : '<img src='+imgurl+' width=600px>'
			});
		});

		$(".bigimg").mouseenter(function() {
			layer.msg('点击我查看大图', {
				offset : 0,
				shift : 5
			});
		});
		
	</script>

	<br />
</body>
</html>
