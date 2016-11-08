
//申请资料提交
$(function(){
	$('#applybutton').click(function(){
		var realname = $('#realname').val();
		var aliaccount = $('#aliaccount').val();
		var telephone = $('#telephone').val();
		var namereg=/^([\u4e00-\u9fa5]){2,7}$/; //只能是中文，长度为2-7位
		var phonereg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;	//电话rule
		var qq = $('#qq').val();
		if(realname==''||!namereg.test(realname)){
			$('#realnametext').text("姓名格式不对");
			return;
		}
		if(aliaccount==''){
			$('#realnametext').text("");
			$('#aliaccounttext').text("支付宝账号不能为空");
			return;
		}
		if(telephone==''||!phonereg.test(telephone)){
			$('#realnametext').text("");
			$('#aliaccounttext').text("");
			$('#telephonetext').text("手机号格式不对");
			return;
		}
		if(qq==''){
			$('#realnametext').text("");
			$('#aliaccounttext').text("");
			$('#telephonetext').text("");
			$('#qqtext').text("qq号不能为空");
			return;
		}
		$('form').submit();
	})
})


//获得推广链接
$(function(){
	$('#getrecommendurl').click(function(){
		$('#fix').css('visibility','visible');
		$(".fixbo").show();
	})
	$('.cuo').click(function(){
		$(".fix").css("visibility","hidden");
		$(".fixbo").hide();		
	})
})

//获得判断有无成为推广用户
$(function(){
	var realname = $('#recommend_name').val();
	if(realname!=''){
		$('#centerinform').hide();
		$('#centerinform_login').show();
		$('#center_show').show();
	}else{
		$('#centerinform_login').hide();
		$('#center_show').hide();
		$('#centerinform').show();
	}
})

//点击更多
$(function(){
	$('#center_show_more').click(function(){
		event.cancelBubble=true;
		var userid = $('#userid').val();
		var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/allrecommendlist.do?userid='+userid;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				var arr=JSON.parse(txt);  
				var list ='';
				if(arr==''){
					list += "<tr class=\"clear\"><td></td><td style='font-size:12px;color:white'>暂无推广记录</td><td></td></tr>";
				}else{
					for(i=0;i<arr.length;i++){
						var obj=arr[i];
						list += "<tr class=\"clear\"><td>"+obj.recommendperson+"</td><td>"+obj.recommendmoney+"</td><td>"+obj.date+"</td><td>"+obj.state+"</td></tr>";
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
