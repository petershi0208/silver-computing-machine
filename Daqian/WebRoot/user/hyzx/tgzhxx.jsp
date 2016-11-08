<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-托管账户信息</title>
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
					<span class="hm20">开通第三方资金托管账户</span>
				</div>
				<div style="height:30px;"></div>
				<div style="height:340px; width:620px; margin:0 auto;">
					<div style="width:260px; height:130px; float:left; border:1px #bbb solid; margin-left:30px; margin-bottom:30px; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="width:260px; height:94px; border-bottom:1px #bbb solid; background:url(images/jxjh-2.png) no-repeat center;"></div>
						<div style="width:260px; height:35px; line-height:35px; text-align:center;">创建托管账户</div>
					</div>
					<div style="width:260px; height:130px; float:left; border:1px #bbb solid; margin-left:30px; margin-bottom:30px; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="width:260px; height:94px; border-bottom:1px #bbb solid; background:url(images/jxjh-2.png) no-repeat center;"></div>
						<div style="width:260px; height:35px; line-height:35px; text-align:center;">创建托管账户</div>
					</div>
					<div style="width:260px; height:130px; float:left; border:1px #bbb solid; margin-left:30px; margin-bottom:30px; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="width:260px; height:94px; border-bottom:1px #bbb solid; background:url(images/jxjh-2.png) no-repeat center;"></div>
						<div style="width:260px; height:35px; line-height:35px; text-align:center;">创建托管账户</div>
					</div>
					<div style="width:260px; height:130px; float:left; border:1px #bbb solid; margin-left:30px; margin-bottom:30px; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="width:260px; height:94px; border-bottom:1px #bbb solid; background:url(images/jxjh-2.png) no-repeat center;"></div>
						<div style="width:260px; height:35px; line-height:35px; text-align:center;">创建托管账户</div>
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