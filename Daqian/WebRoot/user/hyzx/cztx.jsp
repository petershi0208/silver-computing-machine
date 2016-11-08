<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-充值提现</title>
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
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/user/hyzx/css/hyzx.css">
		<div style="height:auto; width:770px;margin-top:15px; margin-left:20px; float:left; ">
			<div style="height:610px; width:740px;  margin-left:20px; background-color:#FFFFFF">
				<div style="height:55px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;">
					<span class="hm20">充值提现</span>
				</div>
				<div style="height:30px;"></div>
				<div style="height:508px; width:668px;  margin:0 auto;">
					<div style="height:132px; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:2px #bbb solid;">
							<span class="hm14b">资产总额 <img src="<%=request.getContextPath()%>/user/hyzx/images/wenhao.png" style="margin-top:-5px;" /></span> 
							<span class="r22b">￥${residualmoney+rolemoney }</span>
						</div>
						<div style="height:92px; width:666px;">
							<div style="height:16px;"></div>
							<div class="bbb" style="height:60px; width:620px; margin:0 auto; text-align:center; text-align:left;">
								<div style="height:60px; width:240px; float:left; border-right:1px #bbb solid;">
									<div style="float:left;">
										<ul style="list-style:none;">
											<li class="g14">可用余额&nbsp<span class="r18b">￥${availablemoney }</span></li>
											<li style="margin-top:10px;">
											<span class="bhp7p15" onclick="javascript=window.location.href='<%=request.getContextPath()%>/user/hyzx/cz.jsp'">充值</span>
											<span class="blp7p15" onclick="javascript=window.location.href='<%=request.getContextPath()%>/user/hyzx/tixian.jsp'">提现</span></li>
										</ul>
									</div>
									<div style="float:left; line-height:75px; margin-left:10px; overflow:hidden;">
										
									</div>
								</div>
								<div style="height:60px; width:180px; float:left; border-right:1px #bbb solid; text-align:center">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">待收金额</li>
										<li class="h20">￥0.00</li>
									</ul>
								</div>
								<div style="height:60px; width:180px; float:left; text-align:center;">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">冻结金额</li>
										<li class="h20">￥0.00</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div style="height:30px;"></div>
					<div style="height:346px; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:1px #bbb solid;">
							<span class="hm14b">充值记录</span>
							<span>交易类型</span>
							<span class="bhp3p5">充值</span> 
							<span> 提现 发布时间 <input type="text" class="hg24" /> 到 <input type="text" class="hg24" /></span>
						</div>
						<div style="width:666px; height:32px; line-height:32px; background-color:#f3f3f3;">
							<ul class="ccc">
								<li class="w90">类型</li>
								<li class="w90">时间</li>
								<li class="w100">理财计划</li>
								<li class="w90">对方</li>
								<li class="w90">金额</li>
								<li class="w100">可用余额</li>
								<li class="w90">备注</li>
							</ul>
						</div>
						<div style="height:240px;"></div>
						<div style="height:216px; width:666px;">
							<div style=" width:260px;margin:0 auto;">共0条 首页 上一页 下一页 尾页 <input type="text" style="width:50px; " /></div>
						</div>
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