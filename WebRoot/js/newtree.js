var docheight = $(document).height();
var docwidth = $(document).width();
$("#main").attr("style", "height:" + docheight + "px;");
var zr;
var isnodehover=true;
var isdrag=false;
var drawCT=1;//drawCT用来控制画图圈数
var drawR;
var links;var nodes;var option;//force对象通过zrender重新绘图
var familygroup;var friendgroup;var allgroup;var toolgroup;
var isfamilyshow=true;var isfriendshow=true;
var mousex;var mousey;var allgroupx;var allgroupy;
var imageShape;var textShape;var ringShape;var group;var circleShape;//全局图形变量
var oneringother;var tworingother;var threeringother;
var guid;var bezierCurve;
var nodenamelist=[];

require.config({
	packages: [
	{
		name: 'zrender',
		location: 'zrender/src',
		main: 'zrender'
	}
	]
	});
//入口
require(['zrender','zrender/shape/Circle','zrender/shape/Image','zrender/shape/Text','zrender/shape/Ring','zrender/Group','zrender/config','zrender/tool/guid','zrender/shape/BezierCurve'],function(zrender,CircleShape,ImageShape,TextShape,RingShape,Group,config,Guid,BezierCurve){
			zr=zrender.init(document.getElementById('main'));
			//组实例化
			familygroup=new Group();
			friendgroup=new Group();
			allgroup=new Group({id:"allgroup"});
			toolgroup=new Group();
			zr.addShape(familygroup);
			zr.addShape(friendgroup);
			zr.addShape(allgroup);
			zr.addShape(toolgroup);
			imageShape =ImageShape;
			textShape=TextShape;
			ringShape=RingShape
			group=Group;
			guid=Guid;
			bezierCurve=BezierCurve;
			circleShape=CircleShape;
			drawtool();
			//所有实现
			getbaseinfo_str(ImageShape,TextShape,RingShape,Group);//得到原有force中对象
			zr.on(config.EVENT.MOUSEDOWN,mousedown);
			zr.on(config.EVENT.MOUSEMOVE,mousemove);
			zr.on(config.EVENT.MOUSEUP,mouseup);
});
function drawtool(){
	zr.addShape(new circleShape({
	    style : {
	        x : 20,
	        y : 20,
	        r : 10,
	        color : 'rgba(253, 192, 46, 0.8)',          // rgba supported
	        text :'亲人',
	        textPosition :'right'
	    },
	    draggable : false,clickable : true,z:100,
	    onclick:function(){
	    	if(isfamilyshow){
	    		isfamilyshow=false;
	    	this.style.color='rgba(205, 205, 205, 0.6)';
	    	zr.modGroup(familygroup.id,{
	    		ignore:true
			   });
	    	}else{
	    		isfamilyshow=true;
	    		this.style.color='rgba(253, 192, 46, 0.8)';
		    	zr.modGroup(familygroup.id,{
		    		ignore:false
				   });
	    	}
	    	
	    }
	    
	}));
	zr.addShape(new circleShape({
	    style : {
	    	x : 80,
	    	y : 20,
	        r : 10,
	        color : 'rgba(60, 177, 251, 0.8)',          // rgba supported
	        text :'朋友',
	        textPosition :'right'
	    },
	    draggable : false,clickable : true,z:100,
	    onclick:function(){
	    	if(isfriendshow){
	    		isfriendshow=false;
	    	this.style.color='rgba(205, 205, 205, 0.6)';
	    	zr.modGroup(friendgroup.id,{
	    		ignore:true
			   });
	    	}else{
	    		isfriendshow=true;
	    		this.style.color='rgba(60, 177, 251, 0.8)';
		    	zr.modGroup(friendgroup.id,{
		    		ignore:false
				   });
	    	}
	    	
	    }
	}));
	zr.render();
}

function mousedown(param){
	isdrag=true;
	mousex=param.event.pageX;
	mousey=param.event.pageY;
	allgroupx=allgroup.position[0];
	allgroupy=allgroup.position[1];
}
function mousemove(param){
	if(isdrag){
		var offsetx=param.event.pageX-mousex;
		var offsety=param.event.pageY-mousey;
		var x=allgroupx+offsetx;
		var y=allgroupy+offsety;
		zr.modGroup("allgroup",{
			   position:[x,y]
		   });
	}
}

function mouseup(param){
	isdrag=false;
}

