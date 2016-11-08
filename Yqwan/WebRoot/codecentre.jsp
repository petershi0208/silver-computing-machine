<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发号中心-199y游戏网</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="发号中心,礼包,新手卡">
	<meta name="description" content="发号中心-199y游戏网">
	<script src="<%=request.getContextPath()%>/giveDetail/jquery-1.7.1.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="css/codecentre.css">

</head>
<body>
    <div id="nav">
		<jsp:include page="head.jsp"></jsp:include>
	</div>
	
	<div class="codebanner"></div>
	<div id="content">
		<div class="nav">
			<div><img src="images/codecentre/iconfont-zhongxin.png" class="img" /></div>
			<div class="fhzxtext">发号中心</div>
			<div class="sslbm">
				<input type="text" value="${giftname }" class="giftname" name="giftname" placeholder="请输入礼包名" />
				<span class="btnn"></span>
			</div>
<%--			<p class="rsyx"><span class="rsc">热搜词:</span><span><a>节奏大师</a> <a>疯狂飙车</a> <a>保卫萝卜</a> <a>疯狂比尔</a> <a>天天连萌</a></span></p> --%>
		</div>
		<div class="content">
<!--  			<div class="banner">
					<ul class="dabanner">
						<c:forEach items="${cdkeybanner}" var="c">
							<li><a href="<%=request.getContextPath()%>/gameinfo.do?gamename=${c.gamename }"><img src="http://www.199y.com/picture/yqwan/${c.picture }" width="1000" height="385" /></a></li>
						</c:forEach>
					</ul>
					<div class="banner_x">
						<ul>
							<c:forEach items="${cdkeybanner}" var="c">
								<li><img src="http://www.199y.com/picture/yqwan/${c.picture }" width="175" height="108" /></li>
							</c:forEach>
						</ul>
					</div>
					<div class="ht"></div>
					<div class="qt">
						<ul>
							<c:forEach items="${cdkeybanner}" var="c">
							<li><a href="<%=request.getContextPath()%>/gameinfo.do?gamename=${c.gamename }" style="color:#FFF;">${c.gamename }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>-->
			<div class="con_left">
				<c:forEach items="${giftinfo }" var="g">
				<div class="code_list">
					<table>
					<tbody>
						<tr>
							<td rowspan="4"><a href="giftDetail.do?id=${g.id }"><img src="http://www.199y.com/picture/yqwan/${g.logo }" width="121" height="116" /></a></td>
							<td height="50"><a href="giftDetail.do?id=${g.id }"><span class="gamename">${g.giftname }</span></a></td>
							<td rowspan="4" class="lh">
								<a href="giftDetail.do?id=${g.id }">
								<img src="images/codecentre/linghaonanzi.png" onMouseOver="this.src='images/codecentre/linghaobaozi.png'" onMouseOut="this.src='images/codecentre/linghaonanzi.png'" width="68" height="68" />
								</a>
							</td>
						</tr>
						<tr>
							<td class="jl" height="40">
								<c:set value="${fn:split(g.content, ',') }" var="content" />
								<c:forEach items="${content }" var="con">
									<span>${con }</span>
								</c:forEach>
								<!-- <span>钻石*50</span>
								<span>金币*50</span>
								<span>经验药水（小）*10</span> -->
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
<%--						<tr>
							<td height="40">已有<span class="hs">673</span>人领取 剩余时间:<span class="hs">364</span>天</td>
						</tr>
						<tr>
							<td class="shouji">
								<img class="an" src="images/codecentre/ANZHUO.png" />
								<img class="ping" src="images/codecentre/PINGGUO.png" />
							</td>
							<td></td>
							<td class="shengy">剩余 : 97</td>
						</tr> --%>
					</tbody>
					</table>
				</div>
				</c:forEach>
				<!-- <div class="code_list">
					<table>
					<tbody>
						<tr>
							<td rowspan="4"><img src="images/codecentre/linghaoer.jpg" /></td>
							<td><span class="gamename">《龙途》回归礼包</span></td>
							<td rowspan="4" class="lh">
								<a href="giveDetail.jsp">
								<img src="images/codecentre/linghaonanzi.png" onMouseOver="this.src='images/codecentre/linghaobaozi.png'" onMouseOut="this.src='images/codecentre/linghaonanzi.png'" />
								</a>
							</td>
						</tr>
						<tr>
							<td class="jl"><span>元宝*50</span><span>金币*500000</span><span>强化石*9</span></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>已有<span class="hs">613</span>人领取 剩余时间:<span class="hs">344</span>天</td>
						</tr>
						<tr>
							<td class="shouji">
								<img class="an" src="images/codecentre/ANZHUO.png" />
								<img class="ping" src="images/codecentre/PINGGUO.png" />
							</td>
							<td></td>
							<td class="shengy">剩余 : 97</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="code_list">
					<table>
					<tbody>
						<tr>
							<td rowspan="4"><img src="images/codecentre/linghaosan.jpg" /></td>
							<td><span class="gamename">《女神国度》大礼包</span></td>
							<td rowspan="4" class="lh">
								<a href="giveDetail.jsp">
								<img src="images/codecentre/linghaonanzi.png" onMouseOver="this.src='images/codecentre/linghaobaozi.png'" onMouseOut="this.src='images/codecentre/linghaonanzi.png'" />
								</a>
							</td>
						</tr>
						<tr>
							<td class="jl"><span>钻石*50</span><span>金币*50000</span><span>符石*8</span></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>已有<span class="hs">643</span>人领取 剩余时间:<span class="hs">314</span>天</td>
						</tr>
						<tr>
							<td class="shouji">
								<img class="an" src="images/codecentre/ANZHUO.png" />
								<img class="ping" src="images/codecentre/PINGGUO.png" />
							</td>
							<td></td>
							<td class="shengy">剩余 : 97</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="code_list">
					<table>
					<tbody>
						<tr>
							<td rowspan="4"><img src="images/codecentre/linghaoer.jpg" /></td>
							<td><span class="gamename">《女神国度》大礼包</span></td>
							<td rowspan="4" class="lh">
								<a href="giveDetail.jsp">
								<img src="images/codecentre/linghaonanzi.png" onMouseOver="this.src='images/codecentre/linghaobaozi.png'" onMouseOut="this.src='images/codecentre/linghaonanzi.png'" />
								</a>
							</td>
						</tr>
						<tr>
							<td class="jl"><span>元宝*50</span><span>金币*50000</span><span>强化石*8</span></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>已有<span class="hs">643</span>人领取 剩余时间:<span class="hs">314</span>天</td>
						</tr>
						<tr>
							<td class="shouji">
								<img class="an" src="images/codecentre/ANZHUO.png" />
								<img class="ping" src="images/codecentre/PINGGUO.png" />
							</td>
							<td></td>
							<td class="shengy">剩余 : 97</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="code_list">
					<table>
					<tbody>
						<tr>
							<td rowspan="4"><img src="images/codecentre/linghaoyi.jpg" /></td>
							<td><span class="gamename">《女神国度》大礼包</span></td>
							<td rowspan="4" class="lh">
								<a href="giveDetail.jsp">
								<img src="images/codecentre/linghaonanzi.png" onMouseOver="this.src='images/codecentre/linghaobaozi.png'" onMouseOut="this.src='images/codecentre/linghaonanzi.png'" />
								</a>
							</td>
						</tr>
						<tr>
							
							<td class="jl"><span>钻石*50</span><span>金币*50000</span><span>符石*8</span></td>
							
						</tr>
						<tr>
							<td></td>
							
						</tr>
						<tr>
							
							<td>已有<span class="hs">643</span>人领取 剩余时间:<span class="hs">314</span>天</td>
							
						</tr>
						<tr>
							<td class="shouji">
								<img class="an" src="images/codecentre/ANZHUO.png" />
								<img class="ping" src="images/codecentre/PINGGUO.png" />
							</td>
							<td></td>
							<td class="shengy">剩余 : 97</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="code_list">
					<table>
					<tbody>
						<tr>
							<td rowspan="4"><img src="images/codecentre/linghaosan.jpg" /></td>
							<td><span class="gamename">《大话西游》新手礼包</span></td>
							<td rowspan="4" class="lh">
								<a href="giveDetail.jsp">
								<img src="images/codecentre/linghaonanzi.png" onMouseOver="this.src='images/codecentre/linghaobaozi.png'" onMouseOut="this.src='images/codecentre/linghaonanzi.png'" />
								</a>
							</td>
						</tr>
						<tr>
							
							<td class="jl"><span>钻石*50</span><span>金币*50</span><span>经验药水（小）*10</span></td>
							
						</tr>
						<tr>
							<td></td>
							
						</tr>
						<tr>
							
							<td>已有<span class="hs">473</span>人领取 剩余时间:<span class="hs">364</span>天</td>
							
						</tr>
						<tr>
							<td class="shouji">
								<img class="an" src="images/codecentre/ANZHUO.png" />
								<img class="ping" src="images/codecentre/PINGGUO.png" />
							</td>
							<td></td>
							<td class="shengy">剩余 : 97</td>
						</tr>
					</tbody>
					</table>
				</div> -->
				<div class="fanye">
					<div class="nice paga">
						<span class="homepage">首页</span>
						<span class="zuo prepage"><img src="images/codecentre/iconfont-jiantou.png" /></span>
						<span class="currentpage1 a">1</span>
						<span class="you nextpage"><img src="images/codecentre/iconfont-jiantou_57.png" /></span>
						<span class="endpage">尾页</span>
						<span class="count" style="display:none;">${count }</span>
					</div>
				</div>
			</div>
			<div class="con_right">
				<div class="newcode">
					<div class="newcode_title">
						<img src="images/codecentre/iconfont-liwu-.png" />最新发号
					</div>
					<div class="newcode_content">
						<c:forEach items="${topnine }" var="top">
							<div style="">
								<span class="datecolor">${fn:substring(top.date, 5, 10)}</span>
								<span>
									<a href="giftDetail.do?id=${top.id }">${top.giftname }</a>
								</span>
								<span class="bccolor">已补仓</span>
							</div>
						</c:forEach>
