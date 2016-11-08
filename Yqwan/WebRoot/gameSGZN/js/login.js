// JavaScript Document
$(function(){
	$(".system ul li").hover(function(){
		$(this).css("background","#8e1014");
		$(this).siblings("li").css("background","#040404");	
		var index = $(this).index();
		$(".synmore > div:eq("+index+")").show();
		$(".synmore > div:eq("+index+")").siblings("div").hide();
	});		   
});