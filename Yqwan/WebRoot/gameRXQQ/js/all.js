var apiUrl = window.location.href;//"http://www.199y.com";
var length = apiUrl.substring(0, apiUrl.indexOf('.', 1)).length;
apiUrl = "http://www"+apiUrl.substring(length,parseInt(length)+parseInt(9));
var gamename = "热血球球";
var originalpage = "gameRXQQ";   			//对应的Yqwan的webroot根目录下的需要进入的游戏目录名称，若为手机则进入gameBSYPT/phoneLogin

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
//充值判断有无登录
$(function(){
	loginornot();
	$('#head_recharge').click(function(){
		var userid = $('#userid').val();
		if(userid==''){
			alert("请先登录进入游戏充值!");
		}else{
			$('#head_recharge a').attr("href",apiUrl+"/recharge.do");
		}
	})	
})
//跳注册页面
$(function(){
	$('#reg,.reg,#head_regist a').attr('href',apiUrl+'/Yqwan/toRegistOne.do?gamename='+encodeURI(encodeURI(gamename)));
})


//从平台获得最新区
$(function(){
	 var url = apiUrl + "/newDistrict.do?g="+encodeURI(encodeURI(gamename));
     $.getJSON(url + "&jsoncallback=?", function (json) {
         if (json) {
             	$('#login_recomend,#server_recommend').text(json.district);
             	$('#login_recommendserverid,#server_recommendserverid').val(json.serverid);
                 return;
         }
     });
})

//服务器推荐区点击逻辑
$(function(){
	$('#server_recommend').click(function(){
		var userid = $('#userid').val();
		var region = $('#server_recommend').text();
		var serverid = $('#server_recommendserverid').val();
		setRecentRegion(region,serverid);
	})
})



//从平台获得全部分区
$(function(){	
	var userid = $('#userid').val();
	 var url = apiUrl + "/allregion.do?g="+encodeURI(encodeURI(gamename));
     $.getJSON(url + "&jsoncallback=?", function (json) {
    	 var arr= json.jsonarray;
     	arr=JSON.parse(arr);
     	var img ='';
     	for(i=0;i<arr.length;i++){
 			var obj=arr[i];
 			var region = obj.gameregion;
 			var serverid = obj.serverid;
 			img += "<div class=\"server3\"><a class=\"qm\" onclick=\"setRecentRegion('"+region+"','"+serverid+"')\">"+region+"</a><div></div></div>";
 		}
 		$('#Demo').append(img);
     });
})

//获得最近登录区
$(function(){
	var userid = $('#userid').val();
	getrecentregion(userid);
})
function getrecentregion(userid){
	var xhr = getXhr();
	//发送请求
	var uri = '/Yqwan/getrecentregion.do?userid='+userid+'&gamename='+encodeURI(encodeURI(gamename));
	xhr.open('get',uri,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt1 = xhr.responseText;
			var txt=txt1.substring(0,txt1.indexOf(','));
			var serverid=txt1.substring(txt1.indexOf(',')+1);
			$('#login_recent').text(txt);
			$('#login_recentserverid').val(serverid);
			if(txt1=="无"){
				$('#server_not').show();
				$("#server_recent").hide();
			}else{
				$("#server_recent a").text(txt);
				$('#server_not').hide();
				$("#server_recent").show();
				$('#server_recentserverid').val(serverid);
			}			
		}	
	};
	xhr.send(null);
}

//设置服务器选择最近登陆区地址
$(function(){
	$('#server_recent a').click(function(){
		var userid = $('#userid').val();
		var region = $('#server_recent a').text();
		var serverid = $('#server_recentserverid').val();
		setRecentRegion(region,serverid);
	})
})

