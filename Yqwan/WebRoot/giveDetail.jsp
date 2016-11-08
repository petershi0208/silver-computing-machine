<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${giftinfo.giftname }-199y游戏网</title>  
		<meta http-equiv="X-UA-Compatible" content="IE=10">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="keywords" content="${giftinfo.gamename },${giftinfo.gamename }礼包,礼包,兑换码,激活码,新手卡">
		<meta name="description" content="${giftinfo.giftname }礼包">
		<script src="<%=request.getContextPath()%>/giveDetail/jquery-1.7.1.js" type="text/javascript"></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/giveDetail/giveDetail.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/giveDetail/giveDetail.js"></script>
		<script src="<%=request.getContextPath()%>/js/cdkey.js" type="text/javascript"></script>
	</head>
  
	<body>
  		<div class="headborder">
  			<jsp:include page="head.jsp"/>
  		</div>
  		<div class="givebanner"></div>
  		<div class="center">
  			<p class="centerp">
  				<img src="giveDetail/fangzi-.png"/>
  				<span id="givecode" style="cursor:pointer;">发号</span>
  				<span>&gt;</span>
  				<span>发号详情</span>
  			</p>
 			<input type="text" style="display:none;" class="giftid" value="${giftinfo.id }" />
  			<div class="centergift">
  				<p>${giftinfo.giftname }</p>
  				<img src="giveDetail/lansefengexian.png"/>
  				<div class="centergiftdetail">
  					<img src="http://www.199y.com/picture/yqwan/${giftinfo.logo }"  class="centergiftdetailpic" width="100" height="98"/>
  					<img src="giveDetail/linghaolandi.png" class="centergiftdetailbtn cdkey" style="cursor:pointer; z-index:99;"/>
  					<ul>
  						<li>游戏名称：《${giftinfo.gamename }》</li>
  						<li>礼包适用：
  							<c:if test="${giftinfo.type=='anzhuo.jpg'}">
  							<img src="/Yqwan/gamePicture/ANZHUO.png"/>
  							</c:if>
  							<c:if test="${giftinfo.type=='apple.jpg'}">
  							<img src="/Yqwan/gamePicture/PINGGUO.png"/>
  							</c:if>
  							<c:if test="${giftinfo.type=='pc.jpg'}">
  							<img src="/Yqwan/gamePicture/PC.png"/>
  							</c:if>
  							<c:if test="${giftinfo.type=='both.jpg'}">
  							<img src="/Yqwan/gamePicture/PINGGUO.png"/><img src="/Yqwan/gamePicture/ANZHUO.png"/>
  							</c:if>
  						</li>
  						<li><div style="left:0;float:left;">剩余情况：</div>
  							<div class="lid">
  								<div class="lidd" style="width:${restcount/count*200}px;"></div>
  							</div>
  							
  							<span class="li33" style="left:0;float:left;margin-left:10px;">${restcount }</span>
  							<span class="left0" style="left:0;float:left;">/${count }</span>
  						</li>
  						<br/>
  						<li>有效时间：至${activetime } 23：59：59</li>
  						<li>领取条件：${giftinfo.conditions }</li>
  						<li>该礼包开启淘号功能,请领取礼包的用户尽快使用！</li>
  						<li>分享到：
  							<img src="giveDetail/fenxianger.png"/>
							<img src="giveDetail/fenxiangsan.png"/>
							<img src="giveDetail/fenxiangsi.png"/>
							<img src="giveDetail/fenxiangyi.png"/>  						
  						</li>
  					</ul>
  				</div>
  			</div>
  			<div class="centercontent">
  				<p>礼包内容</p>
  				<img src="giveDetail/lansefengexian.png"/>
  				<ul>
  					<c:set value="${fn:split(giftinfo.content, ',') }" var="content" />
					<c:forEach items="${content }" var="con">
						<li>${con}</li>
					</c:forEach>
  				</ul>
  			</div>
  			<div class="centerpic" id="centerpic">
  				<p>相关图片</p>
  				<c:set value="${fn:split(gameinfo.picture, ',') }" var="picture" />
  				<div class="centerpicone" id="centerpicone">
	  				<ul>
	  					<c:forEach items="${picture }" var="pic">
	  						<li><a href="javascript:;"><img src="http://www.199y.com/picture/yqwan/${fn:trim(pic)}"  width="434" height="303" /></a></li>
	  					</c:forEach>
	  					
	  					<!-- <li><a href="javascript:;"><img src="giveDetail/xiangqingyedatu.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyedatu.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyedatu.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyedatu.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyedatu.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyedatu.jpg"/></a></li> -->
	  				</ul> 						
  				</div>
  				<div class="centerpicpre" id="centerpicpre"><img src="giveDetail/xiangqingye-datuzuojiantou.jpg"/></div>			
  				<div class="centerpicthree" id="centerpicthree">
  					<ul>
  						<c:forEach  items="${picture }" var="pic">
	  						<li><a href="javascript:;"><img src="http://www.199y.com/picture/yqwan/${fn:trim(pic)}" width="131" height="91" /></a></li>
	  					</c:forEach>
	  					<!-- <li><a href="javascript:;"><img src="giveDetail/xiangqingyexiaotuer.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyexiaotuyi.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyexiaotuyi.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyexiaotuyi.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyexiaotuyi.jpg"/></a></li>
	  					<li><a href="javascript:;"><img src="giveDetail/xiangqingyexiaotuyi.jpg"/></a></li> -->
  					</ul>
  				</div>
  				<div class="centerpicnext" id="centerpicnext"><img src="giveDetail/xiangqingyeyoujiantoudatu.jpg"/></div>
  			</div>
  			
