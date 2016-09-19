<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>约拍</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.cycle.all.js" type="text/javascript"></script>
    <script src="js/js.js" type="text/javascript"></script>
    <script src="layer/layer.js" type="text/javascript"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	

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
							$("input:radio[name=professional]").change(function(){
								
								$(".slidebox li").remove();
								
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
								//$("input:radio[name=professional]:checked").val()--------value值
								/*
								 * 动态获取摄影师或者化妆师列表
								 */
								 var professional=$("input:radio[name=professional]:checked").val();
								 if(professional=="摄影师"){
								 	$("#textp").text("时尚摄影师");
								 }
								 else{
								 	$("#textp").text("潮流化妆师");
								 }
								$.post("yp/employeesActionList_findemployees",{province_id:pid,city_id:cid,professional:professional},function(data,textStatus){
									
									if (textStatus == 'success') {
										if (data != null) {
											if(data=="[]"){
												return false;
											}
											/*
											*动态生成人员列表
											*/
											
											var $slidebox=$(".slidebox");
											var dataobj = eval("(" + data + ")");
											var num=Math.floor(dataobj.length/16)+1;//16格 num为li的数量
											for (var j = 0; j < num; j++) {
												var $li = $("<li></li>");
												$li.attr("id", "li" + j);
												$slidebox.append($li);//外层判断 一共需要多少li然后先创建 
											}
												for (var i = 0; i < dataobj.length; i++) {
													//<li><a href="javascript:void(0)" id=""><img src="images/yppic1.jpg" alt="" /></a></li>
													var $a = $("<a></a>");
													$a.attr("href", "javascript:void(0)");
													$a.attr("id",dataobj[i].e_id);
													$a.attr("onclick","clicka(this)");
													var $img = $("<img></img>");
													$img.attr("src", dataobj[i].img_head);
													$img.attr("alt", "");
													$a.append($img);
													var n=Math.floor(i/16); //这里如果一页正好16个 则i=15 n仍为0 如果为17则加入第二个li中
													$("#li"+n).append($a);
													
												}
												
											
										}
									}
									
								});
							});
							/*****************************************************************/
							$("#btn").click(function(){
                                layer.open({
                                    type: 2,
                                    area: ['500px', '700px'],
									title:"预约",
                                    fix: false, //不固定
                                    maxmin: false,
                                    content: 'yuepai/placeorder.jsp'
                                });


							});
                        });
						/*****************************************************************/
	function clicka(obj){
		
							var id = $(obj).attr("id");
							$.post("yp/employeesAction_findbyid", {e_id:id}, function(data, textStatus){
								/*
								 * 清理
								 */
								$("div.list img").remove();
								var clear=$("#textp").text();
								var i=clear.split(':');
								$("#textp").text(i[0]);
								/*****************/
								if (textStatus == 'success') {
									if (data != null) {
										var dataobj = eval("(" + data + ")");
										$("#jianjie").text(dataobj[0].jianjie);
										$("#ryone").text(dataobj[0].ry_one);
										$("#rytwo").text(dataobj[0].ry_two);
										$("#e_id").text(dataobj[0].e_id);
										var str=$("#textp").text();
										str+=":"+dataobj[0].e_name;
										$("#textp").text(str);
										//<img src="images/img_01.jpg" />
										$div = $("div.list");
										$img1 = $("<img></img>");
										$img1.attr("layer-pid", "pic1");
										$img1.attr("layer-src", dataobj[0].img_one);//大图地址
										$img1.attr("src", dataobj[0].img_one);//缩略图
										$img1.attr("alt", "作品1");
										$div.append($img1);
										$img2 = $("<img></img>");
										$img2.attr("layer-pid", "pic2");
										$img2.attr("layer-src", dataobj[0].img_two);
										$img2.attr("src", dataobj[0].img_two);
										$img2.attr("alt", "作品2");
										$div.append($img2);
										$img3 = $("<img></img>");
										$img3.attr("layer-pid","pic3");
										$img3.attr("layer-src", dataobj[0].img_three);
										$img3.attr("src", dataobj[0].img_three);
										$img3.attr("alt", "作品3");
										$div.append($img3);
										$img4 = $("<img></img>");
										$img4.attr("layer-pid", "pic4");
										$img4.attr("layer-src", dataobj[0].img_four);
										$img4.attr("src", dataobj[0].img_four);
										$img4.attr("alt", "作品4");
										$div.append($img4);
										$img5 = $("<img></img>");
										$img5.attr("layer-pid","pic5");
										$img5.attr("layer-src", dataobj[0].img_five);
										$img5.attr("src", dataobj[0].img_five);
										$img5.attr("alt", "作品5");
										$div.append($img5);
										$img6 = $("<img></img>");
										$img6.attr("layer-pid", "pic6");
										$img6.attr("layer-src", dataobj[0].img_six);
										$img6.attr("src", dataobj[0].img_six);
										$img6.attr("alt", "作品6");
										$div.append($img6);
										layer.config({extend: 'extend/layer.ext.js'})
										layer.ready(function(){ //为了layer.ext.js加载完毕再执行
                                            layer.photos({
                                                photos: '#list'
                                            })
											
										}); 
									}
								}
							});
							
						}
						
						</script>
						<style type="text/css">
							.s1{
								width:120px;
							}
							.footer {
								position:fixed;
								bottom:0;
								
							}
						</style>
  </head>
  
  <body>    <!-- ****************************head******************************* -->
   <s:url action="cancelAction" namespace="/login" var="cancel"/>
