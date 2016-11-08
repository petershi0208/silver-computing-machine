<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>宝石与爬塔-登录-199Y游戏</title>
    <link rel="shortcut icon" href="gameBSYPT/images/b.jpg" type="image/x-icon">
     <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="宝石与爬塔,玩法简单,乐趣无穷,消灭敌人">
	<meta http-equiv="description" content="宝石与爬塔是一款挂机放置类游戏，玩家可以通过不断升级自己的勇士与英雄，消灭层层出现的敌人，闯入更高的关卡。 各种华丽的武器装备能为您的武将提供大量的增益，玩法简单乐趣无穷">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=request.getContextPath()%>/gameBSYPT/scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />	
	<link href="<%=request.getContextPath()%>/gameBSYPT/css/login.css" rel="stylesheet" type="text/css" />

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
    					<td><img src="gameBSYPT/images/tcyx.png" id="login_out"/></td>
    					<td><a href="/Yqwan/gameBSYPT/server.jsp" target="_blank"><img src="gameBSYPT/images/dllb.png"/></a></td>
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
    				<marquee behavior="scroll" contenteditable="true" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="420" onmouseover="this.stop();" onmouseout="this.start();"> 
						欢迎加入官方宝石与爬塔玩家交流群498455409
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
