//获得ajax对象	
function getXhr(){
	var xhr = null;
	if(window.XMLHttpRequest){
		xhr = new XMLHttpRequest();
	}else{
		 xhr = new ActiveXObject('microsoft.XMLHttp');
	}
	return xhr;
}

$(function(){
			$(".hd ul li").hover(function(){
				var a =$(this).index();
				$(this).addClass("on").siblings().removeClass("on");
				$(".bd ul:eq("+a+")").show().siblings().hide();
			});
		});


//开始游戏页面，如果未登录弹出登录框
$(function(){
	var userid = $('#userid').val();
	if(userid==''){
		$('.fix,.fixbo').show();
	}
	$('.cuo').click(function(){
		$('.fix,.fixbo').hide();
	})
	
	$('#startgamebutton').click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		if(username==''){
			$('#usernametext').html("用户名不为空");
			return;
		}
		if(password==''){
			$('#usernametext').html("");
			$('#passwordtext').html("密码不能为空");
			return;
		}
		$('#usernametext').html("");
		$('#passwordtext').html("");
		getrecentregion(username);				//获得该用户最近登录的区
		login_login(username,password);
		
		var a = window.location.href;
//		var arr = a.split('&');
//		var location = window.location.href.replace(arr[1], "userid="+username)
		setTimeout(function(){window.location.href=a;}, 100)
		
	})
})

//侧栏
$(function(){
	var center_game = document.getElementById('center_game');
	var window1 = $(window).width();
	var game_x = GetObjPos(center_game)['x'];

	if(window1>1453 && window1<1562){
		$('#page_left_r').css('background-position','-13px 0');
		$('#page_left').animate({left:'-110px'});
		$('#center_game').animate({left:'-250px'});
	}else if(window1<1454 && window1>1056){
		$('#page_right_l').css('background-position','-13px 0');
		$('#page_right').animate({right:'-505px'});
		$('#center_game').animate({left:'55px'});
	}else if(window1<1057){
		$('#page_left_r').css('background-position','-13px 0');
		$('#page_left').animate({left:'-110px'});
		$('#page_right_l').css('background-position','-13px 0');
		$('#page_right').animate({right:'-505px'});
	}else{
		$('#center_game').animate({left:'-200px'});
	}
	//初始化
	var page_left_r = document.getElementById('page_left_r') 
	var left_r_x = GetObjPos(page_left_r)['x'];					//左边侧栏拉出箭头X坐标
	var page_right_r = document.getElementById('page_right_r') 
	var right_l_x = GetObjPos(page_right_r)['x'];				//右边侧栏拉出箭头X左边
	
//隐藏侧边框点击事件
	$('#page_left_r').click(function(){
		$('body').css('overflow-x','hidden');
		window1 = $(window).width();
		page_left_r = document.getElementById('page_left_r') 
		left_r_x = GetObjPos(page_left_r)['x'];					//左边侧栏拉出箭头X坐标
		page_right_r = document.getElementById('page_right_r') 
		right_l_x = GetObjPos(page_right_r)['x'];				//右边侧栏拉出箭头X左边		
		if(left_r_x>20){										//左边框弹出状态
			$('#page_left_r').css('background-position','-13px 0');
			$('#page_left').animate({left:'-110px'});
			if(window1-right_l_x>20){							//右边框弹出状态
				$('#center_game').animate({left:'-250px'});
			}else{
				$('#center_game').animate({left:'0px'});
			}
		}else{
			$('#page_left_r').css('background-position','0 0');
			$('#page_left').animate({left:'0px'});
			if(window1-right_l_x>20){
				$('#center_game').animate({left:'-200px'});
			}else{
				$('#center_game').animate({left:'55px'});
			}		
		}
	})	
	$('#page_right_l').click(function(){
		$('body').css('overflow-x','hidden');
		window1 = $(window).width();
		page_left_r = document.getElementById('page_left_r') 
		left_r_x = GetObjPos(page_left_r)['x'];					//左边侧栏拉出箭头X坐标
		
		page_right_r = document.getElementById('page_right_r') 
		right_l_x = GetObjPos(page_right_r)['x'];				//右边侧栏拉出箭头X左边
		if(window1-right_l_x>20){
			$('#page_right_l').css('background-position','-13px 0');
			$('#page_right').animate({right:'-505px'});		
			if(left_r_x>13){
				$('#center_game').animate({left:'55px'});
			}else{
				$('#center_game').animate({left:'0px'});
			}
		}else{
			$('#page_right_l').css('background-position','0 0');
			$('#page_right').animate({right:'0'});
			if(left_r_x>13){
				$('#center_game').animate({left:'-200px'});
			}else{
				$('#center_game').animate({left:'-250px'});
			}
		}
	})	
})


//获得坐标
//eg:	var obj = document.getElementById('center_game') 
//var x = GetObjPos(obj)['x']
function CPos(x, y){
	this.x = x;
	this.y = y;
}
function GetObjPos(ATarget){
	var target = ATarget;
	var pos = new CPos(target.offsetLeft, target.offsetTop);
	
	var target = target.offsetParent;
	while (target){
		pos.x += target.offsetLeft;
		pos.y += target.offsetTop;
		
		target = target.offsetParent
	}
	return pos;
}
