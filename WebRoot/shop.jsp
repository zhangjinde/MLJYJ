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
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>名流商城</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/jquery.cycle.all.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>
<style type="text/css">
.footer{
margin-top: 108px;
}
</style>

  </head>
  
  <body>
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
    <div class="shop">
        <div class="shopleft">
        	<div class="shoptt">套系分类</div>
            <div class="mod-category">
                        <div class="list">
                            <a class="title" href=""><img src="images/ico1.png" width="15" height="15" />婚纱</a>
                            <ul>
                                <li>
                                    <a href="javascript:void(0)" class="titles"><img src="images/ico11.jpg" width="24" height="35" />旅拍系列</a>
                                    <a href="shop/tx/lp/sanya_4999.jsp" target="_black">三亚4999</a>
                                    <a href="shop/tx/lp/sanya_7999.jsp" target="_black">三亚7999</a>
                                   
                                </li>
                                
                                <li>
                                    <a href="javascript:void(0)" class="titles"><img src="images/ico11.jpg" width="24" height="35" />主题婚纱</a>
                                    <a href="" target="_black">爱的旋律</a>
                                    <a href="" target="_black">花瓣之恋</a>
                                   
                               
                                </li>
                               
                            </ul>
              			</div>
              			
                        <div class="list">
                            <a href="" class="title"><img src="images/ico2.png" width="15" height="15" />写真</a>
                            
                        </div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico3.png" width="15" height="15" />全家福</a>
                            
                        </div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico4.png" width="15" height="15" />微电影 </a>
                           
                        </div>
          </div>
          <div class="shoptt">周边分类</div>
            <div class="mod-category">
                        <div class="list">
                            <a class="title" href=""><img src="images/ico5.png" width="15" height="15" />生日</a>
                           
              			</div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico6.png" width="15" height="15" />结婚纪念</a>
                           
                        </div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico7.png" width="15" height="15" />宝宝专区</a>
                            
                        </div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico8.png" width="15" height="15" />婚纱 </a>
                            
                        </div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico9.png" width="15" height="15" />礼服 </a>
                           
                        </div>
                        <div class="list">
                            <a href="" class="title"><img src="images/ico10.png" width="15" height="15" />长辈 </a>
                            
                        </div>
                        
          </div>
        </div>
        
        <div class="shopright">
        	<div class="photo">
            	<a target="_blank" href="shop/tx/lp/sanya_4999.jsp" ><img src="img/content/product4.png" alt="三亚4999" /></a>
            </div>
            <div class="photo">
            	<a target="_blank" href="shop/tx/lp/sanya_7999.jsp" ><img src="img/content/product2.png" alt="三亚7999" /></a>
            </div>
            
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
    <div class="erweima" id="ewm"><img src="images/erweima.jpg" width="300" height="300" /></div>
</body>
</html>
