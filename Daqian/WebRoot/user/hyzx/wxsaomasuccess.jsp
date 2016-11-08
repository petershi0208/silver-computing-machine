<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-充值</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/jquery-1.7.1.min.js"></script>
		
		
	<link href="<%=request.getContextPath()%>/user/hyzx/css/head.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/user/hyzx/css/foot.css" rel="stylesheet" type="text/css">
	
	<link href="<%=request.getContextPath()%>/user/hyzx/css/security.css" rel="stylesheet" type="text/css">
	
	</head>

<body>
<input id="realname" value="${realname}" type="hidden"/>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
<div>
<!------------------------------------------------------右侧图标--------------------------------------------->
	<jsp:include page="right.jsp"></jsp:include>
	<!--------------------------------------------------头部开始--------------------------------------------->
	<div style="width:100%; margin:0;">
	<center>
		<jsp:include page="../header.jsp"></jsp:include>
	</center>
	</div>

<!---------------------------------------------------------------头部结束----------------------------------------------------------------------->
<!-----------------------------------------------------------------间隔------------------------------------------------------------------------->
	<div class="head_pojoDiv_05" style=" height:140px;"></div>
<!-----------------------------------------------------------------间隔------------------------------------------------------------------------->
<!---------------------------------------------------------------正文开始----------------------------------------------------------------------->
<div class="div_one_stratum">
	<div class="usercenter_navigationDiv_one">
<!---------------------------------------------------------------左侧开始----------------------------------------------------------------------->
	<jsp:include page="hyzxleft.jsp"></jsp:include>		
	 	<link rel="stylesheet" type="text/css" href="/Daqian/user/hyzx/css/hyzx.css">
		<div style="height:auto; width:770px;margin-top:15px; margin-left:20px; float:left; overflow:hidden;">
			<div style="height:466px; width:740px;  margin-left:20px; background-color:#FFFFFF">
				
				<div class="logo">
					<p>LOGO&nbsp收银台</p>
				</div>		
				<div class="wxpay">
					<img alt="logo" src="/Daqian/user/hyzx/images/wxlogo.png">
					<span class="ptext">亿万用户的选择，更快更安全</span>
				</div>
				<div class="qrcode" id="success">
					<img alt="logo" src="/Daqian/user/hyzx/images/oklogo.png" style="width:250px;height:250px;margin-left:-50px;">
				</div>
			</div>
		<input type="hidden" value="${codeurl }" id="uri"/>
		<input type="hidden" value="${trade_no }" id="trade_no"/>
	</div>
</div>



<jsp:include page="../foot.jsp"></jsp:include>

	</div>
</body>
		
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/security.js"></script>
 		
</html>

