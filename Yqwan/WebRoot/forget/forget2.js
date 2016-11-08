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

//验证码60s倒计时同时发送短信验证码
$(function(){
	$('#send').click(function(){	
//		time();
		sendmsg();
	})
})
//页面加载执行
//$(function(){
//	time();
//})
//$(function(){
//	sendmsg();
//})

//60秒倒计时
function time(){
	var wait=60;
	var time = setInterval(function(){			
	 
		   if(wait == 0){
	            $('#send').attr("disabled",false);           
	            $('#send').val("获取验证码");
	            clearInterval(time)
	       }else{
	    	    $('#send').attr("disabled",'true');
	    	    $('#send').val("重新发送("+wait+")");
	            wait--;
		   }
	   
	},1000);
}

//发送验证短信
function sendmsg(){
	var telephone = $('#telephone').val();
	var imgcode = $('#imgcode').val();
	var reg = "^1[3|4|5|8][0-9]{9}$";
	if(!telephone.match(reg)){
		$('#codetext').html("手机号错误");
		return;
	}
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/sendsms1.do?phone='+telephone+"&code="+imgcode;
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

//点击下一步判断
$(function(){
	$('#button').click(function(){
		var code = $('#code').val();
		var pwd1 = $('#pwd1').val();
		var pwd2 = $('#pwd2').val();
		var telephone = $('#telephone').val();
		var reg = /^[a-zA-Z]\w{5,21}$/;
		if(pwd1==''){
			$('#pwd1text').html("× 密码不允许为空");
		}else if(!reg.test(pwd1)){
			$('#pwd1text').html("");
			$('#pwd1text').html("× 密码格式错误");
		}else if(pwd1!=pwd2){
			$('#pwd1text').html("");
			$('#pwd1text').html("");
			$('#pwd2text').html("× 两次密码不一致");
		}else{
			$('#pwd1text').html("");
			$('#pwd1text').html("");
			$('#pwd2text').html("");
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
		}
	})
	
})