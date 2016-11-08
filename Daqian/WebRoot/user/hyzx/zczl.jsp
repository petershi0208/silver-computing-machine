<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-资产总览</title>
	<link rel="shortcut icon" href="/Daqian/image/5987.ico">
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/prototype-1.6.0.3.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/jquery-1.7.1.min.js"></script>	
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
<input id="username" style="display:none" value="${username }"/>

<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>

<!------------------------------------------------------右侧图标--------------------------------------------->
	<jsp:include page="right.jsp"></jsp:include>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>

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
		<div style="height:auto; margin-top:15px; margin-left:20px; float:left; width:770px;">
			<div style="height:146px; width:770px; background-color:#FFFFFF;">
				<div style="float:left; width:140px; height:146px;">
					<img src="<%=request.getContextPath()%>/user/hyzx/images/ty-1.png" />
				</div>
				<div style="float:left; width:620px; height:146px;">
					<div style="height:40px; line-height:40px;">
						<span class="h20">${username}</span>
						<span class="g914">欢迎你！</span> 
						<span class="g914">上次登录IP:${localip }</span> 
						<span class="g914">上次登录时间:${logintime }</span>
					</div>
					<div style="height:30px; text-align:center; line-height:25px;">
						<div class="left">
							<span class="left">安全等级</span>
							<span class="aq">
								<span class="aqjd"></span>
							</span>
						</div>
						<span class="left bhp1p15" onclick="javascript=window.location.href='<%=request.getContextPath()%>/user/hyzx/cz.jsp'">充值</span>
						<span class="left blp1p15" onclick="javascript=window.location.href='<%=request.getContextPath()%>/user/hyzx/tixian.jsp'">提现</span>
					</div>
					<div class="ccc" style="width:600px; height:25px; line-height:25px; overflow:hidden; border:1px #FF6600 solid;">
						<ul>
							<li class="w160" style="width:auto;min-width:160px;"> <img src="<%=request.getContextPath()%>/user/hyzx/images/xz-9.png" style="margin-top:-4px;"/> 账户余额：${residualmoney}元</li>
							<li class="w130" style="width:auto;min-width:130px">可用金额：${availablemoney}元</li>
							<li class="w100"> <img src="<%=request.getContextPath()%>/user/hyzx/images/65647777778.png" style="margin-top:-4px;" /> 你好</li>
							<li class="w100">抵用卷<span class="y18b">6</span>张</li>
						</ul>
					</div>
					<div class="ddd" style="width:620px; height:50px; line-height:50px;">
						<ul>
							<li class="w80">账户预览:</li>
							<li class="w90 g914"><img src="<%=request.getContextPath()%>/user/hyzx/images/777777.png" style="margin-top:-3px;" /> 手机认证</li>
							<li class="w90 g914"><img src="<%=request.getContextPath()%>/user/hyzx/images/777777.png" style="margin-top:-3px;" /> 邮箱认证</li>
							<li class="w90 g914"><img src="<%=request.getContextPath()%>/user/hyzx/images/777777.png" style="margin-top:-3px;" /> 实名认证</li>
						</ul>
					</div>
				</div>
			</div>
			<div style="height:20px;"></div>
			<div style="height:440px; width:770px; border:1px #ddd solid; background-color:#FFFFFF;">
				<div style="width:740px; height:66px; line-height:60px; border-bottom:1px #ddd solid;">
					<span class="hm20">账户详情</span>
				</div>
				<div style="height:30px;"></div>
				<div style="height:350px; width:688px; margin:0 auto;">
					<div style="width:688px; height:50px; line-height:60px; overflow:hidden;">
						<ul class="ccc">
							<li class="w170">账户净资产</li>
							<li class="w170" id="manage1">理财资产</li>
							<li class="w170" id="borrow1">借款负债</li>
							<li class="w170">账户余额</li>
						</ul>
					</div>
					<div style="width:688px; height:50px; line-height:30px; border-bottom:1px #ddd solid;">
						<ul class="ccc" style="margin-left:8px;" >
							<li class="w150"><span class="h20">${rolemoney+residualmoney}</span>元</li>
							<li class="w20"><span style="font-size:25px;font-weight:bold;color:#555;">=</span></li>
							<li class="w150"><span class="h20">${rolemoney }</span>元</li>
							<li class="w20"><span style="font-size:25px;font-weight:bold;color:#555;">+</span></li>
					<!-- 	<li class="w150 r14"><span class="r20">${rolemoney }</span>元</li>
							<li class="w20	">+</li>
					 -->
							<li class="w150"><span class="h20">${residualmoney}</span>元</li>
						</ul>
						    
					</div>
					
				<div id="manage">
					<div style="height:55px; width:688px; line-height:55px; border-bottom:1px #ddd solid;">
							<span class="r14">理财账户</span>
							
					</div>
					<div  style="margin-top:10px;">
						<table width="688px" border="0px" cellpadding="0px" cellspacing="10px">	
							<thead>					
								<tr style="font-size:20px;">
									<td>理财产品</td>
									<td>持有资产(元)</td>
									<td>预期收益(元)</td>
									<td>预期年化率(%)</td>
									<td>购买时间</td>
								</tr>
								
							</thead>
							<tbody id="managebody">
							</tbody>
						</table>
						<div id="pagesize" style="width:160px;margin:0px auto;">
							<input id="last" type="button" value="上一页"/>
							<input id="page" readonly="readonly" value="1" style="width:20px;border-style:none;"/>/${total}
							<input id="next" type="button" value="下一页"/>
							<input id="maxpage" type="hidden" value="${total }"/>
						</div>
					</div>
					<div style="color:9b9b9b;text-align:center; margin-top:10px;display:none;" id="managerecord">没有理财记录</div>
				</div>	
					
				<div id="borrow">	
					<div style="height:55px; width:688px; line-height:55px; border-bottom:1px #ddd solid;">
						<span class="r14">借款账户</span>
	
					</div>
					<div  style="margin-top:20px;">
						<table width="688px" border="0px" cellpadding="0px" cellspacing="10px">	
							<thead>					
								<tr>
									<td>产品名称</td>
									<td>待还本金</td>
									<td>返还利息</td>
									<td>执行状态</td>
								</tr>
							
							</thead>
							<tbody id="borrowbody">
							</tbody>
						</table>
					</div>
					<div style="color:9b9b9b;text-align:center; margin-top:10px;" id="borrowrecord">没有借款记录</div>
				</div>	
				
					
	<!--  				<div style="height:44px; width:688px; line-height:44px; border-bottom:1px #ddd solid;">
						<ul class="ddd">
							<li class="w130">理财产品</li>
							<li class="w130">持有资产</li>
							<li class="w130">已赚额金</li>
							<li class="w140">预期年率化</li>
							<li class="w120">持有数量</li>
						</ul>
					</div>
					<div style="height:44px; width:688px; line-height:44px; text-align:center; border-bottom:1px #ddd solid;">
						<span class="g914">没有理财记录</span>
					</div>
					<div style="height:55px; width:688px; line-height:55px; border-bottom:1px #ddd solid;">
						<span class="r14">借款账户</span>
						<span class="lm40">待还总金额</span> 
						<span class="r20">0.00</span> 
						<span class="r14">元</span>
					</div>
					<div style="height:44px; width:688px; line-height:44px; border-bottom:1px #ddd solid;">
						<ul class="ddd">
							<li class="w160">产品名称</li>
							<li class="w150">待还本金</li>
							<li class="w150">返还利息</li>
							<li class="w150">执行状态</li>
						</ul>
					</div>
	-->				
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


</body>

	
</html>
<!--[if lte IE 6]>
<script src="js/phone/PNG.js" type="text/javascript"></script>
<script>
        if( typeof(PNG) == 'object') PNG.fix('.png');
    </script>
<![endif]-->