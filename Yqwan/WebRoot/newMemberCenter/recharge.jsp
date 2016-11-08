<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>充值中心</title>  
    <link rel="shortcut icon" href="/Yqwan/images/5987.ico">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script type="text/javascript" src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/newMemberCenter/js/recharge.js"></script>
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">   
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/base.css">
	
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
<!--	<div class="banner"></div>  -->
	<div id="content">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="content_left">
			<div class="recharge">
				<form method="post" id="form" target="_blank">
					<div class="top">
						<img src="../newMemberCenter/images/member/landian.png" height="7" width="7" />
						我要充值
<!--					<span class="czjl" id="morecharge"><a href="http://www.199y.com/Yqwan/totradelist.do" target="_blank">充值记录&nbsp;&nbsp;</a></span>  -->	
					</div>
					<div class="zhanghu">
						<div class="cz">
							<span>请填写并确认账号</span>
						</div>
						<div class="srzhanghao"><span class="red">*</span>充值账号：<input type="text" class="username" value="${user.userid}" readonly="readonly" name="username"/></div>
					</div>
					<div class="chongzhi">
						<div class="cz">
							<span>充值</span>
							<span class="right">G币：${user.gb}&nbsp;&nbsp;</span>
						</div>
						<div style="margin-left:200px; margin-top:30px;">
							选择充值：
							<input value="${defaultgamename }" autoComplete="off" type="text" class="qu" placeholder="请选择游戏" id="czgame" name="gamename"  readonly="readonly"/>
							<input value="${defaultgameregion }" autoComplete="off" type="text" class="subqu" placeholder="请选择分区" id="subqu" name="gameregion" readonly="readonly"/>
							<div class="xzyx" id="xzyx">
								<ul>
									<li class="guaji"><span>平台挂机点</span></li>
									<c:forEach items="${gamename}" var="g">
										<li><span>${g.gamename}</span></li>
									</c:forEach>						
								</ul>
							</div>
							<div class="xzfq" id="xzfq">
								<ul>
									<c:forEach items="${defaultregion}" var="g">
										<li onclick="javascript:$('.subqu').val($(this).children('span').text());$('.xzfq').hide();$('.wenzi').show();"><span>${g.gameregion}</span></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<span class="red wenzi">请您在游戏中建立角色，以便及时到帐，谢谢！</span>
					</div>
					<div class="cztype">
						<div class="cztype1">
							<div class="wangyin">网银充值</div>
							<div class="gbi">G币充值</div>
						</div>
						<div class="czmoney czyuan" id="czyuan">
							<p>请填写充值金额</p>
							<table width="500">
								<tr>	
									<td height="40"><input type="radio" name="money" value="10" /> 
									&nbsp;&nbsp;10元</td>
									<td><input type="radio" name="money" value="20"/> 
									&nbsp;&nbsp;20元</td>
									<td><input type="radio" name="money" value="50"/> 
									&nbsp;&nbsp;50元</td>
									<td><input type="radio" name="money" value="100"/> 
									&nbsp;&nbsp;100元</td>
									<td><input type="radio" name="money" value="500"/> 
									&nbsp;&nbsp;500元</td> 
								</tr>
								<tr>
									<td height="40"><input type="radio" name="money" value="1000" /> 
									&nbsp;&nbsp;1000元</td>
									<td><input type="radio" name="money" value="2000"/> 
									&nbsp;&nbsp;2000元</td>
									<td><input type="radio" name="money" value="3000"/> 
									&nbsp;&nbsp;3000元</td>
									<td><input type="radio" name="money" value="4000"/> 
									&nbsp;&nbsp;4000元</td>
									<td><input type="radio" name="money" value="5000"/> 
									&nbsp;&nbsp;5000元</td>
								</tr>
								<tr>
									<td colspan="3" height="40">其他 <input type="radio" name="money" id="other"/> 
									&nbsp;&nbsp;<input type="text" id="othermoney"/> 
									元</td>
									<td colspan="2">请输入10-10000元之间的整数</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="5">
										<span class="mred">充值兑换比例:1元=1G币 &nbsp;&nbsp;&nbsp;&nbsp;付款金额:10元,获得10G币<br/>(充值额外送：每充值10元返1G币，充越多，送越多。)</span>
									</td>
								</tr>
							</table>
						</div>
						<div class="czmoney czguabi" id="czgb">
							<p>请填写充值金额</p>
							<table width="500">
								<tr>	
									<td height="40"><input type="radio" name="money" value="10" /> 
									&nbsp;&nbsp;10G币</td>
									<td><input type="radio" name="money" value="20" /> 
									&nbsp;&nbsp;20G币</td>
									<td><input type="radio" name="money" value="50" /> 
									&nbsp;&nbsp;50G币</td>
									<td><input type="radio" name="money" value="100" /> 
									&nbsp;&nbsp;100G币</td>
									<td><input type="radio" name="money" value="500" /> 
									&nbsp;&nbsp;500G币</td>
								</tr>
								<tr>
									<td height="40"><input type="radio" name="money" value="1000" /> 
									&nbsp;&nbsp;1000G币</td>
									<td><input type="radio" name="money" value="2000" /> 
									&nbsp;&nbsp;2000G币</td>
									<td><input type="radio" name="money" value="3000" /> 
									&nbsp;&nbsp;3000G币</td>
									<td><input type="radio" name="money" value="4000" /> 
									&nbsp;&nbsp;4000G币</td>
									<td><input type="radio" name="money" value="5000" /> 
									&nbsp;&nbsp;5000G币</td>
								</tr>
								<tr>
									<td colspan="3" height="40">其他 <input type="radio" name="money" id="gbother"/> 
									&nbsp;&nbsp;<input type="text" id="gbothermoney"/> 
									G币</td>
									<td colspan="2">请输入10-10000G币之间的整数</td>
									<td></td>
								</tr>
								<tr>
									<td colspan="5">
										<span class="mred">充值兑换比例:1元=1G币 &nbsp;&nbsp;&nbsp;&nbsp;付款金额:10元,获得10G币<br/>(充值额外送：每充值10元返1G币，充越多，送越多。)</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="payguabi">
						<div class="cz">
							<span>选择支付方式</span>
						</div>
						<div class="summoney">共计金额：<span class="blue" id="gbshowmoney"></span>G币</div>
						<input type="button" value="确认提交" class="qr" id="gbpaybutton"/>
					</div>
					<div class="paytype">
						<div class="cz">
							<span>选择支付方式</span>
						</div>
						<p>共计金额：<span id="showmoney">0 </span>元<span style="color:red;">(预计送<span id="getgb">0</span>G币)</span></p>
						<p>充值方法:</p>
						<div class="type3">
								<div class="cyber">网银充值</div>
								<div class="zhifubao">支付宝充值</div>
								<div class="shouji">微信充值</div>
							</div>
						<div class="type cybercz">
							<div class="typeinfo">
								<div class="tit">
									网上银行：<span class="lan">安全.快捷！在线充值免去买卡烦恼,既冲既玩。</span>
								</div>
								<table width="700" height="340">
									<tr>
										<td width="240"><input type="radio" name="bank" value="BJBANK"/><img src="../newMemberCenter/images/bank/beijingyinhang.jpg" width="153" height="33" /></td>
										<td width="240"><input type="radio" name="bank" value="CMB"/><img src="../newMemberCenter/images/bank/zhaioshangyinhang.jpg" width="153" height="33" /></td>
										<td width="240"><input type="radio" name="bank" value="ABC"/><img src="../newMemberCenter/images/bank/nonghang.jpg" width="153" height="33" /></td>
									</tr>
									<tr>
										<td><input type="radio" name="bank" value="SPDB"/><img src="../newMemberCenter/images/bank/fazhanpudong.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="CEBBANK"/><img src="../newMemberCenter/images/bank/guangdayinhang.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="GDB"/><img src="../newMemberCenter/images/bank/guangdongfazhan.jpg" width="153" height="33" /></td>
									</tr>
									<tr>
										<td><input type="radio" name="bank" value="CCB"/><img src="../newMemberCenter/images/bank/jianshe.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="CMBC"/><img src="../newMemberCenter/images/bank/minsheng.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="CIB"/><img src="../newMemberCenter/images/bank/xingye.jpg" width="153" height="33" /></td>
									</tr>
									<tr>
										<td><input type="radio" name="bank" value="NBBANK"/><img src="../newMemberCenter/images/bank/ningbo.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="SDB"/><img src="../newMemberCenter/images/bank/shenzhenfazhan.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="ICBCB2C"/><img src="../newMemberCenter/images/bank/nognye_76.jpg" width="153" height="33" /></td>
									</tr>
									<tr>
										<td><input type="radio" name="bank" value="CITIC"/><img src="../newMemberCenter/images/bank/zhognxinyinhang.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="SPABANK"/><img src="../newMemberCenter/images/bank/pinanyinhang.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="SHBANK"/><img src="../newMemberCenter/images/bank/shanghaiyinhang.jpg" width="153" height="33" /></td>
									</tr>
									<tr>
										<td><input type="radio" name="bank" value="BOCB2C"/><img src="../newMemberCenter/images/bank/shanghaiyinhang_39.jpg" width="153" height="33" /></td>
										<td><input type="radio" name="bank" value="PSBC-DEBIT"/><img src="../newMemberCenter/images/bank/zhongguoyouzheng.jpg" width="153" height="33" /></td>
										
									</tr>
									
								</table>
							</div>
							<input type="button" value="确认提交" class="wyqr qr" id="wypaybutton"/>
						</div>
						<div class="type zhifubaocz">
							<div class="typeinfo">
								<div class="tit">
									支付宝充值：<span class="lan">安全.快捷！既冲既玩。</span>
								</div>
								<div class="ali"><input type="radio" name="bank" value="alipay"/><img src="../newMemberCenter/images/bank/Alipay.jpg" /></div>
							</div>
							<input type="button" value="确认提交" class="zfbqr qr" id="zfbpaybutton"/>
						</div>
						<div class="type shoujicz wxcz">
							<div class="typeinfo">
								<div class="tit">
									微信充值：<span class="lan">安全.快捷！既冲既玩。</span>
								</div>
								<div class="ali"><input type="radio" name="bank" value="wxpay"/><img src="../newMemberCenter/images/bank/wx.png" /></div>
							</div>
							<input type="button" value="确认提交" class="zfbqr qr" id="wxpaybutton"/>
						</div>
						