function getbaseinfo_str(ImageShape,TextShape,RingShape,Group){
	var  url= location.href;
	var  ss = url.split('?');
	var um_id;
	if(ss.length==1){
		um_id=0;
	}else{
		var dict=ss[1].split('=');
		um_id=dict[1];
	}
	$.post("family/homeTree_getinfo",{um_id : um_id},function(res, textStatus) {
				if (textStatus == 'success') {
					if (res != null) {
						option = eval('('+res+')');
						links = option.series[0].links;//得到线的组
						nodes = option.series[0].nodes;//得到节点的组
						//对于所有节点名称添加到nodenamelist
						for(var i=0;i<nodes.length;i++){
							var namestrs=nodes[i].name.split("\n")
							if(namestrs.length==1){
								nodenamelist.push(namestrs[0]);
							}else{
								nodenamelist.push($.trim(namestrs[1]));
							}
							
							
						}
						
						drawmainnodes(ImageShape,TextShape,RingShape,Group);//绘制主节点
						//定义图形
						
						}}});}
function drawmainnodes(ImageShape,TextShape,RingShape,Group){
	console.log(nodes)
	var mainGroup=new Group();
	var textShape=new TextShape({
		style : {
	       x : docwidth*0.5-25,
	       y : docheight*0.5+50,
	       brushType : 'both',
	       color : 'rgba(255, 255, 255, 0.8)',
	       strokeColor : 'rgba(255, 255, 255, 0.3)',
	       lineWidth : 1,
	       text : nodes[0].name,
	       textFont : 'bold 25px Arial',
	    },hoverable : false,
	  draggable : false,z:20
	        });
	var imgurls=nodes[0].symbol.split("///");
	var imgurl="http://www.jyj.me/"+imgurls[1];
	var imageShape=new ImageShape({//主信息
		id:nodes[0].value,
	    style : {
        x : docwidth*0.5-75,//xy为左上角坐标 居中的话相对减去100
        y : docheight*0.5-75,
        image : imgurl,
        width : 150,
        height : 150,
        color : 'rgba(135, 206, 250, 0.8)',
    },
    draggable : false,z:2,hoverable : false,
    
});
	var ringimgShape=new ImageShape({
    style : {
        x : docwidth*0.5-75,
        y : docheight*0.5-75,
        image : "http://employee.oss-cn-hangzhou.aliyuncs.com/%E6%A8%8A%E9%A3%9E%E5%AE%8F40/treenodeoutsideimg.png",
        width : 150,
        height : 150,
        color : 'rgba(135, 206, 250, 0.8)',
        
    },brushType:'both',z:3,hoverable : false,
    draggable : false});
    var onering=creatrings(RingShape,Group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"onering");
    var tworing=creatrings(RingShape,Group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"tworing");
    var threering=creatrings(RingShape,Group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"threering");
	mainGroup.addChild(imageShape);
	mainGroup.addChild(ringimgShape);
	mainGroup.addChild(textShape);
	mainGroup.addChild(onering);
	mainGroup.addChild(tworing);
	mainGroup.addChild(threering);
	mainGroup.id="mainGroup";
	allgroup.addChild(mainGroup);
	imageShape.onmouseover=function(param){
		if(isnodehover==true){
			isnodehover=false;
			   zr.modGroup("mainGroup",{
				   scale:[1.2,1.2,docwidth*0.5,docheight*0.5],
			   
			   });
		}
		
	};
	imageShape.onmouseout=function(param){
		if(isnodehover==false){
			isnodehover=true;
			   zr.modGroup("mainGroup",{
				   scale:[1,1,docwidth*0.5,docheight*0.5]
			   });
		}
		
	};
	imageShape.onmousedown =function(){
		$("#showbtn").text("详细")//只是一个动画条件
		simpleinfofunc();
		$("#simple_name").text(nodes[0].name);
		$("#simplehead").attr("src",imgurl);
		$("#head").attr("src",imgurl);
		getsomeoneinfo(nodes[0].value);
		if(nodes[0].isclick!=true){
		for(var i=0;i<links.length;i++){
			if(i>=8*drawCT){//
				drawCT+=1;
			}
			drawR=300*drawCT;
			var baseInt=drawR/1.414;
			//一圈八个坐标值
			var rannum=fRandomBy(50,100);
			if(drawCT==1){
				rannum=fRandomBy(-5,0)
			}
			if(drawCT==2){
				rannum=fRandomBy(45,50)
			}
			if(drawCT==3){
				rannum=fRandomBy(145,150)
			}
			if(drawCT==4){
				rannum=fRandomBy(245,250)
			}
			
			var baseringx=docwidth*0.5-75+rannum;
			var baseringy=docheight*0.5-75+rannum;
			var positionlist=[[baseringx+baseInt,baseringy+baseInt-(drawCT-1)*150],[baseringx-baseInt+(drawCT-1)*150,baseringy-baseInt],[baseringx+baseInt,baseringy-baseInt+(drawCT-1)*150],[baseringx-baseInt,baseringy+baseInt+(drawCT-1)*150],[baseringx+(drawCT-1)*150,baseringy+drawR],[baseringx+drawR,baseringy+(drawCT-1)*150],[baseringx+(drawCT-1)*150,baseringy-drawR],[baseringx-drawR,baseringy+(drawCT-1)*150]];
			
			addnodegroup(nodes[i+1],links[i],positionlist[i%8]);
			nodes[0].isclick=true;
			
		}
		}
		
	}
	
	
	
	var easingEffect = [
    'Linear',
    'ElasticIn', 'ElasticOut', 'ElasticInOut', 
    'BackIn', 'BackOut', 'BackInOut', 
    'BounceIn', 'BounceOut', 'BounceInOut'
];
	zr.addShape(mainGroup);
	zr.render();
	var tm1 =zr.animate(mainGroup.id, "", false)
	.when(0, {
		 position: [0, -docheight*0.5]
			        })
			        .when(1000, {
		 position: [0, 0]
			        })
			        .when(2000, {
		 position: [0, -50]
			        })
			        .when(2500, {
		 position: [0, 0]
			        })
    .start("ElasticIn");
    setringanimiteone(onering,5);
    setringanimitetwo(tworing,5);
    setringanimitethree(threering,5);
    
}
var limit=0;
function getsomeoneinfo(id){
	$(".videorow").remove();
	$.post("app/appAction_familyVideoList",{um_id:id,limit:limit},function(data,textStatus){
		if(textStatus=="success"){
			if(data!=null){
				var videolist = eval("("+ data+ ")");
				for(var i=0;i<videolist.length;i++){
					$videorow=$("<div></div>");
					$videorow.attr("class","videorow");
					$videotitle=$("<span>"+videolist[i].fv_title+"</span>");
					$videorow.append($videotitle);
					$videotime=$("<span>"+videolist[i].fv_time+"</span>");
					$videorow.append($videotime);
					$videorow.attr("class","videorow");
					$videotitle.attr("class","videotitle");
					$videotime.attr("class","videotime");
					$video=$("<video controls></video>");
					$video.attr("class","video-js vjs-default-skin vjs-big-play-centered");
					$video.attr("preload","auto");
					$video.attr("poster",videolist[i].fv_poster);
					$video.attr("data-setup","{}");
					$video.attr("onclick","videoplay(this)");
					$source=$("<source></source>");
					$source.attr("src",videolist[i].fv_videourl);
					$source.attr("type","video/mp4");
					$video.append($source);
					$videorow.append($video);
					$("#videolist").append($videorow);
				}
			}
		}
		
	});
}


