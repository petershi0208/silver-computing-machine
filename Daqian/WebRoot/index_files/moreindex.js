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
	$('.morerecord').click(function(){
		var num = $(".produ2a").length;
		if(num%5!=0){
//			alert("无更多数据");
		}else{
			var xhr = getXhr();
			//发送请求
			var uri = '/Daqian/moreindex.do?num='+num;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
			
			//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					var array = JSON.parse(txt);
					if(array.length<5){
						$('.morerecord').text("无更多数据!");
					}
					if(array.length==0){
						$('.morerecord').text("无更多数据!");
//						alert("无更多数据");
					}else{
						for ( var i = 0; i < array.length; i++) {
							var obj = array[i];
							var issu = "";
							var prbar = obj.lastmoney/obj.maxmoney*100;
							var percent = 100-obj.lastmoney/obj.maxmoney*100;
							if(obj.lastmoney==0){
								 issu = "<div class='product_Btn_Img2' style='background-color:#CFCFCF;'>已售完</div>"
							}else{
								 issu = "<div class='product_Btn_Img2' style='background-color:#0093CC;'>投标</div>"
							}
							$(".produ2a:last").after("<a href='products.do?id="+obj.pid+"' class='produ2a'><div id='productList02' class='productList02' style='margin-top:auto;'><div class='index_productName'>"+
							"<span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'><img src='index_files/xin.png' style='position:relative; top:10px; right:10px'/>"+obj.productname+
							"</span><span style='margin-left:8px;font-size:14px;'>W"+obj.pdate+"期</span></div><div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+obj.yearreturn+"%</span>"+
							"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+obj.cycle+"</span>个月</div><div class='product_limit'>总额<span class='product_limit_TEXT maxmoney'+>"+obj.maxmoney+"</span>元"+
							"</div><div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div></div><div class='product_Pojo_DIV_02'>"+
							"<div style='margin-bottom: 15px'><div class='product_plan_01'><div style='width: "+prbar+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'>"+
							"</div></div><div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>"+percent+"%</span></div></div>"+issu+"	<div class='product_Pojo_DIV_03'></div></div></div></a>");
						}
					}
				}
			};
			xhr.send(null);
		}
	})
})