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

//手机号失去光标判断
$(function(){
	$('#telephone').blur(function(){
		var telephone = $('#telephone').val();
		var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
		if(telephone==''){
			$('#telephonetext').html("× 手机号不能为空");
			return;
		}else if(!reg.test(telephone)){
			$('#telephonetext').html("× 手机号格式错误");
			return;
		}else{
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checktelephone.do?telephone='+telephone;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="√ 此手机号可以使用"){
						$("#telephonetext").html("× 手机号不存在");
						return;
					}else{								
						$("#telephonetext").html("");
					}	
				}
			};
			xhr.send(null);
		}
		
	})
})

//点击下一步按钮验证
$(function(){
	$('#button').click(function(){
		var telephone = $('#telephone').val();
		var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
		if(telephone==''){
			$('#telephonetext').html("× 手机号不能为空");
			return;
		}else if(!reg.test(telephone)){
			$('#telephonetext').html("× 手机号格式错误");
			return;
		}else{
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checktelephone.do?telephone='+telephone;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="√ 此手机号可以使用"){
						$("#telephonetext").html("× 手机号不存在");
						return;
					}else{								
						$("#telephonetext").html("");
						$('#form').submit();
					}	
				}
			};
			xhr.send(null);
		}
		
	})
})