function videoplay(obj){
	//$(obj).children().attr("src")//视频路径
	//iframe层-多媒体
	
}

function addnodegroup(node,link,position){
	var imgurls=node.symbol.split("///");
	var imgurl;
	if(imgurls.length<2){
		imgurl="http://www.jyj.me/img/defaulthead.png";
	}else{
		imgurl="http://www.jyj.me/"+imgurls[1];
	}
	if(node.symbol.indexOf('http:')>0){
		imgurl=node.symbol.substring(8);
	}
	
	var imgid;
	if(node.value==0){
		imgid=guid();
	}else{
		imgid=node.value;
	}
	var nodegroup=new group();
	var nodeimgShape=new imageShape({//主信息
	id:imgid,
    style : {
    x : position[0],//xy为左上角坐标 居中的话相对减去100
    y : position[1],
    image : imgurl,
    width : 100,
    height : 100,
    color : 'rgba(135, 206, 250, 0.8)',
},
draggable : false,z:2,hoverable : false,

});
var ringimgShape=new imageShape({
style : {
    x : position[0],
    y : position[1],
    image : "http://employee.oss-cn-hangzhou.aliyuncs.com/%E6%A8%8A%E9%A3%9E%E5%AE%8F40/treenodeoutsideimg.png",//灰色外层图片地址
    width : 100,
    height : 100,
    color : 'rgba(135, 206, 250, 0.8)',
    
},brushType:'both',z:3,hoverable : false,
draggable : false});
var names=node.name.split('\n');
if(names[1].length<3){
	var str1=names[1].substring(0,1);
	var str2=names[1].substring(1);
	names[1]=str1+"  "+str2;
}

var nodetext=new textShape({
	style : {
       x : position[0]+28,
       y : position[1]+85,
       brushType : 'both',
       color : 'rgba(255, 255, 255, 0.8)',
       strokeColor : 'rgba(255, 255, 255, 0.3)',
       lineWidth : 1,
       text : names[1],
       textFont : 'bold 15px Arial',
    },hoverable : false,
  draggable : false,z:20
        });
        var oneringother;var tworingother;var threeringother;
nodeimgShape.onmouseover=function(param){
	if(node.ishover == true || node.ishover == undefined){
		node.ishover=false;
		   zr.modGroup(nodegroup.id,{
			   scale:[1.2,1.2,position[0]+50,position[1]+50],
		   
		   });
		   //圈圈特效
		   oneringother=creatotherrings(ringShape,group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"oneringother");
		   tworingother=creatotherrings(ringShape,group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"tworingother");
		   threeringother=creatotherrings(ringShape,group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"threeringother");
		   nodegroup.addChild(oneringother);
		   nodegroup.addChild(tworingother);
		   nodegroup.addChild(threeringother);
		   setringanimiteone(oneringother,3);
		   setringanimitetwo(tworingother,3);
		   setringanimitethree(threeringother,3);
	}
	
};
nodeimgShape.onmouseout=function(param){
	if(node.ishover==false){
		   zr.modGroup(nodegroup.id,{
			   scale:[1,1,position[0]+50,position[1]+50]
		   });
		   nodegroup.removeChild(oneringother);
		   nodegroup.removeChild(tworingother);
		   nodegroup.removeChild(threeringother);
		   node.ishover=true;
	}
	
};
nodeimgShape.onmousedown=function(){
	$("#showbtn").text("详细")//只是一个动画条件
	simpleinfofunc();
	$("#simple_name").text(names[1]);
	$("#simplehead").attr("src",imgurl);
	$("#head").attr("src",imgurl);
	if(node.value!=0){
		getsomeoneinfo(node.value);
		getotherinfo(node.value,position[0],position[1])//无限扩展
	}else{
		$(".videorow").remove();
	}
};

//添加连线	
	
	var cpx=(position[0]-docwidth*0.5)*0.5+docwidth*0.5;
	var cpy=(position[1]-docheight*0.5)*0.5+docheight*0.5;
	var dotx;var doty;
	var linkstrs=link.source.split("\n");
	
	if(position[0]>docwidth*0.5){
		cpx+=20;
		if(position[1]>docheight*0.5){
			cpy-=20;
			dotx=cpx+3;
			doty=cpy+25;
		}else{
			cpy-=20;
			dotx=cpx;
			doty=cpy+25;
		}
	}else{
		cpx+=20;
		if(position[1]>docheight*0.5){
			cpy+=20;
			dotx=cpx;
			doty=cpy+5;
		}else{
			cpy-=20;
			dotx=cpx+3;
			doty=cpy+25;
		}
	}
	
	
	
var bshape= new bezierCurve({
	 style : {
        xStart : docwidth*0.5,
        yStart : docheight*0.5,
        cpX1 : cpx,
        cpY1 : cpy,
        xEnd : position[0]+50,
        yEnd : position[1]+50,
        strokeColor : 'rgba(135, 206, 250, 0.8)',  
        lineWidth : 2,
        lineCap : 'square',
    },
    draggable : false,hoverable:true
});
//添加线上小圆点
var dotShape=new circleShape({
    style : {
        x : dotx,
        y : doty,
        r : 12,
        color : 'rgba(73, 131, 251, 0.6)',          // rgba supported
        text :linkstrs[0],
        textFont : 'bold 14px Arial',
        textPosition:'right'
    },
    draggable : false,hoverable:true});

nodegroup.addChild(nodeimgShape);
nodegroup.addChild(ringimgShape);
nodegroup.addChild(nodetext);
if(node.category==1){
	familygroup.addChild(nodegroup);
	familygroup.addChild(bshape);
	familygroup.addChild(dotShape);
	allgroup.addChild(familygroup);
}
if(node.category==2){
	friendgroup.addChild(nodegroup);
	friendgroup.addChild(bshape);
	friendgroup.addChild(dotShape);
	allgroup.addChild(friendgroup);
}

zr.animate(bshape.id,"",false)
.when(0,{
  
  scale:[0,0,docwidth*0.5,docheight*0.5]
})
.when(2000,{
  
  scale:[1,1,docwidth*0.5,docheight*0.5]
})
.start("QuadraticInOut");
//节点出现特效
zr.animate(nodegroup.id,"",false)
.when(0,{
	scale:[0.3,0.3,position[0]+50,position[1]+50]
	})
	.when(1000,{
	scale:[1.2,1.2,position[0]+50,position[1]+50]
	})
	.when(2000,{
	scale:[1,1,position[0]+50,position[1]+50]
	})
	.when(2500,{
	scale:[1.1,1.1,position[0]+50,position[1]+50]
	})
	.when(3000,{
	scale:[1,1,position[0]+50,position[1]+50]
	})
	.start("ElasticIn");
}
function getotherinfo(id,x,y){
	$.post("family/homeTree_getotherinfo",{um_id:id},function(backdata,textStatus) {
	 	if(textStatus=="success"){
	 		if(backdata!=null){
	 			var nodeotherlist=eval("("+backdata+")");
	 			//判断节点是否重复
	 			for(var i=0;i<nodeotherlist.length;i++){
	 				var isadd=true;
	 				var namestrs=nodeotherlist[i].name.split("\n");
	 				for(var j=0;j<nodenamelist.length;j++){
	 					
	 					if($.trim(namestrs[1])==$.trim(nodenamelist[j])){
	 						isadd=false;
	 					}
	 				}
	 				if(isadd){
	 					//不存在就添加节点并将节点加入数组
 						nodenamelist.push($.trim(namestrs[1]));
 						addothernodegroup(nodeotherlist[i],x,y,i);//增加节点
	 				}
	 				
	 			}
	 			
	 		}
	 		}
	 		});
	 		
}
function addothernodegroup(nodeobj,x,y,i){//无限扩展
	//zrender开始画节点
	var imgurl=nodeobj.symbol.substring(8);
	
	//计算节点坐标
	var imgid;
	if(nodeobj.value==0){
		imgid=guid();
	}else{
		imgid=nodeobj.value;
	}
	
	var posixy=operationxy(x,y,i);//得到的坐标即为节点坐标
	
	var nodegroup=new group();
	var nodeimgShape=new imageShape({//主信息
	id:imgid,
    style : {
    x : posixy[0],//xy为左上角坐标 居中的话相对减去100
    y : posixy[1],
    image : imgurl,
    width : 100,
    height : 100,
    color : 'rgba(135, 206, 250, 0.8)',
},
draggable : false,z:2,hoverable : false,

});
var ringimgShape=new imageShape({
style : {
    x : posixy[0],
    y : posixy[1],
    image : "http://employee.oss-cn-hangzhou.aliyuncs.com/%E6%A8%8A%E9%A3%9E%E5%AE%8F40/treenodeoutsideimg.png",//灰色外层图片地址
    width : 100,
    height : 100,
    color : 'rgba(135, 206, 250, 0.8)',
    
},brushType:'both',z:3,hoverable : false,
draggable : false});
var names=nodeobj.name.split('\n');
if(names[1].length<3){
	var str1=names[1].substring(0,1);
	var str2=names[1].substring(1);
	names[1]=str1+"  "+str2;
}

var nodetext=new textShape({
	style : {
       x : posixy[0]+28,
       y : posixy[1]+85,
       brushType : 'both',
       color : 'rgba(255, 255, 255, 0.8)',
       strokeColor : 'rgba(255, 255, 255, 0.3)',
       lineWidth : 1,
       text : names[1],
       textFont : 'bold 15px Arial',
    },hoverable : false,
  draggable : false,z:20
        });
        var oneringother;var tworingother;var threeringother;
nodeimgShape.onmouseover=function(param){
	if(nodeobj.ishover == true || nodeobj.ishover == undefined){
		nodeobj.ishover=false;
		   zr.modGroup(nodegroup.id,{
			   scale:[1.2,1.2,posixy[0]+50,posixy[1]+50],
		   
		   });
		   //圈圈特效
		   oneringother=creatotherrings(ringShape,group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"oneringother");
		   tworingother=creatotherrings(ringShape,group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"tworingother");
		   threeringother=creatotherrings(ringShape,group,ringimgShape.style.x,ringimgShape.style.y,ringimgShape.style.width,ringimgShape.style.height,"threeringother");
		   nodegroup.addChild(oneringother);
		   nodegroup.addChild(tworingother);
		   nodegroup.addChild(threeringother);
		   setringanimiteone(oneringother,3);
		   setringanimitetwo(tworingother,3);
		   setringanimitethree(threeringother,3);
	}
	
};
nodeimgShape.onmouseout=function(param){
	if(nodeobj.ishover==false){
		   zr.modGroup(nodegroup.id,{
			   scale:[1,1,posixy[0]+50,posixy[1]+50]
		   });
		   nodegroup.removeChild(oneringother);
		   nodegroup.removeChild(tworingother);
		   nodegroup.removeChild(threeringother);
		   nodeobj.ishover=true;
	}
	
};
nodeimgShape.onmousedown=function(){
	$("#showbtn").text("详细")//只是一个动画条件
	simpleinfofunc();
	$("#simple_name").text(names[1]);
	$("#simplehead").attr("src",imgurl);
	$("#head").attr("src",imgurl);
	if(nodeobj.value!=0){
		getsomeoneinfo(nodeobj.value);
		getotherinfo(nodeobj.value,posixy[0],posixy[1])//无限扩展
	}else{
		$(".videorow").remove();
	}
};
//创建连线
	var cpx=(posixy[0]-x)*0.5+x;
	var cpy=(posixy[1]-y)*0.5+y;
	var dotx;var doty;
	if(posixy[0]<x){
		if(posixy[1]<y){
			dotx=cpx+30;
			doty=cpy+30;
		}else{
			dotx=cpx+30;
			doty=cpy+20;
		}
	}else{
		
	}
	
	
var bshape= new bezierCurve({
	 style : {
        xStart : x+50,
        yStart : y+50,
        cpX1 : cpx,
        cpY1 : cpy,
        xEnd : posixy[0]+50,
        yEnd : posixy[1]+50,
        strokeColor : 'rgba(135, 206, 250, 0.8)',  
        lineWidth : 2,
        lineCap : 'square',
    },
    draggable : false,hoverable:true
});
//添加线上小圆点
var dotShape=new circleShape({
    style : {
        x : dotx,
        y : doty,
        r : 12,
        color : 'rgba(73, 131, 251, 0.6)',          // rgba supported
        text :names[0],
        textFont : 'bold 14px Arial',
        textPosition:'right'
    },
    draggable : false,hoverable:true});
nodegroup.addChild(nodeimgShape);
nodegroup.addChild(ringimgShape);
nodegroup.addChild(nodetext);
if(nodeobj.category==1){
	familygroup.addChild(nodegroup);
	familygroup.addChild(bshape);
	familygroup.addChild(dotShape);
}
if(nodeobj.category==2){
	friendgroup.addChild(nodegroup);
	friendgroup.addChild(bshape);
	friendgroup.addChild(dotShape);
}
	zr.animate(bshape.id,"",false)
.when(0,{
  
  scale:[0,0,x,y]
})
.when(2000,{
  
  scale:[1,1,x,y]
})
.start("QuadraticInOut");
//节点出现特效
zr.animate(nodegroup.id,"",false)
.when(0,{
	scale:[0.3,0.3,posixy[0]+50,posixy[1]+50]
	})
	.when(1000,{
	scale:[1.2,1.2,posixy[0]+50,posixy[1]+50]
	})
	.when(2000,{
	scale:[1,1,posixy[0]+50,posixy[1]+50]
	})
	.when(2500,{
	scale:[1.1,1.1,posixy[0]+50,posixy[1]+50]
	})
	.when(3000,{
	scale:[1,1,posixy[0]+50,posixy[1]+50]
	})
	.start("ElasticIn");
}

