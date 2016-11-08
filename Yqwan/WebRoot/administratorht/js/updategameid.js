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
//判断当前游戏id是否存在
$(function(){
	$(".gameid").blur(function(){
		var gameid=$(".gameid").val();	
		var gamename=$(".gamename").val();	
		
		var xhr = getXhr();
		var uri = '/Yqwan/administrator/vagameid.do?gameid='+gameid;
		
		xhr.open('get',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){
		
			//处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt!="" && txt!=gamename){
					$(".vagameid").text("id已存在于游戏"+txt).css("color","red");
					
				}else{
					$(".vagameid").text("可以使用").css("color","green");
				}
				//window.location.href="/Yqwan/administrat/newslist.do"; 
			}
		};
		xhr.send(null);
	})
	$(".btn-info").click(function(){
		var vagameid = $(".vagameid").text();
		if(vagameid == "可以使用"){
			$(".aaaa").submit();
			alert("提交成功");
		}else{
			alert("游戏id已存在");
		}
		
	})
})
