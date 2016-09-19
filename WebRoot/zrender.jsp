<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zrender.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="zrender/asset/js/jquery.js"></script>
    <script src="zrender/asset/js/esl/esl.js"></script>
	<link href="zrender/asset/css/bootstrap.css" rel="stylesheet">
    <link href="zrender/asset/css/bootstrap-responsive.css" rel="stylesheet">
  </head>
  
  <body>
    <div id="main" style="width:2000px;height:1000px;"></div>
    <script type="text/javascript">
    var zr; // 全局可用zrender对象
    var domMain = document.getElementById('main');
 // 路径配置
	require.config({
	packages: [
    {
        name: 'zrender',
        location: 'zrender/src',
        main: 'zrender'
    }
]
});
    var color;
    var colorIdx = 0;
    var width;
    var height;
    require(
        ['zrender', 'zrender/shape/Ring', 'zrender/shape/Trochoid',],
        function (zrender,RingShape) {
              
            zr = zrender.init(domMain);
              color = require('zrender/tool/color');
             
              width = Math.ceil(zr.getWidth());
              height = Math.ceil(zr.getHeight());
              var x=1000;
              var y=300;
              var size=50;
              setTimeout(function(){
            	  addring(RingShape,x,y,size);
            	  addringmove(RingShape,x,y,size);
            	  setTimeout(function(){
            		  addringmove(RingShape,x,y,size);
                	  setTimeout(function(){
                		  addringmove(RingShape,x,y,size);
                      },1000);
                  },1000);
              },0);
              
              //setTimeout(function(){
            	  //zr.clear();
              //},5000);
              
              
        }
    )
    function addring(RingShape,x,y,size){
    	var ring=new RingShape({
    	    style : {
    	        x :1000,
    	        y : 300,
    	        r : size,
    	        r0 : size-5,
    	        color : 'rgba(255, 134, 13, 0.6)',
    	        //text:'ring'
    	    },
    	    draggable : false,
    	    highlightStyle:false
    	});
    	zr.addShape(ring);
    	zr.render();
    }
 	function addringmove(RingShape,x,y,size){
    	
    	var ring=new RingShape({
    	    style : {
    	        x : x,
    	        y : y,
    	        r : size,
    	        r0 : size-5,
    	        color : 'rgba(255, 134, 13, 0.6)',
    	        //text:'ring'
    	    },
    	    draggable : false
    	});
    	zr.addShape(ring);
    	zr.render();
    	var tm1 = zr.animate( ring.id, "", true)
        .when(1000, {
            position : [-4, -4]
        })
        .when(2000, {
            position : [4, -4]
        })
        .when(3000, {
            position : [4, 4]
        })
        .when(4000, {
            position : [-4, 4]
        })
        .when(5000, {
            position : [0, 0]
        })
        .start();

    zr.animate(ring.id, 'style', true)
        .when(4000, {
            color: 'rgba(255, 134, 13, 0.6)'
        })
        .start();
    }
   
    </script>
  </body>
</html>
