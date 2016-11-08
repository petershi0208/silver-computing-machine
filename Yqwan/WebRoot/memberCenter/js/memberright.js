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
/*
//平台推荐TOP4循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexhottop.do';
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';
			if(arr.length>4){
				for(i=0;i<4;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32'/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}else{
				for(i=0;i<arr.length;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32'/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}
			
			$('#hot_together').after(pic);
		}	
	};
	xhr.send(null);
})

*/
//平台推荐TOP循环
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
			for(i=0;i<10;i++){
				var a = i+1;		//56
				var obj = arr[i];
				var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic += "<div class=\"hotfive\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
							"<img src=\"/Yqwan/index/ERXIAOBANGHUIDIQUAN.jpg\"/>"+
							"<span class=\"hotfivenum\">"+a+"</span>"+
							"<span class=\"hotfivetext\">"+obj.gamename+"</span>"+
							"<span class=\"hotfivequ\">进入</span>"+
						"</div>";
			}
			$('#hot_together').after(pic);
		}	
	};
	xhr.send(null);
})

/*
//新游榜TOP4排行
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexnewtop.do';
	xhr.open('get',uri,false);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var pic ='';	
			if(arr.length>4){
				for(i=0;i<4;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32'/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}else{
				for(i=0;i<arr.length;i++){
					var a = i+1;		//1234
					var obj = arr[i];
					var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
					pic += "<div class='hotone' onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
			    				"<img src='index/PAIHANGTUBIAOHUANG.jpg' class='hotpoint'/>"+
			    				"<img src='gamePicture/"+obj.toppicture+"' class='hotpic' width='70' height='32'/>"+
			    				"<div class='hotstart'></div>"+
			    				"<span class='hotnum'>"+a+"</span>"+
			    				"<span class='hotregion'>"+obj.gameregion+"</span>"+
			    			"</div>";
				}
			}
			
			$('#new_together').after(pic);
		}	
	};
	xhr.send(null);
})

*/
//新游TOP5,6循环
$(function(){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/indexnewtop.do';
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);
			var pic ='';	
			for(i=0;i<10;i++){
				var a = i+1;		//
				var obj = arr[i];
				var gamename=encodeURI(encodeURI(obj.gamename));		//中文编码
				pic += "<div class=\"hotfive\" onclick=\"javascript: window.open('/Yqwan/gameinfo.do?gamename="+gamename+"','_blank');\">"+
							"<img src=\"/Yqwan/index/ERXIAOBANGHUIDIQUAN.jpg\"/>"+
							"<span class=\"hotfivenum\">"+a+"</span>"+
							"<span class=\"hotfivetext\">"+obj.gamename+"</span>"+
							"<span class=\"hotfivequ\">进入</span>"+
						"</div>";
			}
			$('#new_together').after(pic);
		}	
	};
	xhr.send(null);
})

//判断手机号邮箱有无绑定 有无实名
$(function(){
	var telephone = $('#memberright_telephone').val();
	var realname = $('#memberright_realname').val();
	var email = $('#memberright_email').val();
	if(telephone!=''){
		$('#memberright_ul li:nth-child(3) img').attr('src','/Yqwan/memberCenter/images/member/phonebind.png');
		$('#memberright_ul li:nth-child(3) span').css('color','#23527c')
		$('#memberright_ul li:nth-child(3) span').html("已绑定")
	}
	if(email!=''){
		$('#memberright_ul li:nth-child(1) img').attr('src','/Yqwan/memberCenter/images/member/email.png');
		$('#memberright_ul li:nth-child(1) span').css('color','#23527c')
		$('#memberright_ul li:nth-child(1) span').html("已绑定")
	}
	if(realname!=''){
		$('#memberright_ul li:nth-child(2) img').attr('src','/Yqwan/memberCenter/images/member/realname.png');
		$('#memberright_ul li:nth-child(2) span').css('color','#23527c')
		$('#memberright_ul li:nth-child(2) span').html("已实名")
	}
})

//实名认证跳转
$(function(){
	$('#one,#memberright_ul li:nth-child(2)').click(function(){
		window.location.href="/Yqwan/memberCenter/realname.jsp";
	})
})
//充值按钮跳转
$(function(){
	$('#content_right_one_btn span').click(function(){
		alert("暂不开放!");
//		window.location.href="/Yqwan/recharge.do";
	})
})
//个人信息按钮跳转
$(function(){
	$('#six').click(function(){
		window.location.href="/Yqwan/memberCenter/member.jsp";
	})
})

//推广员按钮跳转
$(function(){
	$('#seven').click(function(){
		window.location.href="/Yqwan/toinvitation.do";
	})
})

//修改密码按钮跳转
$(function(){
	$('#two').click(function(){
		window.location.href="/Yqwan/forgetOne.jsp";
	})
})
//绑定手机按钮跳转
$(function(){
	$('#five,#memberright_ul li:nth-child(3)').click(function(){
		var telephone = $('#memberright_telephone').val();
		if(telephone==''){
			window.location.href="/Yqwan/memberCenter/cellphonebind.jsp";
		}else{
			window.location.href="/Yqwan/memberCenter/cellphone.jsp";
		}
	})
})
//修改邮箱按钮跳转
$(function(){
	$('#four').click(function(){
		var email = $('#memberright_email').val();
		if(email==''){
			alert("您尚未绑定邮箱，请先去绑定邮箱");
			window.location.href="/Yqwan/memberCenter/addemail.jsp";
		}else{
			window.location.href="/Yqwan/memberCenter/modifyemail.jsp";
		}	
	})
})
//绑定邮箱按钮跳转
$(function(){
	$('#three').click(function(){
		var email = $('#memberright_email').val();
		if(email!=''){
			alert("您已绑定邮箱");
			window.location.href="/Yqwan/memberCenter/member.jsp";
		}else{
			window.location.href="/Yqwan/memberCenter/addemail.jsp";
		}
		
	})
})
$(function(){
	$('#memberright_ul li:nth-child(1)').click(function(){
		var email = $('#memberright_email').val();
		if(email!=''){
			window.location.href="/Yqwan/memberCenter/member.jsp";
		}else{
			window.location.href="/Yqwan/memberCenter/addemail.jsp";
		}
		
	})
})