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

//判断资料完善不
$(function(){
	
	//左侧按钮
	$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	$('#navlist li:nth-child(1) a').css('color','#fff').css('background','#09f');
	$('#navlist li:nth-child(1) a').hover(function(){
		$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	},function(){
		$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	})
})

//修改资料
$(function(){
	$('#informationbutton').click(function(){
		var email = $('#email').val();
		var qq = $('#qq').val();
		var province = $('#province').val();
		var city = $('#city').val();
		var county = $('#county').val();
		var address = $('#address').val();
		var reg=/^\d{5,10}$/;
		var email_reg =/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		if(!email_reg.test(email)){
			alert("email不合法!");
		}else if(!reg.test(qq)){	
			alert("qq号不合法!");
		}else if(city=="省份"||city=="地级市"||county=="市县级"||address==""){
			alert("请输入合法地址");
		}else{
			$('#form').submit();
		}
	})
})