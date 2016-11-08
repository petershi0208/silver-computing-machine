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

//实名认证加***
$(function(){
//	var realname = $('#table tr:nth-child(5) td:nth-child(2)').text();
//	var idcard = $('#table tr:nth-child(6) td:nth-child(2)').text();
	var telephone = $('#table tr:nth-child(6) td:nth-child(2)').text();
	var email = $('#table tr:nth-child(5) td:nth-child(2)').text();
//	if(realname!=''){	
//		realname = realname.substring(1,realname.length)
//		idcard = idcard.substring(0,6)		
//		$('#table tr:nth-child(5) td:nth-child(2)').text('*'+realname)
//		$('#table tr:nth-child(6) td:nth-child(2)').text(idcard+'************')	
//	}
//判断手机有无绑定
	if(telephone!=''){								
		var telephone1 = telephone.substring(0,3);
		var telephone2 = telephone.substring(7,11);
		$('#table tr:nth-child(6) td:nth-child(2)').text(telephone1+'****'+telephone2);
	}else{
		$('#table tr:nth-child(6) td:nth-child(2)').text("手机未绑定");
		$('#table tr:nth-child(6) td:nth-child(3) div a').text("立即绑定");
		$('#table tr:nth-child(6) td:nth-child(3) div a').attr('href','/Yqwan/memberCenter/cellphonebind.jsp');
	}
//判断邮箱有无绑定
	if(email!=''){							
		var email1 = email.split('@')[1];
		$('#table tr:nth-child(5) td:nth-child(2)').text('********@'+email1);
		$('#table tr:nth-child(5) td:nth-child(3) div a').attr('href','/Yqwan/memberCenter/modifyemail.jsp');
	}else{
		$('#table tr:nth-child(5) td:nth-child(2)').text("邮箱未绑定");
		$('#table tr:nth-child(5) td:nth-child(3) div a').text("立即绑定");
	}
})

//更多资料
$(function(){
	$('#informationbutton').click(function(){
		var qq = $('#qq').val();
		var province = $('#province').val();
		var city = $('#city').val();
		var county = $('#county').val();
		var address = $('#address').val();
		var reg=/^\d{5,10}$/;
		if(!reg.test(qq)){	
			alert("qq号不合法!");
		}else if(city=="省份"||city=="地级市"||county=="市县级"||address==""){
			alert("请输入合法地址");
		}else{
			$('#form').submit();
		}
	})
})

//判断有无完善更多资料
$(function(){
	var qq = $('#informationqq').val();
	if(qq!=''){
		$('#tablenot').css("display","none");
		$('#tableyes').css("display","block");
	}else{
		$('#tableyes').css("display","none");
		$('#tablenot').css("display","block");
	}
})

//获得最近充值的游戏
$(function(){
	var userid = $('#userid').val();
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/lastestchargegame.do?userid='+userid;
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			$('#lastgame').text(txt);
		}
	};
	xhr.send(null);
})

//点击更多
$(function(){
	$('#morecharge').click(function(){
		event.cancelBubble=true;
		var userid = $('#userid').val();
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/allchargegame.do?userid='+userid;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				var arr=JSON.parse(txt);  
				var list ='';
				if(arr==''){
					list += "<tr class=\"clear\"><td></td><td style='font-size:12px;color:white'>暂无充值记录</td><td></td></tr>";
				}else{
					for(i=0;i<arr.length;i++){
						var obj=arr[i];
						list += "<tr class=\"clear\"><td>"+obj.gamename.substring(0,6)+"</td><td>"+obj.money+"</td><td>"+obj.date.substring(0,10)+"</td></tr>";
					}
				}
				
				$('.clear').remove();
				$('#chargetitle').after(list);
			}	
		};
		xhr.send(null);
	
		$('#charge_records').css('z-index','1000')
		$('#charge_records').show();
	})
})
//悬浮框隐藏
$(function(){
	var isOut=true;
	$('#charge_records').mouseover(function(){
		isOut=false;
	})
	$('#charge_records').mouseout(function(){
		isOut=true;
	})
	$('body').click(function(){
		if(isOut==true){
			$('#charge_records').hide();
		}
	})
})

