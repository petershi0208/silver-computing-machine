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

//验证码60s倒计时,同时发送验证短信
$(function(){
	$('#send').click(function(){	
		sendmsg();
//		time();	
	})
})
//页面加载倒计时
//$(function(){
//	time();
//})
//倒计时
function time(){
	var wait=60;
//	var reg = "^1[3|4|5|8][0-9]{9}$";
//	var value=$('#telephone').val();
	var time = setInterval(function(){			
//	   if(value.match(reg)){  
		   if(wait == 0) {
	            $('#send').attr("disabled",false);           
	            $('#send').val("获取验证码");
	            clearInterval(time)
	       }else{
	    	    $('#send').attr("disabled",'true');
	    	    $('#send').val("重新发送("+wait+")");
	            wait--;
		   }
//	   }
	},1000);
}
//页面加载发送短信
//$(function(){
//	sendmsg();
//})

//发送验证短信
function sendmsg(){
	var telephone = $('#telephone').val();
	var userid=$('#username').val();
	var password = $('#password').val();
	var imgcode = $('#imgcode').val();
	var reg = "^1[3|4|5|8][0-9]{9}$";
	if(!telephone.match(reg)){
		$('#codetext').html("手机号错误");
		return;
	}
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/sendsms1.do?phone='+telephone+'&userid='+userid+'&password='+password+'&code='+imgcode;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
			if(txt=='success'){
				$('#imgcodetext').html("");
				$('#codetext').html("");
				time();
			}else if(txt=='验证码错误'){
				$('#codetext').html("");
				$('#imgcodetext').html(txt);
			}else{
				$('#imgcodetext').html("");
				$('#codetext').html(txt);
			}
		}
	};
	xhr.send(null);
}

//验证短信验证码是否正确
$(function(){
	$('#btn').click(function(){
		var telephone = $('#telephone').val();
		var code = $('#code').val();
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checkregisttwocode.do?telephone='+telephone+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码不正确"){
						$("#codetext").html(txt);
					}else{
						$('#form').submit();
					}
				}
			};
			xhr.send(null);
	})
})
