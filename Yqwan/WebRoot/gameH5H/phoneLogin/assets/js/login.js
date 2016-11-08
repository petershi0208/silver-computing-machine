var apiUrl = window.location.href;//"http://www.199y.com";
var length = apiUrl.substring(0, apiUrl.indexOf('.',1)).length;
apiUrl = "http://www"+apiUrl.substring(length,parseInt(length)+parseInt(10));
var gamename;
var gameid;
var originalpage;
	
	//点击注册按钮
	$(function(){
		gamename = GetQueryString("gamename");
		gameid=GetQueryString("gameid");
		originalpage = GetQueryString("originalpage");
		var login_userid = $('#login_userid').val();
		if(login_userid!=''){
			window.location.href='/Yqwan/startgame.do?gameid='+gameid+'&serverid=1&originalpage='+originalpage;
		}	
		$('#registbutton').click(function(){
			window.location.href="/Yqwan/gameRegist/regist.jsp?gamename="+encodeURI(gamename)+"&originalpage="+originalpage+"&gameid="+GetQueryString("gameid");
		})
	})
	
	
jQuery(document).ready(function() {
 
    /*
        Tooltips
    */
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

    /*
      	手机登录平台验证
    */
    $('#loginbutton').click(function(){
        $('#form').find("label[for='userid']").html('账号');
        $('#form').find("label[for='password']").html('密码');
        
        var userid = $('#form').find('input#userid').val();
        var password = $('#form').find('input#password').val();
        if(userid == '') {
            $('#form').find("label[for='userid']").append("<span style='display:none' class='red'> - 请输入合法用户名.</span>");
            $('#form').find("label[for='userid'] span").fadeIn('medium');
            return false;
        }
        if(password == '') {
            $('#form').find("label[for='password']").append("<span style='display:none' class='red'> - 请输入正确的密码.</span>");
            $('#form').find("label[for='password'] span").fadeIn('medium');
            return false;
        }
        password = $.md5(password);
        var url = apiUrl + "/logingame.do?a=doLogin&userName="+userid+"&password="+password;
        $.getJSON(url + "&jsoncallback=?", function (json) {
            if (json) {
                if (json.code == 0) {
                	window.location.href='/Yqwan/startgame.do?gameid='+gameid+'&serverid=1&originalpage='+originalpage;
                	return false;
                } else if(json.code==4){
                	 $('#form').find("label[for='userid']").append("<span style='display:none' class='red'> - "+json.msg+".</span>");
                     $('#form').find("label[for='userid'] span").fadeIn('medium');
                     return false;
                }else{
                	 $('#form').find("label[for='password']").append("<span style='display:none' class='red'> - "+json.msg+".</span>");
                     $('#form').find("label[for='password'] span").fadeIn('medium');
                     return false;
                }
            } else {
            	$('#form').find("label[for='userid']").append("<span style='display:none' class='red'> - 登录失败.</span>");
                $('#form').find("label[for='userid'] span").fadeIn('medium');
                return false;
            }
        });  
        return false;
    });
});



//截取参数
function GetQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}


