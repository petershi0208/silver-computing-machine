<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML5>
<html>
  <head>
    <title>会员中心-修改资料</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	 
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
		
	<!-- Bootstrap -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">
	
	
	
	
	
  </head>
  <body class="updateinform">
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="center">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="center_right">
			<div class="center_right_info">
				<span>基本信息</span>
				<img src="/Yqwan/newMemberCenter/images/hyxh.png" width=750/>
			</div>			
				<div class="center_right_detail">	
				<form action="/Yqwan/memberinformation.do" method="post" id="form">		
					<table height=100% class="table">
						<tr>
							<td width=100 height=50>昵称：</td>
							<td>${user.nickname }</td>
						</tr>
						<tr>
							<td>上次登录时间：</td>
							<td>${user.logindate}</td>
						</tr>
						<tr>
							<td>电子邮件：</td>
							<td><input id="email" name="email" type="email" value="${user.email }"/></td>
						</tr>
						<tr>
							<td>QQ：</td>
							<td><input id="qq" name="qq" type="text" value="${user.qq}"/></td>
						</tr>
						<tr>
							<td>性别：</td>
							<td><input type="radio" name="sex" value="男" checked="checked"/>男
									<input type="radio" name="sex" value="女" />女</td>
						</tr>
						<tr>
							<td>地址：</td>
							<td>
								<select name="province" id="province">
									</select>
									<select name="city" id="city">
									</select>
									<select name="county" id="county">
								</select>	
								<input type="text" class="address" id="address" name="address" />			
							</td>
						</tr>
					</table>
				</div>
				<div class="center_right_infobutton" style="margin-top:400px;"><input id="informationbutton" type="button" value="保存我的信息"/></div>
			</form>
			
			
			<div class="center_right_recommendgame">
				<jsp:include page="memberFootGame.jsp"></jsp:include>
			</div>
			
		</div>
	</div>
	
	
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>	
 	<script src="<%=request.getContextPath()%>/memberCenter/js/area.js" type="text/javascript"></script>
	<script language="javascript">setup()</script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	<link href="<%=request.getContextPath()%>/newMemberCenter/css/member.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/updateInformation.js" type="text/javascript"></script>
</html>