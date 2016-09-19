/// <reference path="jquery-1.7.2.min.js" />
$(function() {
    $(".banner .cycle").cycle({
        pager: ".pager",
        timeout: 5000
    });
    //news
    $("#scrollnews").cycle({
        fx: "scrollVert",
        prev: "a.prev",
        next: "a.next",
        timeout: 3000
    });
    //pro
    $(".info-newproducts .listbox").cycle({
        fx: "scrollHorz",
        prev: "a.left",
        next: "a.right",
        speed: 700,
        timeout: 10000000000000000
    });
    var tt = $(".slide:last").attr("pager");
    var ym = 1;
    $("#tt").html("0" + tt);
    $("a.left").click(function() {
        if (ym == 1) {
            $("#ym").html($("#tt").html());
            ym = tt;
        } else {
            ym = ym - 1;
            $("#ym").html("0" + ym);
        }
    });
    $("a.right").click(function() {
        if (ym == tt) {
            $("#ym").html("0" + 1);
            ym = 1;
        } else {
            ym = ym + 1;
            $("#ym").html("0" + ym);
        }
    });
	
	$("#wx").hover(function() {
        $(".erweima").show();
    }, function() {
    $(".erweima").hide();
    });
	
	$(".mod-category .list").hover(function() {
        $(this).addClass("current");
        $(this).children(".b").show();
        $(this).children("ul").show();
    }, function() {
        $(this).removeClass("current");
        $(this).children(".b").hide();
        $(this).children("ul").hide();
    });
});

