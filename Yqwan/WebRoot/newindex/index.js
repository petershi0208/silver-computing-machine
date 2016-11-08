//初始化新游戏按钮
$(function(){	
	$('.gametype_left div:nth-child(1)').css('background','#09f');	
	$('.gametype_left div:nth-child(1) img').attr('src','newindex/list1a.png');
	$('.gametype_left div:nth-child(1) span').css('color','white');
})
$(function(){
	$('.gametype_left div:nth-child(1)').hover(function(){
		clear();
		$('.gametype_left div:nth-child(1)').css('background','#09f');	
		$('.gametype_left div:nth-child(1) img').attr('src','newindex/list1a.png');
		$('.gametype_left div:nth-child(1) span').css('color','white');
		$('#gametype_right_top,#gametype_right_bottom').empty();
		var gametype=encodeURI(encodeURI("新游戏"));		//中文编码;
		threegame(gametype);
	},function(){
		clear();
		$('.gametype_left div:nth-child(1)').css('background','#09f');	
		$('.gametype_left div:nth-child(1) img').attr('src','newindex/list1a.png');
		$('.gametype_left div:nth-child(1) span').css('color','white');
	})
	
	$('.gametype_left div:nth-child(2)').hover(function(){
		clear();
		$('.gametype_left div:nth-child(2)').css('background','#09f');	
		$('.gametype_left div:nth-child(2) img').attr('src','newindex/list2a.png');
		$('.gametype_left div:nth-child(2) span').css('color','white');
		$('#gametype_right_top,#gametype_right_bottom').empty();
		var gametype=encodeURI(encodeURI("热门游戏"));		//中文编码;
		threegame(gametype);
	},function(){
		clear();
		$('.gametype_left div:nth-child(2)').css('background','#09f');	
		$('.gametype_left div:nth-child(2) img').attr('src','newindex/list2a.png');
		$('.gametype_left div:nth-child(2) span').css('color','white');
	})
	
	$('.gametype_left div:nth-child(3)').hover(function(){
		clear();
		$('.gametype_left div:nth-child(3)').css('background','#09f');	
		$('.gametype_left div:nth-child(3) img').attr('src','newindex/list3a.png');
		$('.gametype_left div:nth-child(3) span').css('color','white');
		$('#gametype_right_top,#gametype_right_bottom').empty();
		var gametype=encodeURI(encodeURI("挂机游戏"));		//中文编码;
		threegame(gametype);
	},function(){
		clear();
		$('.gametype_left div:nth-child(3)').css('background','#09f');	
		$('.gametype_left div:nth-child(3) img').attr('src','newindex/list3a.png');
		$('.gametype_left div:nth-child(3) span').css('color','white');
	})
	
	$('.gametype_left div:nth-child(4)').hover(function(){
		clear();
		$('.gametype_left div:nth-child(4)').css('background','#09f');	
		$('.gametype_left div:nth-child(4) img').attr('src','newindex/list4a.png');
		$('.gametype_left div:nth-child(4) span').css('color','white');
		$('#gametype_right_top,#gametype_right_bottom').empty();
		var gametype=encodeURI(encodeURI("网页游戏"));		//中文编码;
		threegame(gametype);
	},function(){
		clear();
		$('.gametype_left div:nth-child(4)').css('background','#09f');	
		$('.gametype_left div:nth-child(4) img').attr('src','newindex/list4a.png');
		$('.gametype_left div:nth-child(4) span').css('color','white');
	})
})
function clear(){
	$('.gametype_left div:nth-child(1)').css('background','#eee');	
	$('.gametype_left div:nth-child(1) img').attr('src','newindex/list1.png');
	$('.gametype_left div:nth-child(1) span').css('color','#666');
	$('.gametype_left div:nth-child(2)').css('background','#eee');	
	$('.gametype_left div:nth-child(2) img').attr('src','newindex/list2.png');
	$('.gametype_left div:nth-child(2) span').css('color','#666');
	$('.gametype_left div:nth-child(3)').css('background','#eee');	
	$('.gametype_left div:nth-child(3) img').attr('src','newindex/list3.png');
	$('.gametype_left div:nth-child(3) span').css('color','#666');
	$('.gametype_left div:nth-child(4)').css('background','#eee');
	$('.gametype_left div:nth-child(4) img').attr('src','newindex/list4.png');
	$('.gametype_left div:nth-child(4) span').css('color','#666');
}


