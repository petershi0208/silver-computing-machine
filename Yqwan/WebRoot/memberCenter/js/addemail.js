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

//邮箱格式认证
$(function(){
	$('#addmailonebtn').click(function(){
		var mail = $('#addmailone').val();
		var reg =/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(reg.test(mail)){
			mail=encodeURI(encodeURI(mail));		//中文编码;
			window.location.href="/Yqwan/sendmail.do?mail="+mail;
		}else{	
			$('#addmailonetext').html("邮箱格式错误");
		}
	})
})

//邮箱绑定验证码验证
$(function(){
	$('#addmailtwobtn').click(function(){
		var code = $('#addmailtwo').val();
		var email =$('#addmailtwoemail').val();
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checkmailcode.do?mail='+email+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=='true'){
						window.location.href="/Yqwan/memberCenter/addemail3.jsp"
					}else{
						$('#addmailtwocode').html("验证码错误d");
					}
				}
				
			};
			xhr.send(null);		
	})
})