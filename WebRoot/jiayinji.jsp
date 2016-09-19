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
    
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./js/usershow/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/usershow/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/usershow/common.css" />
	<style type="text/css">
	
#main{width:1000px; margin:auto; margin-top:15px;}

#box_01,#box_02,#box_03,#box_04,#box_05{width:100%;}
#box_01 .title{width:100%; height:90px; background-color:#9b1c77; text-align:center; padding-top:30px;background-image:url(./images/jiayinji/about_box_01_bg.png);}
#box_02 .title{width:100%; height:90px; background-color:#007373; text-align:center; padding-top:30px;background-image:url(./images/jiayinji/about_box_02_bg.png);}
#box_03 .title{width:100%; height:90px; background-color:#e77919; text-align:center; padding-top:30px;background-image:url(./images/jiayinji/about_box_03_bg.png);}
#box_04 .title{width:100%; height:90px; background-color:#dd3c40; text-align:center; padding-top:30px;background-image:url(./images/jiayinji/about_box_04_bg.png);}
#box_05 .title{width:100%; height:90px; background-color:#009dd2; text-align:center; padding-top:30px;background-image:url(./images/jiayinji/about_box_05_bg.png);}

#box_01 .body,#box_02 .body,#box_03 .body,#box_04 .body,#box_05 .body{width:100%;}

#box_01 .body{width:700px; margin:auto; padding-top:30px; position:relative;}
#box_01 .body p{ line-height:180%; padding-bottom:20px;}

#box_01 .body a{ text-decoration:none; color:#444;}

#box_02 .body{padding-bottom:20px;}
#box_02 .body .main_ul{}
#box_02 .body .main_ul li{width:460px; height:90px; padding:20px; border-bottom:1px solid #bbb; float:left;background-color:#ffffff; }
#box_02 .body .main_ul li a{ color:#444}
#box_02 .body .main_ul li img{float:left; width:100px; height:90px; border:0;}
#box_02 .body .main_ul li div{width:340px; height:90px; float:right;}
#box_02 .body .main_ul li h1{display:block; height:20px; font-size:16px; font-weight:bold; line-height:16px;}
#box_02 .body .main_ul li p{height:18px; margin:6px 0 4px 0; display:block; line-height:18px;}
#box_02 .body .main_ul li p cite{float:left; display:block; background-image:url(./images/jiayinji/about_news_01.png); padding-left:24px; background-repeat:no-repeat; font-size:14px; padding-right:20px; font-style:normal;}
#box_02 .body .main_ul li p em{float:left; display:block; background-image:url(./images/jiayinji/about_news_02.png); padding-left:24px; background-repeat:no-repeat; font-size:14px; font-style:normal;}
#box_02 .body .main_ul li ins{}

#box_05 .body{padding-bottom:30px; padding-top:30px; width:900px; margin:auto;}
#box_05 .body img{ float:left; border:0;}


 
	</style>
  </head>
  
  <body  style="text-align: center;">    <!-- ****************************head******************************* -->
   <s:url action="cancelAction" namespace="/login" var="cancel"/>
<s:url action="memberAction" namespace="/login" var="member"/>
	<div class="top">
    	<div class="topcon">
        	<div class="welcome">欢迎访问家印记！</div>
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
    <script>
	var number=3; //定义条目数
	
	function close_m() {
		var temp;
		for (i=1;i<=number;i++) {
			temp = eval('dm_' + i);
			temp.style.display = 'none';
		}
	}
	
	function show_m(i) {
		temp = eval('dm_' + i);
		if (temp.style.display == 'none') {
			close_m();
			temp.style.display = '';
		}
		else {
			temp.style.display = 'none';
		}
	}
</script>
    <br/>
    <br/>
    <div id="main">
	<div id="box_01">
		<div class="title"><a onClick=javascript:show_m(1) href="javascript:void(null)"><img src="./images/jiayinji/about_box_01.png" /></a></div>
		<div class="body" id="dm_1">
			<img src="./images/jiayinji/about_box_01_01.png" /><br />
			<p>
				[家•印记]意指留下精彩瞬间，珍藏美好回忆，以传承为目的，对一个家庭或一个家族的重要生活节点及精致瞬间采用影像纪实的方式记录下来，以阶段性时间精裱成册或制作成影像图库，永续传承。特别是在当下充满朝气又怀揣浪漫情怀的青年人世界里，理性地告诉即将步入婚姻殿堂、组建新家庭的青年人，拍婚纱照不仅仅是漂亮照片，其背后的价值是一个家庭传承的新起点，是许多担当与责任的开始，而家印记是为未来的家族成员留下今天的家庭影像文化，让未来承载更多的回忆。