function operationxy(x,y,i){
	var offsetx=x-docwidth*0.5;
	var offsety=y-docheight*0.5;
	var returnx;var returny;
	if(offsetx>0){
		returnx=x+600/1.414+i*120/1.414;//防止节点重叠80/1.414围绕中心点方向上的偏移值
	}else{
		returnx=x-600/1.414-i*120/1.414;
	}
	if(offsety>0){
		returny=y+600/1.414-i*120/1.414;
	}else{
		returny=y-600/1.414+i*120/1.414;
	}
	return [returnx,returny];
}

function creatrings(RingShape,Group,x,y,width,height,id){
	var ring=new RingShape({
		id:id,
		style : {
        x : x+width*0.5,
        y : y+height*0.5,
        r : width*0.5-5,
        r0 : width*0.5+5,
        color : 'rgba(60, 123, 251, 0.6)'
    },
    draggable : false,z:1,hoverable : false
	});
	return ring;
}
function creatotherrings(RingShape,Group,x,y,width,height,id){
	var ring=new RingShape({
		id:id,
		style : {
        x : x+width*0.5,
        y : y+height*0.5,
        r : width*0.5-3,
        r0 : width*0.5+3,
        color : 'rgba(60, 123, 251, 0.6)'
    },
    draggable : false,hoverable : false
	});
	return ring;
}