//游戏首页分类游戏
function threegame(gametype){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexthree.do?gametype='+gametype;;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';
			var word ='';
			if(arr.length>9){
				for(i=0;i<9;i++){
					var obj = arr[i];					
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					if(obj.isrecommend=='是'){
						pic +="<div onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+ 
						"<img src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=60 height=60/>"+
						"<span class=\"neigou\">"+obj.gamename.substring(0,6)+"</span></div>";
					}else{
						pic +="<div onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+ 
						"<img src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=60 height=60/>"+
						"<span>"+obj.gamename.substring(0,6)+"</span></div>";
					}				
				}
				for(i=9;i<arr.length;i++){
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					if(obj.isrecommend=='是'){
						word +="<div class=\"neigou\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+obj.gamename.substring(0,7)+"</div>";					
					}else{
						word +="<div onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+obj.gamename.substring(0,7)+"</div>";
					}
				}
			}else{
				for(i=0;i<arr.length;i++){
					var obj = arr[i];					
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					if(obj.isrecommend=='是'){
						pic += "<div onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+ 
						"<img src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=60 height=60/>"+
						"<span class=\"neigou\">"+obj.gamename.substring(0,6)+"</span></div>";
					}else{
						pic += "<div onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+ 
						"<img src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=60 height=60/>"+
						"<span>"+obj.gamename.substring(0,6)+"</span></div>";
					}
				}
			}
				
			$('#gametype_right_top,#gametype_right_bottom').empty();
			$('#gametype_right_top').append(pic);
			$('#gametype_right_bottom').append(word);
		}
	};
	xhr.send(null);
}
//首页分类游戏点击事件
$(function(){
	$('.gametype_left div:nth-child(1)').click(function(){
		var gametype=encodeURI(encodeURI("新游戏"));		//中文编码;
		window.open('/Yqwan/moregame.do?gametype='+gametype+'&num=1','_blank');
	})
	$('.gametype_left div:nth-child(2)').click(function(){
		var gametype=encodeURI(encodeURI("热门游戏"));		//中文编码;
		window.open('/Yqwan/moregame.do?gametype='+gametype+'&num=1','_blank');
	})
	$('.gametype_left div:nth-child(3)').click(function(){
		var gametype=encodeURI(encodeURI("挂机游戏"));		//中文编码;
		window.open('/Yqwan/moregame.do?gametype='+gametype+'&num=1','_blank');
	})
	$('.gametype_left div:nth-child(4)').click(function(){
		var gametype=encodeURI(encodeURI("网页游戏"));		//中文编码;
		window.open('/Yqwan/moregame.do?gametype='+gametype+'&num=1','_blank');
	})
})


//判断用户有无登录
$(function(){
	var userid = $('#userid').val();
	if(userid==''){
		$('.banner_islogin_block').hide();
		$('.banner_login_block').show();		
	}else{	
		$('.banner_login_block').hide();
		$('.banner_islogin_block').show();
	}
})

//登录板块
//按下回车触发
$(document).ready(function(){ 
	    $("#username,#password").keydown(function(e){ 
	        var curKey = e.which; 
	        if(curKey == 13){ 
	        	login();
	        } 
	    }); 
	});
$(function(){
	$('#button').click(function(){
		login();
	})
})
function login(){
	var username = $('#username').val();
	var password = $('#password').val();
	if(username==''){
		$("#usernametext").html("用户名不能为空");
		return;
	}
	if(password==''){
		$("#usernametext").html("");
		$("#passwordtext").html("密码不能为空");
		return;
	}
	password = $.md5(password);
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/checklogin.do?userid='+username+'&password='+password;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
			if(txt=="x 用户名不存在"){
				$("#passwordtext").html('');
				$("#usernametext").html("用户名不存在");
			}else if(txt=="x 密码错误"){
				$("#usernametext").html('');
				$("#passwordtext").html("密码错误");
			}else{
				$('#form').submit();
			}
		}
	};
	xhr.send(null);
}

