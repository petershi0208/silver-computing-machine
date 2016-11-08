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


//配置跳转的游戏参数
$(document).ready(function(){
	var userid = $('#userid').val();
	var gamename = $('#gamename').val();			//16进制
	var originalpage= $('#originalpage').val();
	var gameid;
	var serverid;
	if(gamename!=''){
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/registtogame.do?gamename='+gamename;
		xhr.open('get',uri,false);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				var obj =  eval("(" + txt + ")");
				gameid = obj.gameid;
				serverid=obj.serverid;
				if(originalpage==null || originalpage==''){
					originalpage = "game"+obj.letter;
				}				
			}
		};
		xhr.send(null);		
//		gameid = "60231";
//		serverid = "2";
//		originalpage="gameBSYPT";
	}
	togame(gamename,gameid,serverid,originalpage); 
	time(gamename,gameid,serverid,originalpage);
})
function time(gamename,gameid,serverid,originalpage){
	var wait=8;
	var time = setInterval(function(){
		  if(wait == 0) {
	           clearInterval(time)
	           timetogame(gamename,gameid,serverid,originalpage)        
	      }else{
	    	   $('#eight').text(wait);
	           wait--;
		   }
	},1000);
}

function togame(gamename,gameid,serverid,originalpage){
	if(gamename!='' && gameid!=undefined){
	 	 $('#handto a').attr('href','/Yqwan/startgame.do?serverid='+serverid+'&gameid='+gameid+'&originalpage='+originalpage);
	}else{
	 	 $('#handto a').attr('href',"/Yqwan/newMemberCenter/member.jsp");
	}
}

function timetogame(gamename,gameid,serverid,originalpage){
	if(gamename!='' && gameid!=undefined){
 	   window.location.href= '/Yqwan/startgame.do?serverid='+serverid+'&gameid='+gameid+'&originalpage='+originalpage;
    }else{
 	   window.location.href="/Yqwan/newMemberCenter/member.jsp";
    }  
}