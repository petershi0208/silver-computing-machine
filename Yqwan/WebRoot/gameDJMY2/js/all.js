var apiUrl = window.location.href;//"http://www.199y.com";
apiUrl = "http://www"+apiUrl.substring(10,20);
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

//头部五个推荐游戏
$(function(){
	var url = apiUrl + "/fiverecommend.do?g=djmy";
    $.getJSON(url + "&jsoncallback=?", function (json) {
    	var arr= json.jsonarray;
    	arr=JSON.parse(arr);
    	var img ='';
    	for(i=0;i<arr.length;i++){
			var obj=arr[i];
			var gamename1=encodeURI(encodeURI(obj.gamename));		//中文编码;
			img += "<img style='border-radius:13px;' src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=\"50\" height=\"50\" onclick=\"javascript: window.open('"+apiUrl+"/gameinfo.do?gamename="+gamename1+"','_blank');\">&nbsp;";
		}
		$('#headlogo').after(img);
    });
})

//充值判断有无登录
$(function(){
	$('#head_recharge').click(function(){
		var userid = $('#userid').val();
		if(userid==''){
			alert("请先登录");
		}else{
			$('#head_recharge a').attr("href",apiUrl+"/recharge.do");
		}
	})	
})




//跳注册页面
$(function(){
	$('.reg').attr('href',apiUrl+'/registOne.jsp');
})

//登录
function login_login(user,pwd){
	var url = apiUrl + "/logingame.do?g=qst&a=doLogin&userName="+user+"&password="+pwd;
    $.getJSON(url + "&jsoncallback=?", function (json) {
        if (json) {
            if (json.code == 0) {
            	$('#nickname').val(user);
                return;
            } else {
                alert(json.msg);
                return;
            }
        } else {
            alert('登录失败');
            return;
        }
    });
}

//开始游戏页面，如果未登录弹出登录框
$(function(){
	var userid = $('#userid').val();
	if(userid==''){
		$('.fix,.fixbo').show();
	}
	$('.cuo').click(function(){
		$('.fix,.fixbo').hide();
	})
	
	$('#startgamebutton').click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		if(username==''){
			$('#usernametext').html("用户名不为空");
			return;
		}
		if(password==''){
			$('#usernametext').html("");
			$('#passwordtext').html("密码不能为空");
			return;
		}
		$('#usernametext').html("");
		$('#passwordtext').html("");
		//登录
		password = $.md5(password);
		var url = apiUrl + "/logingame.do?g=qst&a=doLogin&userName="+username+"&password="+password;
	    $.getJSON(url + "&jsoncallback=?", function (json) {
	        if (json) {
	            if (json.code == 0) {
	            	$('#nickname').val(username);
	            	 var gamename = encodeURI(encodeURI("刀剑魔药2"));
	         		window.location.href="/Yqwan/startgame.do?serverid=1&gameid=60184&originalpage=gameDJMY2"
	                return;
	            } else {
	                alert(json.msg);
	                return;
	            }
	        } else {
	            alert('登录失败');
	            return;
	        }
	    });	
		
//		setTimeout(function(){window.location.href=window.location.href;}, 100)
		
	})
})

