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

//点击放置类型
$(function(){
	type('pc.jpg');
	more("pc.jpg");	
	$('.anzhuoclick').click(function(){
		type('anzhuo.jpg');
		more("anzhuo.jpg");		
	})
	$('.pingguoclick').click(function(){
		type('apple.jpg');
		more("apple.jpg");	
	})
	$('.pcclick').click(function(){
		type('pc.jpg');
		more("pc.jpg");	
	})
})

function more(placetype){
	$("#onemore a").attr("href","classifymoregame.do?roletype="+encodeURI(encodeURI('角色扮演'))+"&placetype="+placetype+"&num=1");
	$("#twomore a").attr("href","classifymoregame.do?roletype="+encodeURI(encodeURI('角色策略'))+"&placetype="+placetype+"&num=1");
	$("#threemore a").attr("href","classifymoregame.do?roletype="+encodeURI(encodeURI('角色经营'))+"&placetype="+placetype+"&num=1");
	$("#fourmore a").attr("href","classifymoregame.do?roletype="+encodeURI(encodeURI('特色类型'))+"&placetype="+placetype+"&num=1");
}

function type(placetype){
	//角色扮演异步请求
	$(function(){
		var uri = '/Yqwan/classifyrole.do?placetype='+placetype;
		var id = "#classifyrole";
		classify(uri,id);
	})
	//策略扮演异步请求
	$(function(){
		var uri = '/Yqwan/classifyplan.do?placetype='+placetype;
		var id = "#classifyplan";
		classify(uri,id);
	})
	//经营扮演异步请求
	$(function(){
		var uri = '/Yqwan/classifymanage.do?placetype='+placetype;
		var id = "#classifymanage";
		classify(uri,id);
	})
	//特色类型异步请求
	$(function(){
		var uri = '/Yqwan/classifyspecial.do?placetype='+placetype;
		var id = "#classifyspecial";
		classify(uri,id);
	})
}
//ajax发送请求
function classify(uri,id){
	var xhr = getXhr();
	//发送请求
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';
			for(i=0;i<arr.length;i++){
				var obj = arr[i]
			    var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic += "<div class='rightgameone' title=\""+obj.gamename+"\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+
		    				"<img class='rightgameonepic' src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width='100' height='98'/>"+
		    				"<img class='rightgameonetype' src=\"http://www.199y.com/picture/yqwan/"+obj.placetype+"\" width='36' height='40'/>"+
		    				"<img class='rightgameonebtn' src='index/jinruyouxi.png' />"+
		    				"<span class='rightgameonename'>"+obj.gamename+"</span>"+
		    				"<span class='rightgameoneg'>类别："+obj.gametype+"</span>"+
		    				"<span class='rightgameonedetail'>"+obj.descrip+"</span>"+
		    			"</div>";
			}
			$(id+' div').remove();
			$(id).append(pic);
		}		
	};
	xhr.send(null);
}
