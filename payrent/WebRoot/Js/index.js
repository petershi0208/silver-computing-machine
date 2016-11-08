//验证码60s倒计时,同时发送验证短信
var house_id;
var name;
var telephone;
$(function(){
	yearpayornot()
	$.ajax({
		   type: "GET",
		   url: "getrenterinfo.do",
		   success: function(result){
				if(result == 'error'){
					window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx84b7a98d26a08ec7&redirect_uri=http://payrent.igjia.com/wxlogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect"
				}else{					
					var html="";
					var obj;
					var resultobj = eval("(" + result + ")");
					document.title = resultobj.nickname;
					var $body = $('body');
					var $iframe = $('<iframe src="/favicon.ico"></iframe>');
					$iframe.on('load',function(){
					  setTimeout(function(){
					      $iframe.off('load').remove();
					  }, 0);
					}).appendTo($body);
					
					telephone = resultobj.telephone		//设置手机号
					if(resultobj.house==undefined){
						$('#applyyear').hide();
						html +="<div class=\"amount botbor\">"+
									"<div class=\"amleft\">"+
										"<div>本期租金（元）</div>"+
										"<div id=\"rentmoney\">----</div>"+
										"<div>本期租金到期时间:<span id=\"rentdate\">----</span></div>"+
									"</div>"+
//									"<img src=\"images/01an.png\" height=\"30%\" class=\"pay\"/>"+
								"</div>";
					}else if(resultobj.house!=undefined){
						var a = resultobj.house;
						name = resultobj.house[0].renter_name;
						house_id = resultobj.house[0].house_id;
						for(var i=0;i<a.length;i++){
							obj = a[i];
							html +="<div class=\"amount botbor\">"+
										"<div class=\"amleft\">"+
											"<div>本期租金（元）</div>"+
											"<div id=\"rentmoney\">"+obj.money+"</div>"+
											"<div>本期租金到期时间:<span id=\"rentdate\">"+obj.date+"</span></div>"+
										"</div>"+
										"<span onclick=payrent('"+obj.money+"','"+obj.house_id+"','"+obj.renter_name+"','"+obj.renter_telephone+"')><img src=\"images/01an.png\" height=\"30%\" class=\"pay\" /></span>"+
									"</div>";
						}					
					}
					$('#benefitdiv').after(html);
				}
		   }
	});	
})

function payrent(money,house_id,renter_name,renter_telephone){
	$('.loading').show();
	$.ajax({
		   type: "GET",
		   url: "wxpay.do",
		   data:"money="+money+"&house_id="+house_id+"&renter_name="+encodeURI(encodeURI(renter_name))+"&renter_telephone="+renter_telephone,
		   success: function(result){
		   		if(result == 'error'){
					window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx84b7a98d26a08ec7&redirect_uri=http://payrent.igjia.com/wxlogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect"
				}else{
					$('.loading').hide();
					var json = eval('(' + result + ')');
					wx.config({
					    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
					    appId: 'wx84b7a98d26a08ec7', // 必填，公众号的唯一标识
					    timestamp:json.timestamp , // 必填，生成签名的时间戳
					    nonceStr: json.nonceStr, // 必填，生成签名的随机串
					    signature: json.signature,// 必填，签名，见附录1
					    jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
					});
					
					
					wx.ready(function(){
							wx.chooseWXPay({
								timestamp: json.timestamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
								nonceStr: json.nonceStr, // 支付签名随机串，不长于 32 位
								package: 'prepay_id='+json.prepay_id, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
								signType: 'MD5', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
								paySign: json.paySign, // 支付签名
								success: function (res) {
									// 支付成功后的回调函数
									window.location.href="http://payrent.igjia.com/index.html";
								}
							});
						
					});
				}
		}
	})
}

function applyyearpay(){
	$.ajax({
		 type: "GET",
		   url: "applyyearpay.do",
		   data:"name="+encodeURI(encodeURI(name))+"&telephone="+telephone+"&house_id="+house_id,
		   success: function(result){
				if(result == 'error'){
					window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx84b7a98d26a08ec7&redirect_uri=http://payrent.igjia.com/wxlogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect"
				}else if(result=='success'){
					$('#applyyear').hide();
					alert("申请成功,我们将于3个工作日内以电话的形式通知您!")
				}	
		}
	})
}

function yearpayornot(){
	$.ajax({
		 type: "GET",
		   url: "yearpayornot.do",  
		   success: function(result){
				if(result == 'error'){
					window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx84b7a98d26a08ec7&redirect_uri=http://payrent.igjia.com/wxlogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect"
				}else if(result=='yes'){
					$('#applyyear').hide();
				}	
		}
	})
}
