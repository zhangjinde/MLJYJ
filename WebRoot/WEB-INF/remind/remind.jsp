<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"><title>remind</title>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <link rel="stylesheet" type="text/css" href="css/bCss/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/bCss/bootstrap-responsive.css" />
        <link rel="stylesheet" type="text/css" href="css/bCss/style.css" />
        <script type="text/javascript" src="js/bJs/jquery.js">
        </script>
        <script type="text/javascript" src="js/bJs/jquery.sorted.js">
        </script>
        <script type="text/javascript" src="js/bJs/bootstrap.js">
        </script>
        <script type="text/javascript" src="js/bJs/ckform.js">
        </script>
        <script type="text/javascript" src="js/bJs/common.js">
        </script>
        <script type="text/javascript" src="js/jquery-1.9.1.min.js">
        </script>
        <script type="text/javascript" src="layer/layer.js">
        </script>
        <style type="text/css">
            body {
                padding-bottom: 40px;
            } .sidebar-nav {
                padding: 9px 0;
            }
            @media ( max-width: 980px) { /* Enable use of floated navbar text */ .navbar-text.pull-right {
                    float: none;
                    padding-left: 5px;
                    padding-right: 5px;
            }
             #familypwd {
                margin-left: 30px;
            } .msg {
                margin-left: 30px;
            }
            @media print { .print {
            
            display:block;
            } .nprint {
                    display: none;
            }
            }
            @media print {
            
            INPUT {
                    display: none
            }
            }
        </style>
    </head>
    <body>
        <object id=WebBrowser classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 width=0>
        </object>
        <div align="center">
            <input type="button" value="打    印" onclick="javascript:window.print()" class="btn btn-success">
        </div>
        <table width="100%" border="1" class="table table-bordered table-hover definewidth m10 " style="border-collapse:collapse; ">
            <THEAD style="display:table-header-group;font-weight:bold">
                <TR>
                    <th>
                        提醒类型
                    </th>
                    <th>
                        家庭住址
                    </th>
                    <th>
                        用户信息
                    </th>
                    <th>
                        联系电话
                    </th>
					                    <th>
                       消费项目
                    </th>
                    <th>
                        微信推送
                    </th>
                </TR>
            </THEAD>
            <tbody>
                <s:iterator value="remindlist">
                    <tr>
                        <td>
                            <s:property value="remindclass" />
                        </td>
                        <td>
                            <s:property value="homeaddress" />
                        </td>
                        <td>
                            <s:property value="sex_name" />
                        </td>
                        <td>
                            <s:property value="phone" />
                        </td>
						 <td>
                            <s:property value="xf_project" />
                        </td>
                        <td>
                            <input type="button" class="btn btn-success" value="微信推送"/>
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
        <script>
            $().ready(function(){
                $("input").click(function(){
                
                    var mobile = $(this).parent().prev().prev().text();//手机号码（去空格）11位 双号码23位（判断用）
                    var remindclass = $(this).parent().prev().prev().prev().prev().prev().text();
                    var name = $(this).parent().prev().prev().prev().text();
                    var btnid = $.trim(mobile);
                    btnid = btnid.substr(0, 11);
                    $(this).attr("id", btnid);
                    $.post("wxTextService_wxtousertext.action", {
                        mobile: mobile,
                        remindclass: remindclass,
                        name: name
                    }, function(data, textStatus){
                        if (textStatus == 'success') {
                            if (data != null) {
                                if (data == "onenobinding") {
									layer.tips('前者还未绑定无法服务，后者已发送。', "#" + btnid, {
                                                tips: [4, '#FF9901'],
                                                time: 3000
                                            });
                                    $("#" + btnid).attr("disabled", "disabled");
                                    $("#" + btnid).val("已推送");
                                }
                                else 
                                    if (data == "twonobinding") {
										layer.tips('后者还未绑定无法服务，前者已发送。', "#" + btnid, {
                                                tips: [4, '#FF9901'],
                                                time: 3000
                                            });
                                        $("#" + btnid).attr("disabled", "disabled");
                                        $("#" + btnid).val("已推送");
                                    }
                                    else 
                                        if (data == "onenobindingtwonobinding") {
											layer.tips('两人都未绑定无法服务，请人工提醒客户。', "#" + btnid, {
                                                tips: [4, '#FF9901'],
                                                time: 3000
                                            });
                                            $("#" + btnid).attr("disabled", "disabled");
                                            $("#" + btnid).val("请人工");
                                        }
                                        else 
                                            if (data == "nobinding") {
												layer.tips('客户未绑定无法服务，请人工提醒客户。', "#" + btnid, {
                                                tips: [4, '#FF9901'],
                                                time: 3000
                                            });
                                                $("#" + btnid).attr("disabled", "disabled");
                                                $("#" + btnid).val("请人工");
                                            }
                                            else {
                                                layer.tips('已推送', "#" + btnid, {
                                                tips: [4, '#78BA32'],
                                                time: 3000
                                            	});
                                                $("#" + btnid).attr("disabled", "disabled");
                                                $("#" + btnid).val("已推送");
                                                
                                            }
                            }
                        }
                    });
                });
                
            });
        </script>
    </body>
</html>
