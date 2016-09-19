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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/buttons/buttons.css">
<link href="css/btns.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/commes.css" />
<link rel="stylesheet" href="css/photoswipe.css"> 
<link rel="stylesheet" href="css/default-skin/default-skin.css">
<style type="text/css">
.btns {
	color: #fef4e9;
	background: #80BCF9;
}
</style>
<script src="layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
		$.post("wxjyjService_checkisself",{pa_id:$("#pa_id").text()},function(data,textStatus){
			if(textStatus=="success"){
				if(data=="true"){
					$("#formHead").show();
					$(".button").show();
				}
			}
		});
		$(".fm").click(function(){
			
			
			
			var path=$(this).attr("src");
			var pid=$("#pa_id").text();
			var thisid=$(this).attr("id");
			$.post("wxSupport_setcover", {path:path,pid:pid},function(data,textStatus){
				$(".pswp").css("display","none");
			     if(textStatus=="success"){
			    	 if(data!=null){
			    		 if(data=="ok"){
			    			 layer.tips('设置封面成功', '#'+thisid, {time: 5000,tips: 4});
			    		 }
			    		 else{
			    			 layer.msg("设置不成功");
			    		 }
			    	 }
			    	 
			    	 }
			});
		});
		$(".del").click(function(){
			$(".pswp").css("display","none");
				var bool=confirm("是否删除照片");
				if(bool==true){
					var id=$(this).attr("id");
					var picid=id.substring(3);
					$.post("wxjyjService_del", {pic_id:picid},function(data,textStatus){
					     if(textStatus=="success"){
					    	 if(data!=null){
					    		 if(data=="ok"){
					    			 layer.tips('删除成功', '#'+id, {time: 5000,tips: 4});
					    			 $('#'+id).parent().remove();
					    		 }
					    		 else{
					    			 layer.tips("删除不成功");
					    		 }
					    	 }
					    	 
					    	 }
					});
				
				}
		});
		$(".btn").click(function(){
			$(".pswp").css("display","none");
			
			
			if($.trim($(this).text())=="描述"){
			var id=$(this).attr("id");
			var picid=id.substring(3);
			$(this).text("保存");
			$(".pic_instructions").attr("style","display:block;");
			$div=$(this).prev().prev();
		  // $div=$(body);
			$textarea=$("<textarea></textarea>");
			$textarea.attr("style","font-size:2em; width:80%;  ");
			$textarea.attr("name","picstr");
			
			$textarea.attr("id","picstr"+picid);
			$textarea.val($div.text());
			$div.text("");
			$div.append($textarea);
			
			}
			else{
				var id=$(this).attr("id");
				var picid=id.substring(3);
				$(".pic_instructions").attr("style","display:none;");;
				$.post("wxSupport_picstr", { picstr: $("#picstr"+picid).val(), picid: picid },function(data,textStatus){
					if(textStatus=="success"){
				    	if(data!=null){
							if(data=="ok"){
								$("#"+id).text("描述");
							  	$("#picstr"+picid).attr("style","display:none;");
							  	$("#"+id).prev().prev().text($("#picstr"+picid).val());
							  	layer.tips('保存成功', $("#"+id), {time: 5000});
								location.reload()
							}else
								{
								layer.msg('描述更新不成功');
								
								}
				    	 }
					 }
				});
			};
			
		});
	});
</script>

