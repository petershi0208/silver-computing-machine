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
	var email = $('table tr:nth-child(3) td:nth-child(2)').text();
	var qq = $('table tr:nth-child(5) td:nth-child(2)').text();
	var sex = $('table tr:nth-child(6) td:nth-child(2)').text();
	var address = $('table tr:nth-child(7) td:nth-child(2)').text();
	if(email==''){
		$('table tr:nth-child(3) td:nth-child(2)').css('color','#aaa');
		$('table tr:nth-child(3) td:nth-child(2)').text('未填写');
	}
	if(qq==''){
		$('table tr:nth-child(5) td:nth-child(2)').css('color','#aaa');
		$('table tr:nth-child(5) td:nth-child(2)').text('未填写');
	}
	if(sex==''){
		$('table tr:nth-child(6) td:nth-child(2)').css('color','#aaa');
		$('table tr:nth-child(6) td:nth-child(2)').text('未填写');
	}
	if(address==''){
		$('table tr:nth-child(7) td:nth-child(2)').css('color','#aaa');
		$('table tr:nth-child(7) td:nth-child(2)').text('未填写');
	}
	
	//左侧按钮
	$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	$('#navlist li:nth-child(1) a').css('color','#fff').css('background','#09f');
	$('#navlist li:nth-child(1) a').hover(function(){
		$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	},function(){
		$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	})
})