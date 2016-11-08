<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-消息设置</title>

	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/zczl.js"></script>		
		
		<script type="text/javascript">
		
		function disBlock(id){
			document.getElementById(id).style.display='block';
		}
		
		function disNone(id){
			document.getElementById(id).style.display='none';
		}
	</script>
	<link href="<%=request.getContextPath()%>/user/hyzx/css/head.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/user/hyzx/css/foot.css" rel="stylesheet" type="text/css">
	</head>
<body>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
<div style="height:1200px;">
<!------------------------------------------------------右侧图标--------------------------------------------->
	<jsp:include page="right.jsp"></jsp:include>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden" />
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
<!---------------------------------------------------------------左侧结束----------------------------------------------------------------------->
<!---------------------------------------------------------------右侧开始----------------------------------------------------------------------->
	 <link rel="stylesheet" type="text/css" href="css/hyzx.css">
		<div style="height:auto; width:770px;margin-top:15px; margin-left:20px; float:left; ">
			<div style="height:610px; width:740px;  margin-left:20px; background-color:#FFFFFF">
				<div style="height:55px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;">
					<span class="hm20">选择通知方式</span>
				</div>
				<div style="height:508px; width:740px;">
					<div style="width:740; height:20px;"></div>
					<div style="width:740; height:50px; margin-left:20px;">
						<span style="margin-right:40px;">站内信通知（免费） </span>
						<input type="checkbox" value="1" />注册成功
						<input type="checkbox" value="2" />充值成功
						<input type="checkbox" value="3" />冻结成功
						<input type="checkbox" value="4" />投资成功
						<input type="checkbox" value="5" />回款成功
						<input type="checkbox" value="6" />提现成功
					</div>
					<div style="width:740; height:50px; margin-left:20px;">
						<span style="margin-right:54px;">短信通知（免费） </span>
						<input type="checkbox" value="1" />注册成功
						<input type="checkbox" value="2" />充值成功
						<input type="checkbox" value="4" />投资成功
						<input type="checkbox" value="5" />回款成功
						<input type="checkbox" value="6" />提现成功
					</div>
					<div style="width:60px; height:24px; line-height:24px; text-align:center; margin:50px auto; background-color:#ee8f00; color:#FFFFFF;">确定</div>
					<div style="width:740px; height:38px; line-height:38px; background-color:#f3f3f3;">
						<img src="<%=request.getContextPath()%>/user/hyzx/images/565987.png" />温馨提示：尊敬的用户您在大钱财富的相关操作，我们将用以上两种方式通知您，请您选择合适自己的方式！
					</div>
				</div>
			</div>
		</div>
<!---------------------------------------------------------------右侧结束----------------------------------------------------------------------->
	</div>
</div>
<!---------------------------------------------------------------正文结束----------------------------------------------------------------------->	



<!--------------------------------------------------底部开始--------------------------------------------->
<!-- WPA Button Begin 
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAwMDY3MV8yNzE5NThfNDAwODIwMzI4OF8"></script>
 WPA Button End -->


<jsp:include page="../foot.jsp"></jsp:include>

<!--------------------------------------------------底部开始--------------------------------------------->

	</div>
</body>
</html>
<!--[if lte IE 6]>
<script src="js/phone/PNG.js" type="text/javascript"></script>
<script>
        if( typeof(PNG) == 'object') PNG.fix('.png');
    </script>
<![endif]-->