<script type="text/javascript">  

        function setImagePreview() {  
            var preview, img_txt, localImag, fileInput = document.getElementById("fileInput"),  
            picture = fileInput.value;
            if (!picture.match(/.jpg|.gif|.png|.bmp|.JPG|.GIF|.PNG|.BMP|.jpeg/i)){
            	alert("您上传的图片格式不正确，请重新选择！");
            	return false;
            	}
             
            if (preview = document.getElementById("preview"), fileInput.files && fileInput.files[0]) preview.style.display = "block",  
                preview.style.width = "20em",  
                preview.style.height = "20em",  
                preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(fileInput.files[0]) : window.URL.createObjectURL(fileInput.files[0]);  
            else {  
                fileInput.select(),  
                fileInput.blur(),  
                img_txt = document.selection.createRange().text,  
                localImag = document.getElementById("localImag"),  
                localImag.style.width = "20em",  
                localImag.style.height = "20em";  
                try {  
                    localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",  
                    localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt; 
                } catch(f) {  
                	layer.msg("您上传的图片格式不正确，请重新选择！");
                	return false;
                     
                    
                }  
                preview.style.display = "none",  
                document.selection.empty();
            }  
            document.getElementById("DivUp").style.display = "block",!0;
            //传paid
            $("#paid").attr("value",$("#pa_id").text());
            return false;
        }
        function subbtn(){
        	document.getElementById("DivUp").style.display = "none";
        	document.getElementById("preview").style.display = "none";
        	document.getElementById("formHead").submit();
        	layer.tips('上传中请稍后...', '#goupload');
        	setTimeout(function(){
        		layer.tips('上传成功', '#goupload');
        		location.reload();
        	}, 5000);
        	
        }
    </script>  
  </head>
  
  <body style="text-align: center;">
  <span style="display:none;" id="tag"><s:property value="#session.self"/></span>
  <div style="font-size: 2em;"><s:property value="message"/></div>
  <iframe name="uploadfrm" id="uploadfrm" style="display: none;"></iframe> 
  <form name="formHead" method="post" action="wxjyjService_upload" id="formHead" enctype="multipart/form-data" target="uploadfrm" style="display:none;">  
  		<s:hidden name="pa_id" id="paid"></s:hidden>
        <div>  
            <div>  
                <input type="file" name="fileInput" id="fileInput" style="display: none;" onchange="javascript:setImagePreview();"><input type=button value="添加图片" onclick="fileInput.click()" class="btns" style="font-size: 2em;"> 
            </div>  
            <div>  
                  <div data-role="fieldcontain">  
        <div id="localImag" style="text-align: center;">  
            <img id="preview" width="-1" height="-1" style="display: none" />  
        </div>  
    </div> 
    <div id="DivUp" style="display: none">  
                    <input type="button" data-inline="true" onclick="return subbtn()" id="goupload" value="确认上传" data-mini="true" class="btns" style="font-size: 2em;"/>  
                </div>
  	<br/>
            </div>  
        </div>  
    </form>  
    
    <div style="clear:both; height:2em; background:url(images/bg_menu.jpg) no-repeat ;line-height:2em; color:#595959; width:100%; height:2em; font-size:3em; text-indent:10px;"><s:property value='pa.pa_name'/>
    </div>
 	<div style="display:none;" id="pa_id"><s:property value='pa.pa_id'/></div>
    <div class="my-gallery">
 	<s:iterator value="piclist">
                    <figure style="width:33%;">
                        <a href='<s:property value="pic_relurl"/>' class="imgs_a" data-size="800x1200" style="z-index:0;">
                            <div style="width:100%; height:300px;  text-align:center;  overflow:hidden;z-index:0;"><img  class="imgh"  src='<s:property value="pic_relurl"/>' style="display:inline-block; vertical-align:middle;width:100%; "  /></div>
                        </a>
 		<!--<a href='<s:property value="pic_relurl"/>' >
        <img alt="" src='<s:property value="pic_relurl"/>' style="width: 80%"></a><br/>-->
 		<div class="pic_instructions" style="color:#B937C8;display:none;"><s:property value='pic_instructions'/></div>
		<button class="button button-glow button-border button-rounded button-primary fm" src='<s:property value="pic_relurl"/>' id="<s:property value='pic_id'/>" style="font-size:2em;width:3.2em;z-index:6;text-align: center;padding:0;display:none;">
		封面
		</button>
		<button class="button button-glow button-border button-rounded button-primary btn" id="img<s:property value='pic_id'/>" style="font-size:2em;width:3.2em;z-index:6;text-align: center;padding:0;display:none;">
		描述
		</button>
		<button class="button button-glow button-border button-rounded button-primary del" id="del<s:property value='pic_id'/>" style="font-size:2em;width:3.2em;z-index:6;text-align: center;padding:0;display:none;">
		删除
		</button>
          </figure>
             
 	</s:iterator>
     </div>



<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true" >
	
	<div class="pswp__bg"></div>
	<div class="pswp__scroll-wrap">
		<div class="pswp__container">
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
		</div>
		<div class="pswp__ui pswp__ui--hidden">
			<div class="pswp__top-bar" >
           
				<div class="pswp__counter"></div>
                
				<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                	
                	
                
				<div class="pswp__preloader" style=" font-size:18px">
					<div class="pswp__preloader__icn" style="font-size:18px">
						<div class="pswp__preloader__cut">
   							<div class="pswp__preloader__donut"></div>
                        </div>
                    </div>
                </div>
             </div>
             <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
             	<div class="pswp__share-tooltip"></div> 
           	 </div>
             <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
             <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
             <div class="pswp__caption">
             	<div class="pswp__caption__center" style="height:66px; font-size:48px;"></div>
			 </div>
		</div>
	</div>
