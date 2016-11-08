<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${gameinfo.gamename}-199y游戏-国内最欢乐H5网页游戏平台</title>
    <meta name="description" content="${gameinfo.detaildescripe }">
   	<meta name="keywords" content="${gameinfo.gamename }">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
	<script src='<%=request.getContextPath()%>/giveDetail/jquery.zclip.js' type='text/javascript'></script>
	<script src='<%=request.getContextPath()%>/giveDetail/jquery.zclip.min.js' type='text/javascript'></script>
  	<script type="text/javascript" src="<%=request.getContextPath()%>/js/gameinfo.js"></script>
  	
  	
  </head>
  <body>
  	<input type="hidden" value="${gameinfo.gamename}" id="gameinfoname">
  	<input type="hidden" value="${gameinfo.gameurl}" id="gameinfourl">
  	<input type="hidden" value="${gameinfo.code}" id="gameinfocode">
  	<input type="hidden" value="${gameinfo.gameid}" id="gameinfogameid">
    <div id="nav">
			<jsp:include page="head.jsp"></jsp:include>
	</div>
	<div id="content">
		<div class="mhc"></div>
		<div class="pop_up" id="demo2">
			<div class="pop_up_xx">
				<span>X</span>
			</div>
			<div class="pop_up2" id="ban_pic2">
				<div class="prev1" id="prev2">
					<img src="images/gameinfos/xiangqingye-datuzuojiantou.png"
						width="28" height="51" alt="" />
				</div>
				<div class="next1" id="next2">
					<img src="images/gameinfos/xiangqingyeyoujiantoudatu.png"
						width="28" height="51" alt="" />
				</div>
				<ul>
					<c:forEach items="${picture}" var="a">
						<li><a href="javascript:;"><img src="http://www.199y.com/picture/yqwan/${fn:trim(a)}" width="520" height="363" class="img" /></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="infosw">
			<div class="infos ban" id="demo1">
				<div class="infos_top">
					<div class="topleft">
						<div class="top_left ban2" id="ban_pic1">
							<ul>
								<c:forEach items="${picture}" var="a">
									<li><a href="javascript:;"><img src="http://www.199y.com/picture/yqwan/${fn:trim(a)}" width="434" height="303" class="img" /></a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="bottom_left min_pic">
							<div class="zc"></div>
							<div id="prev_btn1" class="prev_btn1"><img src="images/gameinfos/xiangqingye-datuzuojiantou.png" width="35" height="76"></div>
								<div class="num clearfix" id="ban_num1">	
									<ul style="width: 521px; height: 380px;">			
										<c:forEach items="${picture}" var="a">
											<li><a href="javascript:;"><img src="http://www.199y.com/picture/yqwan/${fn:trim(a)}" width="118" height="82" class="" /></a></li>
										</c:forEach>		
									</ul>
								</div>
							<div id="next_btn1" class="next_btn1"><img src="images/gameinfos/xiangqingyeyoujiantoudatu.png" width="35" height="76"></div>
						</div>
					</div>	
					<div class="top_right">
						<div class="title">${gameinfo.gamename }</div>
						<div class="title_info">
							<span>${gameinfo.roletype}</span>
							<span>${gameinfo.placetype}</span>
							<span>${gameinfo.gametype}</span>
							<span>${gameinfo.isBoutique}</span>
						</div>
						<div class="title_info">
							<div></div>
						</div>
						<div class="text">&nbsp;&nbsp;&nbsp;&nbsp;${gameinfo.detaildescripe }</div>
						<div class="ksyx"><a><div id="startgame">开始游戏</div></a></div>
					</div>					
				</div>
			</div>
			
			<div class="startgame" id="startgamea">
				<div class="frame">
				<c:choose>
					<c:when test="${gameinfo.code=='s'}">
						<iframe id="ifm" src="${gameinfo.gameurl} "
							frameborder="0" scrolling="no" width="640" height="480"
							allowtransparency="true"></iframe>
					</c:when>
				</c:choose>
				</div>
			</div>
			
			<div class="infos_bottom">
				<div class="corr min_pic1">
					<em id="prev_btn3" class="prev_btn3"><</em>
					<div class="num1 clearfix1" id="ban_num3">
						<ul>	
							<c:forEach  items="${gamelist}" var="list">							
								<li><a><img title="${list.gamename }" src="http://www.199y.com/picture/yqwan/${list.mainpicture }" width="54" height="50" onclick="javascript: window.open('/Yqwan/gameinfo.do?gameid=${list.gameid}','_blank');" /></a><a><span style="text-align:center;font-size:12px;text-align:center;">${fn:substring(list.gamename,0,4)}</span></a></li>
							</c:forEach>
						</ul>
					</div>
					<em id="next_btn3" class="next_btn3">></em>
				</div>
				<div class="kyk">
					<div class="kyk1">
						<span class="pf12">${gameinfo.score }</span> 我的评分：
						<span class="xx5">
						<img src="/Yqwan/images/gameinfos/xingxingtou.png"/>
						<img src="/Yqwan/images/gameinfos/xingxingtou.png"/>
						<img src="/Yqwan/images/gameinfos/xingxingtou.png"/>
						<img src="/Yqwan/images/gameinfos/xingxingtou.png"/>
						<img src="/Yqwan/images/gameinfos/xingxingtou.png"/>
						</span>
					</div>
					<div class="kyk2">
						
						<div class="bdsharebuttonbox"><span style="float:left;position:relative;top:8px;">${gameinfo.click} 玩过  &nbsp;|&nbsp; </span><span style="float:left;position:relative;top:8px;"> 分享到：<span></span></span><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_more" data-cmd="more"></a></div>
					</div>
				</div>
			</div>
		</div>
		
		<object width="1250" style="position:relative;top:-40px;" height="300" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="flash_obj" id="flash_obj">
						<param value="index/xsqst.swf" name="movie">
						<param value="high" name="quality">
						<param value="transparent" name="wmode">
						<param value="6.0.65.0" name="swfversion">
						<param value="always" name="allowScriptAccess">
						<param name="FlashVars" value="">
						
						<object width="1250" height="300" data="index/xsqst.swf" type="application/x-shockwave-flash">
						<param value="high" name="quality">
						<param value="transparent" name="wmode">
						<param value="6.0.65.0" name="swfversion">
						<param value="always" name="allowScriptAccess"><param name="FlashVars" value="http://121.40.87.169/gameXSQST/index.jsp">
						<div>
						<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4><p><a href="http://www.adobe.com/go/getflashplayer">
						<img width="112" height="33" alt="获取 Adobe Flash Player" src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif">
						</a>
						</p>
						</div>
						
						</object>
				  </object>
		
