<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>刀剑魔药2</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="shortcut icon" href="http://www.199y.com/images/5987.ico">
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/gameDJMY2/start/game_start.css">

	</head>
	<body>
	<div class="bgb">
		<!--http://passport.86game.com/platform/images/body_bg.jpg-->
		<jsp:include page="head.jsp"></jsp:include>
		<div class="page">
			<div class="wid1500">
				<div class="center">
					
					<div class="content" style="float:left;">
						<div>
							<img style="display: none" src="/Yqwan/gameDJMY2/start/top.gif">
						</div>
						<div class="frame">
							<iframe id="ifm" src="${game_url}"
								frameborder="0" scrolling="no" width="100%" height="720"
								allowtransparency="true"></iframe>
						</div>
						<!---->
					</div>
	
	
				</div>
			</div>
		</div>
	</div>	
	
	<div class='fix'> 
		<div class='fixtop'><span>账号登录</span> 
			<img src='/Yqwan/gameDJMY2/start/cuo.png' class='cuo'/>
		</div> 
		<div class="logobaidi1">
			<img src="/Yqwan/gameDJMY2/start/logobaidi.png" width=185 height=48/>
		</div>
		<div class='fixcon'> 
			输入账号：<input type="text" name="user" id="username" class="user"/><span style="color:red" id="usernametext"></span><br/>
			输入密码：<input type="password" name="password" id="password" class="password"/><span style="color:red" id="passwordtext"></span><br/>
			<span class="gogame" id="startgamebutton">进入游戏</span><a class="reg" target="_blank">免费注册</a>
		</div> 
	</div>
	<div class="fixbo"></div>
	</body>
</html>