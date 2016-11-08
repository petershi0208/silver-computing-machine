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

window.onload = function(){
		var time1 = setInterval(function fresh(){
			var trade_no = $('#trade_no').val();
			var xhr = getXhr();
			//发送请求
			var uri = '/Daqian/wxpaystate.do?tradeno='+trade_no;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="success"){
						window.location.href="http://www.daqianvip.com/Daqian/user/hyzx/wxsaomasuccess.jsp";
						return;
					}
				}
			};
			xhr.send(null);
		},1000);
}
