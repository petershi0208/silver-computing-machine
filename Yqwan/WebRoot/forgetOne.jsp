<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>重置密码step1-199y游戏</title> 
   		<meta name="description" content="199y重置密码step1">
   		<meta name="keywords" content="重置密码,199y重置密码,重置">
   		<meta http-equiv="X-UA-Compatible" content="IE=10"> 
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/forget/forget1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/forget/forget.css"/>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"></jsp:include>
    	<div class="forgetbanner"></div>
    	<div class="center">
			<div class="center_logo">
				<ul>
					<li>输入手机号</li>
					<li>重置密码</li>
					<li>完成</li>
				</ul>
			</div>
			<form action="/Yqwan/forgetone.do" method="post" id="form">
				<div class="center_user">
					<span>手机号:</span>
					<input type="text" placeholder="请输入手机号" id="telephone" name="telephone">
					<span id="telephonetext"></span>
				</div>
				
				<div class="center_bottom">
					<input type="button" value="下一步 " id="button"/>
				</div>
			</form>
		</div>
    	
    	
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
