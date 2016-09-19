<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>约拍</title>
        <base href="<%=basePath%>">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="this is my page">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
        <style>
            /* white */
            .white {
                color: #606060;
                border: solid 1px #b7b7b7;
                background: #fff;
                background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));  
                background: -moz-linear-gradient(top,  #fff,  #ededed);  
                filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');  
            }  
            .white:hover {  
                background: #ededed;  
                background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));  
                background: -moz-linear-gradient(top,  #fff,  #dcdcdc);  
                filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');  
            }  
            .white:active {  
                color: #999;  
                background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));  
                background: -moz-linear-gradient(top,  #ededed,  #fff);  
                filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');  
            } 
            /* button   
            ---------------------------------------------- */  
            .button {  
                display: inline-block;  
                zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */  
                *display: inline;  
                vertical-align: baseline;  
                margin: 0 2px;  
                outline: none;  
                cursor: pointer;  
                text-align: center;  
                text-decoration: none;  
                font: 14px/100% Arial, Helvetica, sans-serif;  
                padding: .5em 2em .55em;  
                text-shadow: 0 1px 1px rgba(0,0,0,.3);  
                -webkit-border-radius: .5em;   
                -moz-border-radius: .5em;  
                border-radius: .5em;  
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
                box-shadow: 0 1px 2px rgba(0,0,0,.2);  
            }  
            .button:hover {  
                text-decoration: none;  
            }  
            .button:active {  
                position: relative;  
                top: 1px;  
            }  
              
            .bigrounded {  
                -webkit-border-radius: 2em;  
                -moz-border-radius: 2em;  
                border-radius: 2em;  
            }  
            .medium {  
                font-size: 12px;  
                padding: .4em 1.5em .42em;  
            }  
            .small {  
                font-size: 11px;  
                padding: .2em 1em .275em;  
            }  
            .contain{
            	text-align:center;
            	padding:30px;
            }
            .contain button{
            	padding:20px;
            	margin-left:50px;
            }
            #bottom {
            	height:auto;
				width:100%;
				
            }
            .tab_content{
            	height:auto;
				width:100%;
				position:relative;
            }
            
        </style>
        <script>
            $(document).ready(function(){
				
                $(".contain button").each(function(index){
               
                    $(this).click(function(){
                    	$("div#bottom div").hide();
                       // $("div#bottom div.tab_content:eq("+index+")").show();
                        if(index==0){
                        	
                        	$("#mainframe").attr("src","yp/placeOrderAction_list.action");
                        	
                        	
                        }
                        else{
                        	
                        	$("#mainframe").attr("src","yp/employeesActionList.action");
                        }
                        $("div#bottom div").show();
                    })
                })
                
            });
        </script>
    </head>
    <body>
        <div class="contain">
            <button name="orderlist" id="orderlist" class="button white">
                订单管理
            </button>
            <button name="person" id="person" class="button white">
                人员管理
            </button>
        </div>
        <hr width=90% size=3 color=Silver style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
        <div id="bottom">
        	
            <div class="tab_content" style="display:none;">
            <iframe name="mainframe" id="mainframe" width="100%" height="900px" scrolling="yes" frameborder="0"></iframe>
               
            </div>
            
        </div>
    </body>
</html>