[家•印记]传承中华民族家谱文化的精髓，以图片为主，图文并茂地记录一个家庭的生活轨迹与幸福时刻。

    人的一生总有几个幸福时刻需要留下一些印记，用于珍藏或者作为若干年后回忆往昔幸福的途径。[家•印记]根据每个人一生当中所要拍摄照片的时间节点进行规划总结，并以此将摄影节点分为以下六大类：缘定、执手、十月、初生、足迹、纳福。
    [家•印记]以青年人市场为主导，抛弃呆板的模式化拍摄，追求简约、时尚、复古、电影、清新等拍摄手法，主张风格明显，个性定制，用绝对的激情及专业精神为您描绘一生回味的画卷。 

发展历程
[家•印记]源于上海禾吉文化传播有限公司，首家植入于启东名流影像馆，经过不断实践、优化，现已日趋成熟和完善，并且积累了丰富的品牌运营经验，得到当地新人高度认同，在整个摄影行业和社会当中获得良好的口碑效应。近年来，[家•印记]影像文化，已感召国内外许多婚纱影楼同行伙伴慕名而来，并积极加盟。在2014年岁末，[家•印记]品牌已逐步开始进行全国传播推广，旨在与志同道合者共同做一份爱的事业，把[家•印记]的幸福传递到千家万户，让每个有爱的家庭都有一本影像家谱，世代传承！

			</p>
				
		</div>
	</div>
	<div id="box_02">
		<div class="title"><a onClick=javascript:show_m(2) href="javascript:void(null)"><img src="./images/jiayinji/about_box_02.png" /></a></div>
		<div class="body" id="dm_2">
			<ul class="main_ul">
					<li>
					<a href="./news/1.jsp">
					<img src="./images/jiayinji/77c6f5776e7955300f6ef2665033c07f.jpg"/>
					<div>
						<h1>南通摄影狂欢节启东战盛大开幕</h1>
						<p>
							<cite></cite>
							<em>2015-02-06</em>
						</p>
						<ins>南通地区六县市影楼联合举行“南通摄影狂欢节”。一线品牌，全城联动！ 2月7日启东首站率</ins>
					</div>
					</a>
				</li>
					<li>
					<a href="./news/2.jsp">
					<img src="./images/jiayinji/5ebc47b27eb744c00d27004797055669.jpg"/>
					<div>
						<h1>幸福很简单，一个温暖的怀抱，一个可靠的肩膀</h1>
						<p>
							<cite></cite>
							<em>2015-01-26</em>
						</p>
						<ins>再有钱的男人也比不上一个知冷知热疼你的男人重要，再多的爱马仕也抵不过，每天早晨跑几条</ins>
					</div>
					</a>
				</li>
					<li>
					<a href="./news/3.jsp">
					<img src="./images/jiayinji/a244f71c8d370fc2803f645cc8ddd461.jpg"/>
					<div>
						<h1>幸福是包容，而不是忍耐</h1>
						<p>
							<cite></cite>
							<em>2015-01-20</em>
						</p>
						<ins>婚姻是一双鞋
逛街的时候看上了一双鞋
鞋的颜色款式你都特别喜欢
你就认定了这双鞋</ins>
					</div>
					</a>
				</li>
					<li>
					<a href="./news/4.jsp">
					<img src="./images/jiayinji/792def4babd82ef63fc919571081099d.jpg"/>
					<div>
						<h1>家，很平淡； 爱，很简单</h1>
						<p>
							<cite></cite>
							<em>2015-01-18</em>
						</p>
						<ins>家是停泊的港湾，家是幸福的源泉，家是生活的动力，家是温暖的依靠，家是心灵的乐园。</ins>
					</div>
					</a>
				</li>
					<li>
					<a href="./news/5.jsp">
					<img src="./images/jiayinji/350cf7e3e410c7d738b72ef90356a596.jpg"/>
					<div>
						<h1>原创歌曲【爱的天使】——家印记主题歌</h1>
						<p>
							<cite></cite>
							<em>2015-01-11</em>
						</p>
						<ins>在母亲河长江的入海口，
有这样一群人，
他们怀着对传统家文化的热爱，
孕育一个梦想，
梦想着</ins>
					</div>
					</a>
				</li>
					
					
				</ul>
			<div style="clear:both;"></div>
			<div class="pagelist_news">
				<ul>
								</ul>
			</div>
		</div>
	</div>
	
	
	<div id="box_05">
		<div class="title"><a onclick=javascript:show_m(3) href="javascript:void(null)"><img src="./images/jiayinji/about_box_05.png" /></a></div>
		<div class="body" id="dm_3">
			<img src="./images/jiayinji/about_brand01.png" />
			<img src="./images/jiayinji/about_brand02.png" />
			<img src="./images/jiayinji/about_brand03.png" />
			<img src="./images/jiayinji/about_brand04.png" />
			<img src="./images/jiayinji/about_brand05.png" />
			<img src="./images/jiayinji/about_brand06.png" />
		</div>	
		<div style="clear:both; height:30px;"></div>	
	</div>	
</div>
    
    <!-- ***************************************************************** -->
    
    
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
