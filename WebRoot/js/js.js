$(function() {
    $(".select").toggle(function() {
        $(this).children(".list").slideDown(200);
    }, function() {
        $(this).children(".list").slideUp(200);
    });
    $(".slidebox").cycle({
        fx:"scrollHorz",
        prev:"a.prev",
        next: "a.next",
        speed:500,
        timeout:10000000
    });
});