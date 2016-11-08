//鼠标选中时触发，将文本与当前为空
function validate_selectd(val, inputId) {
	if (val == "输入用户名" || val == "输入手机号码" || val == "输入邮箱" || val == "输入密码"
			|| val == "再次输入密码" || val == "输入推荐人手机号码") {
		val = "";// 当前值为空
		document.getElementById(inputId).value = "";// 显示的文本为空
		$("#"+inputId).css("color","#000");
	}
}

/* 普通文本验证 */
function validate(val, divId) {
	var userText = document.getElementById(divId); // 获取 div 对象

	userText.style.color = "red";// 默认红色

	if (userText.title == "username") {

		// 如果为空或者输入空格执行
		if (!(val.match(/^\S+$/))) {
			userText.innerHTML = "× 用户名不允许为空";
			return false;
		} else {
			if (val.length < 2) {
				userText.innerHTML = "× 用户名长度为2-16个字符之间";

			} else {
				//ajax判断用户名是否被注册	
				$.ajax({
					url : "userValid?reg_name='" + val + "'",
					type : 'post',
					dataType : 'json',
					success:function(msg){	
						if(msg.statusCode == 300){
							userText.style.color="red";
							userText.innerHTML = "× 用户名已被注册"; 
							return;
						}else if(msg.statusCode == 303){
							userText.style.color="red";
							userText.innerHTML = "× 用户名不允许为空"; 
							return;
						}
						else if(msg.statusCode == 200){
							userText.style.color = "#00E300";// 可以使用的用户名改变颜色		
							userText.innerHTML = "√ 用户名可以使用"; // 值正常的话先制空			
						}						
					}
				});		
			}
		}

	} else if (userText.title == "email") {
		// 如果为空或者输入空格执行
		if (!(val.match(/^\S+$/))) {
			userText.innerHTML = "× 邮箱不允许为空";

		} else if (!(val
				.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/))) {
			userText.innerHTML = "× 邮箱格式不正确";

		} else {

			//ajax判断邮箱是否被使用	
			$.ajax({
				url : "emailValid?email='" + val + "'",
				type : 'post',
				dataType : 'json',
				success:function(msg){	
					if(msg.statusCode == 300){
						userText.style.color="red";
						userText.innerHTML = "× 此邮箱已被使用"; 
						return;
					}else if(msg.statusCode == 303){
						userText.style.color="red";
						userText.innerHTML = "× 邮箱不允许为空"; 
						return;
					}
					else if(msg.statusCode == 200){
						userText.style.color = "#00E300";// 可以使用的用户名改变颜色		
						userText.innerHTML = "√ 此邮箱可以使用"; // 值正常的话先制空			
					}						
				}
			});		
		}

	} else if (userText.title == "mobiles") {
		// 如果为空或者输入空格执行
		if (!(val.match(/^\S+$/))) {
			userText.innerHTML = "× 手机号码不允许为空";

		} else if (!(val.match(/^1[3|4|5|7|8][0-9]\d{4,8}$/))) {
			userText.innerHTML = "× 手机号码格式不正确";

		} else {

			//ajax判断手机号是否被使用	
			$.ajax({
				url : "mobileValid?mobile='" + val + "'",
				type : 'post',
				dataType : 'json',
				success:function(msg){	
					if(msg.statusCode == 300){
						userText.style.color="red";
						userText.innerHTML = "× 此手机号已被使用"; 
						return;
					}else if(msg.statusCode == 303){
						userText.style.color="red";
						userText.innerHTML = "× 手机号不允许为空"; 
						return;
					}
					else if(msg.statusCode == 200){
						userText.style.color = "#00E300";// 可以使用的用户名改变颜色		
						userText.innerHTML = "√ 此手机号可以使用"; // 值正常的话先制空			
					}						
				}
			});		
		}

	}else if (userText.title == "refereeMobiles") {
		// 如果为空或者输入空格执行
		if (!(val.match(/^\S+$/))) {
			userText.innerHTML = "× 推荐人手机号码不允许为空";

		} else if (!(val.match(/^1[3|4|5|7|8][0-9]\d{4,8}$/))) {
			userText.innerHTML = "× 推荐人手机号码格式不正确";

		} else {
			userText.style.color = "#00E300";// 可以使用的用户名改变颜色		
			userText.innerHTML = "√ 此手机号可以使用"; // 值正常的话先制空			
		}

	}else if(userText.title == "verificationCodes"){
		if (!(val.match(/^\S+$/))) {
			userText.innerHTML = "请输入验证码！";
		}else{
			
			//ajax判断验证码是否正确
			$.ajax({
				url : "validationImg?inputRandomCode=" + val,
				type : 'post',
				dataType : 'json',
				success:function(msg){
					if(msg.statusCode == 300){
						userText.style.color="red";
						userText.innerHTML = "× 验证码错误"; 
						return;
					}else if(msg.statusCode == 200){
						userText.style.color = "#00E300";// 可以使用的用户名改变颜色		
						userText.innerHTML = "√ 验证码正确"; // 值正常的话先制空			
					}						
				}
			});	
		}
	}

}

