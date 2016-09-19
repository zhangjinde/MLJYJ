<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>"><title>三亚旅拍</title>
         <script type="text/javascript" src="js/jquery-1.9.1.min.js">
        </script>
        
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/shop/grid.css">
        <link rel="stylesheet" href="css/shop/normalize.css">
        <link rel="stylesheet" href="css/shop/style.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script src="js/shop/jquery.min.js">
        </script>
        <script>
            window.jQuery || document.write('<script src="js/jquery-1.8.3.min.js"><\/script>')
        </script>
        <script src="js/shop/html5.js">
        </script>
        <script src="js/shop/main.js">
        </script>
        <script src="js/shop/radio.js">
        </script>
        <script src="js/shop/checkbox.js">
        </script>
        <script src="js/shop/selectBox.js">
        </script>
        <script src="js/shop/jquery.carouFredSel-5.2.2-packed.js">
        </script>
        <script src="js/shop/jquery.jqzoom-core.js">
        </script>
        <script src="js/shop/jquery.transit.js">
        </script>
        <script src="js/shop/jquery.easing.1.2.js">
        </script>
        <script src="js/shop/jquery.anythingslider.js">
        </script>
        <script src="js/shop/jquery.anythingslider.fx.js">
        </script>
		<script src="layer/layer.js">
        </script>
        <style type="text/css">
            .product_page .img_slid .next_prev #img_next.arows span {
                background: url(img/bg_arows.png) no-repeat -21px 0;
            }
            
            .product_page .img_slid .next_prev #img_next.arows:hover span {
                background: url(img/bg_arows.png) no-repeat -7px 0;
            }
            
            .arows span {
                background: url(img/bg_arows.png) no-repeat -14px 0;
                display: block;
                height: 13px;
                margin: 0;
                text-indent: -9999px;
                width: 7px;
            }
            
            .arows.next span {
                background: url(img/bg_arows.png) no-repeat -21px 0;
            }
            
            .arows:hover span {
                background: url(img/bg_arows.png) no-repeat 0 0;
            }
            
            .arows.next:hover span {
                background: url(img/bg_arows.png) no-repeat -7px 0;
            }
            
            /* radio */
            .niceRadio {
                width: 16px;
                height: 16px;
                overflow: hidden;
                display: inline-block;
                cursor: pointer;
                background: url(img/radio-bg.png) left top no-repeat;
            }
            
            .radioChecked {
                background-position: left bottom;
            }
            
            .niceRadio input {
                margin-left: -20px;
            }
            
            .product_page .entry_content .review a {
                background: url(img/review.png) no-repeat 0 0;
                display: block;
                float: left;
                height: 14px;
                margin: 0 3px 0 0;
                width: 14px;
            }
            
            .products_list article .review a {
                background: url(img/review.png) no-repeat 0 0;
                display: block;
                float: left;
                height: 14px;
                margin: 0 3px 0 0;
                width: 14px;
            }
            
            .evaluation .price a {
                background: url(img/review.png) no-repeat 0 0;
                display: block;
                float: left;
                height: 14px;
                margin: 0px 3px 0 0;
                width: 14px;
            }
            
            .compare tr.rating td .quality a {
                background: url(img/review.png) no-repeat 0 0;
                display: block;
                float: left;
                height: 14px;
                margin: 0px 2px 0 0;
                width: 14px;
            }
            
            .content {
                margin-top: 5px;
            }
            
            .content dt {
                width: 160px;
                display: inline-block;
                text-align: right;
                float:left;
            }
            
            .content dd {
                float: none;
                margin-left: 50px;
                margin-bottom: 5px;
            }
            
            .bay {
                float: left;
            }
            
            .new-btn-login-sp {
                float: left;
            }
            
            .username {
                float: left;
            }
            
            .tel {
                float: left;
            }
        </style>
        <script>
            $().ready(function(){
				var arr = document.getElementsByTagName('button');
				for (var i = 0; i < arr.length; i++) {
					arr[i].onclick = function(){
						var btnname = this.id;
						
					}
				}
                $.get("order/getOrderInfo.action", function(date, textStatus){
                    if (textStatus == 'success') {
                        if (date != null) {
                            //<input name="ordernum" id="ordernum" style="color:red;"/>
                            $("#ordernum").val(date);
                        }
                    }
                });
                //alipay/alipayapi.jsp
                $("#buy").click(function(){
                	
                	$("#alipayment").attr("action","alipay/alipayapi.jsp");
                	if ($("#order_username").val()== "" || $("#order_usertel").val() == "") {
                        alert("请认真填写个人信息 真实姓名+手机号码");
                      return false;
                    }
					else{
						$.post("order/saveOrder.action", $("#alipayment").serialize(), function(date, textStatus){
                            if (textStatus == 'success') {
                                if (date != null) {
                                	$("form:first").submit();
                                }
                            }
                            
                        });
					}
		  
                });
                $("#wxpay").click(function(){
                	if ($("#order_username").val()== "" || $("#order_usertel").val() == "") {
                        alert("请认真填写个人信息 真实姓名+手机号码");
                      return false;
                    }
					else{
						$.post("order/wxPay.action", $("#alipayment").serialize(), function(data, textStatus){
                            if (textStatus == 'success') {
                                if (data != null) {
									var dataobj = eval("(" + data + ")");
                                    var code_url=dataobj[0];
                                    var ordermoney=dataobj[1];
                                    var ordername=dataobj[2];
                                    var ordernum=dataobj[3];
                                    layer.open({
                                        type: 2,
										title:"微信支付",
                                        area: ['500px', '500px'],
                                        fix: false, //不固定
                                        offset: '100px',
                                        maxmin: false,
                                        content: "order/forCode.action?code_url="+code_url+"&"+"ordermoney="+ordermoney+"&"+"ordername="+ordername+"&"+"ordernum="+ordernum
                                    });
                                    
                                }
                            }

            
                        });
					}
		  
                });
            });
          
            function addfavorite(){
            
                var a = "http://www.jyj.me/shop/tx/lp/sanya_4999.jsp";
                var b = "三亚4999旅拍套餐";
                if (document.all) {
                    window.external.AddFavorite(a, b);
                }
                else 
                    if (window.sidebar) {
                        window.sidebar.addPanel(b, a, "");
                    }
                    else {
                        alert("对不起，您的浏览器不支持此操作!\n请您使用菜单栏或Ctrl+D收藏本页。");
                    }
            }
        </script>
    </head>
    <body>
        <!-- ****************************head******************************* --><s:url action="cancelAction" namespace="/login" var="cancel"/><s:url action="memberAction" namespace="/login" var="member"/>
        <div class="top">
            <div class="topcon">
                <div class="welcome">
                    欢迎访问家印记影像馆！
                </div>
                <s:if test="%{#request.session.usermain==null}">
                    <div class="loginreg">
                        <a href="login.jsp">登陆</a>
                        <a href="#">注册</a>
                    </div>
                </s:if>
                <s:else>
                    <div class="loginreg">
                        <a href='<s:property value="member"/>'><s:property value="%{#request.session.usermain.username }"/></a><a href='<s:property value="cancel"/>'>注销</a>
                    </div>
                </s:else>
                <div class="logo">
                    <a href=""><img src="images/logo.png" border="none" width="134" height="78" /></a>
                </div>
            </div>
        </div>
        <div class="navi">
            <ul>
                <li>
                    <a href="index.jsp">首页</a>
                </li>
                <li>
                    <a href="jiayinji.jsp">家印记</a>
                </li>
                <li>
                    <a href="active.jsp">最新活动</a>
                </li>
                <li>
                    <a href="yuepai.jsp">定制约拍</a>
                </li>
                <li>
                    <a href="shop.jsp">网络商城</a>
                </li>
                <li>
                    <a href="usershow.jsp">客照展示</a>
                </li>
                <li>
                    <a href="contactus.jsp">联系我们</a>
                </li>
                <li>
                    <a href='<s:property value="member"/>'>会员服务</a>
                </li>
            </ul>
        </div>
        <!-- ***************************************************************** -->
        <section id="main">
            <div class="container_12">
                <div id="content" class="grid_12">
                    <header>
                        <h1 class="page_title">三亚旅拍4999套餐</h1>
                    </header>
                    <article class="product_page">
                        <div class="grid_5 img_slid" id="products">
                            <img class="sale" src="img/sale.png" alt="Sale">
                            <div class="preview slides_container">
                                <div class="prev_bg">
                                    <a href="img/content/product1.png" class="jqzoom" rel='gal1' title=""><img src="img/content/product1.png" alt="Product 1" title=""></a>
                                </div>
                            </div><!-- .preview -->
                            <div class="next_prev">
                                <a id="img_prev" class="arows" href="#"><span>Prev</span></a>
                                <a id="img_next" class="arows" href="#"><span>Next</span></a>
                            </div>
                            <!-- .next_prev -->
                            <ul class="small_img clearfix" id="thumblist">
                                <li>
                                    <a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './img/content/product1.png',largeimage: './img/content/product1.png'}"><img src='img/content/product1.png' alt=""></a>
                                </li>
                                <li>
                                    <a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './img/content/product2.png',largeimage: './img/content/product2.png'}"><img src='img/content/product2.png' alt=""></a>
                                </li>
                                <li>
                                    <a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './img/content/product3.png',largeimage: './img/content/product3.png'}"><img src='img/content/product3.png' alt=""></a>
                                </li>
                                <li>
                                    <a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './img/content/product4.png',largeimage: './img/content/product4.png'}"><img src='img/content/product4.png' alt=""></a>
                                </li>
                                <li>
                                    <a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './img/content/product5.png',largeimage: './img/content/product5.png'}"><img src='img/content/product5.png' alt=""></a>
                                </li>
                            </ul><!-- .small_img -->
                            <div id="pagination">
                            </div>
                        </div>
                        <!-- .grid_5 -->
                        <div class="grid_7">
                            <div class="entry_content">
                                <span>浏览<strong>3</strong>次</span>
                            </div>
                            <h3>一次浪漫的邂逅，一段刻骨铭心的回忆，一次说走就走的旅行……我们的故事可以是平凡的，但肯定是最美丽的！多年之后还可以想起那一段旅途，我们一起数过的车窗外的灯光、海边的夕阳、沙滩上的海浪……</h3>
                            <div class="ava_price">
                                <div class="price">
                                    <div class="price_old">
                                        原价：6999元
                                    </div>
                                    网络价：4999元
                                </div>
                                <!-- .price -->
                                <br/>
                                <br/>
                                <br/>
                                <div class="clear">
                                </div>
                            </div>
                            <!-- .ava_price -->
                            <br/>
                            <div class="cart">
                                <form name=alipayment action="" method="post" id="alipayment"">
                                    <span class="new-btn-login-sp">
                                        <button class="bay" id="buy" style="text-align:center;" type="button">
                                            <img src="img/bg_cart.png" alt="Buy" title="">支付宝支付
                                        </button>
										<button class="wxbay" id="wxpay" style="text-align:center;" type="button">
                                            <img src="img/bg_cart.png" alt="Buy" title="">微 信 支 付&nbsp
                                        </button>
                                    </span><a href='javascript:void(0);' class="like" onclick="addfavorite()"><img src="img/like.png" alt="" title="">收藏</a>
                                    <dl class="content">
                                        <input name="ordernum" id="ordernum" type="hidden" style="color:red;"/><input name="ordername" value="三亚旅拍4999套餐" type="hidden" /><input name="ordermoney" value="4999" type="hidden" />
                                        </dd>
                                        <div class="username">
                                            <dt>
                                                用户姓名：（必填）
                                            </dt>
                                            <dd>
                                                <input type="text" name="order_username" id="order_username"/>
                                            </dd>
                                        </div>
                                        <div class="tel">
                                            <dt>
                                                用户手机：（必填）
                                            </dt>
                                            <dd>
                                                <input type="text" name="order_usertel" id="order_usertel"/>
                                            </dd>
                                        </div>
                                    </dl>
                                </form>
                            </div><!-- .cart -->
                        </div><!-- .entry_content -->
                        </div><!-- .grid_7 -->
                        <div class="clear">
                        </div>
                        <div class="grid_12">
                            <div id="wrapper_tab" class="tab1">
                                <a href="#" class="tab1 tab_link">宝贝描述</a>
                                <a href="#" class="tab2 tab_link">评论</a>
                                <div class="clear">
                                </div>
                                <div class="tab1 tab_body">
                                    <h4>一起去三亚，许你一次浪漫的暖冬之旅</h4>
                                    <p>
                                        4999（含拍摄、门票、接机、服务……）
                                    </p>
                                    <ul>
                                        <li>
                                            拍摄提供服装数量安排为：服装男女共6套
                                        </li>
                                        <li>
                                            造型服务如下：提供妆面3次/人，造型3组/人
                                        </li>
                                        <li>
                                            免费提供假睫毛
                                        </li>
                                        <li>
                                            拍摄至少120（外100）张，精选30张入册
                                        </li>
                                        <li>
                                            赠送全部拍摄电子档
                                        </li>
                                        <li>
                                            所选精修照片30张，额外购买精修入册30元/张
                                        </li>
                                        <li>
                                            刻盘赠送
                                        </li>
                                    </ul>
                                    <p>
                                        拍摄详情：海南三亚拍摄一天：浪漫游艇拍摄，海南珊瑚群礁石拍摄，椰梦长廊、草坪拍摄，时尚酒吧街、梦幻电影拍摄，阳光海岸、唯美飘纱、落日余晖拍摄，三亚西岛拍摄。
                                    </p>
                                    <ol>
                                        <li>
                                            提供爱会所6号影视基地拍摄服务
                                        </li>
                                        <li>
                                            提供服装男女共2套，妆面1次/人，造型1组/人
                                        </li>
                                        <li>
                                            提供结婚当天新娘粉色丽人化妆造型一次，需提前预约到店化妆
                                        </li>
                                        <li>
                                            提供结婚当天新娘嫁衣抵用券200元
                                        </li>
                                    </ol>
                                    <p>
                                        拍摄完成后：
                                    </p>
                                    <ol>
                                        <li>
                                            18寸韩式水晶相册20张精修入册
                                        </li>
                                        <li>
                                            9寸新款韩风相册10张精修入册
                                        </li>
                                        <li>
                                            50寸巨幅海报一幅
                                        </li>
                                        <li>
                                            36寸豪华相框-幅
                                        </li>
                                        <li>
                                            36寸高档富士淋膜放大照片一张
                                        </li>
                                        <li>
                                            30寸高档相框一幅
                                        </li>
                                        <li>
                                        30寸高档富士淋膜放大照片一张/li>
                                        <li>
                                            10寸施华洛版画一幅
                                        </li>
                                        <li>
                                            6X12玉石摆台一幅
                                        </li>
                                        <li>
                                            喜卡20份
                                        </li>
                                        <li>
                                            免费提供全国首家爱情见证机构价值1980元见证仪式，服务人员为：摄影师2名+司仪1名+宣导师1名+音响师1名
                                        </li>
                                    </ol>
                                    <p>
                                        往返机票、用餐、住宿费用新人自理
                                    </p>
                                    <div class="clear">
                                    </div>
                                    <img alt="" src="img/sanya1.jpg">
                                </div><!-- .tab1 .tab_body -->
                                <div class="tab2 tab_body">
                                    <h4>用户评价</h4>
                                    <ul class="comments">
                                        <li>
                                            <div class="autor">
                                                用户姓名
                                            </div>
                                            <time datetime="2012-11-03">
                                                时间
                                            </time>
                                            <div class="evaluation">
                                                <div class="price">
                                                    <span>服务</span>
                                                    <a class="plus" href="#"></a>
                                                    <a class="plus" href="#"></a>
                                                    <a class="plus" href="#"></a>
                                                    <a href="#"></a>
                                                    <a href="#"></a>
                                                </div>
                                                <div class="price">
                                                    <span>价格</span>
                                                    <a class="plus" href="#"></a>
                                                    <a class="plus" href="#"></a>
                                                    <a class="plus" href="#"></a>
                                                    <a class="plus_minus" href="#"></a>
                                                    <a href="#"></a>
                                                </div>
                                                <div class="clear">
                                                </div>
                                            </div>
                                            <!-- .evaluation -->
                                            <p>
                                                用户评价详情
                                            </p>
                                        </li>
                                    </ul>
                                    <!-- .comments -->
                                    <form class="add_comments">
                                        <h4>用户体验反馈</h4>
                                        <div class="evaluation">
                                            <div class="quality">
                                                服务
                                                <sup>
                                                    *
                                                </sup>
                                                <input class="niceRadio" type="radio" name="quality" value="1"><span class="eva_num">1</span>
                                                <input class="niceRadio" type="radio" name="quality" value="2"><span class="eva_num">2</span>
                                                <input class="niceRadio" type="radio" name="quality" value="3"><span class="eva_num">3</span>
                                                <input class="niceRadio" type="radio" name="quality" value="4"><span class="eva_num">4</span>
                                                <input class="niceRadio" type="radio" name="quality" value="5"><span class="eva_num">5</span>
                                            </div>
                                            <div class="price">
                                                价格
                                                <sup>
                                                    *
                                                </sup>
                                                <input class="niceRadio" type="radio" name="price" value="1"><span class="eva_num">1</span>
                                                <input class="niceRadio" type="radio" name="price" value="2"><span class="eva_num">2</span>
                                                <input class="niceRadio" type="radio" name="price" value="3"><span class="eva_num">3</span>
                                                <input class="niceRadio" type="radio" name="price" value="4"><span class="eva_num">4</span>
                                                <input class="niceRadio" type="radio" name="price" value="5"><span class="eva_num">5</span>
                                            </div>
                                            <div class="clear">
                                            </div>
                                        </div>
                                        <!-- .evaluation -->
                                        <div class="text_review">
                                            <br/>
                                            <br/>
                                            <br/>
                                            <strong>评价</strong>
                                            <sup>
                                                *
                                            </sup>
                                            <br>
                                            <textarea name="text">
                                            </textarea>
                                            <br>
                                        </div>
                                        <!-- .text_review -->
                                        <br/>
                                        <br/>
                                        <br/>
                                        <div class="nickname">
                                            <strong>用户昵称</strong>
                                            <sup>
                                                *
                                            </sup>
                                            <br>
                                            <input type="text" name="" class="" value="">
                                        </div><!-- .nickname -->
                                        <div class="your_review">
                                            <strong>总体评价</strong>
                                            <sup>
                                                *
                                            </sup>
                                            <br>
                                            <input type="text" name="" class="" value="">
                                        </div><!-- .your_review -->
                                        <div class="clear">
                                        </div>
                                        <input type="submit" value="提交">
                                    </form><!-- .add_comments -->
                                    <div class="clear">
                                    </div>
                                </div>
                                <!-- .tab2 .tab_body -->
                                <div class="clear">
                                </div>
                            </div>​<!-- #wrapper_tab -->
                            <div class="clear">
                            </div>
                        </div>
                        <!-- .grid_12 -->
                    </article>
                    <!-- .product_page -->
                </div>
                <!-- #content -->
            </div>
            <!-- .container_12 -->
        </section>
        <!-- #main -->
        <div class="clear">
        </div>
        <!-- ****************************foot******************************* -->
        <div class="footer">
            <div class="foocon">
                <div class="banquan">
                    <a href="jiayinji.jsp">关于我们</a>
                    | <a href="common.jsp">常见问题</a>
                    | <a href="law.jsp">法律声明</a>
                    | <a href="contactus.jsp">联系我们</a>
                    <br/>
                    Copyright © 2003-2015家印记 All Rights Reserved
                </div>
                <div class="footlogo">
                    <img src="images/footlogo.png" alt="footlogo"/>
                </div>
                <div class="link">
                    <a href="javascript:void(0)" id="wx"><img src="images/weixin.png" border="none" width="36" height="33" /></a><a href="http://weibo.com/u/5592645081" target="_blank" rel="nofollow" title="家印记官方微博" class="wb"><img src="images/weibo.png" border="none" width="40" height="33" /></a><a href="http://wpa.qq.com/msgrd?v=3&uin=800018109&site=qq&menu=yes" target="_blank"><img src="images/qq.png" border="none" width="30" height="32" /></a>
                </div>
            </div>
        </div>
        <div class="erweima" id="ewm">
            <img src="images/erweima.jpg" width="200" height="200" />
        </div>
        <script>
            $("#wx").hover(function(){
                $(".erweima").show();
            }, function(){
                $(".erweima").hide();
            });
        </script>
    </body>
</html>
