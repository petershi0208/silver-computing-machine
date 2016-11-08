//获得ajax对象
function getXhr(){
		  var xhr = null;
		  if(window.XMLHttpRequest){
		    xhr=new XMLHttpRequest();  
		  }else{
		    xhr = new ActiveXObject('microsoft.XMLHttp');
		  }		
		   return xhr;
		}


//充值页面格式判断
$(function(){
	 $('#buttoncz').click(function(){
		 var bank=$('input:radio[name="a"]:checked').val();
		 if(bank!='weixin'){
			alert("目前支持微信充值，网银充值和支付宝充值功能待开放") ;
			return;
		 }
		 
		 
		var money = $('#money').val();
		var code = $('#code').val();
		var realname = $('#realname').val();
		var reg=/^[0-9]*$/;
		if(realname==''){
			alert("请先实名认证");
			return;
		}
		
		if(money==''||!reg.test(money)){
			$('#moneytext').html("金额不为空且必须是整数");
			return;
		}
		if(code==''){
			$('#moneytext').html("");
			$('#codetext').html("请输入验证码");
			return;
		}
		
//		if(reg.test(money)){
			var xhr = getXhr();
			xhr.open('get','/Daqian/alipaycode.do?code='+code,false);
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=='ok'){
						
						$(".backgr").show();
						$(".qrjg").show();
						$('form').submit();
					}else{
						$('#codetext').html(txt);
					}		
				}
			};
			xhr.send();
	
//		}else{
//			$('#moneytext').html("请输入正确的金额");
//		}
	 })	  
});