/* 密码框类型转换 */
function passwordValidate(passwordId_01, passwordId_02) {
	var passwordid_01 = document.getElementById(passwordId_01);
	if (passwordid_01.title == "password"
			|| passwordid_01.title == "repetitionPassword") {
		$("#" + passwordId_01).hide();// 隐藏
		$("#" + passwordId_02).show();// 显示
		$("#" + passwordId_02).select();// 选中
	}
}

// 声明 password 保存第一次密码
var password = "";
// 声明 repetitionPassword 保存重复密码
var repetitionPassword = "";

/* 验证密码 */
function passwordValidates(val, pwd) {

	var pwdText = document.getElementById(pwd);
	pwdText.style.color = "red";// 默认红色

	if (pwdText.title == "password") {
		if (!(val.match(/^\S+$/))) {
			pwdText.innerHTML = "× 登录密码不允许为空";

		} else if (!(val.match(/^[a-zA-Z]\w{5,21}$/)) && (val.match(/^\S+$/))) {
			pwdText.innerHTML = "× 密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线";

		} else {
			pwdText.style.color = "#00E300";// 可以使用的用户名改变颜色
			pwdText.innerHTML = "√ 密码格式正确"; // 值正常的话先制空
			password = val; // 赋值

			// 当第一次密码输入时判断与重复密码是否相符
			if (password == repetitionPassword) {
				document.getElementById("repetitionPwdText").style.color = "#00E300";// 可以使用的用户名改变颜色
				// document.getElementById("").innerHTML="√ 重复密码格式正确";
				// //值正常的话先制空
				$("#repetitionPwdText").html("√ 重复密码格式正确");

			} else if (password != repetitionPassword
					&& repetitionPassword != "") {

				document.getElementById("repetitionPwdText").style.color = "red";// 可以使用的用户名改变颜色
				$("#repetitionPwdText").html("× 您输入的密码不一致");

			}
		}

	} else if (pwdText.title == "repetitionPassword") {

		if (!(val.match(/^\S+$/))) {
			pwdText.innerHTML = "× 重复密码不允许为空";

		} else if (!(val.match(/^[a-zA-Z]\w{5,21}$/))) {
			pwdText.innerHTML = "× 重复密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线";

		} else if ($("#repetitionPwd").val() == "再次输入密码") {
			$("#repetitionPwdText").html("请输入确认密码 ！");

		} else if (password != val) {

			pwdText.innerHTML = "× 您输入的密码不一致";
			repetitionPassword = val;// 将重复密码赋值

		} else {
			pwdText.style.color = "#00E300";// 可以使用的用户名改变颜色
			pwdText.innerHTML = "√ 重复密码格式正确"; // 值正常的话先制空
			repetitionPassword = val;
		}
	}
}