<!--		<img src="images/gameinfos/xs.jpg" width="1000" height="110" style="margin:20px auto;cursor:pointer;" onclick="javascript: window.open('http://121.40.87.169/gameXSQST/index.jsp','_blank');"/>  -->
		<div class="contr">
			<div class="contrleft">
				<div class="recom ban1" id="demo3">
					<div class="play">
						<div class="play_title"><img src="images/gameinfos/lanquanquan.jpg" /> 游戏玩法</div>
						<div class="operate">操作说明:</div>
						<ul>
							<li><img src="images/gameinfos/renwuyidong.jpg" width="50" height="31" />人物移动</li>
							<li><img src="images/gameinfos/shubiaozuo.png" width="21" height="33" />鼠标点击攻击</li>
							<li><img src="images/gameinfos/shubiaoyou.png" width="21" height="33" />右键使用物品</li>
							<li><img src="images/gameinfos/anjianf.png" width="25" height="23" />打开装备栏</li>
							<li><img src="images/gameinfos/kognge.png" width="69" height="24" />结束战斗回合</li>
						</ul>
						<p class="opera">如何开始:</p>
						<p>${gameinfo.howstart }</p>
						<p class="opera">游戏目标:</p>
						<p>${gameinfo.gamegoal }</p>
					</div>
				</div>
				<div class="review">
					<div class="discuss">
						<p class="plhdq">评论回答区</p>
						<textarea name="" class="shuru" id="comment_content" placeholder="请输入您的评论或问题"></textarea>
		<%--			<p class="bq"><img src="images/gameinfos/XIAOLIAN.png" />表情</p> --%>	
						<div class="fbpl" id="button">发表</div>
					</div>
					<p class="plhdq">最新评价</p>
					<img src="images/gameinfos/pingluntuxing.png" class="pingluntuxing" width="888" />
					<div class="tjsl" id="tjsl"><span>共有${commentnum }条评论</span></div>
					
					<div class=pl>
							<table class=nk>
								<tbody>
									<tr><td rowspan=2 class=tx><img style=border-radius:100px; width=49 height=49 src=/></td>
									<td class=xinxi><span class=xingm>obj.nickname</span><span class=shij>obj.date</span></td></tr>									
									<tr><td class=xinxi><span class=xingm>obj.content</span><span class=shij></span></td></tr>
								</tbody>
							</table>
					</div>
					<div class=pl>
							<table class=nk>
								<tbody>
									<tr><td rowspan=2 class=tx><img style=border-radius:100px; width=49 height=49 src=/></td>
									<td class=xinxi><span class=xingm>obj.nickname</span><span class=shij>obj.date</span></td></tr>									
									<tr><td class=xinxi><span class=xingm>obj.content</span><span class=shij></span></td></tr>
								</tbody>
							</table>
					</div>
					<div class=pl>
							<table class=nk>
								<tbody>
									<tr><td rowspan=2 class=tx><img style=border-radius:100px; width=49 height=49 src=/></td>
									<td class=xinxi><span class=xingm>obj.nickname</span><span class=shij>obj.date</span></td></tr>									
									<tr><td class=xinxi><span class=xingm>obj.content</span><span class=shij></span></td></tr>
								</tbody>
							</table>
					</div>
					
					<div class="fanye" id="fenye">
					<input type="hidden" value="${maxnum }" id="maxnum">
		  			<input type="hidden" value="${page }" id="page">
						<div class="nice" id="nice">
							<span>首页</span>
							<span class="zuo"><img src="images/codecentre/iconfont-jiantou.png" /></span>
							<span>1</span>
							<span>2</span>
							<span>3</span>
							<span>4</span>
							<span>5</span>
							<span class="you"><img src="images/codecentre/iconfont-jiantou_57.png" /></span>
							<span>尾页</span>
						</div>
					</div>
				</div>
			</div>
			<div class="contrright">
				<div class="notice">
					<div class="nottxt">
						<span class="xia">游戏公告</span>
					</div>
					<div class="notcon"><br/>
						<p>如何开始:</p>
						<p>${gameinfo.howstart }</p><br/>
						<p>游戏目标:</p>
						<p>${gameinfo.gamegoal }</p>
					</div>
				</div>
				<div class="recommend">
					<div class="rectxt">
						<span class="xia">他们也推荐</span>
					</div>
					<div class="reccon">
						<div class="recco">
							<div><img onclick="javascript:window.open('http://qst.199y.com','_blank');" src="http://static.86joy.com/game/xs/images/favicon.ico" width="30" height="30" /></div>
