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
//头部搜索游戏跳转
$(document).ready(function(){ 
	    $(".password,.username").keydown(function(e){ 
	        var curKey = e.which; 
	        if(curKey == 13){ 
	        	var username = $(".username").val();
	    		var password = $(".password").val();
	    		var xhr = getXhr();
	    		var uri = '/Yqwan/admin/login.do?username='+username+'&password='+password;
	    		xhr.open('get',uri,true);
	    		xhr.onreadystatechange=function(){
	    		
	    		//4,处理服务器返回的数据
	    			if(xhr.readyState==4&&xhr.status==200){
	    				var txt = xhr.responseText;
	    				if(txt=="用户名不存在"){
	    					$(".spcl").text(txt);
	    				}else if(txt=="密码错误"){
	    					$(".spcl").text(txt);
	    				}else{
	    					window.location.href="/Yqwan/administratorht/template/index.jsp"; 
	    				}
	    			}
	    		};
	    		xhr.send(null);
	        } 
	    }); 
	});


$(function(){
	$(".btn").click(function(){
		var username = $(".username").val();
		var password = $(".password").val();
		var xhr = getXhr();
		var uri = '/Yqwan/admin/login.do?username='+username+'&password='+password;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=="用户名不存在"){
					$(".spcl").text(txt);
				}else if(txt=="密码错误"){
					$(".spcl").text(txt);
				}else{
					window.location.href="/Yqwan/administratorht/template/index.jsp"; 
				}
			}
		};
		xhr.send(null);
	});
});
