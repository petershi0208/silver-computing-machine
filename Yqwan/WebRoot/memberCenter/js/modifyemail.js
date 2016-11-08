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
		var mail = $('#modifyemailtwo').val();
		var reg =/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(reg.test(mail)){
			$('#modifyemailtwotext').html("");
			time();
			var xhr = getXhr();
			//发送请求
			var uri = "/Yqwan/modifymail.do?mail="+mail;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
				}
				
			};
			xhr.send(null);
		}else{	
			$('#modifyemailtwotext').html("× 邮箱格式错误");
		}
	})
})


//倒计时
function time(){
	var wait=60;
		var time = setInterval(function(){			  
		   if(wait == 0) {
	            $('#send').attr("disabled",false);           
	            $('#send').val("发送邮件");
	            clearInterval(time)
	       }else{
	    	    $('#send').attr("disabled",'true');
	    	    $('#send').val("重新发送("+wait+")");
	            wait--;
		   }   
		},1000)
}

//修改邮箱验证码验证
$(function(){
	$('#modifymailtwobtn').click(function(){
		var code = $('#modifytwocode').val();
		var email =$('#modifyemailtwo').val();
		if(email!=''){
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checkmailcode.do?mail='+email+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=='true'){
						window.location.href="/Yqwan/memberCenter/modifyemail3.jsp"
					}else{
						$('#modifytwocodetext').html("验证码错误");
					}
				}
				
			};
			xhr.send(null);	
		}else{
			$('#modifyemailtwotext').html("× 邮箱格式错误");
		}
	})
})