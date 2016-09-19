<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %> 
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"><title>预约</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <script type="text/javascript" src="js/jquery-1.9.1.min.js">
        </script>
        <script src="layer/layer.js" type="text/javascript"></script>
        <!-- Modernizr (optional) -->
    	<script src="js/modernizr-custom-v2.7.1min.js"></script>

    	<!-- Include Formplate -->
    	<script src="js/formplate.js"></script>
    	<link href="css/formplate.css" rel="stylesheet" type="text/css">

        
        <script>
            $().ready(function(){
            	$('body').formplate();//表单样式初始化
                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                $('#add').click(function(){
                	/*数据校验
                	 * */
					var pid=$("#province option:selected").val();
					var cid=$("#city option:selected").val();
					if(pid==""){
					alert("请选择省");
					$("input:radio[name=professional]").attr('checked',false);
                    return false;
				}
				if(cid==""){
					alert("请选择市");
					$("input:radio[name=professional]").attr('checked',false);
                    return false;
				}
				var user_name=$("#user_name").val();
				var bz=$("#bz").val();
				var sy=$("#sheying option:selected").val();
				var sy_name=$("#sheying option:selected").text();
				var hz=$("#huazhuang option:selected").val();
				var hz_name=$("#huazhuang option:selected").text();
				if(user_name==""){
					layer.msg("请正确填写姓名",function(){});
					return false;
				}
				if(sy==""&&hz==""){
					layer.msg("一个人都不约么",function(){});
					return false;
				}
				$("#error").css("display", "none");  
        var mobile = $.trim($("#tel").val());  
        var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;  
        var isPhone = /^(?:(?:0\d{2,3})-)?(?:\d{7,8})(-(?:\d{3,}))?$/;;  
        var error = "<label id=\"error\" class=\"validate_input_error\">请正确填写电话号码，例如:13511111111或010-11111111</label>";  
        //如果为1开头则验证手机号码  
        if (mobile.substring(0, 1) == 1) {  
            if (!isMobile.exec(mobile) && mobile.length != 11) {  
                $("#tel").after(error);  
                $("#tel").focus();  
                return false;  
            }  
        }  
        //如果为0开头则验证固定电话号码  
        else if (mobile.substring(0, 1) == 0) {  
            if (!isPhone.test(mobile)) {  
                $("#tel").after(error);  
                $("#tel").focus();  
                return false;  
            }  
        }  
        //否则全部不通过  
        else {  
            $("#tel").after(error);  
            $("#tel").focus();  
            return false;  
        } 
		var time=$("#time input[type=text]").val();
		if(time==""){
			layer.msg('请选择预约时间',function(){});
			return false;
		}
				//校验结束
				/*提交数据*/
				layer.load(2);
				$.post("yp/placeOrderAction_submit",{pid:pid,cid:cid,user_name:user_name,sy_id:sy,hz_id:hz,hz_name:hz_name,sy_name:sy_name,time:time,bz:bz,tel:mobile},function(data, textStatus){
						
					if (textStatus == 'success') {
                        if (data != null) {
                        		parent.layer.msg(data);
                        	 layer.closeAll('loading');
                        	 parent.layer.close(index);
                        }
					}
				});
                /*********************************************/    
                });
                $.post("yp/provinceCityAction_allprovince.action", function(data, textStatus){
                    if (textStatus == 'success') {
                        if (data != null) {
                            var dataobj = eval("(" + data + ")");
                            for (var i = 0; i < dataobj.length; i++) {
                                $option = $("<option></option>");
                                $option.attr("value", dataobj[i].id);
                                $option.text(dataobj[i].name);
                                $("#province").append($option);
								
                            }
                        }
                    }
                    
                });
                /*****************************************************************/
                //省变化城市变化
                $("#province").change(function(){
                    var pid = this.value;
                     $.post("yp/provinceCityAction_findcity.action",{pid:pid}, function(data, textStatus){
					 	$("#city option[value!='']").remove();//变化前清空city select中值
					 	if (textStatus == 'success') {
                        if (data != null) {
								var dataobj = eval("(" + data + ")");
                            for (var i = 0; i < dataobj.length; i++) {
								$option = $("<option></option>");
								$option.attr("value", dataobj[i].id);
								$option.text(dataobj[i].name);
								$("#city").append($option);
							}
								
								}
							}
						
						});
                });
                $("#city").change(function(){
                	var pid=$("#province option:selected").val();
					var cid=$("#city option:selected").val();
				$.post("yp/employeesActionList_findemployees",{province_id:pid,city_id:cid,professional:"摄影师"},function(data,textStatus){
					$("#sheying option[value!='']").remove();
					if (textStatus == 'success') {
						if (data != null) {
							if(data=="[]"){
								return false;
							}
							var dataobj = eval("(" + data + ")");
							for (var i = 0; i < dataobj.length; i++) {
								$option=$("<option></option>");
								$option.attr("value",dataobj[i].e_id);
								$option.text(dataobj[i].e_name);
								$("#sheying").append($option);
							}
						}
					}
				});
				$.post("yp/employeesActionList_findemployees",{province_id:pid,city_id:cid,professional:"化妆师"},function(data,textStatus){
					$("#huazhuang option[value!='']").remove();
					if (textStatus == 'success') {
						if (data != null) {
							if(data=="[]"){
								return false;
							}
							var dataobj = eval("(" + data + ")");
							for (var i = 0; i < dataobj.length; i++) {
								$option=$("<option></option>");
								$option.attr("value",dataobj[i].e_id);
								$option.text(dataobj[i].e_name);
								$("#huazhuang").append($option);
							}
						}
					}
				});
                });
            });
        </script>
		<style type="text/css">
							.s1{
								width:120px;
							}
							</style>
							<sx:head/>
    </head>
    <body data-formplate-colour="blue">
        <div class="formplate" id="top"> 
            <select id="province" class="s1">
                <option value="">地区（省）</option>
            </select>
            <select id="city" class="s1">
                <option value="">地区（市）</option>
            </select>
        </div>
        <div class="formplate" id="sy">
        	摄影师：<select id="sheying" class="s1">
                <option value="">摄影师</option>
            </select>
        </div>
		<div class="formplate" id="hz">
			化妆师：<select id="huazhuang" class="s1">
                <option value="">化妆师</option>
            </select>
		</div>
		<br/>
		<div class="formplate" id="bottom">
			用户姓名：(必填)<input type="text" name="user_name" id="user_name">
			联系方式：(必填)<input type="text" name="tel" id="tel">
			预约时间：(必填)<br/><sx:datetimepicker id="time" displayFormat="yyyy-MM-dd hh:mm:ss" displayWeeks="4" toggleType="explode" toggleDuration="200"/>
			<br/>
			附加信息：<textarea placeholder="附加说明" name="bz" id="bz"></textarea>
		</div>
		
		<div style="text-align:center;">
        <button id="add" style="background-image: url(images/btn.gif);width: 106px; height: 36px;" >
        </button>
		</div>
    </body>
</html>
