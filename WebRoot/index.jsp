<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>家印记</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>
<script src="js/jquery.nivo.slider.js" type=text/javascript></script>
<script language="javascript" type="text/javascript" src="js/ss.js"></script>
<link rel="stylesheet" href="css/lrtk.css"/>
<script src="js/indexcount.js" type="text/javascript"></script>
<link href="css/xuanfu.css" rel="stylesheet" type="text/css"/>
<script src="layer/layer.js" type="text/javascript"></script>
<script>
$(function() {

	 $('#navigation a').stop().animate({'marginLeft':'-85px'},1000);

	 $('#navigation > li').hover(
	  function () {
	   $('a',$(this)).stop().animate({'marginLeft':'-2px'},200);
	  },
	  function () {
	   $('a',$(this)).stop().animate({'marginLeft':'-85px'},200);
	  }
	 );
	 //弹出地图
	 $("#map").click(function(){
		 layer.open({
			    type: 2,
			    area: ['720px', '600px'],
			    fix: false, //不固定
			    maxmin: false,
			    content: 'map.html'
			});
	 });
	});
		//实现从一个数字到另一个数字的变换过程
		function magic_number(value) { 
		    var num = $("#number"); 
		    num.animate({count: value}, { 
		        duration: 500, 
		        step: function() { 
		            num.text(String(parseInt(this.count))); 
		        } 
		    }); 
		};
		//后台获得数据
		function update() { 
			$.get("index/inIndex_familycount", function(data){
					magic_number(data);
				});
		}; 
		setInterval(update, 5000); //5秒钟执行一次 
		update();

</script>
<style>
.topone{width:auto; float: none;margin-left:10px;margin-top: 68px;}
.count{margin-top:5px;font-size:16px;letter-spacing:3px;float: left;font-family: "微软雅黑";}
#number{font-size:42px;text-shadow: 0 -1px 0 #C50083;color:#C50083;font-weight:700;filter: dropshadow(color=#f6f6f9, offx=0, offy=1);}
</style>
</head>

<body>
<ul id="navigation">
 <li class="map"><a title="Map" id="map"></a></li>

</ul>
<s:url action="cancelAction" namespace="/login" var="cancel"/>
<s:url action="memberAction" namespace="/login" var="member"/>

	<div class="top">
	<div style="float:left;" class="left">
	<div class="welcome" style="float: inherit;margin-top: 0px;">欢迎访问家印记！</div>
	<div class="topone">
	<div class="count" >家印记已帮助<span id="number"></span>个家庭建立影像家谱</div>
	</div>
	</div>
    	<div class="topcon">
        	
            <div class="logo" ><a href=""><img src="images/logo.png" border="none" width="134" height="78" /></a></div>
        </div>
        <s:if test="%{#request.session.usermain==null}">
            <div class="loginreg"><a href="login.jsp">登陆</a> <a href="#">注册</a></div>
            </s:if>
            <s:else><div class="loginreg"><a href='<s:property value="member"/>'><s:property value="%{#request.session.usermain.username }"/></a> <a href='<s:property value="cancel"/>'>注销</a></div></s:else>
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
            <li><a href='<s:property value="member"/>' target="_black">会员服务</a></li>
        </ul>
    </div>
    <div class="banner">
    	<div class="cycle" style="height:600px;" id="itc">
            <a href='' class="list" style=' background-image:url(images/banner3.jpg);'></a>
            <a href='' class="list" style=' background-image:url(images/banner4.jpg);'></a>
            <a href='' class="list" style=' background-image:url(images/banner2.png);'></a>
            <a href='' class="list" style=' background-image:url(images/banner.jpg);'></a>
        </div>
    </div>
    <div class="content">
    	<div class="yinji">
        	<div class="yinjipic"><a href="jiayinji.jsp"><img src="images/yinjipic.jpg" border="none" width="422" height="280" /></a></div>
            <div class="yinjicon">
            	<div class="title">家印记</div>
                <div class="jianjie">
                	家印记 意指留下精彩瞬间，珍藏美好回忆，以传承为目的，对一个家庭或一个家族的重要生活节点及精彩瞬间采用影像纪实的方式记录下来，以阶段性时间精裱成册或制作成影像图库。[家·印记]传承中华民族家谱文化的精髓，以图片为主，图文并茂地记录一个家庭的生活轨迹与幸福时刻。
                </div>
                <div class="more"><a href="jiayinji.jsp">了解详情</a></div>
            </div>
        </div>
        <div class="changguanjieshao">
        	<div class="cgjstt">
            	<span>家</span><br />Home
            </div>
            <div class="cgjscon">
            	<div class="cgjsl">
                	<a href="usershowpage/1.jsp"><img src="images/pic1.jpg" border="none" width="200" height="200" /></a>
                    <a href="usershowpage/2.jsp"><img src="images/pic2.jpg" border="none" width="200" height="200" /></a>
                </div>
                <div class="cgjsc">
                    <div class="slide_container">
                      <ul class="rslides" id="slider">
                        <li>
                          <img src="images/picc5.jpg" alt=""/>
                          <p class="caption">传承</p>
                        </li>
                        <li>
                          <img src="images/picc8.jpg" alt=""/>
                          <p class="caption">父子</p>
                        </li>
                        <li>
                          <img src="images/picc4.jpg" alt=""/>
                          <p class="caption">母女</p>
                        </li>
                        <li>
                          <img src="images/picc6.jpg" alt=""/>
                          <p class="caption">父子</p>
                        </li>
                        <li>
                          <img src="images/picc7.jpg" alt=""/>
                          <p class="caption">母子</p>
                        </li>
                        <li>
                          <img src="images/picc2.jpg" alt=""/>
                          <p class="caption">幸福</p>
                        </li>
                        <li>
                          <img src="images/picc3.jpg" alt=""/>
                          <p class="caption">相伴</p>
                        </li>
                        <li>
                          <img src="images/picc9.jpg" alt=""/>
                          <p class="caption">传承</p>
                        </li>
                      </ul>
                    </div>
                </div>
                <div class="cgjsr">
                	<a href="usershowpage/3.jsp"><img src="images/pic3.jpg" border="none" width="200" height="200" /></a>
                    <a href="usershowpage/5.jsp"><img src="images/pic4.jpg" border="none" width="200" height="200" /></a>
                </div>
                <script src="js/responsiveslides.min.js"></script>
