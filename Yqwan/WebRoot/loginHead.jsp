<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/loginHead/loginhead.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/loginHead/loginhead.js" ></script>
		<meta http-equiv="X-UA-Compatible" content="IE=10">
	</head>
  
	<body>
    	<div class="login_header">
	    	<div class="login_head">
	    		<input type="hidden" value="${user.userid}" id="userid">
	    		<a href="index.jsp"><img src="loginHead/yiqiwanguajilogo.png"/></a>
	    		<div class="login_headtext" id="notloginhead">
	    			<span><a href="login.jsp">登录</a></span>
	    			<span>|</span>
	    			<span><a href="registOne.jsp">注册</a></span>
	    		</div>
	    		<div class="login_headtext" id="loginhead">
	    			<span>您好</span>
	    			<span>,</span>
	    			<span><a href="memberCenter/member.jsp">${user.nickname}</a></span>
	    		</div>
	    	</div>
	    	<div class="loginopcity"></div>
	    </div>
	</body>
</html>