function drawnodes(ImageShape){
	
	for(var i=0;i<nodes.length;i++){
		var x;var y;var nodeswidth;var nodeheight;
		var r=200;//r为节点圆形画图半径
		if(nodes[i].category!=0){
			//需要判断i值计算xy值
			x=docwidth*0.5;
			y=docheight*0.5;
			nodeswidth=100;
			nodeheight=100;
		}
		
		
	}
	
}
function drawlinks(RingShape,Group){
	
}
function setringanimiteone(ring,offset){
	var x=ring.style.x
	var y=ring.style.y
	zr.animate(ring.id,"style",true)
	.when(0,{
		x:x,
		y:y
	})
	.when(1000,{
		x:x,
		y:y+offset
	})
	.when(3000,{
		x:x,
		y:y-offset
	})
	.when(4000,{
		x:x,
		y:y
	}).start();
}
function setringanimitetwo(ring,offset){
	var x=ring.style.x
	var y=ring.style.y
	zr.animate(ring.id,"style",true)
	.when(0,{
		x:x,
		y:y
	})
	.when(1000,{
		x:x+offset,
		y:y-offset
	})
	.when(3000,{
		x:x-offset,
		y:y+offset
	})
	.when(4000,{
		x:x,
		y:y
	}).start();
}
function setringanimitethree(ring,offset){
	var x=ring.style.x
	var y=ring.style.y
	zr.animate(ring.id,"style",true)
	.when(0,{
		x:x,
		y:y
	})
	.when(1000,{
		x:x-offset,
		y:y-offset
	})
	.when(3000,{
		x:x+offset,
		y:y+offset
	})
	.when(4000,{
		x:x,
		y:y
	}).start();
}

