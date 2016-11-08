<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>注册Step3-199y游戏</title>
   		<meta name="keywords" content="注册,199y游戏,游戏注册">
   		<meta name="description" content="199y游戏注册Step3">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/jquery-1.7.1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/regist/regist.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/regist3.js" ></script>
	</head>
  
	<body>
	<input type="hidden" value="${invitecode}" id="invitecode">
	<input type="hidden" value="${gamename}" id="gamename">
	<input type="hidden" value="${originalpage}" id="originalpage">
    	<jsp:include page="head.jsp"></jsp:include>
    	<div class="registbanner"></div>
    	<div class="center">
			<div class="three_center_logo">
				<ul>
					<li>输入账号和密码</li>
					<li>激活验证</li>
					<li>完成</li>
				</ul>
			</div>
			<div class="three_center_text">
				<img src="regist/duihao.png">
				<span>恭喜您,注册成功!</span>
				<span>您的199Y游戏网登陆账号为：${user.userid }</span>
				<span>
					<span id="eight">8</span>
					<span>&nbsp秒后自动跳转</span>
					<span>|</span>
					<span id="handto"><a href="">手动跳转</a></span>
				</span>
			</div>
		</div>
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
