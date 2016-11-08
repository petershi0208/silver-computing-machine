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
	var rep = false;
	var rename = false;
	function add(){
		var username = $(".username").val();
		var xhr = getXhr();
		var uri = '/Daqian/adminexists.do?username='+username;
		xhr.open('get',uri,true);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){	
		//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				if(txt=="用户名已存在"){
					rename = false;
					alert("用户名已存在");
				}else{
					rename = true;
				}
			}
		};
		xhr.send();
	}
	function repwd(){
		var repwd = $(".repwd").val();
		var password = $(".password").val();
		if(repwd != password && repwd!="" && password!=""){
			rep = false;
			alert("两次密码不一致");
		}else{
			rep = true;
		}
	}
	$(".repwd").blur(function(){
		repwd();
	})
	$(".username").blur(function(){
		add();
	})
	$(".addbtn").click(function(){
		add();repwd();
		if(rep && rename){
			alert('注册成功');
			$(".addform").submit();
		}
	})
	$(".updatebtn").click(function(){
		repwd();
		if(rep){
			$(".updateform").submit();
		}
	})
});