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
	var userid = $('#userid').val();
	if(userid!=''){
		$('#notloginhead1,#notloginhead2').hide();
		$('#loginhead1,#loginhead2,#loginhead3').show();
		
	}else{
		$('#headtouxiang a img').attr('src','http://www.199y.com/picture/yqwan/touxiang1.png')
	}
})

//头部搜索游戏跳转
$(document).ready(function(){ 
	    $("#head_text").keydown(function(e){ 
	        var curKey = e.which; 
	        if(curKey == 13){ 
	        	search();
	        } 
	    }); 
	});
$(function(){
	$('#head_button').click(function(){
		search();
	})
	$('#head_text').keyup(function(){
		var gameid = $('#head_text').val();
		gameid=encodeURI(encodeURI(gameid));		//中文编码;
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/returngame.do?gamename='+gameid;
		xhr.open('get',uri,false);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				var arr=JSON.parse(txt);  
				var pic ='';
				for(i=0;i<arr.length;i++){
					var obj=arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码;
					pic += "<li onmouseover=\"javascript:$('#head_text').val(this.innerText);\">"+obj.gamename+"</li>"
				}
				$('#gameselect ul li').remove();
				$('#gameselect ul').append(pic);
			}
			
		};
		xhr.send(null);		
		$('#gameselect').show();
	})
	
	$('#head_text').blur(function(){
		$('#gameselect').hide();
	})
})

function search(){
	var gameid = $('#head_text').val();
	gameid=encodeURI(encodeURI(gameid));		//中文编码;
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/headcheckgamename.do?gamename='+gameid;
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			if(txt=='false'){
				alert("不存在相关游戏!");
			}else{
				window.open("/Yqwan/headselectmoregame.do?gamename="+gameid+"&num=1",'_target');
				
			}
		}
		
	};
	xhr.send(null);
}

//点击li跳转
$(function(){
	$('#head_index').click(function(){
		window.location.href="/Yqwan/toindex.do";
	})
	$('#head_classify').click(function(){
		window.location.href="/Yqwan/classify.jsp";
	})
	$('#head_news').click(function(){
		window.location.href="/Yqwan/toNews.do";
	})
	$('#head_record').click(function(){
		window.location.href="/Yqwan/record.jsp";
	})
	$('#head_give').click(function(){
		window.location.href="/Yqwan/codecentre.jsp";
	})
})