<s:url action="memberAction" namespace="/login" var="member"/>
	<div class="top">
    	<div class="topcon">
        	<div class="welcome">欢迎访问家印记影像馆！</div>
            <s:if test="%{#request.session.usermain==null}">
            <div class="loginreg"><a href="login.jsp">登陆</a> <a href="#">注册</a></div>
            </s:if>
            <s:else><div class="loginreg"><a href='<s:property value="member"/>'><s:property value="%{#request.session.usermain.username }"/></a> <a href='<s:property value="cancel"/>'>注销</a></div></s:else>
            <div class="logo"><a href=""><img src="images/logo.png" border="none" width="134" height="78" /></a></div>
        </div>
    </div>
    <div class="navi">
    	<ul>
        	<li><a href="index.jsp">首页</a></li>
            <li><a href="jiayinji.jsp">家印记</a></li>
            <li><a href="active.jsp">最新活动</a></li>
            <li><a href="yuepai.jsp">定制约拍</a></li>
            <li><a href="shop.jsp">网络商城</a></li>
            <li><a href="usershow.jsp">客照展示</a></li>
            <li><a href="contactus.jsp">联系我们</a></li>
            <li><a href='<s:property value="member"/>'>会员服务</a></li>
        </ul>
    </div>
    <!-- ***************************************************************** -->
    	<div class="content">
    	<div class="mod-details-content">
    	    <div class="leftpannel">
    	        <select id="province" class="s1">
                    <option value="">请选择</option>
                    
                </select>
    	        <select id="city" class="s1">
                    <option value="">请选择</option>
                   
                </select>
    	        <input type="radio" name="professional" value="摄影师">摄影师</input>
				<input type="radio" name="professional" value="化妆师">化妆师</input>
    	        <ul class="slidebox" id="slidebox"><!--这里做分页-->
    	           
    	           
    	        </ul>
				
    	        <a href="javascript:void(0)" class="next">></a>
    	        <a href="javascript:void(0)" class="prev"><</a>
    	    </div>
    	    <div class="rightpannel">
    	        <h1 class="title">童梦</h1>
    	        <div class="label">
    	            <a href="javascript:void(0)" id="textp">您选择的职业</a>
					<label id="e_id" style="display:none;"></label>
    	        </div>
    	        <div class="cont">
    	            <p id="jianjie">中国时尚摄影师及视觉艺术家 ，wpo全球摄影师大赛专业组广告类获奖者。她的努力及天马行空的创造力为她带来了”2010中国最受关注新锐时装摄影师”，这个奖项奠定了她在行业中的地位。2011获得”索尼世界摄影大赛-商业广告类季军”。</p>
    	            <p style="color:#333;" id="ryone">-2012美国IPA国际摄影大赛-广告类及时尚类－双荣誉奖</p>
    	            <p style="color:#333;" id="rytwo">-2012网易时尚盛典-中国创造年度商业价值摄影师</p>
    	        </div>
    	        <div class="list" id="list">
    	            
    	        </div>
				<div id="credit"></div>
				
    	        <a href="javascript:void(0)" id="btn"><img src="images/btn01.jpg" alt="马上预约" /></a>
    	    </div>
    	</div>
    </div>
    
    <!-- ****************************foot******************************* -->
    <div class="footer">
    	<div class="foocon">
            <div class="banquan">
                <a href="jiayinji.jsp">关于我们</a> | <a href="common.jsp">常见问题</a> | <a href="law.jsp">法律声明</a> | <a href="contactus.jsp">联系我们</a><br />
    Copyright © 2003-2015家印记 All Rights Reserved
            </div>
            <div class="footlogo"><img src="images/footlogo.png" alt="footlogo"/></div>
            <div class="link">
            
            	<a href="javascript:void(0)" id="wx"><img src="images/weixin.png" border="none" width="36" height="33" /></a>
                <a href="http://weibo.com/u/5592645081" target="_blank" rel="nofollow" title="家印记官方微博" class="wb"><img src="images/weibo.png" border="none" width="40" height="33" /></a>
                <a href="http://wpa.qq.com/msgrd?v=3&uin=800018109&site=qq&menu=yes" target="_blank"><img src="images/qq.png" border="none" width="30" height="32" /></a>
            </div>
        </div>
    </div>
    <div class="erweima" id="ewm"><img src="images/erweima.jpg" width="200" height="200" /></div>
    <script>
    $("#wx").hover(function() {
        $(".erweima").show();
    }, function() {
    $(".erweima").hide();
    });</script>
  </body>
</html>
