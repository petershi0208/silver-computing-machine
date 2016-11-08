var apiUrl = window.location.href;//"http://www.199y.com";
var length = apiUrl.substring(0, apiUrl.indexOf('.', 1)).length;
apiUrl = "http://www"+apiUrl.substring(length,parseInt(length)+parseInt(10));


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


function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

jQuery(document).ready(function() {
	var gamename = GetQueryString("gamename");
	var original = GetQueryString("originalpage");
	var gameid =  GetQueryString("gameid");
	$('form').submit(function(){
        $(this).find("label[for='userid']").html('账号');
        $(this).find("label[for='password']").html('输入密码');
        $(this).find("label[for='password1']").html('确认密码');
        $(this).find("label[for='code']").html('验证码');
        
        var userid = $(this).find('input#userid').val();
        var password = $(this).find('input#password').val();
        var password1 = $(this).find('input#password1').val();
        var code = $(this).find('input#code').val();
        
        var userreg = /^[0-9A-Za-z]{5,12}$/;
        var pwdreg = /^[a-zA-Z]\w{5,21}$/;
        
        if(userid == '') {
            $(this).find("label[for='userid']").append("<span style='display:none' class='red'> - 请输入合法用户名.</span>");
            $(this).find("label[for='userid'] span").fadeIn('medium');
            return false;
        }else if(!userreg.test(userid)){
        	$(this).find("label[for='userid']").append("<span style='display:none' class='red'> - 用户名为5-12位英文或数字.</span>");
	        $(this).find("label[for='userid'] span").fadeIn('medium');
	        return false;
        }
        
        if(code == '') {
            $(this).find("label[for='code']").append("<span style='display:none' class='red'> - 请输入验证码.</span>");
            $(this).find("label[for='code'] span").fadeIn('medium');
            return false;
        }
        
        if(password == '') {
            $(this).find("label[for='password']").append("<span style='display:none' class='red'> - 请输入正确的密码.</span>");
            $(this).find("label[for='password'] span").fadeIn('medium');
            return false;
        }else if(!pwdreg.test(password)){
        	 $(this).find("label[for='password']").append("<span style='display:none' class='red'> - 英文开头,长度为6至22位之间.</span>");
             $(this).find("label[for='password'] span").fadeIn('medium');
             return false;
        }else if(password!=password1){
        	$(this).find("label[for='password1']").append("<span style='display:none' class='red'> - 两次密码不一致.</span>");
            $(this).find("label[for='password1'] span").fadeIn('medium');
            return false;
        }
        password = $.md5(password);
        var xhr = getXhr();
		//发送请求
		var uri = '/Yqwan/phoneregist.do?username='+userid+'&password='+password+'&code='+code+'&gamename='+gamename;
		xhr.open('get',uri,true);
		xhr.onreadystatechange=function(){
			//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
				var txt = xhr.responseText;
				var obj =  eval("(" + txt + ")");
				if(obj.code=="0"){
					 $('form').find("label[for='code']").append("<span style='display:none' class='red'> - 验证码错误.</span>");
			            $('form').find("label[for='code'] span").fadeIn('medium');
			            return false;
				}else if(obj.code=="1"){
//					alert('注册成功,请后退回登录页面!');
					var letter = obj.letter;
					if(original!=null){
						window.location.href="http://www.199y.com/Yqwan/startgame.do?gameid="+gameid+"&serverid=1&originalpage="+original;
					}else{
						window.location.href="http://www.199y.com/Yqwan/game"+letter+"/phoneLogin/server.jsp";
					}					
				}else if(obj.code=="2"){
					 $('form').find("label[for='userid']").append("<span style='display:none' class='red'> - 账号已存在.</span>");
			         $('form').find("label[for='userid'] span").fadeIn('medium');
			         return false;
				}	
			}
		};
		xhr.send(null);
		return false;
	});
});



