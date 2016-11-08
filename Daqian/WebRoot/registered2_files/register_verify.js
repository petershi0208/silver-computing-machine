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

var valObj;
var count = 60;
var curCount;
var code = "";
var codeLength = 6;
curCount = count;

//oumouseout
function SmsValidate() {
	$form = $("#form");
	var phone = $("#mobile", $form).val();
	var phoneSms = /^(13[0-9]|15[0-9]|18[0-9]|17[0-9]\d{8})$/;
	if (!phoneSms.test(phone)) {
		$("#verificationText").html("x请输入正确的手机号");
	}
	if (!$("#verification").val().match(/^\S+$/)) {

		$("#verificationText").html("× 验证码不允许为空");
	} else {

		$("#verificationText").html("");
	}

}

/* 验证选择服务和服务条款button*/
function btnSmsValidate() {
	var value=$('#verification').val();
	var p = $('#mobile').val();
	var xhr = getXhr();
	//发送请求
	var uri = '/Daqian/checkcode.do?code='+value+'&phone='+p;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
			if(txt=="× 验证码不正确"){
				$("#verificationText").html(txt);
			}else{
				document.forms[0].submit();
			}
		}
	};
	xhr.send(null);
	
//	if (!$("#verification").val().match(/^\S+$/)
//			|| $("#verification").val() == ""
//			|| $("#verification").val() == "输入验证码") {
//
//		$("#verificationText").html("× 验证码不允许为空");
//		return false;
//	} else {
//	
//		if($("#verification").val() != $("#code").val()){
//			$("#verificationText").html("× 验证码不正确");
//			return false;
//		}	
//		$("#verificationText").html("");
//	}
//
//	document.forms[0].submit();

}

//onclick
function clickVerification(val, inputId) {
	if (val.match(/^\S+$/) == "输入验证码") {
		val = "";
		document.getElementById(inputId).value = "";// 显示的文本为空
	}

}

//异步向服务器发送 短信触发功能 请求
$(function(){
	$('#send').click(function(){
		var value=$('#mobile').val();
		var xhr = getXhr();
		//发送请求
		var uri = '/Daqian/sendsms.do?phone='+value;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
			}
		};
		xhr.send(null);
	})
})



/*获取验证码*/
//function loadVerify(){
//	document.getElementById("registerVrifyCode_send").setAttribute("onclick", "");
//	$.ajax({
//		  url: "getGainAuthCode",
//		  type: "POST",
//		  dataType : 'json',
//		  data: "mobile="+$("#mobile").val(),
//		  success: function(msg){
//			   if(msg.statusCode==200){
//				   $("#code").val(msg.message);
//			   }			  
//		  }
//		
//	});
//
//}



//var timer;
////启动跳转定时器
//function startTimes() {
//	timer = window.setInterval(showSecondes, 1000);
//}
//
//var i = 61;
//function showSecondes() {
//	if (i > 0) {
//		i--;
//		$("#registerVrifyCode_send").val(i+"秒后重新获取");	
//	} else {
//		//$("#registerVrifyCode_send").css("background-color", "#3598D8");
//		document.getElementById("registerVrifyCode_send").setAttribute("onclick", "popCenterWindow_registerVerify()");
//		$("#registerVrifyCode_send").val("获取验证码");
//		i = 60;
//		window.clearInterval(timer);
//		return;
//	}
//}


//$(document).ready(function(){
//	//ajax判断验证码是否正确
//	$("#verification_code").click(function(){
//		if($("#verificationCode").val() == ""){
//			$("#erroe_code").html("× 验证码不允许为空");
//			return;
//		}
//		
//		$.ajax({
//			url : "validationImg?inputRandomCode="+$("#verificationCode").val(),
//			type : 'post',
//			dataType : 'json',
//			success:function(msg){
//				if(msg.statusCode == 300){
//					$("#erroe_code").html("× 验证码错误");
//					return;
//				}else if(msg.statusCode == 200){
//					//发送验证码
//					
//					//关闭窗口
//					$("body").eq(0).css("overflow","");	
//					$("#registerVerify_hint").css("display", "none");
//					$("#registerVerify_hint_DIV").css("display", "none");
//					//$("#registerVrifyCode_send").css("background-color", "#999999");
//					$("#registerVrifyPhoneHint").html("验证码已发送至您手机，请确保您的手机号码真实有效。");
//					startTimes();
//					loadVerify();		
//				}						
//			}
//		});	
//	});
//	
//});




//
////获取窗口的高度
//var windowHeight_registerVerify;
//
//// 获取窗口的宽度
//var windowWidth_registerVerify;
//
//// 获取弹窗的宽度
//var popWidth_registerVerify;
//
//// 获取弹窗高度
//var popHeight_registerVerify;
//
///*打开初始化页面*/
//function init_registerVerify() {
//	$("#registerVerify_hint").css("height",document.body.scrollHeight+"px");
//	$("#registerVerify_hint").css("display","block");
//	
//	windowHeight_registerVerify = $(window).height();
//	windowWidth_registerVerify = $(window).width();
//	
//	popHeight_registerVerify = $("#registerVerify_hint_DIV").height();
//	popWidth_registerVerify = $("#registerVerify_hint_DIV").width();
//
//}
//
//// 关闭窗口的方法
//function closeWindow_registerVerify() {
//
//	$("#close_registerVerify").click(function() {
//		$("body").eq(0).css("overflow","");
//		$("#registerVerify_hint").css("display", "none");
//		$("#registerVerify_hint_DIV").css("display", "none");	
//	
//	});
//	
//}
//
//// 定义弹出居中窗口的方法
//function popCenterWindow_registerVerify() {
//	refreshValidation('imgs');//刷新验证码
//	//$("body").eq(0).css("overflow","hidden");
//	init_registerVerify();
//
//	// 计算弹出窗口的左上角Y的偏移量
//	var popY_registerVerify = (windowHeight_registerVerify - popHeight_registerVerify) / 2 - 80;
//	var popX_registerVerify = (windowWidth_registerVerify - popWidth_registerVerify) / 2;
//	
//	// 设定窗口的位置
//	$("#registerVerify_hint_DIV").css("top", popY_registerVerify).css("left", popX_registerVerify).show();
//	
//	closeWindow_registerVerify();
//
//}
//
///*刷新验证码*/
//function refreshValidation(imgObj){
//	document.getElementById(imgObj).src="/webApplicationSign/getImg?date=" + new Date().getTime();
//}