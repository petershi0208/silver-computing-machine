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
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/cityScript.js"></script>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/tixian.js"></script>
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
							<span class="r22b">￥${rolemoney+availablemoney}</span>
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
					<div style="height:auto; width:666px; border:1px #bbb solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;  overflow:hidden;">
						<div style="height:40px; width:666px; line-height:40px; border-bottom:1px #bbb solid;">
							<span class="hm14b">账户提现</span>	<span class="hm14b" style="float:right">提现记录</span>
						</div>
				<form action="/Daqian/cash.do" method="post">
				<input id="realname" value="${realname}" type="hidden"/>
				<input id="username" value="${username}" type="hidden" name="username"/>
				<input id="availablemoney" value="${availablemoney}" type="hidden"/>
						<div style="height:auto; width:666px; overflow:hidden;">

						</div>
						<div class="nk" style=" height:500px; width:600px; margin:20px auto;">
							<div class="a">
								<div class="w120"><span class="g14">可用金额：</span></div>
								<div><span class="r16">${availablemoney }元</span></div>
							</div>
							<div class="a">
								<div class="w120"><span class="g14">提现金额：</span></div>
								<div><input type="text" id="money" name="money"/><span id="moneytext" style="color:red;"></span></div>
							</div>
						<div style="display:none;">
							<div  class="a">
								<div class="w120"><span class="g14">手续费：</span></div>
								<div><span class="h16">0.00元</span></div>
							</div>
							<div  class="a">
								<div class="w120"><span class="g14">实际提现金额：</span></div>
								<div><span class="h16">0.00元</span><span class="g14">(已扣除<span class="r16">0.00</span>元手续费)</span></div>
							</div>
							<div  class="a">
								<div class="w120"><span class="g14">选择银行卡：</span></div>
								<div><input type="text" style="display:none;" />
									 <div class="yhkxz" style="border:1px #aaa solid; height:36px; width:222px; margin-top:-5px; float:left; cursor:pointer; line-height:35px;">
									 	添加银行卡
									 </div>
									 <div class="yhtj">
									 	<span><img src="images/bbj.png" />北京银行</span>
										<span><img src="images/bzg.png" />中国银行</span>
										<span><img src="images/bjt.png" />交通银行</span>
										<span><img src="images/bgd.png" />光大银行</span>
										<span><img src="images/bxy.png" />兴业银行</span>
										<span><img src="images/bny.png" />农业银行</span>
										<span><img src="images/bgs.png" />工商银行</span>
										<span><img src="images/bhx.png" />华夏银行</span>
										<span><img src="images/bnb.png" />宁波银行</span>
										<span><img src="images/bjs.png" />建设银行</span>
										<span><img src="images/bzs.png" />招商银行</span>
										<span><img src="images/bms.png" />民生银行</span>
										<span><img src="images/byz.png" />邮政银行</span>
										<span><img src="images/bpf.png" />浦发银行</span>
										<span  style="position:relative; top:-190px;"><img src="images/bzx.png" />中信银行</span>
									 </div>
								</div>
							</div>
					</div>
							<div  class="a" style="z-index:99; position:absolute;">
								<div class="w120"><span class="g14">交易密码：</span></div>
								<div><input type="password" id="paypwd"/><span id="pwdtext" style="color:red;"></span></div>
							</div>
							<div class="a" style="margin-top:50px; z-index:99; position:absolute;">
								<div class="w120"></div>
								<div class="tq">
									<input type="button" style="margin-top:30px;" class="tixian" value="确认提现" id="tixian"/>
								</div>
							</div>
						</div>
				</form>
						<script type="text/javascript">
							$(function(){
								$(".buttoncz").click(function(){
									$(".backgr").show();
									$(".qrjg").show();
								});
								$(".close,.wenti,.fukuan").click(function(){
									$(".backgr").hide();
									$(".qrjg").hide();
								});
							});
						</script>
						<div class="tishi">
							<p>温馨提示</p>
							<p>平台禁止信用卡套现,虚假交易行为,一经发现将予以处罚包括但不限于收款,终止该账户.</p>
						</div>
					</div>
					<div style="height:20px;"></div>
				</div>
			</div>
		</div>
	  
	<div class="bank">
	<div class="qrczjg1">
		<span class="qrl">添加银行卡</span><img src='images/xz-12.png' class="close"/>
	</div>
	<div class="nk">
		<div class="a">
			<div class="w140"><span class="red">*</span> <span class="g16">银行账户类型</span></div>
			<div class="g16">借记卡 不支持体现到信用卡账户</div>
		</div>
		<div class="a">
			<div class="w140"><span class="red">*</span> <span class="g16">开户人姓名</span></div>
			<div class="g16">*杰伦</div>
		</div>
		<div class="a" style="height:60px;">
			<div class="w140"><span class="red">*</span> <span class="g16">银行卡号</span></div>
			<div><input type="text" /><br /><span class="ts">该银行开户名必须为*<span style="color:red;">杰伦</span>,否则会提现失败!</span></div>
		</div>
		<div  class="a">
			<div class="w140"><span class="red">*</span> <span class="g16">选择银行</span></div>
			<div><input type="text" /></div>
		</div>
		<div  class="a">
			<div class="w140"><span class="red">*</span> <span class="g16">开户行所在地</span></div>
			<div><input type="text" readonly="readonly" placeholder="请选择城市" id="inputTest" style="font-size:16px;"/></div>
		</div>
		<div  class="a">
			<div class="w140"><span class="red">*</span> <span class="g16">开户行</span></div>
			<div><input type="text" /></div>
		</div>
		<div  class="a">
			<div class="w140"><span class="red">*</span> <span class="g16">手机验证码</span></div>
			<div><input type="text" /><input type="button" class="yanz" style="width:120px; background-color:#E84D37; font-size:16px; color:#FFFFFF; margin-left:10px; height:39px; border:0; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;" value="获取验证码" />
				<br /><span class="ts">手机需为银行刚开户手机号,否则会提现失败!</span>
			</div>
		</div>
		<div class="a" style="margin-top:50px;">
			<div class="w140"></div>
			<div class="tq">
			<style type="text/css">
				.tq input{border:#E84D37 1px solid;width:112px; height:40px; margin-right:30px; font-size:18px; background-color:#fff; color:#E84D37; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; cursor:pointer;}
				.qq{color:#fff; background-color:#E84D37;}
			</style>
				<input type="button" class="tianjia" value="添加" style="" />
				<input type="button" class="quxiao" value="取消" style="" />
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

