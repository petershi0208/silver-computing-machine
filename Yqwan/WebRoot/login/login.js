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

//验证码60s倒计时并发送短信
$(function(){
	$('#send').click(function(){			
		var reg = "^1[3|4|5|8][0-9]{9}$";
		var value=$('#telephone').val();
		var imgcode=$('#imgcode').val();
		//发送短信
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/sendsms1.do?phone='+value+"&code="+imgcode;
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
	})
})

function time(){
	//60秒倒计时
	var wait=60;
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
	},1000);
}

//登录方式
$(function(){
	$('#center_btn span:nth-child(1)').click(function(){	
		$('#center_btn img').attr('src','login/dengluhuaxianzuo.png')
		$('#namepwd1').css('display','none')
		$('#namepwd').css('display','block')
		$('#center_bottom input:nth-child(1),#center_bottom span:nth-child(2),#center_bottom span:nth-child(3)').show();
		$('#telephone').val('');
		$('#code').val('');
	})
	$('#center_btn span:nth-child(2)').click(function(){	
		$('#center_btn img').attr('src','login/dengluhuaxianyou.png')
		$('#namepwd').css('display','none')
		$('#namepwd1').css('display','block')
		$('#center_bottom input:nth-child(1),#center_bottom span:nth-child(2),#center_bottom span:nth-child(3)').hide();
		$('#username').val('');
		$('#password').val('');
	})
})

//点击登录异步验证
$(function(){
	$('#button').click(function(){
		$("#usernametext").html('');
		$("#telephonetext").html('');
		var userid = $('#username').val();
		var password = $('#password').val();
		var telephone = $('#telephone').val();
		var code =$('#code').val();	
		if(userid!=''){							//判断是否为账号登录
			password = $.md5(password);
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checklogin.do?userid='+userid+'&password='+password;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="x 用户名不存在"){
						$("#passwordtext").html('');
						$("#usernametext").html(txt);
					}else if(txt=="x 密码错误"){
						$("#usernametext").html('');
						$("#passwordtext").html(txt);
					}else{
						$('#form').submit();
					}
				}
			};
			xhr.send(null);
		}else if(telephone!=''){				//判断是否是短信登录
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checklogincode.do?telephone='+telephone+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码不正确"){
						$("#codetext").html(txt);
					}else if(txt=="× 该手机号未注册"){
						$("#telephonetext").html(txt);
					}else{
						$('#form').submit();
					}
				}
			};
			xhr.send(null);
		}else{
			$("#usernametext").html("x 用户名不能为空");
			$("#telephonetext").html("x 手机号不能为空");
		}
	})
})