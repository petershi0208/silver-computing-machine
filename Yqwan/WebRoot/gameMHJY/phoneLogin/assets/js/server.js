var apiUrl = window.location.href;//"http://www.199y.com";
var length = apiUrl.substring(0, apiUrl.indexOf('.', 1)).length;
apiUrl = "http://www"+apiUrl.substring(length,parseInt(length)+parseInt(10));
var gamename = "梦幻家园";
var originalpage = "gameMHJY/phoneLogin";   	//对应的Yqwan的webroot根目录下的需要进入的游戏目录名称 PC则为gameBSYPT

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

jQuery(document).ready(function() {
    
});

//判断是否登录
$(function(){
	var server_userid = $('#server_userid').val();
	if(server_userid==''){
		window.location.href="/Yqwan/"+originalpage+"/login.jsp";
	}
})


//从平台获得最近登录区
$(function(){
	var userid = $('#server_userid').val();
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/getrecentregion.do?userid='+userid+'&gamename='+encodeURI(encodeURI(gamename));
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt1 = xhr.responseText;
			var txt=txt1.substring(0,txt1.indexOf(','));
			var serverid=txt1.substring(txt1.indexOf(',')+1);
			$('#latestregion').text(txt);
			$('#latestserverid').val(serverid);			
		}	
	};
	xhr.send(null);
})



//从平台获得全部分区
$(function(){	
	var userid = $('#server_userid').val();
	 var url = apiUrl + "/allregion.do?g="+encodeURI(encodeURI(gamename));
     $.getJSON(url + "&jsoncallback=?", function (json) {
    	 var arr= json.jsonarray;
     	arr=JSON.parse(arr);
     	var img ='';
     	for(i=0;i<arr.length;i++){
 			var obj=arr[i];
 			var region = obj.gameregion;
 			var serverid = obj.serverid;
 			img += "<div class=\"row1\" onclick=\"setRecentRegion('"+region+"','"+serverid+"')\">"+region+"</div>";
 		}
 		$('#Demo').append(img);
     });
})

//点击最近登录服务器
$(function(){
	$('#latestregionbutton').click(function(){
		var region = $('#latestregion').text();
		var serverid = $('#latestserverid').val();
		if(region==''||serverid==''){
			alert('无最近登录服务器!');
		}else{
			setRecentRegion(region,serverid);
		}		
	})
})

//保存玩家登陆的最新分区,进入游戏
function setRecentRegion(region,serverid){
		var uri = apiUrl+'/Yqwan/getgameidbygamename.do?gamename='+encodeURI(encodeURI(gamename));
	     $.getJSON(uri + "&jsoncallback=?", function (json) {
	    	 if (json) {
	             var gameid = json.gameid;
//	             window.open('/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage,'_blank');
				 window.location.href='/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage;
	         }
	     });
}

