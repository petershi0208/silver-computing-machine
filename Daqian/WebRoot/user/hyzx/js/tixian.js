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


$(function(){
	$('#tixian').click(function(){
		var money = $('#money').val();
		var paypwd = $('#paypwd').val();
		var availablemoney = $('#availablemoney').val();
		var username = $('#username').val();
		var reg=/^[0-9]*$/;
		if(money==''||!reg.test(money)){
			$('#moneytext').html("金额不为空且必须是整数");
			return;
		}
		
		if(paypwd==''){
			$('#moneytext').html("");
			$('#pwdtext').html("请输入支付密码");
			return;
		}
		
		if(money-availablemoney>0){
			$('#pwdtext').html("");
			$('#moneytext').html("可用余额不足");
			return;
		}
		
		var xhr = getXhr();
		xhr.open('get','/Daqian/tixian.do?username='+username+'&paypwd='+paypwd,true);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;	
					if(txt=="success"){
						alert("您的提现请求已收到，我们将在一个工作日内审核后给你答复");
						$("form").submit();
					}else{
						$('#pwdtext').html(txt);
					}
			}
		};
		xhr.send();
		
	})
})