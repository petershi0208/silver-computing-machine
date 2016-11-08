<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>重置密码step2-199y游戏</title> 
   		<meta name="description" content="199y重置密码step2">
   		<meta name="keywords" content="重置密码,199y重置密码,重置">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/forget/forget.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/forget/forget2.js" ></script>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"></jsp:include>
    	<div class="forgetbanner"></div>
    	<form action="/Yqwan/forgettwo.do" method="post" id="form">
    		<input type="hidden" value="${telephone }" id="telephone" name="telephone"/>
	    	<div class="center">
				<div class="two_center_logo">
					<ul>
						<li>输入账号</li>
						<li>重置密码</li>
						<li>完成</li>
					</ul>
				</div>
				<div class="two_center_user imgcode">
					<span>图形验证码: </span>
					<input type="text" placeholder="请输入右侧验证码" id="imgcode" name="imgcode">
					<img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
					<span id="imgcodetext"></span>
				</div>
				<div class="two_center_user">
					<span>验证码: </span>
					<input type="text" placeholder="请输入短信验证码" id="code" name="code">
					<input name="send" id="send" value="发送验证码" class="phone_code" style="cursor:pointer;" type="button">
					<span id="codetext"></span>
				</div>
				<div class="center_user_two">
					<span>设置新密码:</span>
					<input type="text" placeholder="密码必须以字母开头，长度在6~22位之间" id="pwd1" name="password">
					<span id="pwd1text"></span>
				</div>
				<div class="center_user_two">
					<span>确认新密码:</span>
					<input type="text" placeholder="请重新输入密码" id="pwd2">
					<span id="pwd2text"></span>
				</div>
				
				<div class="two_center_bottom">
					<input type="button" value="下一步 " id="button"/>
				</div>
			</div>
		</form> 	
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
