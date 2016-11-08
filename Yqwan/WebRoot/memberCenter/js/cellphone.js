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

//手机绑定与否判断
$(function(){
	var righttelephone = $('#memberright_telephone').val();
	$(".bdsj").click(function(){		
		if(righttelephone==''){
			window.location.href="/Yqwan/memberCenter/cellphonebind.jsp";
		}else{
			alert("您已绑定手机,如需换绑手机请先解绑!")
		}
	})
	$(".jbsj").click(function(){
		if(righttelephone!=''){
			window.location.href="/Yqwan/memberCenter/cellphone.jsp";
		}else{
			alert("您尚未绑定手机");
		}
	})
})

//验证码60s倒计时,同时发送验证短信
$(function(){
	$('#send').click(function(){	
		sendmsg();
		time();	
	})
})
//倒计时
function time(){
	var wait=60;
	var reg = "^1[3|4|5|8][0-9]{9}$";
	var value=$('#bind_telephone').val();
	if(value.match(reg)){
		var time = setInterval(function(){			  
		   if(wait == 0) {
	            $('#send').attr("disabled",false);           
	            $('#send').val("获取验证码");
	            clearInterval(time)
	       }else{
	    	    $('#send').attr("disabled",'true');
	    	    $('#send').val("重新发送("+wait+")");
	            wait--;
		   }   
		},1000)
	}else{
		   alert("请输入正确手机号");
	   }
}
//发送验证短信
function sendmsg(){
	var telephone = $('#bind_telephone').val();
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/sendsms.do?phone='+telephone;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
		}
	};
	xhr.send(null);
}
//绑定手机号验证短信验证码是否正确
$(function(){
	$('#bindbtn').click(function(){
		var telephone = $('#bind_telephone').val();
		var code = $('#bindcode').val();
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checkbindcode.do?telephone='+telephone+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码不正确"){
						$("#bindcodetext").html(txt);
					}else if(txt=="× 该手机号已绑定其他账号"){
						$("#bindcodetext").html(txt);
					}else{
						$('#form').submit();
					}
				}
			};
			xhr.send(null);
	})
})

//手机解绑
$(function(){
	$('#telephoneonebtn').click(function(){
		var telephone = $('#telephoneone').val();
		var memberrighttelephone = $('#memberright_telephone').val();
		if(telephone==''){
			$('#telephoneonetext').html("手机号不能为空");
		}else if(telephone!=memberrighttelephone){
			$('#telephoneonetext').html("手机号不存在");
		}else{
			window.location.href="/Yqwan/memberCenter/cellphone2.jsp";
		}
	})
})
//手机解绑第二步
$(function(){
	var memberrighttelephone = $('#memberright_telephone').val();
	var telephone = memberrighttelephone.substring(0,3);
	$('.tell2 p span').append(telephone+"********")
})

//解绑验证短信验证码是否正确
$(function(){
	$('#telephonebtn').click(function(){
		var telephone = $('#bind_telephone').val();
		var code = $('#telephonecode').val();
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checktelephonecode.do?telephone='+telephone+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码不正确"){
						$("#telephonecodetext").html(txt);
					}else{
						$('#form').submit();
					}
				}
			};
			xhr.send(null);
	})
})