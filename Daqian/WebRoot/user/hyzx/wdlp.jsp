<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-我的礼品</title>
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
			<div style="height:800px; width:740px;  margin-left:20px; background-color:#FFFFFF">
				<div style="height:55px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;"><span>我的礼品</span></div>
				<div style="height:30px;"></div>
				<div style="height:508px; width:668px;  margin:0 auto;">
					<div style="height:132px; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:2px #bbb solid;">
							<img src="<%=request.getContextPath()%>/user/hyzx/images/444555666.png" />
							<span class="h20b">红包状态</span> <span class="h20">可用抵用卷</span><span class="r20">100元</span>
						</div>
						<div style="height:92px; width:666px;">
							<div style="height:16px;"></div>
							<div style="height:60px; width:620px; margin:0 auto; ">
								<div style="height:60px; width:150px; float:left; text-align:center; border-right:1px #bbb solid; margin-left:-30px;">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">未使用</li>
										<li class="h20">0个</li>
									</ul>
								</div>
								<div style="height:60px; width:150px; float:left; text-align:center; border-right:1px #bbb solid;">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">已使用</li>
										<li class="h20">0个</li>
									</ul>
								</div>
								<div style="height:60px; width:150px; float:left; text-align:center;">
									<ul style="list-style:none; margin-top:10px;">
										<li class="g14">已过期</li>
										<li class="h20">0个</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div style="height:30px;"></div>
					<div class="bbb" style="height:346px; width:740px; margin-left:-35px;">
						<div style="width:234px; height:184px; background-color:#d6b16d; float:left; margin-left:10px; margin-bottom:10px;">
							<ul style="color:#fff;">
								<li class="b50b">￥50</li>
								<li>使用条件：投资满5000即可</li>
								<li>有效时间:2个月</li>
								<li>卷号:014562154656254885</li>
								<li>备注：部分活动不能使用红包</li>
								<li>具体以页面说明为准</li>
							</ul>
						</div>
						<div style="width:234px; height:184px; background-color:#d6b16d; float:left; margin-left:10px; margin-bottom:10px;">
							<ul style="color:#fff;">
								<li class="b50b">￥50</li>
								<li>使用条件：投资满5000即可</li>
								<li>有效时间:2个月</li>
								<li>卷号:014562154656254885</li>
								<li>备注：部分活动不能使用红包</li>
								<li>具体以页面说明为准</li>
							</ul>
						</div>
						<div style="width:234px; height:184px; background-color:#d6b16d; float:left; margin-left:10px; margin-bottom:10px;">
							<ul style="color:#fff;">
								<li class="b50b">￥50</li>
								<li>使用条件：投资满5000即可</li>
								<li>有效时间:2个月</li>
								<li>卷号:014562154656254885</li>
								<li>备注：部分活动不能使用红包</li>
								<li>具体以页面说明为准</li>
							</ul>
						</div>
						<div style="width:234px; height:184px; background-color:#85cde9; float:left; margin-left:10px; margin-bottom:10px;">
							<ul style="color:#fff;">
								<li class="b50b">￥20</li>
								<li>使用条件：投资满2000即可</li>
								<li>有效时间:2个月</li>
								<li>卷号:014562154656254885</li>
								<li>备注：部分活动不能使用红包</li>
								<li>具体以页面说明为准</li>
							</ul>
						</div>
						<div style="width:234px; height:184px; background-color:#85cde9; float:left; margin-left:10px; margin-bottom:10px;">
							<ul style="color:#fff;">
								<li class="b50b">￥20</li>
								<li>使用条件：投资满2000即可</li>
								<li>有效时间:2个月</li>
								<li>卷号:014562154656254885</li>
								<li>备注：部分活动不能使用红包</li>
								<li>具体以页面说明为准</li>
							</ul>
						</div>
						<div style="width:234px; height:184px; background-color:#85cde9; float:left; margin-left:10px; margin-bottom:10px;">
							<ul style="color:#fff;">
								<li class="b50b">￥20</li>
								<li>使用条件：投资满2000即可</li>
								<li>有效时间:2个月</li>
								<li>卷号:014562154656254885</li>
								<li>备注：部分活动不能使用红包</li>
								<li>具体以页面说明为准</li>
							</ul>
						</div>
						<div style="height:20px; width:740px;"></div>
						<hr style="border:1px #bbb dotted; width:740px;" />
						备注：<br />
						1、该红包为投资抵用券，该投资抵用券不能投资新手标。只能投资其他理财计划。<br />				
							不同券适用不同理财计划。<br />
						2、5元需投资500元，10元需投资1,000元，20元需投资2,000 元，50元券需投资 5,000元。<br />
						   5，10元券不适用于期限为周理财产品；20元券不适用于期限为周，月的理财产品；50元券<br />
						   不适用于期限为周，月，3个月的理财产品。<br />
						3、投资抵用券可冲抵现金，如果输入投资5000元，选择投资抵用券50元，<br />
						   则实际投资 4950 元，投资抵用券能产生收益，和投资现金完全一样
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