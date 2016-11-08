var flag=false;

//验证码60s倒计时,同时发送验证短信
$(function(){
	$('#telclose').click(function(){
		$('.teltext').hide();
	})
	$('#send').click(function(){	
		var reg = "^1[3|4|5|8][0-9]{9}$";
		var telephone=$('#telephone').val();
		if(!telephone.match(reg)){
			$('#teltext').html("手机号格式错误");
			$('.teltext').show();
			return;
		}
		sendmsg(telephone);	
	})
	
	$('#queren').click(function(){
		if(flag==false) return;
		var telephone = $('#telephone').val();
		var code = $('#code').val();
		$.ajax({
			   type: "GET",
			   url: "renterlogin.do",
			   data: "telephone="+telephone+"&code="+code,
			   success: function(result){
					if(result=='success'){
						window.location.href="index.html"
					}else if(result =='fail'){
						$('#teltext').html("验证码错误");
					}else{
						window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx84b7a98d26a08ec7&redirect_uri=http://payrent.igjia.com/wxlogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect"
					}
			   }
		});
	})
	
	$('#telephone,#code').keyup(function(){
		var codelength = $('#code').val();
		var telephonelength = $('#telephone').val();
		if(telephonelength.length==11 && codelength.length==6){
			$('.queren div').css('background','#09f').css('color','#fff');
			flag=true;
		}else{
			$('.queren div').css('background','#eee').css('color','#999');
			flag=false;
		}
	})
})


//倒计时
function time(){
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


//发送验证短信
function sendmsg(telephone){
	$('#send').attr("disabled",'true');
	$.ajax({
		   type: "GET",
		   url: "payrentsendmsg.do",
		   data: "telephone="+telephone,
		   success: function(result){
				if(result=='success'){
					time();
				}else if(result == 'error'){
					window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx84b7a98d26a08ec7&redirect_uri=http://payrent.igjia.com/wxlogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect"
				}else{
					$('#send').attr("disabled",false);           
		            $('#send').val("重新发送");
				}
		   }
	});
}