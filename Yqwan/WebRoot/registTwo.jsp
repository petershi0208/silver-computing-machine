<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>注册Step2-199y游戏</title>
   		<meta name="keywords" content="注册,199y游戏,游戏注册">
   		<meta name="description" content="199y游戏注册Step2">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/jquery-1.7.1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/regist/regist.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/regist2.js" ></script>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"></jsp:include>
    	<div class="registbanner"></div>
    	<div class="center">
			<div class="two_center_logo">
				<ul>
					<li>输入账号和密码</li>
					<li>激活验证</li>
					<li>完成</li>
				</ul>
			</div>
			<div class="two_center_text">
				<!--<span>短信验证码已发送到您的手机，请注意查收</span>-->
			</div>  
			<form action="/Yqwan/registtwo.do" method="post" id="form">
				<input type="hidden" value="${user.telephone}" id="telephone" name="telephone"/>
				<input type="hidden" value="${user.userid}" id="username" name="username">
				<input type="hidden" value="${user.password}" id="password" name="password">
<!--			<input type="hidden" value="${user.realname}" id="realname" name="realname">
				<input type="hidden" value="${user.idcard}" id="idcard" name="idcard">  -->
				<input type="hidden" value="${user.nickname}" id="nickname" name="nickname">
				<input type="hidden" value="${user.spreadcode}" id="invitecode" name="invitecode">
				<input type="hidden" value="${gamename}" id="gamename" name="gamename">
				<input type="hidden" value="${originalpage}" id="originalpage" name="originalpage">
				<div class="two_center_user">
					<span>图形验证码 : </span>
					<input type="text" placeholder="请输入右侧验证码" id="imgcode" name="imgcode">
					<img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
					<span id="imgcodetext"></span>
				</div>
				<div class="two_center_user">
					<span>验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码 : </span>
					<input type="text" placeholder="请输入短信验证码" id="code" name="code">
					<input name="send" id="send" value="发送验证码" class="phone_code" style="cursor:pointer;" type="button">
					<span id="codetext"></span>
				</div>
				<div class="two_center_bottom">
					<input type="button" value="下一步 " id="btn"/>
				</div>
			</form>
		</div>
    	
    	
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	<script type="text/javascript">
	$(function(){
		$('#notloginhead1,#notloginhead2').show();
		$('#loginhead1,#loginhead2,#loginhead3').hide();
	})
	</script>
</html>
