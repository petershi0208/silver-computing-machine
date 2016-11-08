<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>会员中心-手机绑定</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
    <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/cellphone.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/memberhead.css">
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="banner"></div>
	<div id="content">
		<div class="content_left">
			<jsp:include page="memberhead.jsp"></jsp:include>
			<div class="tell">
				<div class="top">
					<span  class="bdsj">绑定手机账号</span> &nbsp;|&nbsp; <span class="jbsj">解绑手机账号</span>
				</div>	
				<div class="tell5">
					<form action="/Yqwan/bindtelephone.do" method="post" id="form">
						<input type="hidden" value="${user.userid}" id="bind_userid" name="bind_userid">
						<p>填写您要绑定的手机号码，并进行验证：</p>
						<div class="yzfs"><input type="text" id="bind_telephone" name="bind_telephone"/> 
							<input name="send" id="send" value="发送验证码" style="cursor:pointer;width:130px;" type="button">
						</div>
						<p class="geshi">请输入正确的手机号码验证格式：</p>
						<div class="acone">
							<div><input type="text" placeholder="请填写您收到的短信验证码" id="bindcode"/>
								<span style="color:red" id="bindcodetext"></span>
							</div>
						</div>
						<div>
							<div class="qr5"><input value="确认" type="button" id="bindbtn"/></div>
							<div class="qx5" onclick="javascript:location.href='memberCenter/secure.jsp'">取消</div>
						</div>
					</div>	
				</form>
			</div>
		</div>
		<div class="content_right">
			<jsp:include page="memberright.jsp"></jsp:include>
		</div>
	</div>	
	<jsp:include page="../foot.jsp"></jsp:include>
	<script src="<%=request.getContextPath()%>/memberCenter/js/cellphone.js" type="text/javascript"></script>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>