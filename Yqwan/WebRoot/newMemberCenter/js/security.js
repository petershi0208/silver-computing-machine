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

//左侧按钮
$(function(){
	$('#navlist li:nth-child(2) img').attr('src','/Yqwan/newMemberCenter/images/zhanghaob.png')
	$('#navlist li:nth-child(2) a').css('color','#fff').css('background','#09f');
	$('#navlist li:nth-child(2) a').hover(function(){
		$('#navlist li:nth-child(2) img').attr('src','/Yqwan/newMemberCenter/images/zhanghaob.png')
	},function(){
		$('#navlist li:nth-child(2) img').attr('src','/Yqwan/newMemberCenter/images/zhanghaob.png')
	})
})

//判断安全级别
$(function(){
	var email = $('#email').val();
	var realname = $('#realname').val();
	var telephone = $('#telephone').val();
	var pwdproblem = $('#pwdproblem').val();
	var securitystate=10;
	if(!email==''){
		securitystate =Number(securitystate)+Number(20);
	}
	if(realname==''){		
		$('#realnamecheck').html('您尚未实名认证');
		$('#realnameresult').html('未认证').css('color','#aaa');
		$('#realnameclick').html('立即认证');
	}else{
		securitystate =Number(securitystate)+Number(30);
	}
	if(pwdproblem==''){	
		$('#pwdproblemresult').html('未设置').css('color','#aaa');
		$('#clickpwdproblem').html('设置密码提示问题');
	}else{
		securitystate =Number(securitystate)+Number(10);
	}
	if(telephone==''){
		$('#telephoneresult').html('未绑定').css('color','#aaa');
		$('#clicktelephone').html('立即绑定');
	}else{
		securitystate =Number(securitystate)+Number(30);
	}
	
	if(Number(securitystate)<30){
		$('#securitys').html('低');
	}else if(Number(securitystate)>29 && Number(securitystate)<71){
		$('#securitys').html('中');
	}else{
		$('#securitys').html('高');
	}
	var num = Number(securitystate)/100*640;
	$('#wanshan').html('完善'+securitystate+'%');
	$('#orangeline').css('width',num);
})



//验证码60s倒计时,同时发送验证短信
$(function(){
	//解绑
	$('#send').click(function(){	
		var telephone = $('#telephone_box_telephone').val();
		var imgcode = $('#imgcode').val();	
		sendmsg(telephone,imgcode);
	})
	//绑定
	$('#send_bind').click(function(){	
		var telephone = $('#telephonebind_box_telephone').val();
		var imgcode = $('#imgcode1').val();
		sendmsg(telephone,imgcode);
	})
})

//倒计时
function time(){
	var wait=60;
	var time = setInterval(function(){			
		   if(wait == 0) {
	            $('#send,#send_bind').attr("disabled",false);           
	            $('#send,#send_bind').val("获取验证码");
	            clearInterval(time)
	       }else{
	    	    $('#send,#send_bind').attr("disabled",'true');
	    	    $('#send,#send_bind').val("重新发送("+wait+")");
	            wait--;
		   }
	},1000);
}

//发送验证短信
function sendmsg(telephone,imgcode){
	var reg = "^1[3|4|5|8][0-9]{9}$";
	if(!telephone.match(reg)){
		$('#telephone_box_phonecodetext,#telephonebind_box_phonecodetext').html('手机号格式错误');
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
				time();
			}else{
				$('#telephone_box_phonecodetext,#telephonebind_box_phonecodetext').html(txt);
			}
		}
	};
	xhr.send(null);
}


//解绑手机号验证短信验证码是否正确
$(function(){
	$('#telephone_box_button').click(function(){
		var telephone = $('#telephone_box_telephone').val();
		var code = $('#telephone_box_phonecode').val();
		if(code==''){
			$('#telephone_box_phonecodetext').html('验证码为空');
			return;
		}	
		$('#telephone_box_phonecodetext').html(' ');
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/telephoneout.do?telephone='+telephone+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码不正确"){
						$("#telephone_box_phonecodetext").html(txt);
					}else{
						$('#telephone_box').hide();
						$('#success_box').show();
					}
				}
			};
			xhr.send(null);
	})
})

