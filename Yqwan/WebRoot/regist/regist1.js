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

//输入用户名框失去光标判断
$(function(){
	$('#username').blur(function(){
		checkusername();
	})
})

function checkusername(){
	$("#usernametext").css('color','#f00');		//用户名提示改为红色
	var username = $('#username').val();
	var reg = /^[0-9A-Za-z]{5,12}$/;
	if(username==''){
		$('#usernametext').html("× 用户名不允许为空");
	}else if(!reg.test(username)){
		$('#usernametext').html("×用户名为5-12位英文或数字");		
	}else{
		$('#usernametext').html("");
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/checkusername.do?username='+username;
		xhr.open('get',uri,false);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=="× 用户名已被注册"){
					$("#usernametext").html(txt);
					return;
				}else{							
					$("#usernametext").css('color','#00E300');// 可以使用的用户名改变颜色						
					$("#usernametext").html(txt);
				}	
			}
		};
		xhr.send(null);
	}
}

//输入密码框失去光标判断
$(function(){
	$('#pwd').blur(function(){
		checkpwd();
	})
})
function checkpwd(){
	$("#pwdtext").css('color','#f00');		//密码提示改为红色
	var pwd = $('#pwd').val();
	var reg = /^[a-zA-Z]\w{5,21}$/;
	if(pwd==''){
		$('#pwdtext').html("× 密码不允许为空");
	}else if(!reg.test(pwd)){
		$('#pwdtext').html("× 密码格式错误");		
	}else{
		$("#pwdtext").css('color','#00E300');// 可以使用的用户名改变颜色						
		$("#pwdtext").html("√ 密码格式正确");
	}
}
//确认密码框失去光标判断
$(function(){
	$('#qrpwd').blur(function(){
		checkqrpwd();
	})
})
function checkqrpwd(){
	$("#qrpwdtext").css('color','#f00');		//密码提示改为红色
	var pwd = $('#pwd').val();
	var qrpwd = $('#qrpwd').val();
	if(pwd!=qrpwd){
		$('#qrpwdtext').html("× 两次密码不一致");
	}else{
		$("#qrpwdtext").css('color','#00E300');// 可以使用的用户名改变颜色						
		$("#qrpwdtext").html("√");
	}
}



//昵称判断
$(function(){
	$('#nickname').blur(function(){
		checknickname();
	})
})
function checknickname(){
	$("#nicknametext").css('color','#f00');		//密码提示改为红色
	var nickname = $('#nickname').val();
	var reg = /^[\u4e00-\u9fa5_a-zA-Z0-9_]{1,7}$/;
	if(nickname==''||nickname.indexOf("199y") > -1||nickname.indexOf("客服") > -1){
		$('#nicknametext').html("× 昵称不合法");
		return;
	}else if(!reg.test(nickname)){
		$('#nicknametext').html("× 昵称为7位以下中英文数字");
		return;
	}else{
		$('#nicknametext').html("");
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/checknickname.do?nickname='+encodeURI(encodeURI(nickname));;
		xhr.open('get',uri,false);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=="√ 昵称可以使用"){
					$("#nicknametext").css('color','#00E300');// 可以使用的用户名改变颜色	
					$("#nicknametext").html(txt);
					return;
				}else{																	
					$("#nicknametext").html(txt);
				}	
			}
		};
		xhr.send(null);
	}
}


//姓名中文判断
$(function(){
	$('#realname').blur(function(){
		checkrealname();
	})
})
function checkrealname(){
	$("#realnametext").css('color','#f00');		//密码提示改为红色
	var name = $('#realname').val();
	var namereg=/^([\u4e00-\u9fa5]){2,7}$/; //只能是中文，长度为2-7位
	if(name==''){
		$("#realnametext").html("× 姓名不允许为空");
	}else if(!namereg.test(name)){
		$("#realnametext").html("× 姓名格式错误");
	}else{
		$("#realnametext").css('color','#00E300');// 可以使用的用户名改变颜色						
		$("#realnametext").html("√ 正确");
	}
}

//身份证号判断
$(function(){
	$('#idcard').blur(function(){
		checkidcard();
	})
})
function checkidcard(){
	$("#idcardtext").css('color','#f00');		//密码提示改为红色
	var idcard = $('#idcard').val();
	var cardreg = /^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)?$/;
	if(idcard==''){
		$("#idcardtext").html("× 身份证不允许为空");
	}else if(!cardreg.test(idcard)){
		$("#idcardtext").html("× 身份证号错误");
	}else{
		$("#idcardtext").css('color','#00E300');// 可以使用的用户名改变颜色						
		$("#idcardtext").html("√ 正确");
	}
}

//手机号输入框失去光标判断
$(function(){
	$('#telephone').blur(function(){
		checkphone();
	})
})

function checkphone(){
	$("#telephonetext").css('color','#f00');		//手机号提示改为红色
	var telephone = $('#telephone').val();
	var reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
	if(telephone==''){
		$('#telephonetext').html("× 手机号不允许为空");
	}else if(!reg.test(telephone)){
		$('#telephonetext').html("× 手机号格式错误");		
	}else{
		$('#telephonetext').html("");
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/checktelephone.do?telephone='+telephone;
		xhr.open('get',uri,false);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=="× 此手机号已被使用"){
					$("#telephonetext").html(txt);
					return;
				}else{			
					$("#telephonetext").css('color','#00E300');// 可以使用的用户名改变颜色						
					$("#telephonetext").html(txt);
				}	
			}
		};
		xhr.send(null);
	}
}

//点击下一步按钮判断
$(function(){
	$('#button').click(function(){
		checkusername();
		checkpwd();
		checkqrpwd();
		checknickname();
//		checkrealname();
//		checkidcard();
		checkphone();
		var usernamespan = $('#usernametext').html();
		var pwdspan = $('#pwdtext').html();
		var qrpwdspan = $('#qrpwdtext').html();
		var telephonespan = $('#telephonetext').html();
//		var realnamespan = $('#realnametext').html();
//		var idcardspan = $('#idcardtext').html();
		var nicknamespan = $('#nicknametext').html();
		if(usernamespan!="√ 用户名可以使用"){
			return;
		}else if(pwdspan!="√ 密码格式正确"){
			return;
		}else if(qrpwdspan!="√"){
			return;
		}else if(nicknamespan != "√ 昵称可以使用"){
			return;
		}
/*		else if(realnamespan!="√ 正确"){
			return;
		}else if(idcardspan!="√ 正确"){
			return;
		}
*/		else if(telephonespan!="√ 此手机号可以使用"){
			return;
		}else if(!$('#service').is(':checked')){
			$("#servicetext").css('color','#f00');			//改变颜色
			$('#servicetext').html("!请勾选条款");
			return;
		}else{
			$('#form').submit();
/*			$("#registcodetext").css('color','#f00');		//验证码提示改为红色
			var registcode = $('#registcode').val();
			var xhr = getXhr();
			//发送请求
			var uri = '/Yqwan/checkcode.do?code='+registcode;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="× 验证码错误"){
						$("#registcodetext").html(txt);
						return;
					}else{			
						$("#registcodetext").css('color','#00E300');// 可以使用的用户名改变颜色						
						$("#registcodetext").html(txt);
						$('#form').submit();
					}	
				}
			};
			xhr.send(null);
*/
		}
	})
})

//判断邀请码为空否
$(function(){
	var code = $('#invite').val();
	if(code!=''){
		$('#invite').attr('readonly','readonly');
		$('#invitetext').text('');
	}
})