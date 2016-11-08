<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameLMCS/">
    
     <title>猎魔传说-登录-199Y游戏</title>
    <link rel="shortcut icon" href="images/b.png" type="image/x-icon">
     <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="199Y  199  199Y游戏  199Y游戏中心   角色扮演   挂机   mmoprpg   猎魔传说    传说   冒险    养成   娱乐交友   上班休闲    白领游戏    H5    网页游戏   手游   礼包    月卡    自动打怪    地下城    剧情闯关   高画质">
	<meta http-equiv="description" content="《猎魔传说》是以天使与恶魔在一万年前进行了名为末日之战的最后战役为背景，战役的结果是天使险胜，但元气大伤，几乎大部分天使失去了法力，坠落混沌之地。为了避免天堂的覆灭，天使最高议会的大天使联盟决定永久关闭天堂之门，从此天使彻底消失在宇宙之中再无踪迹。失去法力坠落混度之地的天使在头领的带领下艰难的生存下来，混沌之地逐渐秩序，各种族群主见生养起来。生活在这篇土地上的各种文明将混度之地称为极乐大陆，而这些坠落天使成为了创世者，被之后的族群奉为神灵。">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />	
	<link href="css/login.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div class="main">
    	<div class="mainleft">
    		<div class="lgtxt"></div>
    		<div class="wlg" id="login_no">
	    		<div class="ac">用户名：<input autoComplete="off" type="text" placeholder="请输入用户名" id="username"/><br/><span style="padding-left:85px;color:red;font-size:12px;" id="usernametext"></span></div>
	    		<div class="pw">密&nbsp;&nbsp;&nbsp;码：<input autoComplete="off" type="password" placeholder="请输入密码" id="password"/><br/><span style="padding-left:85px;color:red;font-size:12px;" id="passwordtext"></span></div>
	    		<div class="yz">验证码：<input autoComplete="off" type="text" placeholder="验证码" id="code"/>
	    			<div class="yztxt"><img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/></div>
	    			<br/><span style="padding-left:85px;color:red;font-size:12px;" id="codetext"></span>
	    		</div>
	    		<div class="login" id="loginbutton"></div>
	    		<a id="reg" target="_blank" class="rg">免费注册</a>
    		</div>
    		<div class="ylg" id="login_yes">
    			<table width="300" height="200">
    				<tr>
    					<td width="140" align="right" class="z22">用户名：</td>
    					<td width="92" id="login_nickname" class="z23">${user.nickname}</td>
    					<td></td>
    				</tr>
    				<tr>
    					<td width="140" align="right" class="z22">最近登录服：</td>
    					<td width="92" id="login_recent" class="z23">S5 月之港口</td>
    					<input type="hidden" id="login_recentserverid"/>
    					<td></td>
    				</tr>
    				<tr>
    					<td width="140" align="right" class="z22">推荐服务器：</td>
    					<td width="92" id="login_recomend" class="z23"></td>
    					<input type="hidden" id="login_recommendserverid"/>
    					<td></td>
    				</tr>
    				<tr>
    					<td><img src="images/tcyx.png" id="login_out"/></td>
    					<td><a href="server.jsp" target="_blank"><img src="images/dllb.png"/></a></td>
    					<td></td>
    				</tr>
    			</table>
    			<div class="login" id="startgame"></div>
    		</div>
    	</div>
    	<div class="mainright">
    		<div class="mainright_ad">
    			<div class="mainright_ad_tubiao">最新公告：</div>
    			<div class="mainright_ad_text">
    				<marquee behavior="scroll" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="420" onmouseover="this.stop();" onmouseout="this.start();"> 
						欢迎加入官方猎魔传说玩家交流群548881047
					</marquee>
    			</div>
    		</div>
    	</div>
    	<div></div>
    	<div></div>
    	<div></div>
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
