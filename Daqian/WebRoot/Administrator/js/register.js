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
//	$('.valider').click(function(){
//		var phone = $(".phone").val();
//		var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
//		
//		if(!reg.test(phone)){
//			alert("手机号格式错误");
//			return;
//		}else if(vp()){
//			alert("手机号已被使用");
//		}else{
//			var xhr = getXhr();
//			var uri = '/Daqian/sendsms.do?phone='+phone;
//			xhr.open('get',uri,true);
//			xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
//			xhr.onreadystatechange=function(){	
//			//4,处理服务器返回的数据
//				
//			};
//			xhr.send(null);
//			var timing=60;
//			var time = setInterval(function(){			
//				if(timing == 0) {
//				   $(".phoneva").attr("disabled",false);    
//				   $(".phoneva").attr("datatype","*");                  
//				   $(".phoneva").val("获取验证码");
//				   clearInterval(time)
//				}else{
//				    $(".phoneva").attr("disabled",'disabled');
//				    $(".phoneva").attr("datatype","*");
//				    $(".phoneva").val(timing+"秒后");
//				    timing--;
//				}
//			},1000);
//		}
//	});
//	function vp(){
//		var name = $(".phone").val();
//		var xhr = getXhr();
//		var uri = '/Daqian/checkphone.do?name='+name;
//		var txt ="";
//		xhr.open('get',uri,true);
//		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
//		xhr.onreadystatechange=function(){	
//		//4,处理服务器返回的数据
//			if(xhr.readyState==4&&xhr.status==200){
//				txt = xhr.responseText;
//				if(txt=="√ 此手机号可以使用"){
//					return true;
//				}else{
//					return false;
//				}
//			}
//		};
//		xhr.send(null);
//		
//	}
	$('.btn').click(function(){
			var phone = $(".phone").val();
			var money = $(".money").val();
			
			var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
			if(!reg.test(phone)){
				alert("手机号格式错误");
				return;
			}
			
			var xhr = getXhr();
			var uri = '/Daqian/ht/rephone.do?phone='+phone+'&money='+money;
			xhr.open('get',uri,true);
			xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
			xhr.onreadystatechange=function(){	
			//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					alert(txt);
				}
			};
			xhr.send();
	});
});