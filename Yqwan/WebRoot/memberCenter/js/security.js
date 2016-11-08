// JavaScript Document

$(function(){
	var telephone = $('#memberright_telephone').val();
	var email = $('#memberright_email').val();
	$("#secure_telephonebind").click(function(){		
		if(telephone==''){
			window.location.href="/Yqwan/memberCenter/cellphonebind.jsp";
		}else{
			alert("您已绑定手机,如需换绑手机请先解绑!")
		}
	})
	$("#secure_telephone").click(function(){
		if(telephone!=''){
			window.location.href="/Yqwan/memberCenter/cellphone.jsp";
		}else{
			alert("您尚未绑定手机");
		}
	})
	
	$("#secure_addemail").click(function(){		
		if(email==''){
			window.location.href="/Yqwan/memberCenter/addemail.jsp";
		}else{
			alert("您已绑定邮箱!")
		}
	})
	$("#secure_modifyemail").click(function(){		
		if(email!=''){
			window.location.href="/Yqwan/memberCenter/modifyemail.jsp";
		}else{
			alert("您未绑定邮箱!")
		}
	})
})