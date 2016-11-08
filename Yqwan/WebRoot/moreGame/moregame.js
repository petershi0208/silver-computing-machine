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
	var list = $('#list').val();
	var arr=JSON.parse(list);  
	var game ='';
	for(i=0;i<arr.length;i++){
		var obj = arr[i];
		var gametype= obj.gametype;
		var type='';
		if(gametype=='挂机游戏'){
			type='guaj.jpg';
		}else if(gametype=='内购游戏'){
			type='neig.jpg';
		}else{
			type='H5.jpg';
		}
		game +="<div class=\"centerrolefour_one\" title=\""+obj.gamename+"\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+
						"<div class=\"centerrolefour_one_nei\">"+
						"<img src=\"http://www.199y.com/picture/yqwan/"+obj.indexpicture+"\" width='196' height='144'/>"+
						"<img src=\"newClassify/"+type+"\">"+
					"</div>"+
					"<div class=\"centerrolefour_one_info\">"+
						"<div class=\"centerrolefour_one_info_name\">"+obj.gamename+"</div>"+
						"<div class=\"centerrolefour_one_info_score\">"+obj.score+"</div>"+
					"</div>"+
				"</div>"
			
			
//			"<div class=\"rightgameone\" title=\""+obj.gamename+"\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gameid="+obj.gameid+"','_blank');\">"+
//					"<img class=\"rightgameonepic\" src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width='100' height='98' />"+
//					"<img class=\"rightgameonetype\" src=\"http://www.199y.com/picture/yqwan/"+obj.placetype+"\" width='36' height='40'/>"+
//					"<img class=\"rightgameonebtn\" src=\"classify/jinruyouxi.png\" />"+
//					"<span class=\"rightgameonename\">"+obj.gamename+"</span>"+
//					"<span class=\"rightgameoneg\">类别："+obj.gametype+"</span>"+
//					"<span class=\"rightgameonedetail\">游戏简介："+obj.descrip+"</span>"+
//				"</div>";
	}
	$('#centerpic').append(game);
})

