function setTab(name,cursel){
	cursel_0=cursel;
	for(var i=1; i<=links_len; i++){
		var menu = document.getElementById(name+i);
		var menudiv = document.getElementById("con_"+name+"_"+i);
		if(i==cursel){
			menu.className="off";
			menudiv.style.display="block";
		}
		else{
			menu.className="";
			menudiv.style.display="none";
		}
	}
}

$(function(){
	$(".ercode-icon").toggle(function(){
		$(".ercode-icon").css("background-position","0px 50px");
		$(".ercode-box").css("top","3px");
	},function(){
		$(".ercode-icon").css("background-position","0px 0px");
		$(".ercode-icon").css("z-index","202");
		$(".ercode-box").css("top","-100%");
	});
	
	
	
	
	$(window).bind("scroll",function(){
		if($(this).scrollTop()>=0.2*$(this).height()){
			$(".back_to_top").show();
		}else{
			$(".back_to_top").hide();
		}
	});
});




//显示和隐藏投资记录
/*
$(function(){
	$(".con_left area").bind("mouseover",function(){
		   $(".con_right").css({
			   "opacity":"0.3",
			   "filter":"alpha(opacity=30)" });
	          $(".con_right .rig_one").css({
			   "opacity":"0.3",
			   "filter":"alpha(opacity=30)",
			   "-ms-filter":"'progid:DXImageTransform.Microsoft.Alpha(opacity=30)'",
			   "filter":"progid:DXImageTransform.Microsoft.Alpha(opacity=30)" });
		   var names=$(this).attr("class");
		   $("#"+names).show();
	   });
	   $(".con_left area").bind("mouseout",function(){
		    $(".con_right").css({
			   "opacity":"1",
			   "filter":"alpha(opacity=100)" });
			   $(".con_right .rig_one").css({
			   "opacity":"1",
			   "filter":"alpha(opacity=100)",
			   "-ms-filter":"'progid:DXImageTransform.Microsoft.Alpha(opacity=100)'",
			   "filter":"progid:DXImageTransform.Microsoft.Alpha(opacity=100)" });
		   var names=$(this).attr("class");
		   $("#"+names).hide();
	   });
});


function Next(){                                                        
	cursel_0++;
	if (cursel_0>links_len)cursel_0=1
	setTab(name_0,cursel_0);
} 
var name_0='one';
var cursel_0=1;
var links_len,iIntervalId;
$(function(){
	var links = document.getElementById("menu").getElementsByTagName('li');
	links_len=links.length;
	for(var i=0; i<links_len; i++){
		links[i].onmouseover=function(){
			clearInterval(iIntervalId);
			this.onmouseout=function(){
				iIntervalId = setInterval(Next,ScrollTime);
			}
		}
	}
	document.getElementById("con_"+name_0+"_"+links_len).parentNode.onmouseover=function(){
		clearInterval(iIntervalId);
		this.onmouseout=function(){
			iIntervalId = setInterval(Next,ScrollTime);;
		}
	}
	setTab(name_0,cursel_0);
});
*/
  
//幻灯片
$(function(){
	var p = 0;
	$("#imageShow li").css({"z-index":1,"opacity":0});

	$("#imageShow li").eq(0).css({"z-index":100,"opacity":1});
	$("#scroll_dot span").click(function(){
			play($("#scroll_dot span").index(this));
	});

	function play(p){
		$("#scroll_dot span").eq(p).addClass("sel").siblings().removeClass("sel");
		$("#imageShow li").eq(p).animate({'opacity':1},800).css({'z-index':100}).siblings().animate({'opacity':0},800).css({'z-index':1});
	}
	
	function autoplay(){
		p = (p>$("#scroll_dot span").length-2)?0:(p+1);
		play(p);
	}
	var auto = setInterval(function(){ autoplay(p)},6000);
	$("#imageShow").mouseover(function(){clearInterval(auto);})
	$("#imageShow").mouseout (function(){auto = setInterval(function(){ autoplay(p)},6000);})
	
});

//国银快新
$(function(){
	$('.dir1').mouseover(function(){
		$(".dir1 img").attr("src","mjkf/images/dir_img1.png");
	}).mouseout(function(){
		$(".dir1 img").attr("src","mjkf/images/dir_img1s.png");
	});

	$('.dir2').mouseover(function(){
		$(".dir2 img").attr("src","mjkf/images/dir_img2s.png");
	}).mouseout(function(){
		$(".dir2 img").attr("src","mjkf/images/dir_img2.png");
	});

	$('.dir3').mouseover(function(){
		$(".dir3 img").attr("src","mjkf/images/dir_img3s.png");
	}).mouseout(function(){
		$(".dir3 img").attr("src","mjkf/images/dir_img3.png");
	});

	$('.dir4').mouseover(function(){
		$(".dir4 img").attr("src","mjkf/images/dir_img4s.png");
	}).mouseout(function(){
		$(".dir4 img").attr("src","mjkf/images/dir_img4.png");
	});
});