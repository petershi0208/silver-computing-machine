<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML5">
<html>
	<head>
   		<title>登录-199y游戏</title>  
   		<meta name="keywords" content="登陆,199y游戏登陆,199y游戏">
		<meta name="description" content="199y游戏登陆">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">		
		<!-- Bootstrap -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">	
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/login/login.css">
	</head>
  
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="loginbanner"></div>
		<div class="center">
			<form action="/Yqwan/login.do" method="post" id="form">
				<div class="center_logo"></div>
				<div class="center_btn" id="center_btn">
					<span>账号登录</span>
					<span>短信登录</span>
					<img src="login/dengluhuaxianzuo.png"/>
				</div>
				<div class="namepwd" id="namepwd">
					<div class="center_user">
						<span>用户名:</span>
						<input type="text" placeholder="6-12位英文或数字" id="username" name="username">
						<span id="usernametext"></span>
					</div>
					<div class="center_user">
						<span>账号密码: </span>
						<input type="password" placeholder="请输入密码" id="password" name="password">
						<span id="passwordtext"></span>
					</div>
				</div>
				<div class="namepwd1" id="namepwd1">
					<div class="center_user">
						<span>手&nbsp;&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号: </span>
						<input type="text" placeholder="请输入手机号" id="telephone" name="telephone">
						<span id="telephonetext"></span>
					</div>
					<div class="center_user">
						<span>图形验证码:</span>
						<input type="text" placeholder="请输入右侧验证码" id="imgcode" name="imgcode">
						<img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
						<span id="imgcodetext"></span>
					</div>
					
					<div class="center_user">
						<span>验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码: </span>
						<input type="text" placeholder="请输入短信验证码" id="code">
						<input name="send" id="send" value="发送验证码" class="phone_code" style="cursor:pointer;" type="button">
						<span id="codetext"></span>
					</div>
				</div>
				<div class="center_bottom" id="center_bottom">
					<input type="checkbox"/>
					<span>记住我</span>
					<span><a href="forgetOne.jsp">忘记密码</a></span>
					<input type="button" value="登录" id="button"/>
					<span><a href="registOne.jsp">立即注册</a></span>
				</div>
			</form>
		</div>
		<jsp:include page="foot.jsp"/>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.md5.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/login/login.js" ></script>
</html>
