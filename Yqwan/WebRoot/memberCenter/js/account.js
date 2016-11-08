$(function(){
	var email = $('#middle').text();
	var realname = $('#realnameaccount').val();	
//判断邮箱是否绑定
	if(email!=''){							
		email = email.split('@')[1];
		$('#middle').text('目前您绑定的邮箱是:********@'+email);	
	}else{
		$('#middle').text("");
		var text = "邮箱未绑定<br /><span><a href='/Yqwan/memberCenter/addemail.jsp'>立即绑定</a></span>"
		$('#middle').append(text);
	}
//判断有无实名认证
	if(realname!=''){
		var text ="您已通过实名认证<br /><span><a href='memberCenter/realname.jsp'>点击查看</a></span>"
		$('#middlerealname').append(text);
	}else{
		var text ="目前尚未通过实名认证<br /><span><a href='memberCenter/realname.jsp'>实名认证</a></span>"
		$('#middlerealname').append(text);
	}
})