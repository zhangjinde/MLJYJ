<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"><title>摄影、化妆师添加</title>
        <script src="js/jquery-1.7.2.min.js" type="text/javascript">
        </script>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
        <script>
                        
                        $().ready(function(){
                        
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
            						
            						})
                            });
                        });
                        
                        /*****************************************************************/
                        function check(){
                            var p = document.getElementsByName("em.professional");
                            var cheak = false;
                            for (var i = 0; i < p.length; i++) {
                                if (p[i].checked) {
                                    cheak = true;
                                }
                            }
							
							if($("#province option:selected").val()==""){
								alert("请选择省");
                                return false;
							}
							if($("#city option:selected").val()==""){
								alert("请选择市");
                                return false;
							}
                            if (cheak) {
                                return true;
                            }
                            else {
                                alert("请选择职业分类");
                                return false;
                            }
							
                        }
                    
        </script>
    </head>
    <body>
        <s:form action="employeesAction_save" namespace="/yp" method="post" onsubmit="return check()" enctype="multipart/form-data">
            <table width="100%" border="1">
                <tr>
                    <td>
                        姓名：
                    </td>
                    <td>
                        <s:textfield name="em.e_name"/>
                    </td>
                </tr>
		
                <tr>
                    <td>
                        简介：
                    </td>
                    <td>
                        <s:textarea name="em.jianjie"/>
                        <font style="color:red;">120-150字</font>
                    </td>
                </tr>
                <tr>
                    <td>
                        荣誉1：
                    </td>
                    <td>
                        <s:textfield name="em.ry_one"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        荣誉2：
                    </td>
                    <td>
                        <s:textfield name="em.ry_two"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        职业：
                    </td>
                    <td>
                        <s:radio name="em.professional" list="%{#{'摄影师':'摄影师','化妆师':'化妆师'}}" theme="simple"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        地区：
                    </td>
                    <td>
                        省/直辖：<select id="province" name="em.province_id">
                            <option value="">请选择</option>
                        </select>
                        市：<select id="city" name="em.city_id">
                            <option value="">请选择</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        作品1：
                    </td>
                    <td>
                        <s:file name="image">
                        </s:file>
                    </td>
                </tr>
                <tr>
                    <td>
                        作品2：
                    </td>
                    <td>
                        <s:file name="image">
                        </s:file>
                    </td>
                </tr>
                <tr>
                    <td>
                        作品3：
                    </td>
                    <td>
                        <s:file name="image">
                        </s:file>
                    </td>
                </tr>
                <tr>
                    <td>
                        作品4：
                    </td>
                    <td>
                        <s:file name="image">
                        </s:file>
                    </td>
                </tr>
                <tr>
                    <td>
                        作品5：
                    </td>
                    <td>
                        <s:file name="image">
                        </s:file>
                    </td>
                </tr>
                <tr>
                    <td>
                        作品6：
                    </td>
                    <td>
                        <s:file name="image">
                        </s:file>
                    </td>
                </tr>
						<tr>
                    <td>
                        头像：
                    </td>
                    <td>
                         <s:file name="image">
                         </s:file><font style="color:red;">尺寸：95*90</font>
                    </td>
                </tr>
                <s:token/>
                <tr>
                    <td>
                        <input type="submit" value="添加人员"/>
                    </td>
                </tr>
            </table>
        </s:form>
    </body>
</html>