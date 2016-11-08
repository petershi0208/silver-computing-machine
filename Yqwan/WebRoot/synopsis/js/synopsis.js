$(function(){

	var href = window.location.href;
	var a = href.substring(href.lastIndexOf('/')+1);
	$(".synleft a").each(function(){
		a_href=$(this).attr("href");
		var a1 = a_href.substring(a_href.lastIndexOf('/')+1);
		if(a1==a){
			var cls = $(this).attr("class");
			$(this).css({"color":"#FFF","background-color":"#ddd"}).children("img").attr("src","/Yqwan/synopsis/images/"+cls+"2.png");
		}
	});	
	$(".synleft a").hover(function(){
		var cls = $(this).attr("class");
		$(this).css({"color":"#FFF","background-color":"#ddd"}).children("img").attr("src","/Yqwan/synopsis/images/"+cls+"2.png");
	},function(){
		var cls = $(this).attr("class");
		var clsa = a.substring(0, a.lastIndexOf("."));
		$(".synleft a").each(function(){
			if(clsa==cls){
				$("."+cls).css({"color":"#FFF","background-color":"#ddd"});
			}else{
				$("."+cls).css({"color":"#337ab7","background-color":"#FFF"}).children("img").attr("src","/Yqwan/synopsis/images/"+cls+"1.png");
			}
		});	
	})
});