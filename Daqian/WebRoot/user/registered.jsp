<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="registered_files/hm.js"></script><script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大钱--信息注册页</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
<link href="<%=request.getContextPath()%>/registered_files/register_share.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/registered_files/register_msg.css" rel="stylesheet" type="text/css">


<script src="<%=request.getContextPath()%>/registered_files/jquery-1_002.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/registered_files/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/registered_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/registered_files/register_msg.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/registered_files/jquery1.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/registered_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/registered_files/member_center.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/registered_files/jquery-client-1.js"></script>

</head>
<body>

	<div class="registerMsg_Head_DIV">
		<center>
			<div id="top">			
				<div class="registerMsg_Head_DIV_02">
					<div class="registerMsg_Head_DIV_03">
						<div class="registerMsg_Head_DIV_04">
							<a href="<%=request.getContextPath()%>/index.do">
								<div class="registerMsg_Head_DIV_05"></div>
								<div class="registerMsg_Head_logo"><img src="<%=request.getContextPath()%>/index_files/logo.png" width="159" height="48" /></div>
							</a>

							<div class="registerMsg_Head_title02"><img src="<%=request.getContextPath()%>/index_files/l.png" style="margin-left:15px; margin-top:-10px"/></div>

							<div class="registerMsg_Head_title03"><img src="<%=request.getContextPath()%>/index_files/ll.png" width="270" height="23" /></div>

							<div class="registerMsg_Head_pojoDiv_01">
								<div class="registerMsg_Head_title04"></div>
								<div class="registerMsg_Head_registerText">注册</div>
							</div>
					
						</div>
					</div>			
				</div>
			</div>		
			<div class="registerMsg_Head_pojoDiv_02"></div>
			
			
			<form action="/Daqian/regist.do" method="post" id="form">
				<div class="registerMsg_Head_pojoDiv_03">
					<div class="registerMsg_Head_pojoDiv_04">
					</div>
					
					<div class="registerMsg_step_Div">
						
						<div class="registerMsg_stepGreen">
							<span class="registerMsg_stepFont">1</span>		
						</div>
				
						<div class="registerMsg_stepGray_Div"></div>
						
						<div class="registerMsg_stepBack">
							<span class="registerMsg_stepFont">2</span>	
						</div>
						
						<div class="registerMsg_stepGray_Div"></div>
						
						<div class="registerMsg_stepBack">
							<span class="registerMsg_stepFont">3</span>			
						</div>	
					</div>
					
					<div class="registerMsg_pojoDiv_05"></div>
					
					<div class="registerMsg_pojoDiv_06">
						<span class="registerMsg_stepGreen_Font">填写用户信息</span>
						<span class="registerMsg_pojoDiv_07"></span>
						<span class="registerMsg_stepGray_Font">手机信息验证</span>
						<span class="registerMsg_pojoDiv_08"></span>
						<span class="registerMsg_stepGray_Font">注册成功</span>
					</div> 
								
					<div class="registerMsg_Pojo_01"></div>
								
					<div class="registerMsg_Pojo_02">
						<div class="registerMsg_PojoImg_01" border="1px solid red"></div>	
						<div class="registerMsg_property_TEXT">用户名</div>	
						<div class="registerMsg_Pojo_03" ></div>			
						<div class="registerMsg_username">
							<input style="color: rgb(0, 0, 0);" id="uname" name="username" placeholder="输入用户名" class="registerMsg_property_INPUT" onfocus="validate_selectd(this.value,'uname');" onblur="validate(this.value,'username');"  type="text">
						</div>
						<div style="color: red;" id="username" class="registerMsg_property_HINT" title="username">× 用户名不允许为空</div>	
						

						<div class="registerMsg_Pojo_01">						
							<div class="registerMsg_Pojo_07">
								已有帐号  ? <a href="<%=request.getContextPath()%>/user/login.jsp" title="立即登录" class="registerMsg_Pojo_08">立即登录</a>
							</div>
						</div>
						
						
						<div class="registerMsg_PojoImg_01"></div>	
						<div class="registerMsg_property_TEXT">登录密码</div>	
						<div class="registerMsg_Pojo_03"></div>	
						<div class="registerMsg_pwd">
						 	<input style="display: none; color: rgb(0, 0, 0);" id="pwd" title="password" class="registerMsg_property_INPUT" onfocus="passwordValidate('pwd','pwd02'),validate_selectd(this.value,'pwd');" type="text">			
							<input style="display: inline;" id="pwd02" title="password" placeholder="输入密码" class="registerMsg_property_INPUT02" onblur="passwordValidates(this.value,'pwdText');" type="password">		
						</div>					
						<div style="color: red;" id="pwdText" title="password" class="registerMsg_property_HINT">× 登录密码不允许为空</div>	
						
						
						<div class="registerMsg_Pojo_01"><img src="<%=request.getContextPath()%>/registered_files/hongbao.png"  style="margin-left:580px; margin-top:80px"/></div>
						
						
						<div class="registerMsg_PojoImg_01"></div>	
						<div class="registerMsg_property_TEXT">确认密码</div>	
						<div class="registerMsg_Pojo_03"></div>	
					  	<div class="registerMsg_pwd">
							<input id="repetitionPwd02" name="password" title="repetitionPassword"  placeholder="再次输入密码" class="registerMsg_property_INPUT02" onblur="passwordValidates(this.value,'repetitionPwdText');" type="password">
						</div>
						
						<div id="repetitionPwdText" title="repetitionPassword" class="registerMsg_property_HINT">				
						</div>
						<div class="registerMsg_Pojo_01"></div> 
						
						
						
						
						<div class="registerMsg_PojoImg_01"></div>	
						<div class="registerMsg_property_TEXT">手机号码</div>	
						<div class="registerMsg_Pojo_03"></div>	
						<div class="registerMsg_phone">
							<input id="mobile" name="mobile" placeholder="输入手机号码" class="registerMsg_property_INPUT" onfocus="validate_selectd(this.value,'mobile');" onblur="validate(this.value,'mobiles');" type="text">
						</div>
						<div id="mobiles" title="mobiles" class="registerMsg_property_HINT"></div>	
						
						<div class="registerMsg_Pojo_01"></div>
						
						<div class="registerMsg_PojoImg_01"></div>	
						<div class="registerMsg_property_TEXT">选择角色</div>	
						<div class="registerMsg_Pojo_03"></div>	
						
						
						<div id="manageMoney" onclick="manageMoneyBtn()" title="我要理财" class="registerMsg_manageMoney_DIV" >
							<span id="manageMoneyText" class="registerMsg_manageMoney_TEXT">我要理财</span>
							<input id="manageMoneyName" class="registerMsg_manageMoney_btn">													
						</div>
						
						
						<div class="registerMsg_Pojo_14"></div>
						
						
						<div id="borrowMoney" onclick="borrowMoneyBtn()" title="我要借款" class="registerMsg_manageMoney_DIV">
							<span id="borrowMoneyText" class="registerMsg_manageMoney_TEXT">我要借款</span>
							<input id="borrowMoneyName" class="registerMsg_manageMoney_btn">
						</div>
						
						<div id="serveType" class="registerMsg_property_HINT"></div>	

						
			
						
						<div class="registerMsg_Pojo_09"></div>
						
						<div class="registerMsg_Pojo_04"></div>	
						<div class="registerMsg_property_TEXT"></div>	
					
						<div class="registerMsg_Pojo_10"></div>	
						
					  <div class="registerMsg_Pojo_05">
							<div style="float: left; ">
								<input id="btnCheckId" name="btnCheck" class="registerMsg_Pojo_06" onclick="checkBtn()" type="checkbox">
							</div>
							
						  <span class="registerMsg_clause">我已阅读并同意
							  <a   href="<%=request.getContextPath()%>/user/agreement.htm" target="_blank" class="registerMsg_clause_TEXT">&lt;&lt;大钱财富网站服务协议&gt;&gt;</a>						  </span>						</div>	
						
						<div id="btnCheck" class="registerMsg_property_HINT02">
							
						</div>	
										
						<div class="registerMsg_Pojo_11"></div>
						
						<div class="registerMsg_Pojo_04"></div>	
						<div class="registerMsg_Pojo_12"></div>	
						<div class="registerMsg_Pojo_03"></div>	
						
						<div class="registerMsg_registerImg">
							<input value="立即注册" onclick="btnValidate();" class="registerMsg_registerInput" type="button">
						</div>			
					</div>
					
					<div class="registerMsg_Pojo_13"></div>
				
				</div>
			</form>	
		</center>
		<div class="registerMsg_pojoDiv_09"></div>
	</div>

<link href="<%=request.getContextPath()%>/registered_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>
</body>

</html>