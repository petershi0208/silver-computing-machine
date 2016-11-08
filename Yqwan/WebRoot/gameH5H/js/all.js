var apiUrl = window.location.href;//"http://www.199y.com";
var length = apiUrl.substring(0, apiUrl.indexOf('.', 1)).length;
apiUrl = "http://www"+apiUrl.substring(length,parseInt(length)+parseInt(9));
var gamename;

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
	gamename = $('#hiddengamename').val();		//初始化游戏名字
})

//充值判断有无登录
$(function(){
	loginornot();
	$('#head_recharge').click(function(){
		alert("H5游戏请进入游戏充值");
	})	
})
//跳注册页面
$(function(){
	$('#reg,.reg,#head_regist a').attr('href',apiUrl+'/Yqwan/toRegistOne.do?originalpage=gameH5H&gamename='+encodeURI(encodeURI(gamename)));
})

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