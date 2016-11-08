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
    <title>会员中心-我的礼包</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">	
	<!-- Bootstrap -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">
	
	<link href="<%=request.getContextPath()%>/newMemberCenter/css/gift.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	
	<link href="<%=request.getContextPath()%>/newMemberCenter/page/page.css" rel="stylesheet" type="text/css">
		
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="center">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="center_right">
			<div class="center_right_info">
				<span>礼包记录</span>
				<img src="/Yqwan/newMemberCenter/images/hyxh.png" width=750/>
			</div>	
			<div class="center_right_detail">
				<div class="center_right_detail_head">
					<span>账号：</span>
					<span>${user.userid }</span>
					<span>最近共领取礼包数量：</span>
					<span id="rechargenumber">${list}个</span>
				</div>
				<div class="center_right_detail_list">
					<div class="center_right_detail_list_table">
						<table width=100%>
							<tr height=50>
									<td width=20%>礼包名</td>
									<td width=20%>游戏名字</td>
									<td width=20%>礼包码</td>
									<td width=20%>起始日期</td>
									<td width=20%>截止日期</td>
							</tr>
							<c:forEach items="${cdkeyinfopagelist}" var="a">
								<tr height=50>
									<td width=20%>${a.giftname }</td>
									<td width=20%>${a.gamename }</td>
									<td width=20%>${a.cdkey }</td>
									<td width=20%>${a.activationdate }</td>
									<td width=20%>${a.timelimit}</td>
								</tr>
							</c:forEach>						
						</table>
					</div>
					<div class="center_right_detail_list_page">
						<div class="pageTest"></div>
					</div>
				</div>
			</div>
			<div class="center_right_recommendgame">
				<jsp:include page="memberFootGame.jsp"></jsp:include>
			</div>			
		</div>
	</div>
	<jsp:include page="../foot.jsp"></jsp:include>	
	<input type="hidden" value="${maxnum }" id="maxnum"/>
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/gift.js" type="text/javascript"></script>
	<script type="text/javascript">
		var maxnum = $('#maxnum').val();
		maxnum = parseInt(maxnum);
	    $('.pageTest').page({
	      leng:maxnum,//分页总数
	      activeClass: 'activP' , //active 类样式定义
	    })
    </script>
  </body>	
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	
</html>