<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    <link rel="shortcut icon" href="http://static.86joy.com/game/xs/images/favicon.ico" type="image/x-icon">
     <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=request.getContextPath()%>/gameXSQST/scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />
	
	
	<link href="<%=request.getContextPath()%>/gameXSQST/css/login.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div class="main">
    	<div class="h40"></div>
    	<div class="mainleft">
    		<div class="lgtxt">登录游戏</div>
    		<div class="wlg" id="login_no">
	    		<div class="ac">账&nbsp;&nbsp;&nbsp;号：<input type="text" placeholder="请输入用户名" id="username"/><br/><span style="padding-left:85px;color:red;font-size:12px;" id="usernametext"></span></div>
	    		<div class="pw">密&nbsp;&nbsp;&nbsp;码：<input type="password" placeholder="请输入密码" id="password"/><br/><span style="padding-left:85px;color:red;font-size:12px;" id="passwordtext"></span></div>
	    		<div class="yz">验证码：<input type="text" placeholder="验证码" id="code"/>
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
    					<td width="92" id="login_nickname">${user.nickname}</td>
    					<td><img src="gameXSQST/images/tui.png" id="login_out"/></td>
    				</tr>
    				<tr>
    					<td width="140" align="right" class="z22">最近登录服：</td>
    					<td width="92" id="login_recent">S5 月之港口</td>
    					<input type="hidden" id="login_recentserverid"/>
    					<td></td>
    				</tr>
    				<tr>
    					<td width="140" align="right" class="z22">推荐服务器：</td>
    					<td width="92" id="login_recomend"></td>
    					<input type="hidden" id="login_recommendserverid"/>
    					<td></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td align="right" class="gd"><a href="/Yqwan/gameXSQST/server.jsp" target="_blank">更多</a></td>
    					<td></td>
    				</tr>
    			</table>
    			<div class="login" id="startgame"></div>
    		</div>
    	</div>
    	<div class="mainright"></div>
    	<div></div>
    	<div></div>
    	<div></div>
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
