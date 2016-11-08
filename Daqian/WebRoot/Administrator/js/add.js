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
	var vphone = false;
	$(".assbtn").click(function(){
			var money = $(this).siblings(".money").val();
			var uaid = $(this).parents("td").siblings(".uaid").text();
			var reg = /^[0-9]*$/;
			if(reg.test(money)){
				if(confirm('确定要添加资金'+money+'元么？')){
					var xhr = getXhr();
					var uri = '/Daqian/addmoney.do?money='+money+'&uaid='+uaid;
					xhr.open('get',uri,true);
					xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
					xhr.onreadystatechange=function(){	
					//4,处理服务器返回的数据
						if(xhr.readyState==4&&xhr.status==200){
							var txt = xhr.responseText;
							if(txt=="success"){
								alert("添加成功");
								location.replace(location.href);
							}else{
								alert("添加失败");
							}
						}
					};
					xhr.send();
				};
			}else{
				alert("请输入数字");
			}
	});
	
	$(".subbtn").click(function(){
		var username = $(this).siblings(".username").val();
		var ppid = $(this).parents("td").siblings(".ppid").text();
		var ppname1 = $(this).parents("td").siblings(".ppname").text();
		var vvyear = $(this).parents("td").siblings(".vvyear").text();
		var aamount = $(this).parents("td").siblings(".aamount").text();
		ppname = encodeURI(encodeURI(ppname1));
		if(confirm('确定要为用户'+username+'购买产品么？')){
			var xhr = getXhr();
			var uri = '/Daqian/addpurchase.do?username='+username+'&ppid='+ppid+'&ppname='+ppname+'&vvyear='+vvyear+'&aamount='+aamount;
			xhr.open('get',uri,true);
			xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
			xhr.onreadystatechange=function(){	
			//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="success"){
						alert("购买成功");
						location.replace(location.href);
					}else{
						alert(txt);
					}
				}
			};
			xhr.send();
		};
	});
	$(".isbtn1").click(function(){
		alert("添加成功");
	})
	$(".isproduct").blur(function(){
		var productname1 = $(".isproduct").val();
		productname = encodeURI(encodeURI(productname1));
		var xhr = getXhr();
		var uri = '/Daqian/isproducts.do?productname='+productname;
		xhr.open('get',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){	
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=="产品已存在"){
					$(".isbtn1").attr("type","button");
					alert("产品已存在");
				}else{
					$(".isbtn1").attr("type","submit");
				}
			}
		};
		xhr.send();
	});
});
