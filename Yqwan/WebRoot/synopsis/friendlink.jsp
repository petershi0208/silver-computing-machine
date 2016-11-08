<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>友情链接-199y游戏</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="友情链接,199y游戏">
	<meta name="description" content="199y游戏友情链接">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap-theme.css">

<script src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" type="text/javascript"></script>
<style type="text/css">

</style>

</head>

<body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="synopsisbanner"></div>
	<div class="fricontent">
		<div class="synleft">
			<jsp:include page="left.jsp"></jsp:include>
		</div>
		<div class="friright">
			<div class="toulc"><span>友情链接</span></div>
			<div class="linka">
				<a href="http://www.bushuaka.com/" target="_blank"><img src="<%=request.getContextPath()%>/synopsis/images/youlian1.jpg" /></a>
				<a href="http://www.u77.com/" target="_blank"><img src="<%=request.getContextPath()%>/synopsis/images/youlian2.jpg" /></a>
				<a href="http://www.bushuaka.com/" target="_blank"><img src="<%=request.getContextPath()%>/synopsis/images/youlian1.jpg" /></a>
				<a href="http://www.u77.com/" target="_blank"><img src="<%=request.getContextPath()%>/synopsis/images/youlian2.jpg" /></a>
				<a href="http://www.bushuaka.com/" target="_blank"><img src="<%=request.getContextPath()%>/synopsis/images/youlian1.jpg" /></a>
				<a href="http://www.u77.com/" target="_blank"><img src="<%=request.getContextPath()%>/synopsis/images/youlian2.jpg" /></a>
			</div>
		</div>
	</div>
	
	<jsp:include page="../foot.jsp"></jsp:include>
 <script src="<%=request.getContextPath()%>/synopsis/js/synopsis.js" type="text/javascript"></script>
  </body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/synopsis/css/synopsis.css">
</html>