<!--					<div class="type shoujicz">
							<div class="typeinfo">
 								<div class="tit">
									请选择充值卡类别：<span class="lan">安全.快捷！在线充值免去买卡烦恼,既冲既玩。</span>
								</div>
								<div class="a"><input type="radio" name="sjcard" /><div class="sjimg">神州行充值卡</div></div>
								<div class="a"><input type="radio" name="sjcard" /><div class="sjimg">联通充值卡</div></div>
								<div class="a"><input type="radio" name="sjcard" /><div class="sjimg">电信充值卡</div></div>
								<br /><br /><br /><br />
								<p class="bb">充值兑换比例:1元=1G币</p>
								<p>提示:您选择的金额与充值卡面额必须一致，否则将可能导致支付不成功、或支付余额丢失!</p> 	
							</div>
							<input type="button" value="确认提交" class="sjkqr qr" />
						</div>-->
						
					</div>
						
					<p class="red">温馨提示：</p>
					<p>1.请确保您填写的用户名正确无误，因玩家输入错误而导致的任何损失由用户自行承担。</p>
					<p>2.充值过程中，浏览器会跳转至银行页面，支付成功后，会自动返回一起玩游戏网站，如果没有跳转或是弹出充值成功的页面，请您不要关闭充值窗口。</p>
					<p>3.遇到任何充值问题，请您联系客服中心。</p>