/* 注册选择服务类型 */
function manageMoneyBtn() {
	$("#manageMoney").css("background-image",
			"url(../new_style/web_image/register/register_btn_red.png)");
	$("#manageMoneyText").css("color", "#ca141d");

	// 替换值
	$("#manageMoneyName").attr("name", "reg_type");
	$("#manageMoneyName").attr("value", "manageMoney");
	$("#borrowMoneyName").removeAttr("name");
	$("#borrowMoneyName").attr("value", "");
	

	$("#borrowMoney").css("background-image",
			"url(../new_style/web_image/register/register_btn_gray.png)");
	$("#borrowMoneyText").css("color", "#a2a2a2");

	$("#serveType").html("");

}
/* 注册选择服务类型 */
function borrowMoneyBtn() {
	$("#borrowMoney").css("background-image",
			"url(../new_style/web_image/register/register_btn_red.png)");
	$("#borrowMoneyText").css("color", "#ca141d");

	// 替换值
	$("#borrowMoneyName").attr("name", "reg_type");
	$("#borrowMoneyName").attr("value", "borrowMoney");
	$("#manageMoneyName").removeAttr("name");
	$("#manageMoneyName").attr("value", "");

	$("#manageMoney").css("background-image",
			"url(../new_style/web_image/register/register_btn_gray.png)");
	$("#manageMoneyText").css("color", "#a2a2a2");

	$("#serveType").html("");
}

//关于条款
function checkBtn() {
	if ($("#btnCheckId").attr('checked')) {
		$("#btnCheck").html("");
	} else {
		$("#btnCheck").html("！ 请同意我们的条款");
		return;
	}

}

/**
 * 验证推荐人手机号，推荐人手机号码非必填，如果填了，就必须要验证正确性
 * @returns {Boolean}
 */
function checkRefereeMobile(){
	if($("#refereeMobile").val()){
		if(!$("#refereeMobile").val().match(/^\d{11,}$/)){
			$("#refereeMobiles").css("color","red"); 
			$("#refereeMobiles").html("推荐人手机号码不符合规范！");
			return true;	
		}else{
			return false;
		}	
	}
	return false;
}

