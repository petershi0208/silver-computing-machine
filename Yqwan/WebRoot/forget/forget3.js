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

//8s倒计时

$(document).ready(function(){
	time();
})
function time(){
	var wait=8;
	var time = setInterval(function(){			
		  if(wait == 0) {
	           clearInterval(time)
	           window.location.href="/Yqwan/login.jsp";
	      }else{
	    	   $('#eight').text(wait);
	           wait--;
		   }
	},1000);
}