<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head data-gwd-animation-mode="proMode">
	 <base href="<%=basePath%>">
  <meta charset="utf-8">
  <title>个人信息</title>
  <meta name="generator" content="Google Web Designer 1.4.2.0915">
  <meta name="template" content="Expandable 2.2.4">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style type="text/css" id="gwd-lightbox-style">
    .gwd-lightbox {
      overflow: hidden;
    }
  </style>
  <style type="text/css">
    html, body {
      width: 100%;
      height: 100%;
      margin: 0px;
    }
    .gwd-page-container {
      position: relative;
      width: 100%;
      height: 100%;
    }
    .gwd-page-content {
      -webkit-transform: perspective(1400px) matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
      -webkit-transform-style: preserve-3d;
      position: absolute;
      background-color: transparent;
    }
    .gwd-page-wrapper {
      position: absolute;
      -webkit-transform: translateZ(0px);
      background-color: rgb(255, 255, 255);
    }
    .page1-content {
      width: 100%;
      height: 100%;
    }
    @-webkit-keyframes gwd-empty-animation {
      0% {
        opacity: 0.001;
      }
      100% {
        opacity: 0;
      }
    }
    .gwd-img-tcm1 {
      position: absolute;
      width: 720px;
      height: 70px;
      left: -81px;
      top: -69.65px;
    }
    .gwd-div-1h5x {
      position: absolute;
      width: 125px;
      height: 60px;
      text-align: left;
      border: 3px none rgb(238, 236, 236);
      color: rgb(255, 255, 255);
      border-image-source: none;
      font-size: 40px;
      font-family: fantasy;
      top: -67px;
      opacity: 1;
      left: 35%;
    }
    @-webkit-keyframes gwd-gen-wr7agwdanimation_gwd-keyframes {
      0% {
        left: -81px;
        top: -69.65px;
        -webkit-animation-timing-function: linear;
      }
      33.33% {
        left: -78px;
        top: -0.650000000000517px;
        -webkit-animation-timing-function: linear;
      }
      100% {
        left: -78px;
        top: -0.649999976158142px;
        -webkit-animation-timing-function: linear;
      }
    }
    #page1.gwd-play-animation .gwd-gen-wr7agwdanimation {
      -webkit-animation: gwd-gen-wr7agwdanimation_gwd-keyframes 0.9s linear 0s 1 normal forwards;
    }
    [data-gwd-group="btn"] .gwd-grp-uvuf.gwd-imagebutton-1498 {
      position: absolute;
      border-width: 3px;
      border-style: none;
      -webkit-transform-style: preserve-3d;
      -webkit-transform-origin: 71px 71px 0px;
      -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
      width: 128px;
      height: 128px;
      left: 0px;
      top: 0px;
    }
    [data-gwd-group="btn"] .gwd-grp-uvuf.gwd-img-mfdg {
      position: absolute;
      width: 128px;
      height: 128px;
      left: 1px;
      top: 0px;
    }
    [data-gwd-group="btn"] {
      width: 129px;
      height: 128px;
    }
    .gwd-div-evwf {
      position: absolute;
      top: 402px;
      left: 35%;
    }
    @-webkit-keyframes gwd-gen-ryvqgwdanimation_gwd-keyframes {
      0% {
        top: 402px;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      16.67% {
        top: 155px;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      66.67% {
        top: 155px;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      100% {
        top: -133px;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
    }
    #page1.gwd-play-animation .gwd-gen-ryvqgwdanimation {
      -webkit-animation: gwd-gen-ryvqgwdanimation_gwd-keyframes 1.2s linear 0s 1 normal forwards;
    }
    #page1.gwd-play-animation .gwd-gen-1rcsgwdanimation {
      -webkit-animation: gwd-gen-1rcsgwdanimation_gwd-keyframes 1.2s linear 0s 1 normal forwards;
    }
    #page1.gwd-play-animation .event-1-animation {
      -webkit-animation: gwd-empty-animation 0.8s linear 0s 1 normal forwards;
    }
    #page1.gwd-pause-animation .event-1-animation {
      -webkit-animation-play-state: paused !important;
    }
    .gwd-play-animation .gwd-pause-animation .gwd-gen-170vgwdanimation {
      -webkit-animation-play-state: paused !important;
    }
    .gwd-div-waim {
      -webkit-transform: translate3d(15px, 0px, 0px);
      -webkit-transform-style: preserve-3d;
    }
    #page1.gwd-play-animation .gwd-gen-8jjjgwdanimation {
      -webkit-animation: gwd-gen-8jjjgwdanimation_gwd-keyframes 1.2s linear 0s 1 normal forwards;
    }
    #page1.gwd-play-animation .gwd-gen-8jjjgwdanimation {
      -webkit-animation: gwd-gen-8jjjgwdanimation_gwd-keyframes 1.2s linear 0s 1 normal forwards;
    }
    @-webkit-keyframes gwd-gen-1ob2gwdanimation_gwd-keyframes {
      0% {
        opacity: 0;
        -webkit-animation-timing-function: linear;
      }
      75% {
        opacity: 0;
        -webkit-animation-timing-function: linear;
      }
      100% {
        opacity: 1;
        -webkit-animation-timing-function: linear;
      }
    }
    .gwd-div-1qq2 {
      position: absolute;
      text-align: left;
      width: 125px;
      height: 60px;
      font-size: 30px;
      font-family: fantasy;
      color: rgb(255, 255, 255);
      left: 35%;
      top: 5px;
      opacity: 0;
    }
    @-webkit-keyframes gwd-gen-1rcsgwdanimation_gwd-keyframes {
      0% {
        top: -67px;
        opacity: 1;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      33.33% {
        top: 4px;
        opacity: 1;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      50% {
        top: -31px;
        opacity: 1;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      58.33% {
        top: 4px;
        opacity: 1;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      66.67% {
        top: 4px;
        opacity: 1;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
      100% {
        top: 4px;
        opacity: 0;
        left: 35%;
        -webkit-animation-timing-function: linear;
      }
    }
    @-webkit-keyframes gwd-gen-iu2egwdanimation_gwd-keyframes {
      0% {
        opacity: 0;
        -webkit-animation-timing-function: linear;
      }
      66.67% {
        opacity: 0;
        -webkit-animation-timing-function: linear;
      }
      100% {
        opacity: 1;
        -webkit-animation-timing-function: linear;
      }
    }
    #page1.gwd-play-animation .gwd-gen-iu2egwdanimation {
      -webkit-animation: gwd-gen-iu2egwdanimation_gwd-keyframes 1.2s linear 0s 1 normal forwards;
    }
    #page1.gwd-pause-animation .gwd-gen-ryvqgwdanimation {
      -webkit-animation-play-state: paused !important;
    }
    #page1.gwd-pause-animation .gwd-gen-1rcsgwdanimation {
      -webkit-animation-play-state: paused !important;
    }
    #page1.gwd-pause-animation .gwd-gen-wr7agwdanimation {
      -webkit-animation-play-state: paused !important;
    }
    #page1.gwd-pause-animation .gwd-gen-iu2egwdanimation {
      -webkit-animation-play-state: paused !important;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-ur0w {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 100px;
      top: -5px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-mwk1 {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 100px;
      top: -5px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-k59e {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 100px;
      top: -5px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-15tr {
      -webkit-transform: translate3d(-345px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 100px;
      top: -5px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-input-19c5 {
      -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
      -webkit-transform-style: preserve-3d;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-1j74 {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 15%;
      top: -128px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-1gq9 {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 15%;
      top: -128px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-1ytn {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 15%;
      top: -128px;
    }
    [data-gwd-group="formall"] .gwd-grp-1v8m.gwd-div-1vld {
      -webkit-transform: translate3d(-346px, 128px, 0px);
      -webkit-transform-style: preserve-3d;
      width: 500px;
      left: 15%;
      top: -128px;
    }
    [data-gwd-group="formall"] {
      width: 501px;
      height: 168px;
    }
    .gwd-div-1gu6 {
      position: absolute;
      left: -533.499999999999px;
      top: 102px;
    }
    #page1.gwd-play-animation .gwd-gen-1iefgwdanimation {
      -webkit-animation: gwd-gen-1iefgwdanimation_gwd-keyframes 1.2s linear 0s 1 normal forwards;
    }
    #page1.gwd-pause-animation .gwd-gen-1iefgwdanimation {
      -webkit-animation-play-state: paused !important;
    }
    @-webkit-keyframes gwd-gen-1iefgwdanimation_gwd-keyframes {
      0% {
        left: -533.499999999999px;
        top: 102px;
        -webkit-animation-timing-function: linear;
      }
      66.67% {
        left: 27.4999999999965px;
        top: 16px;
        -webkit-animation-timing-function: linear;
      }
      100% {
        left: 120%;
        top: 16px;
        -webkit-animation-timing-function: linear;
      }
    }
  </style>
 
  <link href="wx_user/gwdpage_style.css" data-version="8" data-exports-type="gwd-page" rel="stylesheet">
  <link href="wx_user/gwdimage_style.css" data-version="6" data-exports-type="gwd-image" rel="stylesheet">
  <link href="wx_user/gwdpagedeck_style.css" data-version="8" data-exports-type="gwd-pagedeck" rel="stylesheet">
  <script data-source="wx_user/googbase_min.js" data-version="3" data-exports-type="googbase" type="text/javascript" src="wx_user/googbase_min.js"></script>
  <script data-source="wx_user/gwd_webcomponents_min.js" data-version="4" data-exports-type="gwd_webcomponents" type="text/javascript" src="wx_user/gwd_webcomponents_min.js"></script>
  <script data-source="wx_user/gwdpage_min.js" data-version="8" data-exports-type="gwd-page" type="text/javascript" src="wx_user/gwdpage_min.js"></script>
  <script data-source="wx_user/gwdpagedeck_min.js" data-version="8" data-exports-type="gwd-pagedeck" type="text/javascript" src="wx_user/gwdpagedeck_min.js"></script>
  <script data-source="wx_user/gwdimage_min.js" data-version="6" data-exports-type="gwd-image" type="text/javascript" src="wx_user/gwdimage_min.js"></script>
  <script data-source="wx_user/gwdimagebutton_min.js" data-version="4" data-exports-type="gwd-imagebutton" type="text/javascript" src="wx_user/gwdimagebutton_min.js"></script>
  <script type="text/javascript" src="wx_user/groups_runtime.min.1.0.js" gwd-groups-version="1.0"></script>
  <script type="text/javascript" src="wx_user/gwdid.min.1.0.js" gwd-gwdid-version="1.0"></script>
  <script type="text/javascript" gwd-events="support" src="wx_user/gwd-events-support.1.0.js"></script>
  <script type="text/javascript" gwd-events="handlers">
    gwd.auto_Page1Event_1 = function(event) {
      // GWD Predefined Function
      gwd.actions.timeline.pause('page1');
    };
    gwd.auto_HomeClick = function(event) {
      // GWD Predefined Function
      gwd.actions.timeline.play('page1');
    };
  </script>
  <script type="text/javascript" gwd-events="registration">
    // Google Web Designer中的事件处理支持代码
     // 此脚本块是自动生成的。请勿修改！
    gwd.actions.events.registerEventHandlers = function(event) {
      gwd.actions.events.addHandler('page1', 'event-1', gwd.auto_Page1Event_1, false);
      gwd.actions.events.addHandler('home', 'click', gwd.auto_HomeClick, false);
      gwd.actions.timeline.captureAnimationEnd(document.body);
    };
    gwd.actions.events.deregisterEventHandlers = function(event) {
      gwd.actions.events.removeHandler('page1', 'event-1', gwd.auto_Page1Event_1, false);
      gwd.actions.events.removeHandler('home', 'click', gwd.auto_HomeClick, false);
      gwd.actions.timeline.releaseAnimationEnd(document.body);
    };
    document.addEventListener("DOMContentLoaded", gwd.actions.events.registerEventHandlers);
    document.addEventListener("unload", gwd.actions.events.deregisterEventHandlers);
  </script>
  <script src="js/jquery-1.9.1.min.js" type="text/javascript">
  </script>
  <script src="layer/layer.js" type="text/javascript">
  </script>
  <script>
  	function updatebtn(){
			var username=$("#username").val();
			var user_password=$("#user_password").val();
			var user_nickname=$("#user_nickname").val();
			var uv_name=$("#uv_name").val();
			var tel=$("#tel").val();
			var qq=$("#qq").val();
			var weixin=$("#weixin").val();
			var workunit=$("#workunit").val();
			var openid=$("#openid").val();
			$.post("wxTextService_updateuser",{username:username,password:user_password,nickname:user_nickname,uv_name:uv_name,tel:tel,qq:qq,weixin:weixin,workunit:workunit,openid:openid},function(data,textStatus){
				if(textStatus=="success"){
					if(data=="ok"){
						layer.msg("更新成功");
					}else{
						layer.msg("更新失败，请联系客服。");
					}
				}
			});
  	}
  </script>
   
</head>

<body class="document-body">
  <template id="gwd-group-definitions">
    <div data-gwd-group-def="btn" data-gwd-group-class="gwd-grp-uvuf" style="display:none">
      <gwd-imagebutton up-image="" over-image="" down-image="" scaling="cover" class="gwd-imagebutton-1498 gwd-grp-uvuf" data-gwd-grp-id="gwd-imagebutton_1"></gwd-imagebutton>
      <img is="gwd-image" source="wx_user/assets/ooopic_1457613397.png" class="gwd-img-mfdg gwd-grp-uvuf" data-gwd-grp-id="gwd-image_2">
    </div>
    <div data-gwd-group-def="formall" data-gwd-group-class="gwd-grp-1v8m" style="display:none">
      <div class="gwd-div-waim gwd-div-ur0w gwd-grp-1v8m">
        账号：
        <input type="textfiled" class="gwd-input-19c5 gwd-grp-1v8m" id="username" value="<s:property value='um.username'/>" readonly="true">
      </div>
      <div class="gwd-div-waim gwd-div-mwk1 gwd-grp-1v8m">
        密码：
        <input type="password" class="gwd-grp-1v8m" id="user_password" value="<s:property value='um.user_password'/>">
      </div>
      <div class="gwd-div-waim gwd-div-k59e gwd-grp-1v8m">
        昵称：
        <input type="textfiled" class="gwd-grp-1v8m"  id="user_nickname" value="<s:property value='um.user_nickname'/>">
      </div>
      <div class="gwd-div-waim gwd-div-15tr gwd-grp-1v8m">
        姓名：
        <input type="textfiled" class="gwd-grp-1v8m" id="uv_name" value="<s:property value='um.uservice.uv_name'/>">
      </div>
      <div class="gwd-div-waim gwd-div-1j74 gwd-grp-1v8m">
        电话：
        <input type="textfiled" class="gwd-grp-1v8m" id="tel" value="<s:property value='um.uservice.tel'/>">
      </div>
      <div class="gwd-div-waim gwd-div-1gq9 gwd-grp-1v8m">
        Q Q ：
        <input type="textfiled" class="gwd-grp-1v8m" id="qq" value="<s:property value='um.uservice.qq'/>">
      </div>
      <div class="gwd-div-waim gwd-div-1ytn gwd-grp-1v8m">
        微信：
        <input type="textfiled" class="gwd-grp-1v8m" id="weixin" value="<s:property value='um.uservice.weixin'/>">
      </div>
      <div class="gwd-div-waim gwd-div-1vld gwd-grp-1v8m">
        单位：
        <input type="textfiled" class="gwd-grp-1v8m" id="workunit" value="<s:property value='um.uservice.workunit'/>">
      </div>
      <input type="textfiled" id="openid" value="<s:property value='um.uservice.openid'/>" style="display:none;"/>
      <div class="gwd-div-waim gwd-div-1vld gwd-grp-1v8m">
       <button class="gwd-grp-1v8m" id="updatebtn" onclick="updatebtn()">修改</button>
      </div>
    </div>
  </template>
  <div is="gwd-pagedeck" class="gwd-page-container" id="pagedeck">
    <div is="gwd-page" id="page1" class="gwd-page-wrapper page1-content gwd-lightbox" data-gwd-width="550px" data-gwd-height="400px" style="" data-gwd-name="">
      <div class="gwd-page-content page1-content">
        <img is="gwd-image" source="wx_user/assets/wxpersonal.png" id="gwd-image_1" class="gwd-img-tcm1 gwd-gen-wr7agwdanimation">
        <div class="gwd-div-1h5x gwd-gen-1rcsgwdanimation">家印记</div>
        <div class="gwd-div-1gu6 gwd-gen-1iefgwdanimation" data-gwd-group="formall" id="formall"></div>
        <div class="gwd-div-evwf gwd-gen-ryvqgwdanimation" data-gwd-group="btn" id="home"></div>
        <gwd_animation_pause_element></gwd_animation_pause_element>
        <div class="gwd-animation-event event-1-animation" data-event-name="event-1" data-event-time="800"></div>
        <div class="gwd-div-1qq2 gwd-gen-iu2egwdanimation">个人信息</div>
      </div>
    </div>
  </div>
  
  <script type="text/javascript" id="gwd-init-code">
    (function() {
      document.body.style.opacity = "0";
      var pageDeck = document.getElementById('pagedeck');
      /**
       * Handles the DOMContentLoaded event. The DOMContentLoaded event is
       * fired when the document has been completely loaded and parsed.
       */

      function handleDomContentLoaded(event) {}

      /**
       * Handles the WebComponentsReady event. This event is fired when all
       * custom elements have been registered and upgraded.
       */
      function handleWebComponentsReady(event) {
        document.body.style.opacity = "";
        setTimeout(function() {
          pageDeck.goToPage(pageDeck.getDefaultPage().id);
        }, 0);
      }

      window.addEventListener('DOMContentLoaded',
        handleDomContentLoaded, false);
      window.addEventListener('WebComponentsReady',
        handleWebComponentsReady, false);
    })();
  </script>
  
  <div style="position:fixed;bottom:0;text-align:center; margin-left: 35%;margin-right: auto;">上海善智网络科技</div>



</body>

</html>