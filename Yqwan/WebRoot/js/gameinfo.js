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

//判断是开始游戏还是下载游戏
//点击开始
$(function(){
		var code = $('#gameinfocode').val();
		var url = $('#gameinfourl').val();
		if(code=='n'||code=='s'){
			$('#startgame').text("开始游戏");						
		}else{
			$('#startgame').text("下载游戏");
		}
		$('#startgame').click(function(){
		if(code=='y' || code=='n'){
//			window.location.href=url
			window.open(url,'_blank');
		}else if(code=='s'){
			$('#demo1').hide();
			$('#startgamea').show();
		}else{
			$('#fix').css('visibility','visible');
			$(".fixbo").show();
		}
	})
	
	$('.cuo').click(function(){
		$(".fix").css("visibility","hidden");
		$(".fixbo").hide();
	})
	$('.download').click(function(){
		window.open(url,'_blank');
	})
})


//相关游戏循环js
function Autoleft(obj){
		jQuery(obj).find("ul").stop().animate({
			left:"-84px"
		},300,function(){
			jQuery(this).css({left:"0px"}).find("li:first").appendTo(this);
		});
	}
function Autoright(obj){
		jQuery(obj).find("ul").stop().animate({
			left:"84px"
		},300,function(){
			jQuery(this).css({left:"0px"}).find("li:last-child").prependTo(this);
		});
	}	
jQuery(document).ready(function($){
	var a=setInterval('Autoleft("#ban_num3")',2000)
	$(".corr").hover(function(){
		clearInterval(a);
	},function(){
		a=setInterval('Autoleft("#ban_num3")',2000)
	});
	$("#prev_btn3").click(function(){
		Autoright("#ban_num3");
	});
	$("#next_btn3").click(function(){
		Autoleft("#ban_num3");
	});
	$(".huif,a").click(function(){
		$(this).parents("tr").siblings(".huifu").show();
		$(this).parents(".pl").siblings().children("table").children("tbody").children(".huifu").hide();
		
	})
});



//发表评论
$(function(){
	$('#button').click(function(){
		var userid = $('#userid').val();
		var comment = $('#comment_content').val();
		var gamename = $('#gameinfoname').val();
		var gameid = $('#gameinfogameid').val();

		if(comment==''){
			alert('请输入评论!');
			return;
		}
		if(comment.length>200){
			alert('评论最多200字!')
			return;
		}
		var comment1=encodeURI(encodeURI(comment));
		var gamename1=encodeURI(encodeURI(gamename));
		var xhr = getXhr();
		var uri = '/Yqwan/addgameinfocomment.do';
		xhr.open('post',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){	
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=='success'){
					alert('发表成功!');
					window.location.href="/Yqwan/gameinfo.do?gameid="+gameid;
				}
			}
		};
		xhr.send("gamename1="+gamename1+"&comment1="+comment1+"&userid="+userid);	
	})
})

//页面加载刷新评论列表
$(function(){
	var num = 1;
	var gamename = $('#gameinfoname').val();
	getcomment(gamename,num);
	
	$('#nice span').click(function(){
		var index = $(this).index();
		if(index==0){
			getcomment(gamename,1);
		}else if(index==1){
			var thispage = $('#page').val();
			if(thispage>1){
				thispage =thispage-1;
				getcomment(gamename,thispage);
			}
		}else if(index==2||index==3||index==4||index==5||index==6){
			thispage =$(this).text();
			getcomment(gamename,thispage);
			
		}else if(index==7){
			var thispage = $('#page').val();
			if(thispage-$('#maxnum').val()<0){
				thispage =parseInt(thispage)+1;
				getcomment(gamename,thispage);
			}
		}else{
			getcomment(gamename,$('#maxnum').val());
		}
	})
	
})

//后台发送请求获得评论
function getcomment(gamename,num){
	gamename=encodeURI(encodeURI(gamename));
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/gameinfogetcomment.do?gamename='+gamename+'&num='+num;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
			var arr = txt.split('&&&');
			$('#maxnum').val(arr[1]);		//获得所有的评论数目
			$('#page').val(arr[2]);			//当前是第几页
			subpage(parseInt(arr[1]),parseInt(arr[2]));
			var arr1=JSON.parse(arr[0]);
			var pic ='';
			for(i=0;i<arr1.length;i++){
				var obj=arr1[i];
				pic += "<div class=\"pl\">"+
							"<table class=\"nk\">"+
								"<tbody>"+
									"<tr><td rowspan=\"2\" class=\"tx\"><img style=\"border-radius:100px;\" width=\"49\" height=\"49\" src=\""+obj.headpicture+"\" /></td>"+
									"<td class=\"xinxi\"><span class=\"xingm\">"+obj.nickname+"</span><span class=\"shij\">"+obj.date+"</span></td></tr>"+									
									"<tr><td class=\"xinxi\"><span class=\"xingm\">"+obj.content+"</span><span class=\"shij\"></span></td></tr>"+
								"</tbody>"+
							"</table>"+
					"</div>"
			}
			$('.pl').remove();
			$('#tjsl').after(pic);
		}	
	};
	xhr.send(null);
}

