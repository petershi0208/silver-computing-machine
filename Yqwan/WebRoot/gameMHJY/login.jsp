<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameMHJY/">
    
     <title>梦幻家园-登录-199Y游戏</title>
    <link rel="shortcut icon" href="images/b.jpg" type="image/x-icon">
     <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="199Y  199  199Y游戏  199Y游戏中心   DIY   挂机   设计   梦幻家园    庄园   种植    喂养宠物   娱乐交友   上班休闲    白领游戏 田园    H5    网页游戏   手游   礼包    月卡">
	<meta http-equiv="description" content="在浪漫大陆上发现了一种奇特的浮空石，大家纷纷采集搭建岛屿，于是许多美丽的飞行岛屿诞生了，它们与云朵作伴，它们和彩虹争艳，在蓝天和白云之间出现了一个个新的彩虹庄园。在这里可以喂养动物、种植果树，体验着原汁原味儿的田园生活。通过简单有趣的DIY系统可以把庄园按照搭积木的方式打造成你心中最美的梦幻庄园。经常和朋友交流和分享设计的心得，您一定会成为鼎鼎有名的设计大师！">
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
						欢迎加入官方梦幻家园玩家交流群245476016
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
