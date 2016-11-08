var apiUrl = window.location.href;//"http://www.199y.com";
var length = apiUrl.substring(0, apiUrl.indexOf('.', 1)).length;
apiUrl = "http://www"+apiUrl.substring(length,parseInt(length)+parseInt(9));

var gameurl = "http://sgzn"+apiUrl.substring(length,parseInt(length)+parseInt(9));
var gamename = "三国之怒";
var originalpage = "gameSGZN";			//对应的Yqwan的webroot根目录下的游戏目录名称

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
//充值判断有无登录,设置充值地址
$(function(){
	$('.loginMag > div > a:eq(1),#head_recharge a').click(function(){
		var userid = $('#userid').val();
		if(userid==''){
			alert("请先登录");
		}else{
			$('.loginMag > div > a:eq(1),.lori > a:eq(0),#head_recharge a').attr("href",apiUrl+"/recharge.do?gameid=60000015&serverid=39");
		}
	})	
})

//设置注册地址
$(function(){
	$('.loginMag > div > a:eq(0),.reg,#head_regist a,#login_regist').attr('href','http://www.199y.com/Yqwan/toRegistOne.do?gamename='+encodeURI(encodeURI(gamename)));
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
	$('#click_recommend').click(function(){
		var userid = $('#userid').val();
		var region = $('#server_recommend').text();
		var serverid = $('#server_recommendserverid').val();
		setRecentRegion(region,serverid);
	})
//设置服务器选择最近登陆区地址
	$('#click_recent').click(function(){
		var userid = $('#userid').val();
		var region = $('#server_recent a').text();
		var serverid = $('#server_recentserverid').val();
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
 			if(i==arr.length-1){
 				img +="<a class='hasWord' onclick=\"setRecentRegion('"+region+"','"+serverid+"')\">" +
 				"<img class='fireLogo' src='images/serverimage/huo.png' alt='火logo'>" +
 				"<span class='firstW'>"+region+"</span>" +
 				"<span class='secondW'> 火爆开启</span>" +
 				"</a>"
 			}else{
 				img +="<a class='noFireW' onclick=\"setRecentRegion('"+region+"','"+serverid+"')\">" +
 				"<span class='firstW'>"+region+"</span>" +
 				"<span class='secondW'> 火爆开启</span>" +
 				"</a>"
 			}
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
				$('#wdl').show();
				$(".loginShow a").hide();
			}else{
				$("#server_recent").text(txt);
				$('#wdl').hide();
				$(".loginShow a").show();
				$('#server_recentserverid').val(serverid);
			}			
		}	
	};
	xhr.send(null);
}


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
	if(userid==''){
		return;
	}else{
		var uri = apiUrl+'/Yqwan/getgameidbygamename.do?gamename='+encodeURI(encodeURI(gamename));
	     $.getJSON(uri + "&jsoncallback=?", function (json) {
	    	 if (json) {
	             var gameid = json.gameid;
//	             window.open('/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage,'_blank');
				 window.location.href='/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage;
	         }
	     });
		
//		var xhr = getXhr();
//		//发送请求
//		var uri = '/Yqwan/getgameidbygamename.do?gamename='+encodeURI(encodeURI(gamename));
//		xhr.open('get',uri,false);
//		xhr.onreadystatechange=function(){
//			//4,处理服务器返回的数据				
//			if(xhr.readyState==4&&xhr.status==200){
//				var txt = xhr.responseText;		
//				var gameid = txt;
//				window.open('/Yqwan/startgame.do?gameid='+gameid+'&serverid='+serverid+'&originalpage='+originalpage,'_blank');
//			}	
//		};
//		xhr.send(null);
	}
	
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

