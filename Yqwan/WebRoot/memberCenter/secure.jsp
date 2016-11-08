<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>安全中心</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/memberCenter/js/security.js" type="text/javascript"></script>
	 <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">   
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/secure.css">
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="banner"></div>
	<div id="content">
		<div class="content_right">
			<jsp:include page="memberright.jsp"></jsp:include>
		</div>
		<div class="content_left">
			<jsp:include page="memberhead.jsp"></jsp:include>
			<div class="secure">
				<div class="top">
					<img src="../memberCenter/images/member/landian.png" height="7" width="7" />
					安全中心
					
				</div>
				<div class="centre">
					<div>
						<img src="../memberCenter/images/member/youxiang.png" width="67" height="67" />
						<span><a id="secure_addemail">邮箱绑定</a></span>
						<span><a id="secure_modifyemail">修改邮箱</a></span>
					</div>
				</div>
				<div class="centre">
					<div>
						<img src="../memberCenter/images/member/iconfont-bangdingshoujiicon.png" width="67" height="67" />
						<span><a id="secure_telephonebind">手机绑定</a></span>
						<span><a id="secure_telephone">解绑手机</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>