<%--						<div><img src="<%=request.getContextPath()%>/images/gameinfos/c1.png" width="30" height="30" /></div>
							<div class="avc"></div> --%>
						</div>
						<div class="reccotxt">
							<div>
								《像素骑士团》是一款像素风格，魔幻题材放置类冒险RPG社交网页游戏。画风怀旧古朴，风格诙谐幽默，知名角色乱入穿越，战斗战术简单易上手，且具备较强的策略性。是一款兼策略、趣味、充满怀旧、逗逼元素的优秀页游，也是真正意义上第一款像素画风的网页游戏，我在像素骑士团等着你哦！！！等着你的来临，我们一起放置生活，由你主宰,让我们《一起玩挂机》!放置QQ群：389530007
							</div>
<%--						<div>546456456456456456ef</div>
							<div>99999999999</div> --%>	
						</div>
						<div class="zjb">
							<span style="cursor:pointer;" ><a id="perfect">赞(<fmt:formatNumber type="number" value="${gameinfo.click/10}" maxFractionDigits="0"/>)</a>
								| <a href="http://wpa.qq.com/msgrd?v=3&uin=2912667676&site=qq&menu=yes" target="_blank">举报</a></span>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<div class='fix' id="fix"> 
			<div class='fixtop'><span>获取成功</span> 
				<img src='giveDetail/cuo.png' class='cuo' /> 
			</div> 
			<div class='fixcon'> 
				<p style='margin-left:30px;'>提取码为:</p>
				<p style='margin-left:40px;'></p> 
				<div class='haoma line' id='p1'>
					<span class='input'>${gameinfo.code}</span> 
					<span class='copy'>复制</span> 
				</div>
				<p style='margin-left:40px;'>复制后在云盘输入</p> 
				<div class="download">跳转至下载页面</div>
			</div> 
	</div>
	<div class="fixbo"></div>
	
	<jsp:include page="foot.jsp"></jsp:include>
	 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/gameinfo.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pic_tab.js"></script>	
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>	
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
  <script type="text/javascript">
  	
  </script>
  <style type="text/css">
   .foot>span{
		top:-20;
	}
	.footinfo span:nth-child(1){
		margin-top:0;
	}
  </style>
  <script type="text/javascript">
  	
		
//		$(".pf12").click(function(){
//			alert(jQuery.cookie('the_cookie'));
//			jQuery.cookie('the_cookie', null);
//			alert(jQuery.cookie('the_cookie')+"删除成功");
//			return;
//		});
//	});	
  </script>
 <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"我在199y正在玩《${gameinfo.gamename }》，大家一起来玩吧","bdMini":"1","bdMiniList":false,"bdPic":"http://www.199y.com/Yqwan/images/imgs.png","bdStyle":"1","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
 </body>
 

	
	<script type="text/javascript">
	$(function () {
    	$(".copy").zclip({
            path: "giveDetail/ZeroClipboard.swf",
            copy: function(){
            return $(this).parent().find(".input").text();
            },
            afterCopy:function(){/* 复制成功后的操作 */
                var $copysuc = $("<div class='copy-tips'><div class='copy-tips-wrap'>☺ 复制成功</div></div>");
                $("body").find(".copy-tips").remove().end().append($copysuc);
                $(".copy-tips").fadeOut(3000);
            }
        });
    });
	</script>
 
 
</html>