//分页功能
$(function(){
	var from = $('#moregamefrom').text();		//判断哪个页面跳转过来的更多
	var maxnum = $('#maxnum').val();
	var page = $('#page').val();
	var gametype=$('#gametype').val();
	gametype=encodeURI(encodeURI(gametype));
//	var span3 = $('#nice span:nth-child(3)').text();
//	var span4 = $('#nice span:nth-child(4)').text();
//	var span5 = $('#nice span:nth-child(5)').text();
//	var span6 = $('#nice span:nth-child(6)').text();
//	var span7 = $('#nice span:nth-child(7)').text();	
	$('#hiddenpage').val(page);
	if(maxnum==1||maxnum==0){
		$('#fenye').hide();
		$('#fenyeshow').show();
	}
	if(maxnum<3){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(5),#nice span:nth-child(6),#nice span:nth-child(7),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','140px')
	}
	else if(maxnum<4){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(6),#nice span:nth-child(7),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','120px')
	}
	else if(maxnum<5){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(7),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','100px')
	}
	else if(maxnum<6){
		$('#nice span:nth-child(1),#nice span:nth-child(2),#nice span:nth-child(8),#nice span:nth-child(9)').hide();
		$('#nice span:nth-child(3)').css('margin-left','80px')
	}
	
	if(page%5==0){
		page1 = page%5+7;
		page5 = page/5-1;
	}else{
		page1 = page%5+2;
		page5 = page/5;
	}
	if(parseInt(page)+5-maxnum<=0){
		page5 = 5*parseInt(page5);
		for(i=3;i<8;i++){
			page6 = page5+parseInt(i)-2;
			$('#nice span:nth-child('+i+')').text(page6);
		}	
		$('#nice span:nth-child('+page1+')').css({'background-color':'#337ab7','color':'#fff'});
	}else{
		for(i=3;i<8;i++){
			if(page>5){
				$('#nice span:nth-child('+i+')').text(maxnum-7+i);
			}
		}
		if(page>5){
			page1 = parseInt(page-maxnum)+7;
		}
		$('#nice span:nth-child('+page1+')').css({'background-color':'#337ab7','color':'#fff'});
	}
	
	
//	if(span3==1){
//		$('#nice span:nth-child(1),#nice span:nth-child(2)').css('background-color','#ccc');
//		$('#nice span:nth-child(1)').css('color','black')
//	}
//	if(span7==maxnum){
//		$('#nice span:nth-child(8),#nice span:nth-child(9)').css('background-color','#ccc');
//		$('#nice span:nth-child(9)').css('color','black')
//	}
	if(from=="首页"){
		$('#nice span:nth-child(1)').click(function(){
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num=1";
		})
		$('#nice span:nth-child(2)').click(function(){
			var hiddenpage = $('#hiddenpage').val();
			if(hiddenpage>1){
				hiddenpage = hiddenpage-1;
				window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
			}	
		})
		$('#nice span:nth-child(3)').click(function(){
			var hiddenpage = $('#nice span:nth-child(3)').text()
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(4)').click(function(){
			var hiddenpage = $('#nice span:nth-child(4)').text()
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(5)').click(function(){
			var hiddenpage = $('#nice span:nth-child(5)').text()
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(6)').click(function(){
			var hiddenpage = $('#nice span:nth-child(6)').text()
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(7)').click(function(){
			var hiddenpage = $('#nice span:nth-child(7)').text()
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
		})
		 
		$('#nice span:nth-child(8)').click(function(){
			var hiddenpage = $('#hiddenpage').val();
			if(hiddenpage-maxnum<0){
				hiddenpage =parseInt(hiddenpage)+1;
				window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+hiddenpage;
			}	
		})
		$('#nice span:nth-child(9)').click(function(){
			window.location.href="/Yqwan/moregame.do?gametype="+gametype+"&num="+maxnum;
		})
	}else if(from=="分类"){
		var placetype=$('#placetype').val();
		$('#nice span:nth-child(1)').click(function(){
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num=1";
		})
		$('#nice span:nth-child(2)').click(function(){
			var hiddenpage = $('#hiddenpage').val();
			if(hiddenpage>1){
				hiddenpage = hiddenpage-1;
				window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
			}	
		})
		$('#nice span:nth-child(3)').click(function(){
			var hiddenpage = $('#nice span:nth-child(3)').text()
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(4)').click(function(){
			var hiddenpage = $('#nice span:nth-child(4)').text()
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(5)').click(function(){
			var hiddenpage = $('#nice span:nth-child(5)').text()
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(6)').click(function(){
			var hiddenpage = $('#nice span:nth-child(6)').text()
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(7)').click(function(){
			var hiddenpage = $('#nice span:nth-child(7)').text()
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
		})
		 
		$('#nice span:nth-child(8)').click(function(){
			var hiddenpage = $('#hiddenpage').val();
			if(hiddenpage-maxnum<0){
				hiddenpage =parseInt(hiddenpage)+1;
				window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+hiddenpage;
			}	
		})
		$('#nice span:nth-child(9)').click(function(){
			window.location.href="/Yqwan/classifymoregame.do?roletype="+gametype+"&placetype="+placetype+"&num="+maxnum;
		})
	}else if(from=="搜索"){
		$('#nice span:nth-child(1)').click(function(){
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num=1";
		})
		$('#nice span:nth-child(2)').click(function(){
			var hiddenpage = $('#hiddenpage').val();
			if(hiddenpage>1){
				hiddenpage = hiddenpage-1;
				window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
			}	
		})
		$('#nice span:nth-child(3)').click(function(){
			var hiddenpage = $('#nice span:nth-child(3)').text()
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(4)').click(function(){
			var hiddenpage = $('#nice span:nth-child(4)').text()
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(5)').click(function(){
			var hiddenpage = $('#nice span:nth-child(5)').text()
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(6)').click(function(){
			var hiddenpage = $('#nice span:nth-child(6)').text()
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
		})
		$('#nice span:nth-child(7)').click(function(){
			var hiddenpage = $('#nice span:nth-child(7)').text()
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
		})
		 
		$('#nice span:nth-child(8)').click(function(){
			var hiddenpage = $('#hiddenpage').val();
			if(hiddenpage-maxnum<0){
				hiddenpage =parseInt(hiddenpage)+1;
				window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+hiddenpage;
			}	
		})
		$('#nice span:nth-child(9)').click(function(){
			window.location.href="/Yqwan/headselectmoregame.do?gamename="+gametype+"&num="+maxnum;
		})
	}
	
})