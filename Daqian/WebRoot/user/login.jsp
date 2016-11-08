<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head><script src="login_files/hm.js"></script><script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<script>
function keyLogin(){
	debugger;
  if (event.keyCode==13){   //回车键的键值为13
     $("#loginId").click();  //调用登录按钮的登录事件
   }
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大钱--信息登录页</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
<link href="<%=request.getContextPath()%>/login_files/register_share.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/login_files/register_msg.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/login_files/web_login.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="/Daqian/login_files/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/login_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/login_files/register_msg.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/login_files/web_login.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/login_files/jquery-client-1.js"></script>

</head><body onkeydown="keyLogin()">

	<div class="registerMsg_Head_DIV">
		<center>
			<div id="top">			
				<div class="registerMsg_Head_DIV_02">
					<div class="registerMsg_Head_DIV_03">
						<div class="registerMsg_Head_DIV_04">
							<a  href="<%=request.getContextPath()%>/index.do">
								<div class="registerMsg_Head_DIV_05"></div>
								<div class="registerMsg_Head_logo">
								<img src="<%=request.getContextPath()%>/index_files/logo.png" width="159" height="48" />
								</div>
							</a>

							<div class="registerMsg_Head_title02">
													<img src="<%=request.getContextPath()%>/index_files/l.png" style="margin-left:15px; margin-top:-10px"/>		
							</div>

							<div class="registerMsg_Head_title03">
							<img src="<%=request.getContextPath()%>/index_files/ll.png" width="270" height="23" />
							</div>

							<div class="registerMsg_Head_pojoDiv_01">
								<div class="registerMsg_Head_title04"></div>
								<div class="registerMsg_Head_registerText">登录</div>
							</div>
					
						</div>
					</div>			
				</div>
			</div>		
			<div class="registerMsg_Head_pojoDiv_02"></div>
			
			
			<form action="/Daqian/login.do" id="form" method="post">
				<div class="registerMsg_Head_pojoDiv_03">
					<div class="registerMsg_Head_pojoDiv_04"></div>
						
						<div class="login_pojoDiv_01">
							<div class="login_pojoDiv_02">
								
									<div class="login_userLogin">用户登录</div>				
									<div class="login_pojoDiv_03"></div>
									
									<div class="login_username_DIV">
										<div class="login_user_TEXT">用户名</div>
										<div class="login_pojoDiv_04"></div>
										<div class="login_username_Img">
											<input id="username" name="username" placeholder="请输入手机号/邮箱/用户名" class="login_user_INPUT" type="text">
										</div>		
										<div id="uname" title="uname" class="login_user_HINT"></div>
									</div>
									
									<div class="login_pojoDiv_05">
										<div class="login_user_TEXT">密&nbsp;&nbsp;&nbsp;码</div>
										<div class="login_pojoDiv_04"></div>
										<div class="login_pwd_Img">
											<input id="password" name="password" placeholder="输入密码" class="login_user_INPUT" type="password">
										</div>		
										<div id="user_password" title="user_password" class="login_user_HINT"></div>

									</div>
									
							
									<div class="login_pojoDiv_06">			
										<div class="login_pojoDiv_07"></div>
										<div class="login_pojoDiv_08">
											<input id="remember_checkbox" name="remember_checkbox" title="记住用户名" type="checkbox">
											<span class="rememberUname">记住用户名</span>	
											<a  href="<%=request.getContextPath()%>/user/forgot.jsp" title="忘记密码">					
												<span class="forgetPwd">忘记密码</span>								
											</a>
										</div>		
									</div>

									<div class="login_pojoDiv_05">			
										<div class="login_pojoDiv_09"></div>					
										<div id="promptlyLogin" title="立即登录">
											<div class="login_pojoDiv_11">
												<input id="loginId" style="font-family: Microsoft YaHei; color: #fff; font-size: 16px; border: 0px; width: 139px; height: 35px; background-color: #3598d8; border-radius: 4px;" value="立即登录" onclick="checkForm()" type="button">	
											</div>
										</div>				
									</div>
										
							</div>
							
							<div class="login_pojoDiv_13"></div>														
							<div class="login_pojoDiv_14">
								<div class="login_pojoDiv_15"></div>								
							  <div class="login_pojoDiv_16">
							  <img src="<%=request.getContextPath()%>/login_files/login.png" border="0" usemap="#Map" style="margin-left:-80px; margin-top:-60px"/>
<map name="Map" id="Map">
</map>
							  </div>					
							</div>					
						</div>		
					<div class="registerMsg_Pojo_13"></div>				
				</div>
			
			</form>	
			
		</center>
		<div class="registerMsg_pojoDiv_09"></div>
	</div>
<script type="text/javascript" language="javascript">


	$(document).ready(function(){ 
	    $("#username,#password").keydown(function(e){ 
	        var curKey = e.which; 
	        if(curKey == 13){ 
	        	checkForm();
	        } 
	    }); 
	}); 

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

	function checkForm() {
		if (document.getElementById('username').value == ''
				|| document.getElementById('username').value == null) {
			$("#uname").html("x 您的用户名不能为空");
			return;
		}else if(document.getElementById('username').value != ''
				|| document.getElementById('username').value != null){
			$("#uname").html("");
		}
		
		if(document.getElementById('password').value == ''
				|| document.getElementById('password').value == null) {
				
			$("#user_password").html("x 您的密码不能为空");
			return;
		} else {
			var name=$('#username').val();
			var password = $('#password').val();

			var xhr = getXhr();
			//发送请求
			var uri = '/Daqian/check.do?username='+name+'&password='+password;
				xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
			if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					if(txt=="x 用户名或密码错误"){
						$("#user_password").html(txt);
					}else{
					document.forms[0].submit();
			}
		}
	};
	xhr.send(null);
			
/*			$form = $("form");		
				$.ajax({
				url : "/login/login",
				data : $form.serialize(),
				dataType : 'json',
				success : function(msg) {
					if (msg.statusCode == 300) {
						$("#user_password").html("x 用户名或密码错误");
					}
					if (msg.statusCode == 200) {
						window.location.href = "/webApplicationUserCenter?secondBackImg=secondBackImg_1&secondfont=secondfont_1&menu=myAccount&rank=01&Fontcolor=menuFontcolor&menuid=menuId"
									+"&secondbackimg=secondBackImg_1&secondfont=secondfont_1";
					}
					if (msg.statusCode == 1000) {
						var sm_sm=document.getElementById("sm_sm").value;
						var onlineProductTermm=document.getElementById("onlineProductTermm").value;
						window.location.href = "/webApplicationFinancialInvest/financialBuyLogin?onLineProductTerm="+onlineProductTermm+"&sm_sm="+sm_sm;
					}
					if (msg.statusCode == 100) {
					    window.location.href = "/webApplicationLoan/borPayRoll";
					}
					if (msg.statusCode == 400) {
					    window.location.href = "/webApplicationLoan/borWhiteCollar";
					}
					if (msg.statusCode == 500) {
					    window.location.href = "/webApplicationLoan/borGoldCollar";
					}
					if (msg.statusCode == 600) {
					    window.location.href = "/webApplicationLoanApply/borMessage?productname="+msg.message+"&statu="+msg.navTabId;
					}
				},
				error : function() {
					alert("数据提交异常！请检查网络");
				}
			});
*/
		}
	}

</script>


<link href="<%=request.getContextPath()%>/login_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>

</body>
</html>