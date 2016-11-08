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
//添加数据
function getContent() {
	var title=document.getElementById("tt").value;
	var title1=encodeURI(encodeURI(title));
    var arr = [];
    arr.push(UE.getEditor('editor').getContent());
    var content=arr.join();
    alert(content)
    var image=document.getElementById("myFile").value;
    var image1=image.substring(image.lastIndexOf('\\')+1);
    var content1 = content.replace(/&/g,"@");
	var content2=encodeURI(encodeURI(content1));
		var xhr = getXhr();
		var uri = '/Daqian/news-add.do';
		xhr.open('post',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){	
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				alert(txt);
			}
		};
		xhr.send("title="+title1+"&content="+content2+"&image="+image1);
}


$(function(){
	//启用
	$(".td-manage .qiyong").click(function(){
		var id =$(this).children('span').html();
		var xhr = getXhr();
		var uri = '/Daqian/news-update1.do?id='+id;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				alert(txt);
				location.replace(location.href);
			}
		};
		xhr.send(null);
	});
	//停用
	$(".td-manage .tingyong").click(function(){
		var id =$(this).children('span').html();
		var xhr = getXhr();
		var uri = '/Daqian/news-update2.do?id='+id;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				alert(txt);
				location.replace(location.href);
			}
		};
		xhr.send(null);
	});
})


$(function(){
	//启用
	$(".td-manage1 .qiyong1").click(function(){
		var id =$(this).children('span').html();
		var xhr = getXhr();
		var uri = '/Daqian/borrow-update1.do?id='+id;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				alert(txt);
				location.replace(location.href);
			}
		};
		xhr.send(null);
	});
	//停用
	$(".td-manage1 .tingyong1").click(function(){
		var id =$(this).children('span').html();
		var xhr = getXhr();
		var uri = '/Daqian/borrow-update2.do?id='+id;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
		
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				alert(txt);
				location.replace(location.href);
			}
		};
		xhr.send(null);
	});
})
   
//修改数据
function getUpdate() {
	var title=document.getElementById("tt").value;
	var title1=encodeURI(encodeURI(title));
	var arr = [];
	arr.push(UE.getEditor('editor').getContent());
    var id = $("#newsid").val();
    var image=document.getElementById("myFile").value;
    var image1=image.substring(image.lastIndexOf('\\')+1);
    var content=arr.join();
    var content1 = content.replace(/&/g,"@");
	var content2=encodeURI(encodeURI(content1));
	var xhr = getXhr();
	var uri = '/Daqian/news-update.do';
	
	xhr.open('post',uri,true);
	xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
	xhr.onreadystatechange=function(){
	
	//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
			alert(txt);
		}
	};
	xhr.send('title='+title1+'&content='+content2+'&image='+image1+'&id='+id);
}
