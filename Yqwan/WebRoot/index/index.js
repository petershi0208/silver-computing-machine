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

//判断用户有无登录
$(function(){
	var userid = $('#userid').val();
	if(userid==''){
		$('#islogin').hide();
		$('#loginnot').show();		
	}else{	
		$('#loginnot').hide();
		$('#islogin').show();
	}
})


//头部banner图片循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexthreebanner.do';
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据				onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\"
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';
			for(i=0;i<arr.length;i++){
				var obj=arr[i];
				var gamename1=encodeURI(encodeURI(obj.gamename));		//中文编码;
				pic += "<li><a href=\"/Yqwan/gameinfo.do?gamename="+gamename1+"\" title=\""+obj.gamename+"\"><img src=\"http://www.199y.com/picture/yqwan/"+obj.largegamepicture+"\" width=756 height=466></a></li>";
			}
			$('#items').append(pic);
		}		
	};
	xhr.send(null);
})

/*换新版本（插件）
//头部图片切换(根据id：上面的count) 鼠标放上去图片变亮
var count =1;
$(function(){
	time = setInterval('toggle()',1000);
	$(window).load(function(){
		var piconepicone = $('#piconepicone').val();
		var pictwopictwo = $('#pictwopictwo').val();
		var picthreepicthree = $('#picthreepicthree').val();
		$('#picone').hover(function(){
			clearInterval(time);	
			$('#banner_pic').hide();
			$('#banner_pic').css('background','url(/Yqwan/gamePicture/'+piconepicone+')');
			$('#banner_pic').fadeTo('slow','1');
			$('#picone,#pictwo,#picthree').css('opacity','0');
		},function(){
			$('#picone,#pictwo,#picthree').css('opacity','0.6');
			$('#banner_pic').css('background','black');
			time = setInterval('toggle()',1000);			
		})
		
		$('#pictwo').hover(function(){
			clearInterval(time);	
			$('#banner_pic').hide();
			$('#banner_pic').css('background','url(/Yqwan/gamePicture/'+pictwopictwo+')');
			$('#banner_pic').fadeTo('slow','1');
			$('#picone,#pictwo,#picthree').css('opacity','0');
		},function(){
			$('#picone,#pictwo,#picthree').css('opacity','0.6');
			$('#banner_pic').css('background','black');
			time = setInterval('toggle()',1000);
		})
		
		$('#picthree').hover(function(){
			clearInterval(time);	
			$('#banner_pic').hide();
			$('#banner_pic').css('background','url(/Yqwan/gamePicture/'+picthreepicthree+')');
			$('#banner_pic').fadeTo('slow','1');
			$('#picone,#pictwo,#picthree').css('opacity','0');
		},function(){
			$('#picone,#pictwo,#picthree').css('opacity','0.6');
			$('#banner_pic').css('background','black');
			time = setInterval('toggle()',1000);
		})
	})
})
function toggle(){	
	if(count%3==1){
		$('#picone').css('opacity','1');
		$('#pictwo').css('opacity','0.6');
		$('#picthree').css('opacity','0.6');
		count++;
		return;
	}else if(count%3==2){
		$('#picone').css('opacity','0.6');
		$('#pictwo').css('opacity','1');
		$('#picthree').css('opacity','0.6');
		count++;
		return;
	}else if(count%3==0){
		$('#picone').css('opacity','0.6');
		$('#pictwo').css('opacity','0.6');
		$('#picthree').css('opacity','1');
		count++;
		return;
	}	
}
*/
//登录下推荐应用循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexrecommend.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';
			for(i=0;i<arr.length;i++){
				var obj=arr[i];
				var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码;
				pic += "<img width='48' height='48' title=\""+obj.gamename+"\" src='http://www.199y.com/picture/yqwan/"+obj.mainpicture+"' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\"/>"
			}
			$('#apppic').append(pic);
		}
		
	};
	xhr.send(null);	
})



//页面初始化新游戏
$(function(){
	var gametype=encodeURI(encodeURI("新游戏"));		//中文编码;
	threegame(gametype);
})
//点击内购游戏
$(function(){
	$('#center_type ul li:nth-child(3)').mouseover(function(){
		$('.picone').remove();
		var gametype=encodeURI(encodeURI("内购游戏"));		//中文编码;
		threegame(gametype);	
	})
})

