<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<title>家印记</title>
	<meta name="description" content="app, web app, responsive, responsive layout, admin, admin panel, admin dashboard, flat, flat ui, ui kit, AngularJS, ui route, charts, widgets, components" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
	<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/font.css" type="text/css" />
	<link rel="stylesheet" href="css/app.css" type="text/css" />
	
	<style>
		.navbar{
			border-radius:1px;
			box-shadow:1px 1px 1px #888888;
		}
		.navbar-nav {
			margin: 0px 0px;
		}
		#conrent,#app{
			position:relative;
		}
		#number {
			font-size: 30px;
			color: #E2137D;
			font-weight: 700;
			filter: dropshadow(color=#f6f6f9, offx=0, offy=1);
		}
		.count{
			margin-top:10px;
			font-size:16px;
			letter-spacing:3px;
			float: left;
			font-family: "微软雅黑";
			margin-left:20px;
		}
	</style>
</head>
<body>

	<div id="app">

		<div class="app-header navbar navbar-default">
			<!--navbar right-->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" data-toggle="dropdown" class="dropdown-toggle">
						<span class="glyphicon glyphicon-bell"></span>
						<span class="visible-xs-inline">今日提醒</span>
						<span class="badge badge-sm up bg-danger pull-right-xs">0</span>
					</a>
					<!-- dropdown -->
					<div class="dropdown-menu w-xl animated fadeInUp" sytle="display:none;">
						<div class="panel bg-white">
							<div class="panel-heading b-light bg-light">
							<strong>您有 <span>0</span> 条消息</strong>
							</div>
							<div class="list-group">
								
							</div>
							
						</div>
					</div>
					<!-- / dropdown -->
				</li>
				<li class="dropdown">
					<a href="#" data-toggle="dropdown" class="dropdown-toggle clear" data-toggle="dropdown">
						<span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
							<img src="<s:property value='wxheadurl'/>" alt="...">
							<i class="on md b-white bottom"></i>
						</span>
						<span class="hidden-sm hidden-md"><s:property value='wxusernickname'/></span>
						<b class="caret"></b>
					</a>
					<!-- dropdown -->
					<ul class="dropdown-menu animated fadeInRight w">
						<li>
							<a href>
								<span class="badge bg-danger pull-right"><s:property value='userinfoper'/>%（资料完成度）</span>
								<span>编辑</span>
							</a>
						</li>
						<li>
							<a ui-sref="app.docs">
								<span class="label bg-info pull-right">new</span>
							帮助
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a ui-sref="access.signin">退出</a>
						</li>
					</ul>
					<!-- / dropdown -->
				</li>
			</ul>
			<!-- / navbar right -->
		</div>

		<div id="app-content">

			<div style="background:url(img/c0.jpg) center; background-size:cover">
				<div class="wrapper-lg bg-white-opacity">
					<div class="row m-t">
						<div class="col-sm-7">
							<a href class="thumb-lg pull-left m-r">
								<img src="<s:property value='wxheadurl'/>" class="img-circle">
							</a>
							<div class="clear m-b">
								<div class="m-b m-t-sm">
									<span class="h3 text-black"><s:property value='wxusernickname'/></span>
									<small class="m-l"><s:property value='wxcountry'/>,<s:property value='wxcity'/></small>
								</div>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="pull-right pull-none-xs text-center">
								<div class="count">家印记已经陪伴了我<s:property value='howdays'/></span>天</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="myFram">
				<div class="wrapper bg-white b-b" style="opacity: 0.8;">
					<ul class="nav nav-pills " role="tablist">
						<li role="presentation"><a href="#" onclick="myclick(1)">我的圈子<span class="badge">42</span></a></li>
						<li role="presentation"><a href="#" onclick="myclick(2)">我的照片</a></li>
						<li role="presentation"><a href="#" onclick="myclick(3)">我的提醒<span class="badge">3</span></a></li>
						<li role="presentation"><a href="#" onclick="myclick(4)">我的服务<span class="badge">3</span></a></li>
					</ul>
				</div>

				<iframe id="context" style="height:960px;width:100%;"></iframe>
			</div>

		</div>

	</div>
	<script type="text/javascript" language="javascript" src="./js/jquery.min.js" ></script>
	<script type="text/javascript" language="javascript" src="./js/bootstrap.js" ></script>
	
	<script type="text/javascript">
		$("#context").width($(document).width());
	 
			function myclick(num){
			  
			  if(num==1){
				$("#context").attr("src","circle.html");
				return false;
			}
			  
			if(num==2){
				$("#context").attr("src","http://www.jyj.me/wxjyjService_pics.action?pa_id=5640");
				return false;
			}
			if(num==3){
				$("#context").attr("src","remind.html");
				return false;
			}
			if(num==4){
				$("#context").attr("src","serve.html");
				return false;
			}

		}
	</script>
	<script type="text/javascript">
    +function ($) {
      $(function(){
        // class
        $(document).on('click', '[data-toggle^="class"]', function(e){
			e && e.preventDefault();
			console.log('abc');
			var $this = $(e.target), $class , $target, $tmp, $classes, $targets;
			!$this.data('toggle') && ($this = $this.closest('[data-toggle^="class"]'));
			$class = $this.data()['toggle'];
			$target = $this.data('target') || $this.attr('href');
			$class && ($tmp = $class.split(':')[1]) && ($classes = $tmp.split(','));
			$target && ($targets = $target.split(','));
			$classes && $classes.length && $.each($targets, function( index, value ) {
				if ( $classes[index].indexOf( '*' ) !== -1 ) {
					var patt = new RegExp( '\\s' + 
						$classes[index].
						replace( /\*/g, '[A-Za-z0-9-_]+' ).
						split( ' ' ).
						join( '\\s|\\s' ) + 
						'\\s', 'g' );
					$($this).each( function ( i, it ) {
						var cn = ' ' + it.className + ' ';
						while ( patt.test( cn ) ) {
							cn = cn.replace( patt, ' ' );
						}
						it.className = $.trim( cn );
					});
				}
				($targets[index] !='#') && $($targets[index]).toggleClass($classes[index]) || $this.toggleClass($classes[index]);
			});
			$this.toggleClass('active');
        });

        // collapse nav
        $(document).on('click', 'nav a', function (e) {
			var $this = $(e.target), $active;
			$this.is('a') || ($this = $this.closest('a'));

			$active = $this.parent().siblings( ".active" );
			$active && $active.toggleClass('active').find('> ul:visible').slideUp(200);

			($this.parent().hasClass('active') && $this.next().slideUp(200)) || $this.next().slideDown(200);
			$this.parent().toggleClass('active');

			$this.next().is('ul') && e.preventDefault();

			setTimeout(function(){ $(document).trigger('updateNav'); }, 300);      
        });
      });
    }(jQuery);
	</script>
</body>
</html>