/*点击注册触发*/
function btnValidate(){
	   
	//获取并判断表单中所有文本是否是默认值
	if($("#uname").val() == "输入用户名"){ 	 //判断密码
		$("#username").html("请输入用户名 ！");		
		return;
		
	}else if(!$("#uname").val().match(/^\S+$/)){	
		$("#username").html("× 用户名不允许为空");
		return;
		
	}else if(!$("#mobile").val().match(/^\d{11,}$/)){	
		$("#mobiles").css("color","red"); 
		$("#mobiles").html("手机号码不符合规范！");
		return;
	}
	else if(checkRefereeMobile()){	
		return;	
	}
	else{
		
		//ajax判断用户名是否被注册
		$.ajax({
			url : "userValid?reg_name='" + $("#uname").val() + "'",
			type : 'post',
			dataType : 'json',
			success:function(msg){	
				if(msg.statusCode == 300){
					$("#username").css("color","red");
					$("#username").html("× 用户名已被注册");
					return;
				}else if(msg.statusCode == 303){
					$("#username").css("color","red");
					$("#username").html("× 用户名不允许为空");
					return;
				}else if(msg.statusCode == 200){
					$("#username").css("color","#00E300");
					$("#username").html("√ 用户名可以使用");		
				

					/*验证密码*/
					if($("#pwd").val() == "输入密码"){	
						$("#pwdText").html("请输入密码 ！");	
						if($("#repetitionPwd02").val()!=""){
							$("#repetitionPwdText").css("color","red");
							$("#repetitionPwdText").html("× 您输入的密码不一致");
							return;	
						}		
						return;
					}else if(!$("#pwd02").val().match(/^\S+$/)){
						$("#pwdText").html("× 登录密码不允许为空");
						
						if($("#repetitionPwd02").val()!=""){
							$("#repetitionPwdText").css("color","red");
							$("#repetitionPwdText").html("× 您输入的密码不一致");
							return;	
						}			
						return;	
					}else if(!($("#pwd02").val().match(/^[a-zA-Z]\w{5,21}$/)) && $("#pwd02").val().match(/^\S+$/)){	
						$("#pwdText").html("× 密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线");
						
						if($("#repetitionPwd02").val()!=""){
							$("#repetitionPwdText").css("color","red");
							$("#repetitionPwdText").html("× 您输入的密码不一致");
							return;	
						}		
						return;	
					}else if($("#repetitionPwd").val() == "再次输入密码"){		
						
						$("#repetitionPwdText").html("请输入确认密码 ！");	
						return;			
						
					}else if(!($("#repetitionPwd02").val().match(/^\S+$/))){		
				    	
				    	$("#repetitionPwdText").html("× 重复密码不允许为空");		
				    	return;    
						
					}else if(!($("#repetitionPwd02").val().match(/^[a-zA-Z]\w{5,21}$/))){
						
						$("#repetitionPwdText").html("× 重复密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线");		
						return;
						
					}else if($("#repetitionPwd02").val() != $("#pwd02").val()){
						$("#repetitionPwdText").html("× 您输入的密码不一致");
						return;
					
					}
					else if($("#eml").val() == "输入邮箱"){ //email验证		
						$("#email").html("请输入邮箱 ！");	
						return;
					}/*else if(!($("#eml").val().match(/^\S+$/))){	
						$("#email").html("× 邮箱不允许为空");	
						return;
					}else if(!($("#eml").val().match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/))){
				     
				        $("#email").html("× 邮箱格式不正确");
				        return;
				    }*/else{

				   		//红色背景
						var red = "red";		
						var borrowMoneyUrl = $("#borrowMoney").css("background-image");
						var manageMoneyUrl = $("#manageMoney").css("background-image");
						
				    	//ajax判断邮箱是否被使用	
						$.ajax({
							url : "emailValid?email='" + $("#eml").val() + "'",
							type : 'post',
							dataType : 'json',
							success:function(msg){	
								if(msg.statusCode == 300){
									$("#email").css("color","red"); 
									$("#email").html("× 此邮箱已被使用");
									return;
								}else if(msg.statusCode == 303){
									$("#email").css("color","red"); 
									$("#email").html("× 邮箱不允许为空");
									return;
								}else if(msg.statusCode == 200){
									$("#email").css("color","#00E300"); 
									$("#email").html("√ 此邮箱可以使用");	
										
									/*手机验证*/ 
								    if($("#mobile").val() == "输入手机号码"){		
										$("#mobiles").html("请输入手机号码 ！");	
										return;
									}else if(!($("#mobile").val().match(/^\S+$/))){	
										$("#mobiles").html("× 手机号码不允许为空");	
										return;
									}else if(!($("#mobile").val().match(/^1[3|4|5|7|8][0-9]\d{4,8}$/))){     
								        $("#mobiles").html("× 手机号码格式不正确");
								        return;
								    }
								    
								    	//ajax判断手机号是否被使用	
										$.ajax({
											url : "mobileValid?mobile='" + $("#mobile").val() + "'",
											type : 'post',
											dataType : 'json',
											success:function(msg){	
												if(msg.statusCode == 300){
													$("#mobiles").css("color","red");
													$("#mobiles").html("× 此手机号已被使用"); 
													return;
												}else if(msg.statusCode == 303){			
													$("#mobiles").css("color","red");
													$("#mobiles").html("× 手机号不允许为空"); 
													return;
												}else if(msg.statusCode == 200){
													$("#mobiles").css("color","#00E300");
													$("#mobiles").html("√ 此手机号可以使用");	
												}
												if(manageMoneyUrl.indexOf(red)<0  && borrowMoneyUrl.indexOf(red)<0  &&
														$("#manageMoneyName").attr("value")=="" && $("#borrowMoneyName").attr("value")==""){
													$("#serveType").html("！ 请选择服务类型");	
													return;		
												}
												if($("#btnCheckId").attr('checked')){			
													$("#btnCheck").html("");
				
												}else if($("#btnCheckId").attr('checked') == false){		
													$("#btnCheck").html("！ 请同意我们的条款");
													return;
												}
												
												
												document.forms[0].submit();						
											}
										});		
								    
								    
							
							   
									
						
									
									
									//以上过程执行后提交form表单
								
								}						
							}
						});		
				    }    		
				}						
			}
		});		
	}

		
} 


// 将服务类型的值置空
function refresh() {
	$("#manageMoneyName").attr("value", "");
	$("#manageMoneyName").attr("name", "");
	
	$("#borrowMoneyName").attr("value", "");
	$("#borrowMoneyName").attr("name", "");
}


// 刷新事件
window.onload= refresh();