//排行榜
$(function(){
	$('.toprank_gamelist .toprank_gamelist_game').hover(function(){
		$(this).css('background','#eee');
		$(this).removeClass('toprank_gamelist_game').addClass('toprank_gamelist_game_hover');
		$(this).siblings().removeClass('toprank_gamelist_game_hover').addClass('toprank_gamelist_game');		
	},function(){
		$(this).css('background','#fff');
	})
	$('.toprank_gamelist .toprank_gamelist_game:nth-child(1)').removeClass('toprank_gamelist_game').addClass('toprank_gamelist_game_hover');
	$('#toprank_reyou').click(function(){
		$('.toprank_text span:nth-child(1)').css('color','#09f');
		$('.toprank_text span:nth-child(3)').css('color','#666');
		 $("#toprank_gamelist_demo").animate({
             left: "0",
         }, 500);
	})
	$('#toprank_resou').click(function(){
		$('.toprank_text span:nth-child(3)').css('color','#09f');
		$('.toprank_text span:nth-child(1)').css('color','#666');
		$("#toprank_gamelist_demo").animate({
			left: "-308px",
		},500);
	})
})

//function getrankdata(type){
//	var url = "http://192.168.1.137:80/Yqwan/listrank.do?type="+type;
//    $.getJSON(url + "&jsoncallback=?", function(json){
//    	if(json.code==0){
//    		var arr = json.jsonarray;
//            arr=JSON.parse(arr);
//            var html="";
//            var obj="";
//            for(var i=0;i<16;i++){
//            	obj = arr[i];
//            	html +="<div class=\"toprank_gamelist_game\">"+
//							"<div>"+ Number(i+1)+"</div>"+
//							"<div><img alt=\""+obj.gamename+"\" src=\"http://www.199y.com/picture/yqwan/"+obj.toppicture+"\" width='120' height='70'></div>"+
//							"<div>"+obj.gamename.substring(0,6)+"</div>"+
//							"<div>"+obj.roletype+"</div>"+
//							"<div onclick=\"javascript:window.open('gameinfo.do?gameid="+obj.gameid+"','_blank');\">进入游戏</div>"+
//						"</div>";
//            }
//            
//            $("#toprank_gamelist div").animate({
//                left: "-308px",
//            }, 500);
//            setTimeout(function(){
//            	$('#toprank_gamelist').html("").append(html);
//            	$('#toprank_gamelist>div:nth-child(1)').removeClass('toprank_gamelist_game').addClass('toprank_gamelist_game_hover');
//                $('#toprank_gamelist>div').hover(function(){
//            		$(this).css('background','#eee');
//            		$(this).removeClass('toprank_gamelist_game').addClass('toprank_gamelist_game_hover');
//            		$(this).siblings().removeClass('toprank_gamelist_game_hover').addClass('toprank_gamelist_game');		
//            	},function(){
//            		$(this).css('background','#fff');
//            	})
//            },800)
//             $("#toprank_gamelist div").animate({
//                left: "0",
//            }, 500);
//            
//            
//    	}
//    });	
//}

//主页悬浮小窗
$(function(){
	$('#hongbao').animate({left:'50%','z-index':'99999',top:'50%',width:'130px',height:'130px'},3000);
	$('#hongbao').animate({left:'50%','z-index':'99999',top:'725px',width:'200px',height:'200px','margin-left':'-800px'},2000);
})

//退出 
$(function(){
	$('#index_logout').click(function(){
		window.location.href="/Yqwan/destroy.do";		
	})
})

//广告位关闭
$(function(){
		$(".x1").click(function(){
			$(".swf1").hide();
			$(".h").hide();
			$(".x1").hide();
		});
		$(".x2").click(function(){
			$(".l").hide();
			$(".x2").hide();
			$(".r").hide();
			$(".x3").hide();
		});
		$(".x3").click(function(){
			$(".l").hide();
			$(".x2").hide();
			$(".r").hide();
			$(".x3").hide();
		});
	});