//分页功能
function subpage(maxnum,page){
	if(maxnum==1||maxnum==0){
		$('#fenye').hide();
	}
	if(maxnum<3){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(5),#nice span:nth-child(6),#nice span:nth-child(7),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','140px')
	}
	else if(maxnum<4){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(6),#nice span:nth-child(7),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','120px')
	}
	else if(maxnum<5){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(7),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','100px')
	}
	else if(maxnum<6){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','80px')
	}
	
	if(page%5==0){
		page1 = page%5+7;
		page5 = page/5-1;
	}else{
		page1 = page%5+2;
		page5 = page/5;
	}
	if(parseInt(page)+5-maxnum<=0){
		page5 = 5*parseInt(page5);
		for(i=3;i<8;i++){
			page6 = page5+parseInt(i)-2;
			$('#nice span:nth-child('+i+')').text(page6);
		}	
		$('#nice span:nth-child('+page1+')').siblings().css({'background-color':'#fff','color':'#000'})
		$('#nice span:nth-child('+page1+')').css({'background-color':'#337ab7','color':'#fff'});
	}else{
		for(i=3;i<8;i++){
			if(page>5){
				$('#nice span:nth-child('+i+')').text(maxnum-7+i);
			}else{
				$('#nice span:nth-child('+i+')').text(i-2);
			}
		}
		if(page>5){
			page1 = parseInt(page-maxnum)+7;
		}
		$('#nice span:nth-child('+page1+')').siblings().css({'background-color':'#fff','color':'#000'})
		$('#nice span:nth-child('+page1+')').css({'background-color':'#337ab7','color':'#fff'});
	}
}

//图片渐隐效果
 $(window).scroll(function(){  
     // var htmlHeight=document.body.scrollHeight||document.documentElement.scrollHeight;  
     //var clientHeight=document.body.clientHeight||document.documentElement.clientHeight;  
     //浏览器滚动条的top位置，  
     var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;  
    	//通过滚动条位置判断是否加载
		if(scrollTop>=400){  
			jQuery(".mhc").fadeOut()
		jQuery("#demo2").fadeOut()
     }  
 })
 //评价 图片显示
 $(function(){
		$(".kyk1 span img").hover(function(){
			var a = $(this).index();
			$(".kyk1 span").children("img:lt("+(a+1)+")").attr("src","/Yqwan/images/gameinfos/xingxingbai.png");
			$(".kyk1 span").children("img:gt("+a+")").attr("src","/Yqwan/images/gameinfos/xingxingtou.png");
		});
		jQuery(".kyk1 span img").click(function(){
			var gamen =jQuery("#gameinfoname").val();
			
			var thecookie = jQuery.cookie('the_cookie');
			var gamen1=encodeURI(encodeURI(gamen));
			jQuery(this).index();
			var score = jQuery(this).index()*2;
			if(thecookie == null){
				jQuery.cookie('the_cookie', '199y', { expires: 7 });
				thecookie= jQuery.cookie('the_cookie');
				var index = thecookie.indexOf(gamen);
			}else{
				var index = thecookie.indexOf(gamen);
			}
			var cookiegame = jQuery.cookie('the_cookie')+","+gamen;
			if(index==-1){
				jQuery.cookie('the_cookie', cookiegame, { expires: 7 }); 			
				var xhr = getXhr();
				var uri = '/Yqwan/gamescore.do?score='+score+'&gamename='+gamen1;
				xhr.open('post',uri,true);
				xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
				xhr.onreadystatechange=function(){	
				//4,处理服务器返回的数据
					if(xhr.readyState==4&&xhr.status==200){
						var txt = xhr.responseText;
						alert("评价成功");
						jQuery(".pf12").text(txt);
					}
				};
				xhr.send(null);
			}else{
				alert("您已评价过!");
			}
		});

		$(".topleft").hover(function(){
			$(".bottom_left").stop().animate({
				top:'-108px',
				opacity:'0.9'
			},200);
		},function(){
			$(".bottom_left").stop().animate({
				top:'-20px',
				opacity:'0'
			},200);
	});	
 });
 
 
	
 //悬浮切换
 jQuery(function(){
		jQuery(".recco div").hover(function(){
			jQuery(this).css("opacity","1").siblings().css("opacity","0.4");;
			
			var a = $(this).index();
			var left = -a*300;
			jQuery(".reccotxt").stop().animate({'left':left},500);
			
		});	
	});
	
//点赞
 $(function(){
	 $('#perfect').click(function(){
		 var perfect_cookie = jQuery.cookie('perfect_cookie');
		 var gamename = $('#gameinfoname').val();
		 var gamename1 =encodeURI(encodeURI(gamename));
		 if(perfect_cookie == null){
				jQuery.cookie('perfect_cookie', '199y', { expires: 7 });
				perfect_cookie= jQuery.cookie('perfect_cookie');
				var index = perfect_cookie.indexOf(gamename);
			}else{
				var index = perfect_cookie.indexOf(gamename);
			}
			var cookiegame = jQuery.cookie('perfect_cookie')+","+gamename;
			if(index==-1){
				jQuery.cookie('perfect_cookie', cookiegame, { expires: 7 }); 
				
				 var xhr = getXhr();
					//发送请求
					var uri = '/Yqwan/givePerfect.do?gamename='+gamename1;
					xhr.open('get',uri,false);
					xhr.onreadystatechange=function(){
						//4,处理服务器返回的数据
						if(xhr.readyState==4&&xhr.status==200){
							var txt = xhr.responseText;
							txt = Math.round(txt/10);
							$('#perfect').text("赞("+txt+")");
						}	
					};
					xhr.send(null);
			}else{	
				alert("您已赞过!");
			}
	 })
 })

