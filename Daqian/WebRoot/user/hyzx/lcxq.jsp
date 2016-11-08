<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-理财详情</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/images/jquery-1.7.1.min.js"></script>
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
		<style type="text/css">
			ul li{margin-bottom:5px;}
		</style>
		<div style="height:auto; width:770px;margin-top:15px; margin-left:20px; float:left; ">
			<div style="height:610px; width:740px;  margin-left:20px; background-color:#FFFFFF">
				<div style="height:55px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;">
					<span class="hm20">我的理财</span>
				</div>
				<div style="height:30px;"></div>
				<div style="height:508px; width:668px;  margin:0 auto;">
					<div style="height:132px; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:2px #bbb solid;">
							<span class="hm14b">已赚金额 <img src="<%=request.getContextPath()%>/user/hyzx/images/wenhao.png" style="margin-top:-5px;" /></span>  <span class="rm22">¥ 0.00</span>
						</div>
						<div style="height:92px; width:666px;">
							<div style="height:16px;"></div>
							<div style="height:60px; width:620px; margin:0 auto; text-align:center; text-align:left;">
								<div style="height:60px; width:117px; float:left; border-right:1px #bbb solid;">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">持有中的数量</li>
										<li class="h20">0个</li>
									</ul>
								</div>
								<div style="height:60px; width:130px; float:left; text-align:left; margin-left:40px;">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">已退出的数量</li>
										<li class="h20">0个</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div style="height:30px;"></div>
					<div style="height:346px; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="width:666px; height:40px; line-height:40px; border-bottom:1px #bbb solid;">
							<span class="hm14b">交易类型</span>
							<span class="bhp3p5">持有的产品</span>
							<span>退出的产品</span>
						</div>
						<div style="width:666px; height:32px; line-height:32px; background-color:#f3f3f3; overflow:hidden;">
							<ul class="ccc">
								<li class="w110">计划名称</li>
								<li class="w100">加入金额</li>
								<li class="w120">加入时间</li>
								<li class="w120">到期时间</li>
								<li class="w110">已获收益</li>
								<li class="w100">状态</li>
							</ul> 
						</div>
						<div style="height:195px;"></div>
						<div style="width:666px;">
							<div style=" width:260px;margin:0 auto;">共0条 首页 上一页 下一页 尾页 <input type="text" style="width:50px;" /></div>
						</div>
						<div style="width:626px; height:55px; line-height:55px; margin:0 auto; background-color:#f3f3f3;">
							<div class="hm14">持有中的金额：0.00元</div>
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