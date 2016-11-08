<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>会员中心-实名认证</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/memberCenter/js/realname.js" type="text/javascript"></script>
	
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/realname.css">
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
			<div class="content">
				<div class="top">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/landian.png" height="7" width="7" />
					实名认证
				</div>
				<div class="center">
					<form action="/Yqwan/realname.do" method="post" id="form">
						<input type="hidden" value="${user.userid}" name="userid">
						<div id="yesrealname" style="display:none">
							<div class="center_div">
								<span>账户名：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
								<input readonly="readonly" value="${user.userid }"/>
							</div>						
							<div class="center_div">
								<span>真实姓名：&nbsp&nbsp&nbsp</span>
								<input readonly="readonly" value="${user.realname}" id="realnamehidden"/>
							</div>
							<div class="center_div">
								<span>身份证号码：</span>
								<input realname="readonly" value="${user.idcard}" id="idcardhidden"/>
							</div>
						</div>
						
						<div id="notrealname">
							<div class="center_div">
								<span>账户名：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
								<input readonly="readonly" value="${user.userid }"/>
							</div>						
							<div class="center_div">
								<span>真实姓名：&nbsp&nbsp&nbsp</span>
								<input type="text" id="realname" name="realname"/>
								<span id="nametext"></span>
							</div>
							<div class="center_div">
								<span>身份证号码：</span>
								<input type="text" id="idcard" name="idcard" title=""/>
								<span id="idcardtext"></span>
							</div>
						</div>
						<div class="center_confirm" id="center_confirm">
							<input type="button" value="确认" id="confirm"/>
							<input type="button" value="取消" onclick="javascript:window.location.href='/Yqwan/memberCenter/account.jsp';"/>
						</div>
					</form>
					<div class="center_text" id="center_text">
						<span>友情提示：请认真填写个人身份信息，将作为</span>
						<span>游戏中领取的身份验证资料：请不要随意填写</span>
						<span>以保证您的账号的所有权利不受侵害和影响</span>
					</div>
				</div>				
			</div>
		</div>
	</div>
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>