<script src="js/slide.js"></script>
          </div>
        </div>
        <div class="changguanjieshao">
        	<div class="cgjstt">
            	<span>爱</span><br />Love
            </div>
            <div class="cgjscon">
            	<div class="cgjsl">
                	<a href="love/1.jsp"><img src="images/pic5.jpg" border="none" width="200" height="200" /></a>
                    <a href="love/2.jsp"><img src="images/pic6.jpg" border="none" width="200" height="200" /></a>
                </div>
                <div class="cgjscs">
                    <div class="slides_container">
                      <ul class="rslidess" id="sliders">
                        <li>
                          <img src="images/pica1.jpg" alt=""/>
                          <p class="caption">完</p>
                        </li>
                        <li>
                          <img src="images/pica2.jpg" alt=""/>
                          <p class="caption">美</p>
                        </li>
                        <li>
                          <img src="images/pica3.jpg" alt=""/>
                          <p class="caption">邂</p>
                        </li>
                         <li>
                          <img src="images/pica4.jpg" alt=""/>
                          <p class="caption">逅</p>
                        </li>
                         <li>
                          <img src="images/pica5.jpg" alt=""/>
                          <p class="caption">美</p>
                        </li>
                         <li>
                          <img src="images/pica6.jpg" alt=""/>
                          <p class="caption">丽</p>
                        </li>
                         <li>
                          <img src="images/pica7.jpg" alt=""/>
                          <p class="caption">爱</p>
                        </li>
                         <li>
                          <img src="images/pica8.jpg" alt=""/>
                          <p class="caption">情</p>
                        </li>
                         <li>
                          <img src="images/pica9.jpg" alt=""/>
                          <p class="caption">珍</p>
                        </li>
                         <li>
                          <img src="images/pica10.jpg" alt=""/>
                          <p class="caption">藏</p>
                        </li>
                         <li>
                          <img src="images/pica11.jpg" alt=""/>
                          <p class="caption">永</p>
                        </li>
                         <li>
                          <img src="images/pica12.jpg" alt=""/>
                          <p class="caption">远</p>
                        </li>
                      </ul>
                    </div>
                </div>
                <div class="cgjsr">
                	<a href="love/3.jsp"><img src="images/pic7.jpg" border="none" width="200" height="200" /></a>
                    <a href="love/4.jsp"><img src="images/pic8.jpg" border="none" width="200" height="200" /></a>
                </div>
          </div>
        </div>
    </div>
    <div style="width:850px; margin:0 auto">
<div class="mr_t1 mt14">
   <div class="mr_t1name">
    <img src="images/mt_ico6.jpg" />合作伙伴
   </div>
</div>
<div class="mr_frbox">
  <img class="mr_frBtnL prev" src="images/mfrL.jpg" width="28" height="46" />
  <div class="mr_frUl">
  <ul>
   <li><a href="http://eqxiu.com/" target="_blank"><img src="images/mfr_1.png" width="123" height="52" /></a></li>
	<li><a href="http://www.nttonghua.cn/" target="_blank"><img src="images/mfr_2.jpg" width="123" height="52" /></a></li>
	<li><img src="images/mfr_3.jpg" width="123" height="52" /></li>
	<li><img src="images/mfr_4.jpg" width="123" height="52" /></li>
  </ul>
  </div>
  <img class="mr_frBtnR next" src="images/mfrR.jpg" width="28" height="46" />
</div>
<script>
$(".mr_frUl ul li img").hover(function(){$(this).css("border-color","#A0C0EB");},function(){$(this).css("border-color","#d8d8d8")});
jQuery(".mr_frbox").slide({titCell:"",mainCell:".mr_frUl ul",autoPage:true,effect:"leftLoop",autoPlay:true,vis:4});
</script>
</div>
</div>
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
                                                                                                                                                                                                                     