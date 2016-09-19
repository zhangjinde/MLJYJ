<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>添加家庭</title>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
	<script src="js/jquery.datetimepicker.js"></script>
	<script src="layer/layer.js" type="text/javascript"></script>
	
	<script>
	$().ready(function(){
		$("#money").focusout(function(){
			var num =$("#money").val()
			if(num>20000){
				
                layer.confirm('你确定这家金额套餐超过2万吗？', {
                    btn: ['是的', '更改'], //按钮
                    icon: 3,
					title:'金额警告'
                },null, function(){
                    $("#money").val("");
					$("#money")[0].focus();
                });
			}
		});
		$("#love").focusout(function(){
			$.post("family/lovePwdAction_isexsit.action",{lovepwd:$("#love").val()},function(data,textStatus){
				if(textStatus=='success'){
					if(data=='密码已存在'){
						$("#ts").attr("style","color:red");
						$("#ts").text(data);
					}
					else{
						$("#ts").attr("style","color:green");
						$("#ts").text(data);
					}
				}
				
			});
			});
				$('#jhdate').datetimepicker({
      lang:"ch",           //语言选择中文
      format:"Y-m-d",      //格式化日期
      timepicker:false,    //关闭时间选项
      //yearStart：1900,     //设置最小年份
      yearEnd:2050,        //设置最大年份
      todayButton:false   //关闭选择今天按钮
      });//时间控件
		$('#ycdate').datetimepicker({
      lang:"ch",           //语言选择中文
      format:"Y-m-d",      //格式化日期
      timepicker:false,    //关闭时间选项
      //yearStart：1900,     //设置最小年份
      yearEnd:2050,        //设置最大年份
      todayButton:false   //关闭选择今天按钮
      });//时间控件
      //清除时间控件的数据
	  $("#clearone").click(function(){
	  	$("#jhdate").val("");
		return false;
	  });
	  $("#cleartwo").click(function(){
	  	$("#ycdate").val("");
		return false;
	  });
		});
	</script>
	
	
	<style type="text/css">
	table {border: 1px solid #BABEF1;border-collapse:collapse; color:#8080CC} 
		.Left_td { text-align:left;padding-left:10px;height:40px;  }
		.title{ width:100%;text-align:center; margin:0 auto;}
		.span_td { font-size:14px;}
		.right_td {padding-left:10px; }
		#check {font-size:12px; }
	</style>
	
  	</head>
  <body>


   <s:form action="familyAction_add" namespace="/family" method="post">
    <div class="title"><h3>家庭信息</h3></div>
   <table  width="100%"  border="1" cellpadding="0" cellspacing="0"  >
  			<tr><th class="Left_td">家庭地址：</th><td class="right_td"><s:textfield name="familybean.family_address" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>
  			<tr><th class="Left_td">家庭电话：</th><td class="right_td"><s:textfield name="familybean.home_phone" style="width:20%;line-height:26px;border-radius:5px;" /></td></tr>
  			<tr><th class="Left_td">爱情密码：</th><td class="right_td"><s:textfield name="familybean.lovepwd" id="love" style="width:20%;line-height:26px;border-radius:5px;" /><font id="ts"></font></td></tr>
  			<tr><th class="Left_td">护照编号：</th><td class="right_td"><s:textfield name="familybean.postnum" style="width:20%;line-height:26px;border-radius:5px;"  /></td></tr>
  			<tr><th class="Left_td">婚纱套系（价格）：</th><td class="right_td"><s:textfield name="familybean.consumption" style="width:20%;line-height:26px;border-radius:5px;"  id="money"/></td></tr>
  			<tr><th class="Left_td">结婚日期：</th><td class="right_td"><input id="jhdate" type="text" name="familybean.marrydate" placeholder="点我选择时间"><button id="clearone">清除</button><input type="radio" name="familybean.islun" value="1" >阴历    <input type="radio" name="familybean.islun" value="0"/>阳历(客户过周年纪念是以阴历还是阳历。)</td></tr>
  			<tr><th class="Left_td">预产日期：</th><td class="right_td"><input id="ycdate" type="text" name="familybean.childbirth" placeholder="点我选择时间"><button id="cleartwo">清除</button></td></tr>
			<tr><th class="Left_td">家庭介绍：</th><td class="right_td"><s:textarea name="familybean.home_instructions" style="width:20%;border-radius:5px;" /></td></tr>
			<tr><th class="Left_td">所属影楼：</th><td class="right_td"><s:select id="select" name="familybean.family_studio.studio_id" list="studios" style="width:20%;line-height:26px;height:30px; border-radius:5px;" listKey="studio_id" listValue="studio_name" value="studio_id" headerKey="%{#request.fs.studio_id}" headerValue="%{#request.fs.studio_name}"/></td></tr>
  			<s:token/>
  			<tr><td colspan="2" ><input type="submit" value="加  入" style="cursor:pointer; color:#fff;line-height:26px;border-radius:5px;display:block;width:180px;text-align:center;margin-left:5px;background:#164FE4;font-size:16px; font-family:微软雅黑；; line-height:30px; font-weight:bold;  " /></td></tr>
  		</table>
  		</s:form>
  		<script type="text/javascript">
		document.getElementsByName('familybean.islun')[1].checked=true;//--默认选中阳历 --
	</script>
  </body>
  
</html>

