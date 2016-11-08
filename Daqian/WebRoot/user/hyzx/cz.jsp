<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-充值</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/jquery-1.7.1.min.js"></script>
		
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
<!---------------------------------------------------------------左侧结束----------------------------------------------------------------------->
<!---------------------------------------------------------------右侧开始----------------------------------------------------------------------->
	 	<link rel="stylesheet" type="text/css" href="css/hyzx.css">
		<div style="height:auto; width:770px;margin-top:15px; margin-left:20px; float:left; overflow:hidden;">
			<div style="height:auto; width:740px;  margin-left:20px; background-color:#FFFFFF">
				<div style="height:55px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;">
					<span class="hm20">充值提现</span>
				</div>
				<div style="height:30px;"></div>
				<div style="height:auto; width:668px;  margin:0 auto;">
					<div style="height:132px; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:2px #bbb solid;">
							<span class="hm14b">资产总额 <img src="images/wenhao.png" style="margin-top:-5px;" /></span> 
							<span class="r22b">￥${rolemoney+residualmoney}</span>
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
				<form action="/Daqian/alipay.do" method="post" target="_blank">
					<div style="height:auto; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;  overflow:hidden;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:1px #bbb solid;">
							<span class="hm14b">我要充值</span>	<span class="hm14b" style="float:right">提现记录</span>
						</div>
						<div style="width:666px; height:32px; line-height:32px; background-color:#f3f3f3;"></div>
						<div style="height:auto; width:666px; overflow:hidden;">
							<div style="margin-left:10px; margin-top:38px; float:left;">选择银行:</div>
							<style>
								.yh{padding:8px 60px;border:1px #f3f3f3 solid;}
								.yyy{ margin-left:40px; margin-top:30px; height:auto; width:580px; overflow:hidden;}
								.yyy div{float:left; height:30px; margin-right:10px; margin-top:10px;}
							</style>
							<div class="yyy">
								<div><input type="radio" name="a" value="ABC" checked="checked"/><span class="yh" style="background:url(images/bank/abc.bmp) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="BOCB2C"/><span class="yh" style="background:url(images/bank/bc.bmp) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="COMM"/><span class="yh" style="background:url(images/bank/bcc.bmp) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="CCB"/><span class="yh" style="background:url(images/bank/ccb.bmp) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="CMB"/><span class="yh" style="background:url(images/bank/cmb.bmp) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="CMBC"/><span class="yh" style="background:url(images/bank/cmbc.bmp) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="ICBCB2C"/><span class="yh" style="background:url(images/bank/icbc.bmp) no-repeat center"></span></div>
							
							</div>
							<div style="margin-left:10px; margin-top:38px; float:left;">其他支付:</div>
							<div class="yyy">
								<div><input type="radio" name="a" value="weixin"/><span class="yh" style="background:url(images/bank/wx.png) no-repeat center"></span></div>
								<div><input type="radio" name="a" value="alipay"/><span class="yh" style="background:url(images/bank/zfb.png) no-repeat center"></span></div>
							</div>
						</div>
						<div class="yinhang">
							<h4>工商银行限额</h4><br/>
							<p>未认证的网上银行口令卡:单笔交易限额500元,单日交易限额1000元;</p>
							<p>手机短信认证网上银行口令卡:单笔交易限额2000元,单日交易限额5000元;</p>
							<p>USBKey（U盾）:单笔交易限额100万元,单日交易限额100万元;</p>	
						</div>
						<div style=" height:200px; width:646px; margin:20px auto;">
							<div style="margin-left:80px;">
								<p>充值金额：<input type="text" class="w180" style="height:30px;" name="totalmoney" id="money"/>
									<span style="color:red;" id="moneytext"></span>
								</p><br /><br />
								<p>验证码：&nbsp&nbsp <input type="text" class="w100" style="height:30px;" id="code"/>
										<img src="/Daqian/checkalipaycode.do" onclick="this.src='/Daqian/checkpaycode.do?'+Math.random();"/>
										<span style="color:red;" id="codetext"></span>
								</p><br /><br />
								<p style=""><input type="button" value="充值" class="buttoncz" id="buttoncz" style="width:100px; height:37px; color:#FFFFFF; background-color:#e95352; border:0; font-size:16px;margin-left:40px; border-radius:2px; -moz-border-radius: 2px; -webkit-border-radius: 2px;" /></p>
							</div>
						</div>
						<script type="text/javascript">
							$(function(){
					/*			$(".buttoncz").click(function(){
									$(".backgr").show();
									$(".qrjg").show();
								});
					*/
								$(".close,.wenti,.fukuan").click(function(){
									$(".backgr").hide();
									$(".qrjg").hide();
								});
							});
						</script>
						
						<style type="text/css">
						</style>
						<div class="qrjg">
							<div class="qrczjg">
								<span class="qrl">确认充值结果</span><img src='images/xz-12.png' class="close"/>
								<p style="font-size:22px; margin-top:30px;">请您在新打开的网上银行页面完成支付</p>
								<p style="font-size:16px; margin-top:20px;">付款完成前请不要关闭此窗口</p>
								<p style="font-size:16px; margin-top:10px;">完成付款后请根据您的情况选择按钮</p>
								<p style="margin-top:30px;"><a href="#"><span class="fukuan">已完成付款</span></a><a href="#"><span class="wenti">遇到问题？</span></a></p>
							</div>
						</div>
						<div class="backgr"></div>
						<div class="tishi">
							<p>温馨提示</p>
							<p>1.为了保障您的账户资金安全充值前请先完成实名认证.</p>
							<p>2.您的账户资金将由第三方支付通道进行充值.</p>
							<p>3.请注意您的银行卡充值限制,以免造成不便.</p>	
							<p>4.平台禁止信用卡套现,虚假交易行为,一经发现将予以处罚包括但不限于收款,终止该账户.</p>
						</div>
					</div>
				</form>
					<div style="height:20px;"></div>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/alipay.js"></script>			
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/security.js"></script>
</html>

