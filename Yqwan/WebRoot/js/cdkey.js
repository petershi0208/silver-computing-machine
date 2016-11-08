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


//获取cdkey
$(function(){
	$('.cdkey').click(function(){
		var userid=$('#userid').val();
		if(userid==''){
			alert("请先登录!");
			window.location.href="/Yqwan/toindex.do";
			return;
		}
		
		var giftid=$('.giftid').val();
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/giftcdkey.do?giftid='+giftid+'&userid='+userid;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt!=null && txt!=''){
					$(".input").text(txt);
					$(".fix").css("visibility","visible");
					$(".fixbo").show();
				}else{
					alert("礼包已领完");
				}			
			}
		};
		xhr.send(null);
	})
	
	$('.cuo').click(function(){
		$(".fix").css("visibility","hidden");
		$(".fixbo").hide();
	})
	
	
})