<!-- 					<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《大话西游2》群雄序列号 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《龙途》回归礼包 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《战痕天下》圣战光环礼包 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《传奇霸业》冥界召唤礼包 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《我是大主宰》公测世界礼包 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《女神国度》大礼包 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《赤月传说》东荡西除通服礼 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《MU奇迹来了》败通礼包 </a><span class="bccolor">已补仓</span></div>
						<div><span class="datecolor">11-23</span><a href="giveDetail.jsp">《莽荒纪》大礼包 </a><span class="bccolor">已补仓</span></div> -->
					</div>
				</div>
				<div class="grabcode">
					<div class="grabcode_title">
						<img src="images/codecentre/iconfont-jinrifengqiang_46.png" />大家都在抢
					</div>
					<div class="grabcode_wc">
					<div class="grabcode_content">
						<c:forEach items="${qiang }" var="q">
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="http://www.199y.com/picture/yqwan/${q.logo }" width="58" height="58" /></td>
									<td width="184"> ${q.gamename }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${fn:substring(q.date, 5, 10)} <a href="giftDetail.do?id=${q.id }">领取</a></td>
								</tr>
								<tr>
									<td>${q.giftname }</td>
								</tr>
							</tbody>
							</table>
						</div>
						</c:forEach>
						<!--<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qianger.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《关云长》独家公测礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qiangsi.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《不良人》七夕豪华礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qingyi.jpg"  /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《天天爱消除》小王子礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qianger.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《不良人》新手礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qiangsi.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《君临天下》七夕豪华礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qiangqi.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《拳皇98总计之战OL》普通礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qianger.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《不良人》新手礼包</td>
								</tr>
							</tbody>
							</table>
						</div>
						<div class="grabcode_info">
							<table>
							<tbody>
								<tr>
									<td rowspan="2" width="60"><img src="images/codecentre/qiangsi.jpg" /></td>
									<td width="184"> ID31326095 11-23 <a href="giveDetail.jsp">领取</a></td>
								</tr>
								<tr>
									<td>《君临天下》七夕豪华礼包</td>
								</tr>
							</tbody>
							</table>
						</div>-->
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
<script src="js/code.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>