<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>注册Step1-199y游戏</title>
   		<meta name="keywords" content="注册,199y游戏,游戏注册">
   		<meta name="description" content="199y游戏注册Step1">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/jquery-1.7.1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/regist/regist.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/regist1.js" ></script>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"></jsp:include>
    	<div class="registbanner"></div>
    	<div class="center">
			<div class="center_logo">
				<ul>
					<li>输入账号和密码</li>
					<li>激活验证</li>
					<li>完成</li>
				</ul>
			</div>
			<form action="/Yqwan/registone.do" method="post" id="form">
				<input type="hidden" value="${gamename}" name="gamename"/>
				<input type="hidden" value="${originalpage}" name="originalpage"/>
				<div class="center_user">
					<span>&nbsp;&nbsp;&nbsp;账号:</span>
					<input type="text" placeholder="用户名为5-12位英文或数字" id="username" name="username">
					<span id="usernametext"></span>
				</div>
				<div class="center_user center_user1">
					<span>设置密码:</span>
					<input autoComplete="off" type="password" placeholder="密码必须以字母开头，长度在6~22位之间" id="pwd" name="pwd">
					<span id="pwdtext"></span>
				</div>
				<div class="center_user center_user1">
					<span>确认密码:</span>
					<input autoComplete="off" type="password" placeholder="密码必须以字母开头，长度在6~22位之间" id="qrpwd" name="qrpwd">
					<span id="qrpwdtext"></span>
				</div>
				
				
				<div class="center_user  center_user3">
					<span>&nbsp;&nbsp;&nbsp; 昵称:</span>
					<input type="text" placeholder="昵称为7位以下中英文或数字" id="nickname" name="nickname">
					<span id="nicknametext"></span>
				</div>
				
<!--			<div class="center_user center_user3">
					<span>&nbsp;&nbsp;&nbsp; 姓名:</span>
					<input type="text" placeholder="请输入真实姓名" id="realname" name="realname">
					<span id="realnametext"></span>
				</div>
				<div class="center_user center_user3">
					<span>身份证: </span>
					<input type="text" placeholder="请输入身份证号" id="idcard" name="idcard">
					<span id="idcardtext"></span>
				</div>  -->	
				
				
				<div class="center_user center_user3">
					<span>手机号: </span>
					<input type="text" placeholder="请输入手机号" id="telephone" name="telephone">
					<span id="telephonetext"></span>
				</div>				
<!--			<div class="center_user center_user2">
					<span>验证码: </span>
					<input type="text" placeholder="请输入验证码" id="registcode">
					<img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
					<span id="registcodetext"></span>
				</div>  -->
				<div class="center_user center_user3">
					<span>邀请码: </span>
					<input type="text" placeholder="如果无邀请码，可为空" value="${invitecode}" id="invite" name="invite">
					<span id="invitetext">非必填</span>
				</div>
				<div class="center_bottom">
					<input type="checkbox" id="service"/>
					<span>我已经看过并同意</span>
					<span ><a href="yhxy.jsp" target="_blanket">《服务协议》</a></span>
					<span id="servicetext"></span>
					<input type="button" value="下一步 " id="button"/>
				</div>				
			</form>
		</div> 	
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