<!-- 				<p>3.支持全国通用的神州行卡（卡号17位，密码18位）。面额： 10 ,30 ,50 ,100 ,200 ,300 ,500 元。</p>
					<p>4.支持江苏移动充值卡（卡号16位，密码17位）。面额： 30 ,50 ,100 元。</p>
					<p>5.支持浙江移动充值卡（卡号10位，密码8位）。面额： 10 ,30 ,50 ,100 元。</p>
					<p>6.支持全国通用的联通卡（卡号15位，密码19位）。面额： 50 ,100 元。</p>
					<p>7.支持全国通用的电信卡（卡号19位，密码18位）。面额： 50 ,100 元。</p> -->		
					
				</form>
				<div class="qrjg">
							<div class="qrczjg">
								<span class="qrl">确认充值结果</span><img src='/Yqwan/newMemberCenter/images/xz-12.png' class="close"/>
								<p style="font-size:22px; margin-top:30px;">请您在新打开的网上银行页面完成支付</p>
								<p style="font-size:16px; margin-top:20px;">付款完成前请不要关闭此窗口</p>
								<p style="font-size:16px; margin-top:10px;">完成付款后请根据您的情况选择按钮</p>
								<p style="margin-top:30px;"><a><span class="fukuan">已完成付款</span></a><a><span class="wenti">遇到问题？</span></a></p>
							</div>
				</div>
				<div class="backgr"></div>
			</div>
			<div class="charge_records" id="charge_records">
					<table width="450">
						<tr id="chargetitle">
							<td>充值游戏</td>
							<td>充值金额(元)</td>
							<td>充值日期</td>
						</tr>
<%--					<tr>
							<td>像素骑士团</td>
							<td>30</td>
							<td>2016-1-31</td>
						</tr> --%>	
					</table>
			</div>
		</div>
		<br style="clear:both;height:0;" />
	</div>
	
	
		
	<jsp:include page="../foot.jsp"></jsp:include>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/recharge.css">
</html>