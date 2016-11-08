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

//判断是否从游戏里发起
$(function(){
	var dgamename = $('#czgame').val();
	if(dgamename!=''){
		$('#subqu').show();
	}
})


$(function(){
	var a=($(".gamebox div").index()+1)*37+2;
	$(".gamebox").css("height",a+"px");
	
	$(".qu").click(function(){
		$('#czgame').css('border','1px solid #aaa');
		$(".xzyx").show();
		$(".wenzi").hide();
		$(".xzfq").hide();
	});
	$(".subqu").click(function(){
		$('#subqu').css('border','1px solid #aaa');
		$(".xzfq").show();
		$(".xzyx").hide();
		$(".wenzi").hide();
	});
	$(".typeinfo table td").click(function(){
		$(this).children("input").attr("checked",'checked');
	});
	$(".ali").click(function(){
		$(this).children("input").attr("checked",'checked');					 
	});
	$(".shoujicz .a").click(function(){
		$(this).children("input").attr("checked",'checked');
		$(this).children(".sjimg").css("background-image","url(../memberCenter/images/member/sjxz.png)");
		$(this).siblings().children(".sjimg").css("background-image","url(../memberCenter/images/member/sjwx.png)");
	});
	$("select option").hover(function(){
		$(this).css("color","red");
	});
	
	//充值游戏名字 分区事件
	$(".guaji").click(function(){
		$(".qu").val($(this).text());
		$('#subqu').hide();
		$(".xzyx").hide();
		$(".wenzi").show();
	});
	
//点击游戏异步出现分区
	$(".xzyx ul li").click(function(){
		if($(this).index()>0){
			$('#subqu').show();
		}		
		var gamename = $(this).children("span").text();
		
		$(".qu").val(gamename);
		$('#subqu').val('');
		$(".xzyx").hide();
		var xhr = getXhr();
		var gamename1=encodeURI(encodeURI(gamename));		//中文编码;
		//发送请求
		var uri = '/Yqwan/czregion.do?gamename='+gamename1+'&time='+new Date();		
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				var arr=JSON.parse(txt);  
				var pic ='';
				for(var i=0;i<arr.length;i++){
					var obj = arr[i];
					pic += "<li onclick=\"javascript:$('.subqu').val($(this).children('span').text());$('.xzfq').hide();$('.wenzi').show();\"><span>"+obj.gameregion+"</span></li>";
				}
				$('#xzfq ul').empty();
				$('#xzfq ul').append(pic);
			}		
		};
		xhr.send(null);	
		$(".wenzi").show();
	});		
//	var gameregion = $(this).children("span").text();
//	$(".subqu").val(gameregion);
//	$(".xzfq").hide();
//	$(".wenzi").show();
	
	
	$(".cyber").click(function(){
		$(this).css("background-image","url(../memberCenter/images/member/chognzhikluang.png)");
		$(this).siblings().css("background-image","url(../memberCenter/images/member/gbichongzhihui.png)");
		$(".cybercz").show();	
		$(".zhifubaocz").hide();
		$(".shoujicz").hide();
	});
	$(".zhifubao").click(function(){
		$(this).css("background-image","url(../memberCenter/images/member/chognzhikluang.png)");	
		$(this).siblings().css("background-image","url(../memberCenter/images/member/gbichongzhihui.png)");
		$(".zhifubaocz").show();	
		$(".cybercz").hide();
		$(".shoujicz").hide();
		
	});
	$(".shouji").click(function(){
//		alert('暂时不开放!')
//		return;
		$(this).css("background-image","url(../memberCenter/images/member/chognzhikluang.png)");
		$(this).siblings().css("background-image","url(../memberCenter/images/member/gbichongzhihui.png)");
		$(".shoujicz").show();		
		$(".cybercz").hide();
		$(".zhifubaocz").hide();
	});
	$(".wangyin").click(function(){
		$('.charge_records').css('margin-top','-1600px');
		$("[name='money']").attr('checked',false);
		$('#showmoney').text('0');
		 $('#gbshowmoney').text('0');
		
		$(this).css("background-image","url(../memberCenter/images/member/chognzhikluang.png)");
		$(this).siblings().css("background-image","url(../memberCenter/images/member/gbichongzhihui.png)");	
		$(".czyuan").show();
		$(".czguabi").hide();
		$(".payguabi").hide();
		$(".paytype").show();
	});
	$(".gbi").click(function(){
		$('.charge_records').css('margin-top','-1050px');
		$("[name='money']").attr('checked',false);
		$('#showmoney').text('0');
		 $('#gbshowmoney').text('0');
		
		$(this).css("background-image","url(../memberCenter/images/member/chognzhikluang.png)");
		$(this).siblings().css("background-image","url(../memberCenter/images/member/gbichongzhihui.png)");		
		$(".czguabi").show();
		$(".czyuan").hide();
		$(".payguabi").show();
		$(".paytype").hide();
	});
});

//充值金额其他
$(function(){
	$('#othermoney').blur(function(){
		 var othermoney = $('#othermoney').val();
		 $('#other').val(othermoney);
		 $('#showmoney').text(othermoney);
		 $('#getgb').text(parseInt(othermoney/10) )
	})
	$('#othermoney').click(function(){
		 $('#other').attr('checked','true')
	})
	
	$('#gbothermoney').blur(function(){
		 var gbothermoney = $('#gbothermoney').val();
		 $('#gbother').val(gbothermoney);
		 $('#gbshowmoney').text(gbothermoney);
		 $('#getgb').text(parseInt(gbothermoney/10) )
	})
	$('#gbothermoney').click(function(){
		$('#gbother').attr('checked','true')
	})
})