//点击挂机游戏
$(function(){
	$('#center_type ul li:nth-child(2)').mouseover(function(){
		$('.picone').remove();
		var gametype=encodeURI(encodeURI("挂机游戏"));		//中文编码;
		threegame(gametype);	
	})
})
//点击新游戏
$(function(){
	$('#center_type ul li:nth-child(1)').mouseover(function(){
		$('.picone').remove();
		var gametype=encodeURI(encodeURI("新游戏"));		//中文编码;
		threegame(gametype);	
	})
})
//游戏首页中间三个游戏展示
function threegame(gametype){
	//点击更多跳转页面
	$("#typemore a").attr("href","/Yqwan/moregame.do?gametype="+gametype+'&num=1');
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
			if(arr.length>3){
				for(i=0;i<3;i++){
					var obj = arr[i];
					
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='picone' style='background-image:url(http://www.199y.com/picture/yqwan/"+obj.indexpicture+")' title=\""+obj.gamename+"\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\" >"+
				    			"<p class='angel "+i+"'>"+obj.gamename+"</p>"+   			//onmouseover=\"javascript:$('."+i+"').show();\" onmouseout=\"javascript:$('."+i+"').hide();\"
//								"<p class='gift "+i+"'>礼包</p>"+
								"<div class='start' onclick=\"javascript:window.location.href='gameinfo.do?gamename="+gamename+"';\"><span>马上进入</span></div>"+
								"<div class='desc "+i+"'></div>"+  				 	
							"</div>";
				}
			}else{
				for(i=0;i<arr.length;i++){
					var obj = arr[i];
					
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='picone' style='background-image:url(http://www.199y.com/picture/yqwan/"+obj.indexpicture+")' title=\""+obj.gamename+"\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
				    			"<p class='angel "+i+"'>"+obj.gamename+"</p>"+
//								"<p class='gift "+i+"'>礼包</p>"+
								"<div class='start' onclick=\"javascript:window.location.href='gameinfo.do?gamename="+gamename+"';\"><span>马上进入</span></div>"+
								"<div class='desc "+i+"'></div>"+  				 	
							"</div>";
				}
			}
			$('.picone').remove();
			$('#center_type').append(pic);
		}
	};
	xhr.send(null);
}
/*
//平台推荐TOP4循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexhottop.do';
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';	
			if(arr.length>4){
				for(i=0;i<4;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32' title=\""+obj.gamename+"\"/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}else{
				for(i=0;i<arr.length;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32' title=\""+obj.gamename+"\"/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}
			
			$('#hot_together').after(pic);
		}	
	};
	xhr.send(null);
})

*/
//平台推荐TOP循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexhottop.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);
			var pic ='';	
			for(i=0;i<10;i++){
				var a = i+1;		//
				var obj = arr[i];
				var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic += "<div class=\"hotfive\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
							"<img src=\"/Yqwan/index/ERXIAOBANGHUIDIQUAN.jpg\"/>"+
							"<span class=\"hotfivenum\">"+a+"</span>"+
							"<span class=\"hotfivetext\" title=\""+obj.gamename+"\">"+obj.gamename+"</span>"+
							"<span class=\"hotfivequ\">进入</span>"+
						"</div>";
			}
			$('#hot_together').after(pic);
		}	
	};
	xhr.send(null);
})

/*
//新游榜TOP4排行
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexnewtop.do';
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';	
			if(arr.length>4){
				for(i=0;i<4;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32' title=\""+obj.gamename+"\"/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}else{
				for(i=0;i<arr.length;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript:window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32' title=\""+obj.gamename+"\"/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}
			
			$('#new_together').after(pic);
		}	
	};
	xhr.send(null);
})
*/
//新游TOP循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexnewtop.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);
			var pic ='';	
			for(i=0;i<10;i++){
				var a = i+1;		//
				var obj = arr[i];
				var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic += "<div class=\"hotfive\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
							"<img src=\"/Yqwan/index/ERXIAOBANGHUIDIQUAN.jpg\"/>"+
							"<span class=\"hotfivenum\">"+a+"</span>"+
							"<span class=\"hotfivetext\"  title=\""+obj.gamename+"\">"+obj.gamename+"</span>"+
							"<span class=\"hotfivequ\">进入</span>"+
						"</div>";
			}
			$('#new_together').after(pic);
		}	
	};
	xhr.send(null);
})

