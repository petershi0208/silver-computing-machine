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
    <title>会员中心-微信扫码支付</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	 
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
		
	<!-- Bootstrap -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">
	
	
	
	
	
  </head>
  <body>
 		<input type="hidden" value="${codeurl }" id="uri"/>
		<input type="hidden" value="${trade_no }" id="trade_no"/>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="center">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="center_right">
			<div class="logo">
					<p>LOGO&nbsp收银台</p>
				</div>
				<div class="trade">
					<p>订单编号：${trade_no }</p>
					<p>订单描述：${body }</p>
					<h>应付金额：￥${totalfee}</h>
				</div>			
				<div class="wxpay">
					<img alt="logo" src="/Yqwan/newMemberCenter/images/wxlogo.png" width=120 height=30>
					<span class="ptext">亿万用户的选择，更快更安全</span>
					<span class="pmoney">支付<span style="color:red">${totalfee }</span>元</span>
				</div>
				<div id="qrcode" class="qrcode">
				</div>
<!-- 			<div class="qrcode" style="display:none" id="success">
					<img src="/Yqwan/newMemberCenter/images/oklogo.png" style="width:200px; height:200px;">
				</div> -->	
				<img alt="pic" src="/Yqwan/newMemberCenter/images/wxtext.png" class="pic" id="pic"/>
										
			<div class="center_right_recommendgame">
				<jsp:include page="memberFootGame.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>	
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	<link href="<%=request.getContextPath()%>/newMemberCenter/css/wxsaoma.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/newMemberCenter/js/qrcode.js"></script>
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/wxsaoma.js" type="text/javascript"></script>
	
	<script type="text/javascript">
 			var url=$('#uri').val();
		 	//这个地址是Demo.java生成的code_url,这个很关键
			//var url = "weixin:wxpay/bizpayurl?pr=FvDHhht";
			
			//参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
			var qr = qrcode(5, 'H');
			qr.addData(url);
			qr.make();
			var dom=document.createElement('DIV');
			dom.innerHTML = qr.createImgTag();
			var element=document.getElementById("qrcode");
			element.appendChild(dom);
 		</script>
</html>