<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameSGZN/">
    
    <title>三国之怒-199Y游戏</title>
    <link rel="shortcut icon" href="http://www.199y.com/picture/yqwan/201608/sanggg.jpg" type="image/x-icon">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="expires" content="0">
	<meta name="keywords" content="三国,三国之怒,三国志9,三国志10,三国志11,三国志12,三国志13,热血传奇,大皇帝,传奇,关羽,张飞,吕布,热血PK,PK,貂蝉,小乔,赵云,三国演义,新三国,怒三国,三国志,真三国无双,三国杀,三国女志,三国之志,199,199y,9游戏,199游戏,9y游戏,199y游戏">
	<meta name="description" content="华丽的技能和优良的操作手感带来极致战斗体验，打怪PK更为爽快。召集各路英豪，一统天下，尽在《三国之怒》">
	
		<script type="text/javascript"
			src="start/jquery-1.7.2.min.js"></script>
			<script type="text/javascript"
			src="start/start.js"></script>
	</head>
	<body>
	<div class="bgb">
		<jsp:include page="head.jsp"></jsp:include>
			<div class="page" id="page">
				
			<div class="wid1500"  id="center_game">
				<div class="center_game_gonggao">
					<div class="center_game_region">${gameregion }</div>
					<div class="center_game_zuixingonggao">最新公告：</div>
					<div class="center_game_gonggao_content">
						<marquee behavior="scroll" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="620" onmouseover="this.stop();" onmouseout="this.start();"> 
						<span>欢迎加入官方三国之怒-玩家交流群247700260</span>
						</marquee>
					</div>
				</div>
				<div class="center">
					<div class="content" style="float:left;">
						<div class="frame">
							<iframe id="ifm" src="${game_url}"
								frameborder="0" scrolling="no" width="100%" height="100%"
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
			<img src='start/cuo.png' class='cuo' /> 
		</div> 
		<div class="logobaidi1">
			<img src="start/logobaidi.png" width=185 height=48/>
		</div>
		<div class='fixcon'> 
			输入账号：<input type="text" name="user" id="username" class="user" /><span style="color:red" id="usernametext"></span><br/>
			输入密码：<input type="password" name="password" id="password" class="password"/><span style="color:red" id="passwordtext"></span><br/>
			<span class="gogame" id="startgamebutton">进入游戏</span><a class="reg" target="_blank">免费注册</a>
		</div> 
	</div>
	<div class="fixbo"></div>
	</body>
	<link rel="stylesheet" type="text/css"
			href="start/game_start.css">
</html>