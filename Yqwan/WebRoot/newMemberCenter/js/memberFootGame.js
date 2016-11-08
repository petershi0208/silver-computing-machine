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


//热门游戏
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexboutique.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);
			var pic ='';	
			for(i=0;i<4;i++){	
				var obj = arr[i];
				var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic +="<div class=\"recommendgame_games_one\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+
						"<div class=\"recommendgame_games_one_img\"><img src=\"http://www.199y.com/picture/yqwan/"+obj.indexpicture+"\" width=170 height=125/></div>"+
						"<div class=\"recommendgame_games_one_gamename\">"+obj.gamename+"</div>"+
						"<div class=\"recommendgame_games_one_descripe\">"+obj.gameinfo.detaildescripe+"</div>"+
					"</div>"
			}
			$('#recommendgame_games').append(pic);
		}	
	};
	xhr.send(null);
})