<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
   		<title>会员中心-head</title>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/memberCenter/css/memberhead.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/memberCenter/js/memberhead.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/memberCenter/js/loginornot.js" ></script>
	</head>
  
	<body>
    	<ul class="nav" id="memberhead">
			<li>首页</li>
			<li>账号中心</li>
			<li>安全中心</li>
			<li>充值中心</li>
		</ul>
	</body>
</html>