//精品游戏 （更多跳转）
$(function(){
	$('#rightpmore').click(function(){
		var gametype=encodeURI(encodeURI("精品游戏"));		//中文编码;
		window.open("moregame.do?gametype="+gametype+'&num=1','_blank');
	})
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexboutique.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';	
			for(i=0;i<6;i++){
				var obj = arr[i]
			    var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic += "<div class='rightgameone' title=\""+obj.gamename+"\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
		    				"<img class='rightgameonepic' src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width='100' height='98' />"+
		    				"<img class='rightgameonetype' src=\"http://www.199y.com/picture/yqwan/"+obj.placetype+"\" width='36' height='40'/>"+
		    				"<img class='rightgameonebtn' src='index/jinruyouxi.png'/>"+
		    				"<span class='rightgameonename'>"+obj.gamename+"</span>"+
		    				"<span class='rightgameoneg'>类别："+obj.gametype+"</span>"+
		    				"<span class='rightgameonedetail'>"+obj.descrip+"</span>"+
		    			"</div>";
			}
			$('#rightgame').append(pic);
		}
		
	};
	xhr.send(null);
})

//更新列表图片循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexrenew.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';	
			for(i=0;i<arr.length;i++){
				var obj = arr[i]
				pic += "<div><img src='http://www.199y.com/picture/yqwan/"+obj.indexpicture+"' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+encodeURI(encodeURI(obj.gamename))+"','_blank');\" width='245' height='175' title=\""+obj.gamename+"\"/></div>";
			}
			$('#rightlist').append(pic);
		}
		
	};
	xhr.send(null);
})

//热门讨论循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexcomment.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';	
			for(i=0;i<arr.length;i++){
				var obj = arr[i];
				pic += "<div class='rightcomment'>"+
		    				"<span class='rightcommentname'>["+obj.gamename.substring(0,5)+"]</span>"+
		    				"<span class='rightcommentdetail'  onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+encodeURI(encodeURI(obj.gamename))+"','_blank');\" title=\"["+obj.gamename+"] "+obj.content+"\">"+obj.content+"</span>"+
		    				"<img class='rightcommentyuan' src='index/xiaoyuandian.png'/>"+
		    				"<span class='rightcommentdate'>"+obj.date+"</span>"+
		    				"<img class='rightcommentline' src='index/celiequkongxinxian.png'>"+
		    			"</div>";
			}
			$('#righthot').after(pic);
		}
		
	};
	xhr.send(null);
	
//	var pic ='';	
//	for(i=0;i<6;i++){
//		pic += "<div class='rightcomment'>"+
//    				"<span class='rightcommentname'>[剑灵]</span>"+
//    				"<span class='rightcommentdetail' onclick=\"javascript:window.location.href='/Yqwan/gameinfo.jsp';;\">用同一种战术就注定他们操作空间很小,一样的条件下靠细节打败对手不是简单的事情!我觉得他们表现得不错!</span>"+
//    				"<img class='rightcommentyuan' src='index/xiaoyuandian.png'/>"+
//    				"<span class='rightcommentdate'>12-09</span>"+
//    				"<img class='rightcommentline' src='index/celiequkongxinxian.png'>"+
//    			"</div>";
//	}
//	$('#righthot').after(pic);
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





//首页充值按钮事件
$(function(){
	$('#center_type ul li:nth-child(5)').click(function(){
		alert("暂不开放!");
//		var userid =$('#userid').val();
//		if(userid==''){
//			alert('请先登录');
//		}else{
//			window.location.href="/Yqwan/recharge.do";
//		}
	})
})

//首页会员签到事件
$(function(){
	$('#login_check span:nth-child(2)').click(function(){
		alert('功能待开发中!');
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
