$().ready(function() {
	var zr; // 全局可用zrender对象
	var myChart;
	var mainId;
	var otherId;
	var alerdId={};
	var alerdState={};
	var onmousebool;
	var selfx;var selfy;
	var selfx1;var selfy1;
	var selfx2;var selfy2;
	var selfx3;var selfy3;
	var dindex;
	
	var changex;var changey;
	var isDown ; //是否按下鼠标
			var docheight = $(document).height();
			$("#zmain").attr("style", "height:" + docheight + "px;position:absolute;left:0;top:0;width:1920px;");
			$("#main").attr("style", "height:" + docheight + "px;position:absolute;left:0;top:0;width:1920px;z-index:2");
			
		});
		// 路径配置
		require.config({
			packages: [
	    {
            name:'echarts',
            location:'js/echarts',
            main:'echarts'
	    },{
	        name: 'zrender',
        location: 'zrender/src',
        main: 'zrender'
    }
	]
		
    });

		// 使用
		require(
				[ 'echarts','zrender','zrender/shape/Ring','echarts/chart/force', 'zrender/shape/Trochoid',],
				function(ec,zrender,RingShape) {
					// 基于准备好的dom，初始化echarts图表
					var domMain = document.getElementById('main');
					var domZMain = document.getElementById('zmain');
//					zr = zrender.init(domZMain);
					onmousebool=false;
					mainId="main";
					otherId="other";
					isDown = false;
					var mousex;var mousey;
					var offsetx=0;var offsety=0;
					var thisnodeindex;
					var nowx=0;var nowy=0;
					changex=0;changey=0;
					myChart = ec.init(domMain);
					zr=myChart.getZrender();
					myChart.showLoading();
					var  url= location.href;
					var  ss = url.split('?');
					var um_id;
					if(ss.length==1){
						um_id=0;
					}else{
						var dict=ss[1].split('=');
						um_id=dict[1];
					}
					
					

					$
							.post(
									"family/homeTree_getinfo",
									{
										um_id : um_id
									},
									function(res, textStatus) {
										if (textStatus == 'success') {
											if (res != null) {

												var option = eval('(' + res
														+ ')');//动态调用
												//alert(res);
												myChart.hideLoading();
												//这里手动添加样式尝试
												var links = option.series[0].links;
												var nodes = option.series[0].nodes;
												var drag=myChart._ondragover;
												
												for (var i=0;i<links.length;i++){
													var str=links[i].source
													var strs=str.split("\n");
													links[i].itemStyle={
									                	normal:{
								                        lineWidth:1,
								                        text:strs[0],
								                        textColor:'#3CB6AC',
								                        textFont:'bold 15px verdana',
								                        textPosition:'inside'
								                    	}
													};	
												}
												
												
												// 为echarts对象加载数据 
												myChart.setOption(option);
												
												var zrConfig = require('zrender/config');
												var ecConfig = require('echarts/config');
												
												
												
												//设置点击事件
												function focus(param) {
													isDowm=true;
													var data = param.data;
													if (data.source !== undefined
															&& data.target !== undefined) { //点击的是边
														var sourceNode = nodes
																.filter(function(
																		n) {
																	return n.name == data.source
																})[0];
														var targetNode = nodes
																.filter(function(
																		n) {
																	return n.name == data.target
																})[0];

																
													} else { // 点击的是点data.name=节点名称   data.value位用户ID
														//得到category=1为家人 2为朋友 这个属性是我要的，赞时告一段落后续扩展
														//添加节点样式zrender param.dataIndex为点击的在数组中的下标
														//无限扩展入口
														$("#list").empty();
//													if(param.dataIndex != 0){
														//异步交互
														
														$.post("family/homeTree_getotherinfo",{um_id:data.value},function(backdata,textStatus) {
														 	if(textStatus=="success"){
														 		if(backdata!=null){
														 			var nl = eval("("+ backdata+ ")");
														 			var nodearray = option.series[0].nodes;
														 			for(var i=0;i<nl.length;i++){
														 				var strs=nl[i].name.split('\n');
														 				var addbool=true;
																		for(var j=0;j<nodearray.length;j++){
																			var namestrs=nodearray[j].name.split('\n');
																			
																			if( strs[1] == namestrs[1] && namestrs[1] !== undefined){
//																				alert("strs:"+strs+"------nomestrs:"+namestrs+"\n strs[1]"+strs[1]+"===namestrs[1]"+namestrs[1])
																				addbool=false;
																				
																			}
																		}
																		if(addbool==true){
																			option.series[0].nodes.push({
																				name:nl[i].name,
																				category:nl[i].category,
																				value:nl[i].value,
																				symbolSize:25,
																				symbol:nl[i].symbol
																			});
																			option.series[0].links.push({
																				source:nl[i].name,
																				target:data.name,
																				weight:50,
																				itemStyle:{normal:{
																				lineWidth:1,
																				text:nl[i].linktext,
																				textColor:'#3CB6AC',
																				textFont:'bold 15px verdana',
																				textPosition:'inside'
													                    	}}
																			});
																			myChart.setOption(option);
																		}
																		
														 			}
														 			//刷新后对对象重新设置事件
														 			
														 			myChart.on(ecConfig.EVENT.HOVER,hover);
																	myChart.on(ecConfig.EVENT.CLICK,focus);
																	myChart.on(ecConfig.EVENT.MOUSEOUT,mouseout);
																	
														 		}
														 		
														 	}
														 	
														});
														
														
														
														
														

														
														
													
//													}	
														zr.clear();
														var thisnodedata=myChart.chart.force
														.getPosition()[param.dataIndex];
														if (changex == 0){
														 changex=thisnodedata.position[0];
														 changey= thisnodedata.position[1];
														}
														var size=data.symbolSize+3;
														zaction(RingShape,changex,changey,size,otherId);
														$("#headrem").text("");
														var num = data.name
																.indexOf("子女");
														if (num == -1) {//这样就不是查孩子表
															//对于不是孩子的载入记录事件列表
															//初始化列表
															$("#list").empty();
															getlist(data.value);
															//进一步判断
															num = data.name
																	.indexOf("\n");
															if (num == -1) {
																$("#headrem")
																		.text(
																				"1");
																$("#uid")
																		.text(
																				data.value);
																$("#edit")
																		.show();
																$("#releation")
																		.show();
															} else {
																$("#edit")
																		.attr(
																				"style",
																				"display:none;");
																$("#releation")
																		.attr(
																				"style",
																				"display:none;");
															}
															if(data.value!=0){//如果不是未绑定用户
																
															$
																	.post(
																			"family/homeTree_targetparent",
																			{
																				um_id : data.value,
																			},
																			function(
																					info,
																					textStatus) {
																				if (textStatus == "success") {
																					if(info != 'null'){
																					var infoobj = eval("(["
																							+ info
																							+ "])");
																					//配置右侧数据
																					$(
																							"#username")
																							.text(
																									infoobj[0].uv_name);
																					$(
																							"#sex")
																							.text(
																									infoobj[0].gender == "MAN" ? "男"
																											: "女");
																					$(
																							"#head")
																							.attr(
																									"src",
																									infoobj[0].headportrait_url == null ? "http://www.jyj.me/img/defaulthead.png"
																											: infoobj[0].headportrait_url);
																					}else{//这里是未绑定用户的入口
																					$("#head").attr("src","http://www.jyj.me/img/defaulthead.png");
																					var array = data.name.split("\n");
																					$("#username").text(array[1]);
																					$("#sex").text("未知");
																				}
																					
																					}
																				
																				



																			});}
																			
														} else {
															$("#edit")
																	.attr(
																			"style",
																			"display:none;");
															$("#releation")
																	.attr(
																			"style",
																			"display:none;");
															$
																	.post(
																			"family/homeTree_targetchild",
																			{
																				um_id : data.value
																			},
																			function(
																					info,
																					textStatus) {
																				if (textStatus == "success") {

																					var infoobj = eval("(["
																							+ info
																							+ "])");
																					//配置右侧数据
																					$(
																							"#username")
																							.text(
																									infoobj[0].child_name);
																					$(
																							"#sex")
																							.text(
																									infoobj[0].child_gender == "MAN" ? "男"
																											: "女");
																					$(
																							"#head")
																							.attr(
																									"src",
																									infoobj[0].headurl == null ? "http://www.jyj.me/img/defaulthead.png"
																											: infoobj[0].headurl);
																				}
																			});
															
														}

														$(".selectinfo")
																.attr("style",
																		"min-height:483px;z-index:3;");
																
													}

												}
													
												function hover(param) {
													var list=myChart.chart.force;
													console.log(list);
//													if(thisnodeindex!=param.dataIndex){
//														thisnodeindex=param.dataIndex;
//														nowx==0;
//													}
//													if(onmousebool==false){
//														onmousebool=true;
//													var data=param.data;
//													if (data.source == undefined
//													&& data.target == undefined) {
//														oneshapedel()
//													
//													
//													var thisnodedata=myChart.chart.force
//														.getPosition()[param.dataIndex];
//															if(nowx==0){
//															 changex=thisnodedata.position[0]+offsetx;
//															 changey= thisnodedata.position[1]+offsety;
//															var size=data.symbolSize+3;
//															zaction(RingShape,changex,changey,size,otherId);
//															}else{
//																var size=data.symbolSize+3;
//																zaction(RingShape,nowx,nowy,size,otherId);
//															}
//															
//														
//													
//													}
//													}
												}
												function mouseout(param) {
													if(onmousebool==true){
														onmousebool=false;
														var data=param.data;
														if (data.source == undefined
														&& data.target == undefined) {
															oneshapedel();
															
														var thisnodedata=myChart.chart.force
														.getPosition()[param.dataIndex];
														if(nowx==0){
															 changex=thisnodedata.position[0];
															 changey= thisnodedata.position[1];
															var size=data.symbolSize+3;
															zaction(RingShape,changex,changey,size,otherId);
															}else{
																var size=data.symbolSize+3;
																zaction(RingShape,nowx,nowy,size,otherId);
															}
														}
														
													}
												}
												function mousedown(param){
													mousex=param.event.screenX;
													mousey=param.event.screenY;

													isDown=true;
												}
												
												function mousemove(param){
													if(isDown==true){
														offsetx=param.event.screenX-mousex;
														offsety=param.event.screenY-mousey;
														nowx=offsetx+changex;
														nowy=offsety+changey;
														
														//对zr图形同步移动
//														console.log(param.event)
//														console.log("ox:"+offsetx+"---oy:"+offsety)
														updateshape(nowx,nowy,otherId);
													}
												}
												function mouseup(param){
													isDown=false;
													myChart.setOption(option);
												}
												
												myChart.on(ecConfig.EVENT.HOVER,hover);
												myChart.on(ecConfig.EVENT.MOUSEOUT,mouseout);
												myChart.on(
														ecConfig.EVENT.CLICK,
														focus);

												myChart
														.on(
																ecConfig.EVENT.FORCE_LAYOUT_END,//页面导入结束
																function() {
																					//初始化主节点ring
																					var mainnode=myChart.chart.force
																							.getPosition()[0];
																							var mainx=mainnode.position[0];
																							var mainy= mainnode.position[1];
																							var mainsize=nodes[0].symbolSize+3;
																							zaction(RingShape,mainx,mainy,mainsize,mainId);
																});
														
																zr.on(zrConfig.EVENT.MOUSEDOWN,mousedown);
																zr.on(zrConfig.EVENT.MOUSEMOVE,mousemove);
																zr.on(zrConfig.EVENT.MOUSEUP,mouseup);
											}
										}
									});

				});
		
				function oneshapedel(param) {
					zr.delShape(otherId);
					zr.delShape(otherId+"1");
					zr.delShape(otherId+"2");
					zr.delShape(otherId+"3");
			        zr.refresh();
				}
				function updateshape(changex,changey,shapeId){
					//更新绘图
					updatering(changex,changey,shapeId);
					updatering(changex,changey,shapeId+"1");
					updatering(changex,changey,shapeId+"2");
					updatering(changex,changey,shapeId+"3");
					
				}
				
				function updatering(changex,changey,shapeId){
					
					var zrshapeList = zr.storage._shapeList;
					for(var i=0;i<4;i++){
						if(i<4){
							console.log(zrshapeList)
							zr.modShape(shapeId, {
								 style:{
								 x:changex,
								 y:changey
							 	}
							 });
								 }
						
						
					}
					
					zr.refresh();
								 
					 
					 
				}
				
				function zaction(RingShape,x,y,size,shapeId){
					
					//zrender绘图
					addring(RingShape,x,y,size,shapeId);
					addringmove(RingShape,x,y-2,size,shapeId+"1");
					addringmove(RingShape,x-2,y+2,size,shapeId+"2");
					addringmove(RingShape,x+2,y+2,size,shapeId+"3");
				}
				
				function addring(RingShape,x,y,size,shapeId){
			    	var ring=new RingShape({
			    		id: shapeId,
			    	    style : {
			    	        x :	x,
			    	        y : y,
			    	        r : size,
			    	        r0 : size-3,
			    	        color : 'rgba(60, 123, 251, 0.6)',
			    	        //text:'ring'
			    	    },
			    	    draggable : false,
			    	    highlightStyle:false
			    	});
			    	zr.addShape(ring);
			    	zr.render();
			    }
			 	function addringmove(RingShape,x,y,size,shapeId){
			    	
			    	var ring=new RingShape({
			    		id: shapeId,
			    	    style : {
			    	        x : x,
			    	        y : y,
			    	        r : size,
			    	        r0 : size-3,
			    	        color : 'rgba(60, 123, 251, 0.6)',
			    	        //text:'ring'
			    	    },
			    	    draggable : false
			    	});
			    	zr.addShape(ring);
			    	zr.render();
			    	var tm1 = zr.animate( ring.id, "", true)
			        .when(1000, {
			            position : [-1, -1]
			        })
			        .when(2000, {
			            position : [1, -1]
			        })
			        .when(3000, {
			            position : [1, 1]
			        })
			        .when(4000, {
			            position : [-1, 1]
			        })
			        .when(5000, {
			            position : [0, 0]
			        })
			        .start();

			    zr.animate(ring.id, 'style', true)
			        .when(4000, {
			            color: 'rgba(60, 123, 251, 0.6)'
			        })
			        .start();
			    }
		function getlist(umid) {
			$.post("family/ ", {
				um_id : umid
			}, function(data, textStatus) {
				if (textStatus == "success") {
					var obj = eval("(" + data + ")");
					$("#list").empty();
					for ( var i = 0; i < obj.length; i++) {
						$div = $("<div></div>");
						$label = $("<label></label>");
						$label.attr("style", "display:none;");
						$label.text(obj[i].tc_id);
						$a = $("<a></a>");
						$a.attr("href", "javascript:void(0)");
						$a.attr("onclick", "showcontent(this)");
						$a.text(obj[i].title);
						$content = $("<span></span>");
						$content.text(obj[i].content);
						$content.attr("style", "display:none;");
						$time = $("<span></span>");
						$time.text(obj[i].date + "时");
						$div.append($time);
						$div.append("<br/>");
						$div.append($a);
						$div.append($content);
						$button = $("<button></button>");
						$button.attr("class", "delbtn");
						$button.attr("title", "删除");
						$button.attr("onclick", "delcontent(this)");
						$div.append($label);
						$div.append($button);
						$div.append("<br/>");
						$("#list").append($div);
					}
					if ($("#headrem").text() != "1") {
						$(".delbtn").attr("style", "display:none;");
					}
				}
			});
		}
		function eachobj(obj){
			for(var i in obj){
				alert(i);
			}
			
		}
		
		function delcontent(tag) {
			//$(tag).prev().text();
			//$(tag).parent().empty();
			$.post("family/homeTree_deltc", {
				tc_id : $(tag).prev().text()
			}, function(data, textStatus) {
				if (textStatus == "success") {
					if (data == "ok") {
						layer.msg("删除成功");
						$(tag).parent().empty();
					} else if (data == "hack") {
						layer.msg("篡改代码并没卵用，哈哈哈");
					}
				}
			});
		}
		function showcontent(tag) {
			layer.alert($(tag).next().text(), {
				skin : 'layui-layer-lan',
				closeBtn : 0,
				title : $(tag).text(),
				shift : 1
			//动画类型
			});
		}
		$().ready(function() {
			
			$("#closelayer").click(function() {
				$(".selectinfo").attr("style", "display:none");
			});
			$("#uploadhead").click(function() {
				//头像判断
				if ($("#headrem").text() == "1") {
					layer.open({
						type : 2,
						title : false,
						area : [ '650px', '500px' ],
						fix : false, //不固定
						maxmin : false,
						content : 'head.html'
					});
				}
				;
			});
			$("#edit").click(function() {
				if ($("#headrem").text() == "1") {
					layer.open({
						type : 1,
						shade : false,
						title : false, //不显示标题
						content : $('.editui'), //捕获的元素
						cancel : function(index) {
							layer.close(index);
							this.content.show();
							layer.msg('在您人生重要阶段记录一笔，是留给后代的宝贵记忆。', {
								time : 5000,
								icon : 6
							});
						}
					});
				}
			});
			$("#editdo").click(function() {
				var title = $("#title").val();
				var content = $("#content").val();
				if (title != "" && content != "") {
					$.post("family/homeTree_editdo", {
						title : title,
						content : content,
						um_id : $("#uid").text()
					}, function(data, textStatus) {
						if (textStatus == "success") {
							if (data == "ok") {
								//清理
								$("#title").val("");
								$("#content").val("");
								layer.msg("记录成功");
								$("#list").empty();
								getlist($("#uid").text());
							} else {
								layer.msg("出错啦，请联系客服。");
							}

						}
					});

				} else {
					layer.msg("写点什么再记录吧。");
				}

			});

			$("#releation").click(function() {
				if ($("#headrem").text() == "1") {

					layer.open({
						type : 1,
						shade : false,
						zIndex:99,
						title : false, //不显示标题
						content : $('.addreleation'), //捕获的元素
						cancel : function(index) {
							
							layer.close(index);
//							this.content.show();
						}
					});
				}
			});
			$("#addrel").click(function() {
				if ($("#r_whichgroup").val() == "0") {
					layer.msg("请选择分组");
					return;
				}
				if ($("#r_label").val() == "") {
					layer.msg("请填写关系");
					return;
				}
				if ($("#r_uname").val() == "" && $("#r_tel").val() == "") {
					layer.msg("姓名和手机至少要填写一个");
					return;
				}
				$.post("family/homeTree_addreleation", {
					r_label : $.trim($("#r_label").val()),
					r_uname : $.trim($("#r_uname").val()),
					r_tel : $.trim($("#r_tel").val()),
					r_eval : $.trim($("#r_eval").val()),
					r_umid : $.trim($("#uid").text()),
					r_whichgroup : $.trim($("#r_whichgroup").val()),
					realman : $.trim($("#realman").text())
				}, function(data, textStatus) {
					if (textStatus == "success") {
						if(data=="ok"){
							layer.closeAll();
							layer.msg("关系保存成功");
							window.location.reload();//刷新当前页面.
						}
					}
				});
			});
			$("#clearbtn").click(function (){
				$("#realman").text("");
				
			});
			$("#r_uname").autocomplete("family/homeTree_gethints", {//此插件只能支持到jquery1.8.3-搞了我半天
                minChars: 2,   
                max:6,   
                width: 200,  
                matchCase:false,//不区分大小写  
                matchSubset:true,
                delay: 400,
              //  matchContains :true,  
               // autoFill: false,  
                scroll: true,  
                dataType: 'json',      
                scrollHeight: 500,  
               //此处为传递参数  
                extraParams:{r_uname:function() { return $('#r_uname').val();}},  
              //需要把data转换成json数据格式                        
                parse: function(data) {  
                   return $.map(eval(data), function(row) {  
                       return {  
                        data: row,  
                        value: row.uv_id,    //此处无需把全部列列出来，只是两个关键列  
                        result: row.uv_name   
                      };
                });  
         },  
        formatItem: function(data, i, total) {
        	var tel=data.tel
        	if(data.tel!=""){
        	var first=data.tel.substring(0,3);
        	var later=data.tel.substring(7);
        	tel=first+"****"+later;
        	}
        	
           return "<div><table ><tr><td align='left'>" + data.uv_name + "</td><td align='right'> " + tel + " </td></tr></table></div>";   
              
         },  
        formatMatch: function(data, i, total) {  
        	
                    return data.uv_name;  
         },  
        formatResult: function(data, value) { 
        	
                    return data.uv_name;     
         }  
        }).result(function(event, data, formatted) { //回调  
                 $('#r_uname').val(data.uv_name);   //不知为何自动返回值后总是加了个“,”,所以改成后赋值 
                 //$('#r_tel').val(data.tel);
                 $('#realman').text(data.uv_id);
    });  

		});
		$().ready(function(){
			//扩展方法调用
			layer.config({
				  extend: 'extend/layer.ext.js'
				}); 
			$(".list").click(function(){
				var pa_id=$(this).prev().prev().text();
				$.post('login/userPicAction_getjson_pa_pics',{pa_id:pa_id},function(data,textStatus){
					if(textStatus=="success"){
						if(data!=null){
							dataobj=eval("("+data+")");
							layer.ready(function(){ //为了layer.ext.js加载完毕再执行
							 layer.photos({
								    photos:dataobj
								  });
							});
						}
						
					}
				});
			});
		});