//登录页点击开始游戏逻辑
$(function(){
	$('#startgame').click(function(){
		var userid = $('#userid').val();
		var recent_region = $('#login_recent').text();
		var recent_regionserverid = $('#login_recentserverid').val();
		var recomend_region = $('#login_recomend').text();
		var recommend_regionserverid = $('#login_recommendserverid').val();
		//判断有无最近登陆的服，有就进，否则进推荐服
		if(recent_region=='无'||recent_region==''){
			var region = recomend_region;
			var serverid = recommend_regionserverid;
		}else{
			var region = recent_region;
			var serverid = recent_regionserverid
		}	
		setRecentRegion(region,serverid);
//		window.open('/gameXSQST/gameStart.jsp','_blank');
	})
})

//保存玩家登陆的最新分区,进入游戏
function setRecentRegion(region,serverid){
		var uri = apiUrl+'/Yqwan/getgameidbygamename.do?gamename='+encodeURI(encodeURI(gamename));
	     $.getJSON(uri + "&jsoncallback=?", function (json) {
	    	 if (json) {
	             var gameid = json.gameid;
//	             window.open('/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage,'_blank');
				 window.location.href='/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage;
	         }
	     });	
}






//头部五个推荐游戏
$(function(){
	var url = apiUrl + "/fiverecommend.do?g=qst";
    $.getJSON(url + "&jsoncallback=?", function (json) {
    	var arr= json.jsonarray;
    	arr=JSON.parse(arr);
    	var img ='';
    	for(i=0;i<arr.length;i++){
			var obj=arr[i];
			var gamename1=encodeURI(encodeURI(obj.gamename));		//中文编码;
			img += "<img style='border-radius:13px;' src=\"http://www.199y.com/picture/yqwan/"+obj.mainpicture+"\" width=\"50\" height=\"50\" onclick=\"javascript: window.open('"+apiUrl+"/gameinfo.do?gameid="+obj.gameid+"','_blank');\">&nbsp;";
		}
		$('#headlogo').after(img);
    });
})


//登录页登录功能
$(function(){
	$('#loginbutton').click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		var code = $('#code').val();
		if(username==''){
			$('#usernametext').html("用户名不能为空");
			return;
		}
		if(password==''){
			$('#usernametext').html("");
			$('#passwordtext').html("密码不能为空");
			return;
		}
		$('#usernametext').html("");
		$('#passwordtext').html("");
		
		
		var xhr = getXhr();
		//发送请求
	    var url="/Yqwan/checkcode.do?code="+code;
		xhr.open('get',url,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;		
				if(txt!="√ 验证码正确"){
					$('#codetext').html(txt);
					return;
				}else{
					$('#login_nickname').text(username);
					getrecentregion(username);				//获得该用户最近登录的区
					login_login(username,password);			//判断登录状态
				}
			}		
		};
		xhr.send(null);	
	})
})

//选择服务器页面登录
$(function(){
	$('#serverbutton').click(function(){
		var username = $('#username').val();
		var password = $('#password').val();
		var code = $('#code').val();
		if(username==''){
			alert('用户名不能为空!');
			return;
		}
		if(password==''){
			alert('密码不能为空!')
			return;
		}
		$('#server_nickname').text("账户名："+username);
		getrecentregion(username);				//获得该用户最近登录的区
		login_login(username,password);
	})
})

//登录
function login_login(user,pwd){
	pwd = $.md5(pwd)
	var url = apiUrl + "/logingame.do?g=qst&a=doLogin&userName="+user+"&password="+pwd;
    $.getJSON(url + "&jsoncallback=?", function (json) {
        if (json) {
            if (json.code == 0) {
            	$('#userid').val(user);
            	loginornot();		//显示登录框
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


//登出
$(function(){
	$('#login_out,#server_out').click(function(e){
		e.preventDefault();
        var url = apiUrl + "/gamedestroy.do?g="+originalpage;
        $.getJSON(url + "&jsoncallback=?", function (json) {
            if (json.code==0) {
            	$('#userid').val("");
            	loginornot();
            }
        });
	})
})

//判断是否登录
function loginornot(){
   var userid = $('#userid').val();
   	if(userid!=''){
 	    $("#login_no,#server_no").hide();
 	    $("#login_yes,#server_yes").show();
	}else{
		$("#login_no,#server_no").show();
 	    $("#login_yes,#server_yes").hide();
	}
}