</div>

 <script src="js/photoswipe.min.js"></script> 
        <script src="js/photoswipe-ui-default.min.js"></script> 
        <script type="text/javascript">
		$().ready(function(e) {
            var imgsgroup=$(".imgh");
			var imgs_a=$(".imgs_a");
            var initPhotoSwipeFromDOM = function(gallerySelector) {
                // parse slide data (url, title, size ...) from DOM elements 
                // (children of gallerySelector)
                var parseThumbnailElements = function(el) {
					
					
					
                    var thumbElements = el.childNodes,
                            numNodes = thumbElements.length,
                            items = [],
                            figureEl,
                            linkEl,
                            size,
                            item;
					var k=0
                    for (var i = 0; i < numNodes; ++i) {
                        figureEl = thumbElements[i]; // <figure> element
                        // include only element nodes 
                        if (figureEl.nodeType !== 1) {
                            continue;
                        }
						
                        linkEl = figureEl.children[0]; // <a> element
						
						linkEl.setAttribute('data-size',docwidth+"x"+docheight);
						
						var imgwidth=imgsgroup[k].width;
						var imgheight=imgsgroup[k].height;
						k=k+1;
					    var docwidth=$(document).width();
						var docheight=docwidth*imgheight/imgwidth;
                        size = linkEl.getAttribute('data-size').split('x');
                        // create slide object
                        item = {
                            src: linkEl.getAttribute('href'),
                            w:docwidth,
							h:docheight
                        };
                        if (figureEl.children.length > 1) {
                            // <figcaption> content
                            item.title = figureEl.children[1].innerHTML;
                        }

                        if (linkEl.children.length > 0) {
                            // <img> thumbnail element, retrieving thumbnail url
                            item.msrc = linkEl.children[0].getAttribute('src');
                        }

                        item.el = figureEl; // save link to element for getThumbBoundsFn
                        items.push(item);
                    }

                    return items;
                };

                // find nearest parent element
                var closest = function closest(el, fn) {
                    return el && (fn(el) ? el : closest(el.parentNode, fn));
                };

                // triggers when user clicks on thumbnail
                var onThumbnailsClick = function(e) {
                    e = e || window.event;
                    e.preventDefault ? e.preventDefault() : e.returnValue = false;

                    var eTarget = e.target || e.srcElement;

                    // find root element of slide
                    var clickedListItem = closest(eTarget, function(el) {
                        return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
                    });

                    if (!clickedListItem) {
                        return;
                    }

                    // find index of clicked item by looping through all child nodes
                    // alternatively, you may define index via data- attribute
                    var clickedGallery = clickedListItem.parentNode,
                            childNodes = clickedListItem.parentNode.childNodes,
                            numChildNodes = childNodes.length,
                            nodeIndex = 0,
                            index;

                    for (var i = 0; i < numChildNodes; i++) {
                        if (childNodes[i].nodeType !== 1) {
                            continue;
                        }

                        if (childNodes[i] === clickedListItem) {
                            index = nodeIndex;
                            break;
                        }
                        nodeIndex++;
                    }



                    if (index >= 0) {
                        // open PhotoSwipe if valid index found
                        openPhotoSwipe(index, clickedGallery);
                    }
                    return false;
                };

                // parse picture index and gallery index from URL (#&pid=1&gid=2)
                var photoswipeParseHash = function() {
                    var hash = window.location.hash.substring(1),
                            params = {};

                    if (hash.length < 5) {
                        return params;
                    }

                    var vars = hash.split('&');
                    for (var i = 0; i < vars.length; i++) {
                        if (!vars[i]) {
                            continue;
                        }
                        var pair = vars[i].split('=');
                        if (pair.length < 2) {
                            continue;
                        }
                        params[pair[0]] = pair[1];
                    }

                    if (params.gid) {
                        params.gid = parseInt(params.gid, 10);
                    }

                    return params;
                };

                var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
                    var pswpElement = document.querySelectorAll('.pswp')[0],
                            gallery,
                            options,
                            items;

                    items = parseThumbnailElements(galleryElement);

                    // define options (if needed)
                    options = {
                        // define gallery index (for URL)
                        galleryUID: galleryElement.getAttribute('data-pswp-uid'),
                        getThumbBoundsFn: function(index) {
                            // See Options -> getThumbBoundsFn section of documentation for more info
                            var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                                    rect = thumbnail.getBoundingClientRect();
					
                            return {x: rect.left, y: rect.top + pageYScroll, w: rect.width};
                        }

                    };

                    // PhotoSwipe opened from URL
                    if (fromURL) {
                        if (options.galleryPIDs) {
                            // parse real index when custom PIDs are used 
                            // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                            for (var j = 0; j < items.length; j++) {
                                if (items[j].pid == index) {
                                    options.index = j;
                                    break;
                                }
                            }
                        } else {
                            // in URL indexes start from 1
                            options.index = parseInt(index, 10) - 1;
                        }
                    } else {
                        options.index = parseInt(index, 10);
                    }

                    // exit if index not found
                    if (isNaN(options.index)) {
                        return;
                    }

                    if (disableAnimation) {
                        options.showAnimationDuration = 0;
                    }

                    // Pass data to PhotoSwipe and initialize it
                    gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
					
                    gallery.init();
                };

                // loop through all gallery elements and bind events
                var galleryElements = document.querySelectorAll(gallerySelector);
                for (var i = 0, l = galleryElements.length; i < l; i++) {
                    galleryElements[i].setAttribute('data-pswp-uid', i + 1);
                    galleryElements[i].onclick = onThumbnailsClick;
                }

                // Parse URL and open gallery if it contains #&pid=3&gid=1
                var hashData = photoswipeParseHash();
                if (hashData.pid && hashData.gid) {
                    openPhotoSwipe(hashData.pid, galleryElements[ hashData.gid - 1 ], true, true);
                }
            };

        // execute above function
            initPhotoSwipeFromDOM('.my-gallery');
        });
			
        </script>
  </body>
</html>
