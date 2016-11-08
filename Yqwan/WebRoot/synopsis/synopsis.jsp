<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>关于我们-199y游戏</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="关于我们,199y游戏">
	<meta name="description" content="199y游戏关于我们">
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
	<div class="syncontent">
		<div class="synleft">
			<jsp:include page="left.jsp"></jsp:include>
		</div>
		<div class="synright">
			<div class="toup"><img src="<%=request.getContextPath()%>/synopsis/images/2.jpg"/></div>
			<p class="ptitle">关于我们</p>
			<div class="gcon">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;17挂机游戏网一直秉承着服务用户、快乐至上的发展理念，致力提供最丰富、最优先的游戏内容。努力成为一个涵盖小游戏、网页游戏、手机
				游戏、游戏资讯等多个领域的综合性休闲游戏平台。目前，我们慢慢发展新用户，并且这些数据，每天都在以令人惊喜的速度不断刷新。
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用者将本网站提供的内容与服务用于非商业用途、非盈利、非广告目的而纯作个人消费时，应遵守著作权法以及其他相关法律的规定，不
					得侵犯17玩挂机网站及／或相关权利人的权利。
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 公司文化：17挂机游戏网主张快乐工作、快乐生活、快乐成长的企业文化。为员工提供轻松快乐的工作环境，关心着每一个员工的生活，并关
					注每一个员工的成长和发展，我们努力将公司建设为一个能让员工感受最贴心关怀的温暖大家庭。
				<br/>公司介绍：公司全称上海壹火网络科技有限公司，位于上海市宝山区。
				<br/>企业愿景：打造国内最大的休闲游戏平台。随着手机游戏、网页游戏等新业务的开展，我们离目标也越来越近。年轻而富有激情的我们，不断
					努力地追赶着心中的理想，我们相信，就在不久的将来，我们愿望必定会成实现！
				<br/><br/>
					维护权益官方联系电话：021-60828377
			</div>
		</div>
	</div>
	<jsp:include page="../foot.jsp"></jsp:include>
 <script src="<%=request.getContextPath()%>/synopsis/js/synopsis.js" type="text/javascript"></script>
  </body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/synopsis/css/synopsis.css">
</html>