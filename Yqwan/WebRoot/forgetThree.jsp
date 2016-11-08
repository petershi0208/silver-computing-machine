<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>重置密码step3-199y游戏</title> 
   		<meta name="description" content="199y重置密码step3">
   		<meta name="keywords" content="重置密码,199y重置密码,重置">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/forget/forget.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/forget/forget3.js" ></script>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"></jsp:include>
    	<div class="forgetbanner"></div>
    	<div class="center">
			<div class="three_center_logo">
				<ul>
					<li>输入账号</li>
					<li>重置密码</li>
					<li>完成</li>
				</ul>
			</div>
			<div class="three_center_text">
				<img src="regist/duihao.png">
				<span>恭喜您,修改密码成功!</span>
				<span>
					<span id="eight">8</span>
					<span>&nbsp秒后自动跳转</span>
					<span>|</span>
					<span><a href="login.jsp">手动跳转</a></span>
				</span>
			</div>
		</div>
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
