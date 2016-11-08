<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameLMCS/">
    
    <title>猎魔传说-199Y游戏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="《猎魔传说》是以天使与恶魔在一万年前进行了名为末日之战的最后战役为背景，战役的结果是天使险胜，但元气大伤，几乎大部分天使失去了法力，坠落混沌之地。为了避免天堂的覆灭，天使最高议会的大天使联盟决定永久关闭天堂之门，从此天使彻底消失在宇宙之中再无踪迹。失去法力坠落混度之地的天使在头领的带领下艰难的生存下来，混沌之地逐渐秩序，各种族群主见生养起来。生活在这篇土地上的各种文明将混度之地称为极乐大陆，而这些坠落天使成为了创世者，被之后的族群奉为神灵。">
	<meta http-equiv="description" content="《猎魔传说》是以天使与恶魔在一万年前进行了名为末日之战的最后战役为背景，战役的结果是天使险胜，但元气大伤，几乎大部分天使失去了法力，坠落混沌之地。为了避免天堂的覆灭，天使最高议会的大天使联盟决定永久关闭天堂之门，从此天使彻底消失在宇宙之中再无踪迹。失去法力坠落混度之地的天使在头领的带领下艰难的生存下来，混沌之地逐渐秩序，各种族群主见生养起来。生活在这篇土地上的各种文明将混度之地称为极乐大陆，而这些坠落天使成为了创世者，被之后的族群奉为神灵。">
		<link rel="shortcut icon" href="images/b.png" type="image/x-icon">
	
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
						<span>欢迎加入官方猎魔传说-玩家交流群548881047</span>
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
	<script src="https://cdn.bootcss.com/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>
		<script type="text/javascript">
			$(".page_left_l").niceScroll({scrollspeed:"80",zIndex:"9999",cursorcolor:"#ccc"});
			$(".page_left_l").niceScroll("#wrapperdiv",{cursorcolor:"#00F"});
		</script>
	<link rel="stylesheet" type="text/css" href="start/game_start.css">
</html>