function fRandomBy(under, over){ 
switch(arguments.length){ 
case 1: return parseInt(Math.random()*under+1); 
case 2: return parseInt(Math.random()*(over-under+1) + under); 
default: return 0; 
}
}
var simpleinfoshow=false;
var simpleinfofunc=function(){
	if($("#showbtn").text()=="详细"){
		$("#showbtn").text("收起");
		move('simpleinfo', {left:10});
	}else{
		$("#showbtn").text("详细");
		move('selectinfo',{top:-1000},10,move('simpleinfo', {left:-300}));
		simpleinfoshow=false;
	}
	
}
$("#showbtn").click(simpleinfofunc);

$(".simpleinfo").click(function(){
	
	if(!simpleinfoshow){
		move('selectinfo',{top:75});
		simpleinfoshow=!simpleinfoshow;
	}else{
		move('selectinfo',{top:-1000});
		simpleinfoshow=!simpleinfoshow;
	}
	
	
});

var move = function(element, position, speed, callback){//移动到指定位置，position:移动到指定left及top 格式{left:120, top:340}或{left:120}或{top:340}；speed:速度 1-100，默认为10
	if(typeof(element)=='string')element=document.getElementById(element);
	if(!element.effect){
		element.effect = {};
		element.effect.move=0;
	}
	clearInterval(element.effect.move);
	var speed=speed||10;
	var start=(function(elem){
		var	posi = {left:elem.offsetLeft, top:elem.offsetTop};
		while(elem = elem.offsetParent){
			posi.left += elem.offsetLeft;
			posi.top += elem.offsetTop;
		};
		return posi;
	})(element);
	element.style.position = 'absolute';
	var	style = element.style;
	var styleArr=[];
	if(typeof(position.left)=='number')styleArr.push('left');
	if(typeof(position.top)=='number')styleArr.push('top');
	element.effect.move = setInterval(function(){
		for(var i=0;i<styleArr.length;i++){
			start[styleArr[i]] += (position[styleArr[i]] - start[styleArr[i]]) * speed/100;
			style[styleArr[i]] = start[styleArr[i]] + 'px';
		}
		for(var i=0;i<styleArr.length;i++){
			if(Math.round(start[styleArr[i]]) == position[styleArr[i]]){
				if(i!=styleArr.length-1)continue;
			}else{
				break;
			}
			for(var i=0;i<styleArr.length;i++)style[styleArr[i]] = position[styleArr[i]] + 'px';
			clearInterval(element.effect.move);
			if(callback)callback.call(element);
		}
	}, 20);
};
var fade = function(element, transparency, speed, callback){//透明度渐变：transparency:透明度 0(全透)-100(不透)；speed:速度1-100，默认为1
if(typeof(element)=='string')element=document.getElementById(element);
if(!element.effect){
	element.effect = {};
	element.effect.fade=0;
}
clearInterval(element.effect.fade);
var speed=speed||1;
var start=(function(elem){
	var alpha;
	if(navigator.userAgent.toLowerCase().indexOf('msie') != -1){
			alpha=elem.currentStyle.filter.indexOf("opacity=") >= 0?(parseFloat( elem.currentStyle.filter.match(/opacity=([^)]*)/)[1] )) + '':
			'100';
	}else{
			alpha=100*elem.ownerDocument.defaultView.getComputedStyle(elem,null)['opacity'];
	}
	return alpha;
})(element);
if(window.console&&window.console.log)console.log('start: '+start+" end: "+transparency);
element.effect.fade = setInterval(function(){
	start = start < transparency ? Math.min(start + speed, transparency) : Math.max(start - speed, transparency);
	element.style.opacity =  start / 100;
	element.style.filter = 'alpha(opacity=' + start + ')';
	if(Math.round(start) == transparency){
		element.style.opacity =  transparency / 100;
		element.style.filter = 'alpha(opacity=' + transparency + ')';
		clearInterval(element.effect.fade);
		if(callback)callback.call(element);
	}
}, 20);
};		
var resize = function(element, size, speed, callback){//长宽渐变：size:要改变到的尺寸 格式 {width:400, height:250}或{width:400}或{height:250}；speed:速度 1-100，默认为10
	if(typeof(element)=='string')element=document.getElementById(element);
	if(!element.effect){
		element.effect = {};
		element.effect.resize=0;
	}
	clearInterval(element.effect.resize);
	var speed=speed||10;
	var	start = {width:element.offsetWidth, height:element.offsetHeight};
	var styleArr=[];
	if(!(navigator.userAgent.toLowerCase().indexOf('msie') != -1&&document.compatMode == 'BackCompat')){
		//除了ie下border-content式盒模型情况外，需要对size加以修正
		var CStyle=document.defaultView?document.defaultView.getComputedStyle(element,null):element.currentStyle;
		if(typeof(size.width)=='number'){
			styleArr.push('width');
			size.width=size.width-CStyle.paddingLeft.replace(/\D/g,'')-CStyle.paddingRight.replace(/\D/g,'');
		}
		if(typeof(size.height)=='number'){
			styleArr.push('height');
			size.height=size.height-CStyle.paddingTop.replace(/\D/g,'')-CStyle.paddingBottom.replace(/\D/g,'');
		}
	}
	element.style.overflow = 'hidden';
	var	style = element.style;
	element.effect.resize = setInterval(function(){
		for(var i=0;i<styleArr.length;i++){
			start[styleArr[i]] += (size[styleArr[i]] - start[styleArr[i]]) * speed/100;
			style[styleArr[i]] = start[styleArr[i]] + 'px';
		}
		for(var i=0;i<styleArr.length;i++){
			if(Math.round(start[styleArr[i]]) == size[styleArr[i]]){
				if(i!=styleArr.length-1)continue;
			}else{
				break;
			}
			for(var i=0;i<styleArr.length;i++)style[styleArr[i]] = size[styleArr[i]] + 'px';
			clearInterval(element.effect.resize);
			if(callback)callback.call(element);
		}
	}, 20);
};		
		


	


	
	
	