//绑定手机号验证短信验证码是否正确
$(function(){
	$('#telephonebind_box_button').click(function(){
		var telephone = $('#telephonebind_box_telephone').val();
		var code = $('#telephonebind_box_phonecode').val();
		
		var reg = "^1[3|4|5|8][0-9]{9}$";
		if(code==''){
			$('#telephonebind_box_phonecodetext').html('验证码为空');
			return;
		}
		if(!telephone.match(reg)||telephone==''){
			$('#telephonebind_box_phonecodetext').html('x格式错误');
			return;
		}
		$('#telephonebind_box_phonecodetext').html(' ');
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/telephonein.do?telephone='+telephone+'&code='+code;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码不正确"||txt=="×手机号已被绑定"){
						$("#telephonebind_box_phonecodetext").html(txt);
					}else{
						$('#telephonebind_box').hide();
						$('#success_box').show();
					}
				}
			};
			xhr.send(null);
	})
})

//实名认证验证格式
$(function(){
	$('#realname_box_not_tijiao').click(function(){
		var realname = $('#realname_box_not_realname').val();
		var idcard = $('#realname_box_not_idcard').val();
		var cardreg = /^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)?$/;
		var namereg=/^([\u4e00-\u9fa5]){2,7}$/; //只能是中文，长度为2-7位
		if(!namereg.test(realname)||realname==''){
			$('#realname_box_not_realname_text').html('格式错误');
			return;
		}
		if(!cardreg.test(idcard)||idcard==''){
			$('#realname_box_not_realname_text').html('');
			$('#realname_box_not_idcard_text').html('格式错误');
			return;
		}
		$('#realname_box_not_realname_text').html(' ');
		$('#realname_box_not_idcard_text').html(' ');
			
		realname=encodeURI(encodeURI(realname));
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/newmemberrealname.do?realname='+realname+'&idcard='+idcard;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="success"){
						$('#realname_box_not').hide();
						$('#success_box').show();
					}else{
						$('#realname_box_not_idcard_text').html('网络出错');
					}
				}
			};
			xhr.send(null);
	})
})


//密码提示验证格式
$(function(){
	$('#pwdproblem_box_not_tijiao').click(function(){
		var pwdproblem = $('#pwdproblem_box_not_pwd').val();
		if(pwdproblem.length>15){
			return;
		}		
		pwdproblem=encodeURI(encodeURI(pwdproblem));
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/pwdproblem.do?pwdproblem='+pwdproblem;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="success"){
						$('#pwdproblem_box_not').hide();
						$('#success_box').show();
					}else{
						$('#pwdproblem_box_not_pwd_text').html('网络出错');
					}
				}
			};
			xhr.send(null);
	})
})



//弹出框点击事件
$(function(){
	//手机号
	$('#modaltrigger').click(function(){
		var telephone = $('#telephone').val();
		if(telephone==''){
			$('#pwdproblem_box,#pwdproblem_box_not,#telephone_box,#realname_box,#realname_box_not,#success_box').hide();
			$('#telephonebind_box').show();
		}else{
			$('#pwdproblem_box,#pwdproblem_box_not,#telephonebind_box,#realname_box,#realname_box_not,#success_box').hide();
			$('#telephone_box').show();
		}	
	})
	//密码提示问题
	$('#modaltrigger2').click(function(){
		var pwdproblem = $('#pwdproblem').val();
		if(pwdproblem==''){
			$('#telephone_box,#pwdproblem_box,#telephonebind_box,#realname_box,#realname_box_not,#success_box').hide();
			$('#pwdproblem_box_not').show();
		}else{
			$('#telephone_box,#pwdproblem_box_not,#telephonebind_box,#realname_box,#realname_box_not,#success_box').hide();
			$('#pwdproblem_box').show();
		}		
	})
	//实名认证
	$('#modaltrigger3').click(function(){
		var realname = $('#realname').val();
		if(realname==''){
			$('#telephone_box,#realname_box,#pwdproblem_box,#pwdproblem_box_not,#telephonebind_box,#success_box').hide();
			$('#realname_box_not').show();
		}else{
			$('#telephone_box,#realname_box_not,#pwdproblem_box,#pwdproblem_box_not,#telephonebind_box,#success_box').hide();
			$('#realname_box').show();
		}		
	})
})
