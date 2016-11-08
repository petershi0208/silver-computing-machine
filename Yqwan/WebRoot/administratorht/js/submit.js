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
//添加数据
	$(".addbtn").click(function(){
	var title = $(".title").val();
	title = title.replace(/&/g,"@");
	title=encodeURI(encodeURI(title));
	var author=encodeURI(encodeURI($(".author").val()));
	var gamename=encodeURI(encodeURI($(".gamename").val()));
	var type=encodeURI(encodeURI($(".type").val()));
	var indexpicture=encodeURI(encodeURI($(".indexpicture").val()));
	var origin=encodeURI(encodeURI($(".origin").val()));
	var description=encodeURI(encodeURI($(".description").val()));
    var arr = [];
    arr.push(UM.getEditor('myEditor').getContent());
    var content=arr.join();
    var content1 = content.replace(/&/g,"@");
	var content2=encodeURI(encodeURI(content1));
		var xhr = getXhr();
		var uri = '/Yqwan/addnews.do';
		xhr.open('post',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){
			//处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				$(".aaaa").submit();
				alert(txt);
				window.location.href="/Yqwan/administrator/newslist.do"; 
			}
		};
		xhr.send("title="+title+"&content="+content2+"&indexpicture="+indexpicture+"&author="+author+"&origin="+origin+"&description="+description+"&gamename="+gamename+"&type="+type);
	});
	//修改数据
	$(".updatebtn").click(function(){
		var id=$(".newsid").val();	
		var title = $(".title").val();
		title = title.replace(/&/g,"@");
		title=encodeURI(encodeURI(title));
		var gamename=encodeURI(encodeURI($(".gamename").val()));
		var type=encodeURI(encodeURI($(".type").val()));
		var author=encodeURI(encodeURI($(".author").val()));
		var indexpicture=encodeURI(encodeURI($(".indexpicture").val()));
		var origin=encodeURI(encodeURI($(".origin").val()));
		var description=encodeURI(encodeURI($(".description").val()));
	    var arr = [];
		arr.push(UM.getEditor('myEditor').getContent());
	    var content=arr.join();
	    var content1 = content.replace(/&/g,"@");
		var content2=encodeURI(encodeURI(content1));
		var xhr = getXhr();
		var uri = '/Yqwan/updatenews.do';
		
		xhr.open('post',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){
		
			//处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				$(".aaaa").submit();
				alert(txt);
				//window.location.href="/Yqwan/administrat/newslist.do"; 
			}
		};
		xhr.send("id="+id+"&title="+title+"&content="+content2+"&indexpicture="+indexpicture+"&author="+author+"&origin="+origin+"&description="+description+"&gamename="+gamename+"&type="+type);
	});
});