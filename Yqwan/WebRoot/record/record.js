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


var npage =0;
//图片循环
$(function(){
	getrecord(0);
	$('#morerecord').click(function(){
		var more = $('#morerecord').text();
		if(more=='无更多数据!'){
			return;
		}else{
			getrecord(npage);
		}		
	})
})


function getrecord(n){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/gamerecord.do?n='+n;
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;	
			var arr=JSON.parse(txt);  
			npage=eval(npage+1);
			if(arr.length<8){
				$('#morerecord').hover(function(){$('#morerecord').css('border','1px solid #dfdfdf')});
				$('#morerecord').text('无更多数据!').css('cursor','default');
			}
			
			var pic ='';
			for(i=0;i<arr.length;i++){
				var obj = arr[i];
				var gameid = obj.gameid.split(',');
				var gamenum = gameid.length;
				pic += "<div class=\"center_record\">"+
			    			"<div class=\"center_record_img\">"+
							"<img src=\"http://www.199y.com/picture/yqwan/"+obj.picture+"\" width=\"300\" height=\"210\" onclick=\"javascript: window.open('/Yqwan/recordgame.do?recordid="+obj.id+"','_blank');\" />"+
						"</div>"+
						"<div class=\"center_record_detail\">"+
							"<div onclick=\"javascript: window.open('/Yqwan/recordgame.do?recordid="+obj.id+"','_blank');\" >"+obj.name+"</div>"+
							"<div>共"+gamenum+"款游戏</div>"+
							"<div>"+obj.describe+"</div>"+
							"<div class=\"center_record_bottom\">"+
								"<img src=\"record/shij.png\"/><span>&nbsp;时间："+obj.date+"&nbsp;&nbsp;&nbsp;&nbsp;</span>"+
								"<img src=\"record/liul.png\"/><span>&nbsp;浏览："+obj.click+"&nbsp;&nbsp;&nbsp;&nbsp;</span>"+
								"<img src=\"record/pinf.png\"/><span>&nbsp;评分："+obj.score+"&nbsp;&nbsp;&nbsp;&nbsp;</span>"+
							"</div>"+
						"</div>"+ 
						"<div class=\"center_record_right\">"+
							"<div><img src=\"record/pinf.png\" width='23' height='23'/></div>"+
							"<span>评分"+obj.score+"</span>"+
						"</div>"+
					"</div>"
			}
			$('#gamerecord').append(pic);
		}		
	};
	xhr.send(null);	
}

$(function(){
	var num = $('.center_record').length;
	if(num<8){
		$('#morerecord').hide();
	}
})