//网银充值判断选中金额
$(function(){
	$('input:radio[name="money"]').click(function(){
		$('#czyuan').css('border','1px solid #aaa');
		 var money=$('input:radio[name="money"]:checked').val();
		 $('#showmoney').text(money);
		 $('#gbshowmoney').text(money);
		 $('#getgb').text(parseInt(money/10) )
	})
	$('input:radio[name="bank"]').click(function(){
		$('.typeinfo').css('border','2px solid #0bb1ff');
	})
})

//充值弹出框操作
$(function(){
	$(".close,.wenti,.fukuan").click(function(){
		$(".backgr").hide();
		$(".qrjg").hide();
	});
});

//支付宝、网银充值确定按钮触发事件
$(function(){
	$("#wypaybutton,#zfbpaybutton,#wxpaybutton").click(function(){
		var money=$('input:radio[name="money"]:checked').val();
		var bank=$('input:radio[name="bank"]:checked').val();
		var gamename = $('#czgame').val();
		var gameregion = $('#subqu').val();
		var userid = $('#userid').val();
		var reg_money = /^[1-9]\d{1,3}|10000$/;
		if(gamename==''){
			 $('#czgame').css('border','1px solid red');
			alert("请选择充值的游戏")
			return;
		 }else if(gamename!='平台挂机点'&gameregion==''){
			 $('#subqu').css('border','1px solid red');
				alert("请选择充值的游戏分区")
				return;
		 }		 
		 if(!reg_money.test(money)){
			 $('#czyuan').css('border','1px solid red');
			 alert('请选择正确的充值金额');
			 return;
		 }
		 if(bank==null){
			$('.typeinfo').css('border','2px solid red');
			alert('请选择充值类型');
			return;
		 }
		 var url = "/Yqwan/wypay.do";
		 userisornot(gamename,userid,gameregion,url);	//判断角色存在不
	})
})

//Gb充值游戏按钮触发事件
$(function(){
	$("#gbpaybutton").click(function(){
		var money=$('input:radio[name="money"]:checked').val();
		var gamename = $('#czgame').val();
		var gameregion = $('#subqu').val();
		var userid = $('#userid').val();
		var reg_money = /^[1-9]\d{1,3}|10000$/;
		
		//游戏格式判断
		if(gamename==''||gamename=='平台挂机点'){
			$('#czgame').css('border','1px solid red');
			alert('请选择充值的游戏');
			return;
		}else if(gameregion==''){
			$('#subqu').css('border','1px solid red');
			alert("请选择充值的游戏分区")
			return;
		}
		//充值金额格式判断
		 if(!reg_money.test(money)){
			 $('#czgb').css('border','1px solid red');
			 alert('请选择正确的充值金额');
			 return;
		 }	
		 
		
		 var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/gbcheck.do?userid='+userid+'&gb='+money;
			xhr.open('get',uri,false);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;		
					if(txt=='ok'){
						var url = "/Yqwan/gbpay.do";
						 userisornot(gamename,userid,gameregion,url);	//判断角色存在不
					}else{
						alert(txt);
					}
				}		
			};
			xhr.send(null);	 
	})
})

//判断充值区用户存在否
function userisornot(gamename,userid,gameregion,url){
	if(gamename=='平台挂机点'){
		$('#form').attr('action',url);
		$('#form').submit();
	}else{
		gamename=encodeURI(encodeURI(gamename));
		gameregion=encodeURI(encodeURI(gameregion));
		 var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/usercheck.do?gamename='+gamename+'&userid='+userid+'&gameregion='+gameregion;
			xhr.open('get',uri,false);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=='success'){
						$('#form').attr('action',url);
						$('#form').submit();
						if(url=="/Yqwan/wypay.do"){			//跳转充值支付宝后原页面灰色背景
							 $(".backgr").show();
							 $(".qrjg").show();
						}
					}else{
						alert(txt);
					}
				}		
			};
			xhr.send(null);
	}
	
}

//充值记录
//$(function(){
//	$('#morecharge').click(function(){
//		event.cancelBubble=true;
//		var userid = $('#userid').val();
//		var xhr = getXhr();
//		//发送请求
//		var uri = '/Yqwan/allchargegame.do?userid='+userid;
//		xhr.open('get',uri,true);
//		xhr.onreadystatechange=function(){
//			//4,处理服务器返回的数据
//			if(xhr.readyState==4&&xhr.status==200){
//				var txt = xhr.responseText;		
//				var arr=JSON.parse(txt);  
//				var list ='';
//				if(arr==''){
//					list += "<tr class=\"clear\"><td></td><td style='font-size:12px;color:white'>暂无充值记录</td><td></td></tr>";
//				}else{
//					for(i=0;i<arr.length;i++){
//						var obj=arr[i];
//						list += "<tr class=\"clear\"><td>"+obj.gamename+"</td><td>"+obj.money+"</td><td>"+obj.date.substring(0,10)+"</td></tr>";
//					}
//				}
//				
//				$('.clear').remove();
//				$('#chargetitle').after(list);
//			}	
//		};
//		xhr.send(null);
//	
//		$('#charge_records').css('z-index','1000')
//		$('#charge_records').show();
//	})
//})
//悬浮框隐藏
//$(function(){
//	var isOut=true;
//	$('#charge_records').mouseover(function(){
//		isOut=false;
//	})
//	$('#charge_records').mouseout(function(){
//		isOut=true;
//	})
//	$('body').click(function(){
//		if(isOut==true){
//			$('#charge_records').hide();
//		}
//	})
//})
