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
	$('#navlist li:nth-child(1) a').hover(function(){
		$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/gerenb.png')
	},function(){
		$('#navlist li:nth-child(1) img').attr('src','/Yqwan/newMemberCenter/images/geren.png')
	})
	$('#navlist li:nth-child(2) a').hover(function(){
		$('#navlist li:nth-child(2) img').attr('src','/Yqwan/newMemberCenter/images/zhanghaob.png')
	},function(){
		$('#navlist li:nth-child(2) img').attr('src','/Yqwan/newMemberCenter/images/zhanghao.png')
	})
	$('#navlist li:nth-child(3) a').hover(function(){
		$('#navlist li:nth-child(3) img').attr('src','/Yqwan/newMemberCenter/images/jilub.png')
	},function(){
		$('#navlist li:nth-child(3) img').attr('src','/Yqwan/newMemberCenter/images/jilu.png')
	})
	$('#navlist li:nth-child(4) a').hover(function(){
		$('#navlist li:nth-child(4) img').attr('src','/Yqwan/newMemberCenter/images/tuiguangb.png')
	},function(){
		$('#navlist li:nth-child(4) img').attr('src','/Yqwan/newMemberCenter/images/tuiguang.png')
	})
	$('#navlist li:nth-child(5) a').hover(function(){
		$('#navlist li:nth-child(5) img').attr('src','/Yqwan/newMemberCenter/images/xiaoxib.png')
	},function(){
		$('#navlist li:nth-child(5) img').attr('src','/Yqwan/newMemberCenter/images/xiaoxi.png')
	})
})

//内购游戏循环
$(function(){
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/indexthree.do?gametype='+encodeURI(encodeURI("内购游戏"));
		xhr.open('get',uri,false);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据	
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				var arr=JSON.parse(txt);  
				var pic ='';
				if(arr.length>5){
					for(i=0;i<5;i++){
						var obj=arr[i];
						var gamename1=encodeURI(encodeURI(obj.gamename));		//中文编码;					
						pic += "<li><a href=\"/Yqwan/gameinfo.do?gameid="+obj.gameid+"\" title=\""+obj.gamename+"\"  target=\"_blank\"><img src=\"http://www.199y.com/picture/yqwan/"+obj.indexpicture+"\" width=260 height=198></a></li>"
					}
				}else{
					for(i=0;i<arr.length;i++){
						var obj=arr[i];
						var gamename1=encodeURI(encodeURI(obj.gamename));		//中文编码;					
						pic += "<li><a href=\"/Yqwan/gameinfo.do?gameid="+obj.gameid+"\" title=\""+obj.gamename+"\"  target=\"_blank\"><img src=\"http://www.199y.com/picture/yqwan/"+obj.indexpicture+"\" width=260 height=198></a></li>"
					}
				}
				
				$('#items').append(pic);
			}		
		};
		xhr.send(null);
})

//热门游戏循环
$(function(){
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/indexhottop.do';
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据	
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				var arr=JSON.parse(txt);  
				var pic ='';
				for(i=0;i<7;i++){
					var obj=arr[i];
					var gamename1=encodeURI(encodeURI(obj.gamename));		//中文编码;					
					pic += "<div class=\"toprank_game\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"
				    			+"<div class=\"toprank_game_img\">"
			    				+"<img src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=56 height=56/>"
				    			+"</div>"
				    			+"<span>"+obj.gamename.substring(0,8)+"</span>"
				    			+"<span>进入游戏</span>"
							+"</div>"
				}
				$('#toprank_allgame').append(pic);
			}		
		};
		xhr.send(null);
})