$(function () {
    loginornot();
    $("#btn_login").click(function (e){
        e.preventDefault();
        var user = $("#txtUser").val();
        var pwd = $("#txtPwd").val();
        if (user == '' || user.length <= 0){
            alert('用户名不能为空！');
            return;
        }
        if(pwd == '' || pwd.length <= 0){
            alert('密碼不能为空！');
            return;
        }
		getrecentregion(user);				//获得该用户最近登录的区
        
		login_login(user,pwd);

    });

    $("#btn_logout").click(function (e) {
        e.preventDefault();
        var url = apiUrl + "/gamedestroy.do?g=xsqst";
        $.getJSON(url + "&jsoncallback=?", function (json) {
            if (json.code==0) {
            	$("#login-box,.button_login").show();
            	$("table").hide();
            }
        });
    });
});


//登录
function login_login(user,pwd){
	pwd = $.md5(pwd);
	var url = apiUrl + "/logingame.do?g=qst&a=doLogin&userName="+user+"&password="+pwd;
    $.getJSON(url + "&jsoncallback=?", function (json) {
        if (json) {
            if (json.code == 0) {
            	$('#login_nickname').text(json.msg);      	
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
            	$('#nickname').val("");
            	loginornot();
            }
        });
	})
})

//判断是否登录
function loginornot() {	
   var nickname = $('#nickname').val();
   var userid = $('#userid').val();
   	if (nickname!=''||userid!='') {
   		$('#login-box,.button_login').hide();
		$("table").show();
 	    return;
	}else{
		$('#login-box,.button_login').show();
		$("table").hide();
 	   return;
	}
}



//初始化新闻更多按钮
$(function(){
	$(".newstop a").each(function(){
		var type1 = $(this).text();
		if(type1!="副本"){
			var type =encodeURI(encodeURI(type1));
			$(this).attr('href',gameurl+'/morenews.do?type='+type+'&num=1');
		}
	})
})
//新闻切换
$(function(){
	$(".newstop a").hover(function (){ 
	    var id = $(this).attr("id"); 
	    var type =encodeURI(encodeURI($("#" +id).text()));
	    $(".news .newstop a").removeClass("act");
	    $("#" + id).addClass("act");
		$(".newstitle").hide();                
		$("#u" + id).show();
		
		//修改更多的样式
		//$('#more').attr('href','morenews.do?type='+type+'&num=1')
	});        
});
//初始化新闻跳转
$(function(){
	$("#news").attr("href",gameurl+"/morenews.do?type="+encodeURI(encodeURI('最新'))+"&num=1");
	$("#activity").attr("href",gameurl+"/morenews.do?type="+encodeURI(encodeURI('活动'))+"&num=1");
})


//更多页面按钮样式
$(function(){
	var type = $('#hiddentype').val();
	if(type=='新闻'){
		$(".news_menu a").removeClass("act");
		$('.xw').addClass("act");
	}else if(type=="活动"){
		$(".news_menu a").removeClass("act");
		$('.hd').addClass("act");
	}else if(type=="攻略"){
		$(".news_menu a").removeClass("act");
		$('.gl').addClass("act");
	}
})
	
$(function(){
	getnews("最新","#ua1");
	getnews("新闻","#ua2");
	getnews("活动","#ua3");
	getnews("攻略","#ua4");
})


//新闻功能
function getnews(type,id){
    var xhr = getXhr();
	//发送请求
    var url=apiUrl+"/gamegznews.do?type="+encodeURI(encodeURI(type))+"&gamename="+encodeURI(encodeURI(gamename));
   
	xhr.open('get',url,true);
	xhr.onreadystatechange=function(){
		//4,处理服务器返回的数据
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;		
			var arr=JSON.parse(txt);  
			var html ="";
			for(i=0;i<arr.length;i++){
				var obj = arr[i];
				
				html += "<div>"+
	        				"<a href=\""+gameurl+"/newsinfo.do?id="+obj.newsid+"\" target=\"_blank\" style=\"cursor: pointer\">  【"+obj.type+"】"+obj.title.substring(0,12)+"</a>"+
	        				"<span>"+obj.date.substring(5,10)+"</span>"+
	        			"</div>";
			}
			
			$(id).append(html);
		}		
	};
	xhr.send(null);	
}