<%--		<div class="review">
				<div class="discuss">
					<p class="plhdq">评论回答区</p>
					<textarea name="" class="shuru">请输入您的评级或问题</textarea>
					<p class="bq"><img src="giveDetail/XIAOLIAN.png" />表情</p>
					<div class="fbpl">发表</div>
				</div>
				<p class="plhdq">最新评价</p>
				<img src="giveDetail/pingluntuxing.png" class="pingluntuxing" />
				<div class="tjsl"><span>共有14条评论</span></div>
				<div class="pl">
					<table class="nk">
					<tbody>
						<tr>
							<td rowspan="2" class="tx"><img src="giveDetail/YOUXISHOUYETUBIAO.png" /></td>
							<td class="xinxi"><span class="xingm">DSKDJS王</span><span class="shij">2015-12-03</span></td>
						</tr>
						<tr>
							<td class="xinxi"><span class="xingm">怎么用一键游戏啊???</span><span class="shij"></span></td>
						</tr>
						<tr>
							<td colspan="3" class="xinxi"><span class="dzhf"><img src="giveDetail/ZANYIGETUBIAO.png" class="dianz" />(3)<img src="giveDetail/HUIFUTUBIAO.png" class="huif" />回复</span></td>
						</tr>
					</tbody>
					</table>
				</div>  	
				
				<div class="pl">
					<table class="nk">
					<tbody>
						<tr>
							<td rowspan="2" class="tx"><img src="giveDetail/YOUXISHOUYETUBIAO.png" /></td>
							<td class="xinxi"><span class="xingm">DSKDJS王</span><span class="shij">2015-12-03</span></td>
						</tr>
						<tr>
							<td class="xinxi"><span class="xingm">怎么用一键游戏啊???</span><span class="shij"></span></td>
						</tr>
						<tr>
							<td colspan="3" class="xinxi"><span class="dzhf"><img src="giveDetail/ZANYIGETUBIAO.png" class="dianz" />(3)<img src="giveDetail/HUIFUTUBIAO.png" class="huif" />回复</span></td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="pl">
					<table class="nk" cellspacing="0" cellpadding="0" >
					<tbody>
						<tr>

							<td rowspan="2" class="tx"><img src="giveDetail/YOUXISHOUYETUBIAO.png" /></td>
							<td class="xinxi"><span class="xingm">DSKDJS王</span><span class="shij">2015-12-03</span></td>
						</tr>
						<tr>
							<td class="xinxi"><span class="xingm">怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???怎么用一键游戏啊???</span><span class="shij"></span></td>
						</tr>
						<tr>
							<td colspan="3" class="xinxi"><span class="dzhf"><img src="giveDetail/ZANYIGETUBIAO.png" class="dianz" />(3)<img src="giveDetail/HUIFUTUBIAO.png" class="huif" />回复</span></td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="fanye">
					<div class="nice">
						<span>首页</span>
						<span class="zuo"><img src="giveDetail/iconfont-jiantou.png" /></span>
						<span>1</span>
						<span>2</span>
						<span>3</span>
						<span>4</span>
						<span>5</span>
						<span class="you"><img src="giveDetail/iconfont-jiantou_57.png" /></span>
						<span>尾页</span>
					</div>
				</div> 
			</div>	--%>		
  		</div>
  		<div class='fix'> 
			<div class='fixtop'><span>领取成功</span> 
				<img src='giveDetail/cuo.png' class='cuo' /> 
			</div> 
			<div class='fixcon'> 
				<p style='margin-left:30px;'>您已经获得:</p>
				<p style='margin-left:40px;'>${giftinfo.giftname }</p> 
				<div class='haoma line' id='p1'>
					<span class='input'></span> 
					<span class='copy'>复制</span> 
				</div>
				<p style='margin-left:40px;'>复制后在游戏中输入</p> 
			</div> 
		</div>
		<div class="fixbo"></div>	
  		<jsp:include page="foot.jsp"></jsp:include>
	</body>
	
	<script src="<%=request.getContextPath()%>/giveDetail/pic_tab.js" type="text/javascript"></script>
	
	<script src='<%=request.getContextPath()%>/giveDetail/jquery.zclip.js' type='text/javascript'></script>
	<script src='<%=request.getContextPath()%>/giveDetail/jquery.zclip.min.js' type='text/javascript'></script>
	
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
