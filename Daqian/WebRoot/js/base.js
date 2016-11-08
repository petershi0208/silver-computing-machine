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

//投标按钮判断输入金额是否正确
$(function(){
//	$('.logindiv2').focus(function(){
//		$('.logindiv2').val("");
//		
//	});
//		if(login2!=null&login2%100==0&login2>=minmoney&login2<=lastmoney){
//			alert(lastmoney+login2+minmoney);
			$('#logindiv1').click(function(){
				var username = $('#username').val();
				var card = $('#card').val();
				var role = $('#role').val();
				var availablemoney = $('#availablemoney').val();
				var money = $('#logindiv2').val();
				if(username==''||role=='borrowMoney'){
					alert("请登录或者当前账户不是理财账户");
					window.location.href="/Daqian/user/login.jsp";
					return;
				}
				if(card==''){
					alert("未实名认证，请前往会员中心实名认证");
					window.location.href="/Daqian/tomember.do";
					return;
				}
				if(money-availablemoney>0){
					alert("账户可用金额不够，请前往充值");
					return;
				}
				
				var lastmoney=$('.lastmoney').html();
				var login2=$('.logindiv2').val();
				var minmoney=$('.minmoney').html();
				min = login2-minmoney;
				last = login2-lastmoney;
				if(login2!=null && login2%100==0 && min>=0 && last<=0){
				$(".qrtb").show();
				$(".bj").show();
				var logindiv2=$('.logindiv2').val();
				var yfmoney = $('.yfmoney').val(logindiv2);
				var pid=$('.pid').html();
				var monthoryear = 2;
				$(".monthoryear").val(monthoryear);
				var xhr = getXhr();
				//发送请求
				
				var uri = '/Daqian/producttb.do?pid='+pid+'&monthoryear='+monthoryear+'&amount='+logindiv2;
				xhr.open('get',uri,true);
				xhr.onreadystatechange=function(){
				
				//4,处理服务器返回的数据
					if(xhr.readyState==4&&xhr.status==200){
						var txt = xhr.responseText;
						$('.vyear').val(txt);
					}
				};
				xhr.send(null);
				}else if(last>0){
					$('.yecz2').text('产品剩余金额'+lastmoney);
					return;
				}
				else if(login2==null || login2%100!=0 || min<0){
					$('.yecz2').text('输入金额需为100的整数倍,最低金额1000');
				}
			})
			
//		}		
});

//异步年付
$(function(){
	$('.year').click(function(){
		$('.year').css({'color':'#fff','background-color':'#df0716'});
		$('.month').css({'color':'#df0716','background-color':'#fff'});
		var pid=$('.pid').html();
		var yfmoney=$('.yfmoney').val();
		var monthoryear = 2;
		$(".monthoryear").val(monthoryear);
		var xhr = getXhr();
		//发送请求
		
		var uri = '/Daqian/producttb.do?pid='+pid+'&monthoryear='+monthoryear+'&amount='+yfmoney;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				$('.vyear').val(txt);
			}
		};
		xhr.send(null);
	})
})


//异步月付
$(function(){
	$('.month').click(function(){
		$('.month').css({'color':'#fff','background-color':'#df0716'});
		$('.year').css({'color':'#df0716','background-color':'#fff'});
		var pid=$('.pid').html();
		var yfmoney=$('.yfmoney').val();
		var monthoryear = 1;
		$(".monthoryear").val(monthoryear);
		var xhr = getXhr();
		//发送请求
		
		var uri = '/Daqian/producttb.do?pid='+pid+'&monthoryear='+monthoryear+'&amount='+yfmoney;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				$('.vyear').val(txt);
			}
		};
		xhr.send(null);
	})
})
//$(function(){
//	var xhr = getXhr();
//	var uri = '/Daqian/index2.do';
//	xhr.open('get',uri,true);
//	xhr.onreadystatechange=function(){
//	
//	//4,处理服务器返回的数据
//		if(xhr.readyState==4&&xhr.status==200){
//			var txt = xhr.responseText;
//			$('.vyear').val(txt);
//		}
//	};
//	xhr.send(null);
//});


//判断产品剩余百分比
$(function(){
	var lastmoney=$(".lastmoney").html();
	var maxmoney=$(".maxmoney").html();
	var a=100-lastmoney/maxmoney*100;
	var b=a;
	var dd=$(".baif").text(b).html();
	$(".perem").css("width",(100-b)+"%");
	if(dd.length>4){
		var c=dd.substring(0,5);
		$(".baif").text(c+"%");
	}
	if(dd.length<=4){
		$(".baif").text(b+"%");
	}
});


//投标确认
$(function(){
	$(".close,.qx").click(function(){
		$(".qrtb").hide();
		$(".bj").hide();
		$('.logindiv2').val("");
	});
	$(".submit1").click(function(){
		if(!$(".tongyi").attr("checked")){			
			$('#pwdtext').html("请勾选");
		}else{
			$('#pwdtext').html("");
			var paypwd = $('#paypwd').val();
			var username = $('#username').val();
			var xhr = getXhr();
			//发送请求			
			var uri = '/Daqian/productpay.do?paypwd='+paypwd+'&username='+username;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){			
			//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=='成功'){
						$("form").submit();	
					}else{
						$('#paytext').html(txt);
					}
				}
			};
			xhr.send(null);			
		}
	});
});


//$(function(){
//	$('.aa').click(function(){
//		
//		$(".qrtb").show();
//		$(".bj").show();
//		var year=$('.year').html();
//		var month=$('.month').html();
//		var pid=$('.pid').html();
//		var yfmoney=$('.yfmoney').html();
//		var monthoryear = 1;
//		var xhr = getXhr();
//		//发送请求
//		
//		var uri = '/Daqian/aaa.do?pid='+pid+'&monthoryear='+monthoryear+'&amount='+yfmoney;
//		xhr.open('get',uri,true);
//		xhr.onreadystatechange=function(){
//		
//		//4,处理服务器返回的数据
//			if(xhr.readyState==4&&xhr.status==200){
//				var txt = xhr.responseText;
//				$('.vyear').val(txt);
//			}
//		};
//		xhr.send(null);
//	})
//})

//充值判断用户有无登录
$(function(){
	$('#yecz').click(function(){
		var username= $('#username').val();
		if(username==''){
			alert("请先登录");
			window.location.href="/Daqian/user/login.jsp";
		}else{
			window.location.href="/Daqian/user/hyzx/cz.jsp";
		}
	});
});