<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html style="overflow:scroll">
  <head> 
    <title>H5游戏,199Y游戏,放置游戏-199Y游戏-国内最欢乐H5网页游戏平台</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10"> 
	<meta name="keywords" content="pc放置型rpg游戏,pc放置类游戏,pc,放置类游戏,pc上的放置游戏,可以挂机的网络游戏,能挂机的网络游戏,什么游戏可以挂机赚钱,放置型rpg,ios,ios放置型游戏, ios,放置型游戏,ios放置游戏,安卓放置类rpg游戏,安卓whipper放置游戏,安卓,放置类游戏,苹果放置,pc放置型rpg游戏,pc放置类rpg,pc,放置型rpg,pc放置类游戏,独立游戏开发,独立开发能力,企业网站做独立开发,独立游戏开发,独立游戏开发引擎,游戏邦,独立开发,H5游戏 ,好玩的H5游戏 ,H5放置游戏,H5rpg游戏 ,H5">
	<meta name="description" content="199Y游戏是国内第一家最全面内容最多的放置挂机等类型游戏平台，ZombieMonkey工作室旗下平台。欢乐游戏，快乐生活，就上199Y！">
	<meta name="Robots" content= "all">
	<meta name="Author" content="TYShi">
	<meta http-equiv="cache-control" content="private"/>
	
<!--<meta name="viewport" content="width=device-width, initial-scale=1">  -->

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newindex/base9300.css" />
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newindex/css/normalize.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newindex/css/demo.css" />
	
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newindex/css/set1.css" />
		
	<link href="<%=request.getContextPath()%>/index/slider/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />	
	<link href="<%=request.getContextPath()%>/newindex/index.css" rel="stylesheet" type="text/css"/>	
  </head>  
<body>
<span style="display:none;"><img src="http://www.199y.com/picture/yqwan/201607/baiduzhizhu.jpg" width='121' height='75' title="199Y游戏-国内最欢乐H5网页游戏平台" alt="199Y游戏-国内最欢乐H5网页游戏平台"/></span>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="curdate" value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss" /> 
    <jsp:include page="head.jsp"/>
    <div class="center">
    	<div class="banner">
    		<div class="banner_login">
    			<div class="banner_login_block">
    				<div class="banner_login_logo">
    					<div class="banner_login_logoimg">
    						<img src="newindex/touxiang2.png" alt="头像" title="头像"/>
    					</div> 
    					<div class="banner_login_logotext">会员登录</div>
    				</div>
	    			<form action="/Yqwan/login.do" method="post" id="form">
	    				<div class="banner_login_input">
	    					<span>账号：</span>
	    					<input type="text" name="username" id="username"/><br>
	    					<span style="color:red;position:relative;left:45px;" id="usernametext"></span>
	    				</div>
	    				<div class="banner_login_input" style="margin-top:15px;">
	    					<span>密码：</span>
	    					<input type="password" name="password" id="password"/><br>
	    					<span style="color:red;position:relative;left:45px;" id="passwordtext"></span>
	    				</div>
	    				<div class="banner_login_auto">
	    					<input type="checkbox"/>
	    					<span>下次自动登录</span>
	    				</div>
	    				<div class="banner_login_button"><input type="button" value="立即登录" id="button"/></div>
	    			</form>
    				<div class="banner_login_regist">
    					<span><a href="/Yqwan/toRegistOne.do" target="_blank">立即注册</a></span>
    					<span><a href="/Yqwan/forgetOne.jsp" target="_blank">忘记密码</a></span>
    				</div>
    			</div>
    			<div class="banner_islogin_block">
    				<div class="banner_login_logo">
    					<div class="banner_login_logoimg">
    						<img src="newindex/touxiang2.png" alt="头像" title="头像"/>
    					</div>
    					<div class="banner_login_logotext">会员登录</div>
    				</div>
    				<div class="banner_islogin_block_inform">
    					<span>欢迎您,</span>
    					<span>${user.userid } </span>
    					<span id="index_logout">[退出]</span>
    					<div class="banner_islogin_block_inform_gb"><span>G币:</span><span> ${user.gb }</span></div>
    				</div>
    				<div class="banner_islogin_block_threebutton">
    					<div><a href="/Yqwan/tomember.do" target="_blank">个人中心</a></div>
    					<div><a href="/Yqwan/forgetOne.jsp" target="_blank">修改密码</a></div>
    					<div><a href="/Yqwan/recharge.do"target="_blank">充值中心</a></div>
    				</div>
    				<div class="banner_islogin_block_recommend">
    					<div class="banner_islogin_block_recommend_text">推荐服务器:</div>
    					<c:forEach items="${neigou}" var="a" begin="0" end="1">
							<div class="banner_islogin_block_recommend_game" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
	    						<div class="banner_islogin_block_recommend_game_img">
	    							<img src="http://www.199y.com/picture/yqwan/${a.mainpicture }" alt="${a.gamename }" title="${a.gamename }" width=36 height=36/>
	    						</div>
	    						<span>${fn:substring(a.gamename,0,6)}</span>
	    						<span>${fn:substring(a.gameregion,0,7)}</span>
    						</div>
						</c:forEach>
    				</div>
    			</div>
    		</div>
    		<div class="banner_pic">
	    		<div class="grid">
	    			<div id="kv" class="kv box-shadow1" role="article" style="width:840px; margin:0 auto;">
		                <ul class="kv-img-wrap">
		                    <c:forEach items="${threebanner}" var="a" varStatus="abc">
		                    	<c:if test="${abc.index == 0}">
		                        <li class="kv-img-item active" style="display: list-item;">
		                        </c:if>
		                        <c:if test="${abc.index >= 1}">
		                        <li class="kv-img-item" style="display: none;">
		                        </c:if>
		                        <c:if test="${curdate >= a.ddate }">
		                        	<a class="kv-img-item-a amat-kv-bg" target="_blank" title="${a.gamename }" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');" style="background:url(http://www.199y.com/picture/yqwan/${a.largegamepicture})" target="_blank" title="${a.gamename }"></a>                        
		                        </li>
		                        </c:if>
		                            
		                       <c:if test="${curdate < a.ddate }">
		                       		<a class="kv-img-item-a amat-kv-bg" target="_blank" title="${a.gamename }" onclick="javascript:window.open('http://www.199y.com/Yqwan/lookforward.jsp','_blank');" style="background:url(http://www.199y.com/picture/yqwan/${a.largegamepicture})" target="_blank" title="${a.gamename }"></a>                        
		                        </li>
		                       </c:if>
		                    </c:forEach>
		                </ul>
		                <ul class="kv-num2">
		                    <c:forEach items="${threebanner}" var="a">
		                        <li class="kv-num2-item active" style="background:url(http://www.199y.com/picture/yqwan/${a.largegamepicture}) center; background-size:cover"><a class="kv-num2-desc"><p>${a.gamename}</p></a></li>
		                    </c:forEach>
		                </ul>
		                    <a id="kv_control_left" class="kv-control left" role="button" title=""><span class="ico ico-kv-control-left f-block">上一页</span></a>
		                    <a id="kv_control_right" class="kv-control right" role="button" title=""><span class="ico ico-kv-control-rig f-block">下一页</span></a>   
					</div>
				</div>	
    		</div>
    	</div>
    	<div class="gametype">
    		<div class="gametype_left"> 
    			<div>
    				<img src="newindex/list1.png" alt="新游" title="新游"/>
    				<span>新游</span>
    			</div>
    			<div>
    				<img src="newindex/list2.png" alt="热门" title="热门"/>
    				<span>热门</span>
    			</div>
    			<div>
    				<img src="newindex/list3.png" alt="单机" title="单机"/>
    				<span>单机</span>
    			</div>
    			<div>
    				<img src="newindex/list4.png" alt="页游" title="页游"/>
    				<span>页游</span>
    			</div>
    		</div>
    		<div class="gametype_right" >
    			<div class="gametype_right_top" id="gametype_right_top">
    			
	    			<c:forEach items="${listnewgame}" var="a" begin="0" end="8">
		    	<c:choose>
		    				<c:when test="${a.isrecommend=='是'}">
		    					<div onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
			    					<img src="http://www.199y.com/picture/yqwan/${a.mainpicture}" alt="${a.gamename }" title="${a.gamename }" width=60 height=60/>
			    					<span class="neigou">${fn:substring(a.gamename,0,6)}</span>
	    						</div>
		    				</c:when>
		    				<c:otherwise>
		    					<div onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
			    					<img src="http://www.199y.com/picture/yqwan/${a.mainpicture}" alt="${a.gamename }" title="${a.gamename }" width=60 height=60/>
			    					<span>${fn:substring(a.gamename,0,6)}</span>
	    						</div>
		    				</c:otherwise> 
		    			</c:choose> 
					</c:forEach> 				
    			</div>
    			<div class="gametype_right_bottom" id="gametype_right_bottom">
    				<c:forEach items="${listnewgame}" var="a" begin="9" end="26">  				
    					<c:choose>
		    				<c:when test="${a.isrecommend=='是'}">
		    					<div class="neigou" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">${fn:substring(a.gamename,0,7)}</div>
		    				</c:when>
		    				<c:otherwise>
		    					<div onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">${fn:substring(a.gamename,0,7)}</div>
		    				</c:otherwise>
		    			</c:choose>
					</c:forEach>
    			</div>
    		</div>
    	</div>
    	
    	
    	<div id="con3th" style="width:1150px; height:380px; margin:0 auto;">     
			<div style="width:280px; float:left;"> 
			   <div id="new_server_Container" class="mt-20 article-wrap bor-e3 new-server" data-vert="true">
                    <h3 class="t ind-section-t bor-top-rough"><span class="title-name">开服列表</span></h3>
                    <div class="c list-style1" data-prop="rollist-frame">
                        <ul id="new_server" class="f-pos-r" data-prop="rollist-wrapper" data-subs="li" style="top: 0px;">
                        	<c:forEach items="${openservice }" var="opens">
                        		<li class="list-style1-item f-cf">                    
									<div class="f-fl row-item1">
										<span><c:out value="${fn:substring(opens.ddate, 5, 16)}" /></span>
										<i class="ico ico-new-g"></i>								
									</div>                    
									<c:choose>
										<c:when test="${opens.ddate > curdate and serverid==1 }">
											<a onclick="javascript:window.open('http://www.199y.com/Yqwan/lookforword.jsp','_blank');" target="_blank" class="f-fl row-item2 f-orange" id="gwredic" title="进入${opens.gamename}官网" >${opens.gamename }</a>     
										</c:when>
										<c:otherwise>
											<a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${opens.gameid}','_blank');" target="_blank" class="f-fl row-item2 f-orange" id="gwredic" title="进入${opens.gamename}官网" >${opens.gamename }</a>     
										</c:otherwise>
									</c:choose>     
									<c:if test="${opens.ddate > curdate }">               
									<a onClick="javascript:var gamename = makePy('${opens.gamename}'); location.href='http://www.199y.com/Yqwan/lookforward.jsp'" id="game${opens.gameid }${opens.serverid}" lang="${opens.gameid }" target="_blank" class="f-fl row-item3 f-orange" title="${opens.gamename }" ><span class="jifu">${opens.gameregion }</span></a>							
									</c:if>
									<c:if test="${opens.ddate <= curdate }">               
									<a onClick="javascript:var gamename = makePy('${opens.gamename}'); location.href='http://www.199y.com/Yqwan/startgame.do?gameid=${opens.gameid}&serverid=${opens.serverid}&originalpage=game'+gamename" id="game${opens.gameid }${opens.serverid}" lang="${opens.gameid }" target="_blank" class="f-fl row-item3 f-orange" title="${opens.gamename }" ><span class="jifu">${opens.gameregion }</span></a>							
									</c:if>
								</li>
                        	</c:forEach>
						</ul>
                    </div>
                    <div class="new-server-control p-0-20">
                        <a class="f-link-h disabled" id="handl-prev" data-prop="handler-prev">上一页</a>
                        <a class="f-link-h" id="handl-next" data-prop="handler-next">下一页</a>
                    </div>
                </div>
			</div>
			<div style="width:840px; float:right;">		
				<div class="hot-game mt-20" role="article">
                    <ul class="f-cf">                 
                     <c:forEach items="${newserverbanner }" var="ns">
                     	<!-- ${ns.ddate }
                     	${curdate } -->
                     	   <c:if test="${curdate < ns.ddate}">
	                       <li class="hot-game-item box-shadow2">
	                       		<c:if test="${ns.maxserverid>1 }">
	                            <div class="hot-game-img">
	                                <a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${ns.gameid}','_blank');" target="_blank" title="进入${ns.gamename }官网" ><img src="http://www.199y.com/picture/yqwan/${ns.gamepicture}" alt="${ns.gamename }"></a>
	                                <div class="hot-game-info">
	                                    <em class="info-mask"></em>
	                                    <a onClick="javascript:var gamename = makePy('${ns.gamename}');location.href='http://www.199y.com/Yqwan/game'+gamename+'/server.jsp';" target="_blank" title="进入服务器列表" class="info-href f-fl" ><span class="ico-point f-fl"></span>服务器列表</a>
	                                    <a onClick="javascript:location.href='http://www.199y.com/Yqwan/codecentre.do?giftname='+encodeURI(encodeURI('${ns.gamename}'))+'&page=1';" target="_blank" title="领取${ns.gamename }游戏礼包" class="info-href f-fr" ><span class="ico-point f-fl"></span>领取礼包</a>                                
	                                </div>
	                            </div>
	                            <div class="hot-game-tit f-cf">
	                                <a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${ns.gameid}','_blank');" target="_blank" title="进入${ns.gamename }官网" class="game-tit-name f-orange f-h-light-gold f-fl" ><c:out value="${fn:substring(ns.gamename, 0, 6)}" /></a>
	                                <a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${ns.gameid}','_blank');" target="_blank" title="进入${ns.gamename }官网" class="btn1 btn1-yellow drop-shadow" >游戏官网</a>
	                               	
	                                <a onClick="javascript:var gamename = makePy('${ns.gamename}'); location='http://www.199y.com/Yqwan/startgame.do?gameid=${ns.gameid}&serverid=${ns.maxserverid-1}&originalpage=game'+gamename" class="btn1 btn1-orange drop-shadow" >进入新区</a>
	                            </div>
	                            </c:if>
	                            <c:if test="${ns.maxserverid==1 }">
	                            <div class="hot-game-img">
	                                <a href="http://www.199y.com/Yqwan/lookforward.jsp" target="_blank" title="进入${ns.gamename }官网" ><img src="http://www.199y.com/picture/yqwan/${ns.gamepicture}" alt="${ns.gamename }"></a>
	                                <div class="hot-game-info">
	                                    <em class="info-mask"></em>
	                                    <a href="http://www.199y.com/Yqwan/lookforward.jsp" target="_blank" title="进入服务器列表" class="info-href f-fl" ><span class="ico-point f-fl"></span>服务器列表</a>
	                                    <a href="http://www.199y.com/Yqwan/lookforward.jsp" target="_blank" title="领取${ns.gamename }游戏礼包" class="info-href f-fr" ><span class="ico-point f-fl"></span>领取礼包</a>                                
	                                </div>
	                            </div>
	                            <div class="hot-game-tit f-cf">
	                                <a href="http://www.199y.com/Yqwan/lookforward.jsp" target="_blank" title="进入${ns.gamename }官网" class="game-tit-name f-orange f-h-light-gold f-fl" ><c:out value="${fn:substring(ns.gamename, 0, 6)}" /></a>
	                                <a href="http://www.199y.com/Yqwan/lookforward.jsp" target="_blank" title="进入${ns.gamename }官网" class="btn1 btn1-yellow drop-shadow" >游戏官网</a>
	                               	
	                            	<a href="http://www.199y.com/Yqwan/lookforward.jsp" class="btn1 btn1-orange drop-shadow" >进入新区</a>
	                            </div>
	                            </c:if>
	                        </li>
	                        </c:if>
	                        <c:if test="${curdate >= ns.ddate}">
	                        <li class="hot-game-item box-shadow2">
	                            <div class="hot-game-img">
	                                <a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${ns.gameid}','_blank');" target="_blank" title="进入${ns.gamename }官网" ><img src="http://www.199y.com/picture/yqwan/${ns.gamepicture}" alt="${ns.gamename }"></a>
	                                <div class="hot-game-info">
	                                    <em class="info-mask"></em>
	                                    <a onClick="javascript:var gamename = makePy('${ns.gamename}');location.href='http://www.199y.com/Yqwan/game'+gamename+'/server.jsp';" target="_blank" title="进入服务器列表" class="info-href f-fl" ><span class="ico-point f-fl"></span>服务器列表</a>
	                                    <a onClick="javascript:location.href='http://www.199y.com/Yqwan/codecentre.do?giftname='+encodeURI(encodeURI('${ns.gamename}'))+'&page=1';" target="_blank" title="领取${ns.gamename }游戏礼包" class="info-href f-fr" ><span class="ico-point f-fl"></span>领取礼包</a>                                
	                                </div>
	                            </div>
	                            <div class="hot-game-tit f-cf">
	                                <a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${ns.gameid}','_blank');" target="_blank" title="进入${ns.gamename }官网" class="game-tit-name f-orange f-h-light-gold f-fl" ><c:out value="${fn:substring(ns.gamename, 0, 6)}" /></a>
	                                <a onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${ns.gameid}','_blank');" target="_blank" title="进入${ns.gamename }官网" class="btn1 btn1-yellow drop-shadow" >游戏官网</a>
	                               	
	                                <a onClick="javascript:var gamename = makePy('${ns.gamename}'); location='http://www.199y.com/Yqwan/startgame.do?gameid=${ns.gameid}&serverid=${ns.maxserverid}&originalpage=game'+gamename" class="btn1 btn1-orange drop-shadow" >进入新区</a>
	                            </div>
	                        </li>	
	                        </c:if>
                        </c:forEach>
                     </ul>
                </div>
			</div>
		</div>
		
		<div class="addetail">
			<div class="toprank">
				<div class="toprank_text">
					<span id="toprank_reyou">热游排行</span>
					<span>丨</span>
					<span id="toprank_resou">热搜榜单</span>
				</div>
				<div class="toprank_gamelist" id="toprank_gamelist">
					<div style="width:616px;height:100%;position:relative;" id="toprank_gamelist_demo">	
						<div style="width:308px;float:left">			
							<c:forEach items="${listhot}" var="a" begin="0" end="15" varStatus="vs">					
								<div class="toprank_gamelist_game">
									<div>${vs.count}</div>
									<div><img alt="${a.gamename}" src="http://www.199y.com/picture/yqwan/${a.toppicture }" width='120' height='70'></div>
									<div>${fn:substring(a.gamename,0,6)}</div>
									<div>${a.roletype}</div>
									<div onclick="javascript:window.open('gameinfo.do?gameid=${a.gameid}','_blank');">进入游戏</div>
								</div>
							</c:forEach>
						</div>
						<div style="width:308px;float:left">
							<c:forEach items="${listresou}" var="a" begin="0" end="15" varStatus="vs">					
								<div class="toprank_gamelist_game">
									<div>${vs.count}</div>
									<div><img alt="${a.gamename}" src="http://www.199y.com/picture/yqwan/${a.toppicture }" width='120' height='70'></div>
									<div>${fn:substring(a.gamename,0,6)}</div>
									<div>${a.roletype}</div>
									<div onclick="javascript:window.open('gameinfo.do?gameid=${a.gameid}','_blank');">进入游戏</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="lotsnews">
	    		<div class="lotsnews_topright">
	    			<div class="morenews">
	    				<span>游戏公告</span>
	    				<span onclick="javascript: window.open('/Yqwan/toNews.do','_blank');">更多 <img src="newindex/more_s.png"/></span>
	    			</div>
	    			<img src="newindex/xiah1.png"/>
	    			<div class="lotsnews_topright_list">
	    				<c:forEach items="${news}" var="a" begin="0" end="14">
							<div class="lotsnews_topright_new" onclick="javascript: window.open('/Yqwan/newsinfo.do?newsid=${a.newsid}','_blank');">
		    					<strong>·</strong>
		    					<span>${a.description }</span>
		    					<span>${fn:substring(a.date,5,11)}</span>
	    					</div>
						</c:forEach> 				
	    			</div>
	    		</div>
	    		<div class="lotsnews_topleft">
	    			<div class="morenews">
	    				<span>游戏攻略</span>
	    				<span onclick="javascript: window.open('/Yqwan/toNews.do','_blank');">更多 <img alt="更多" src="newindex/more_s.png"/></span>
	    			</div>
	    			<img src="newindex/xiah1.png"/>
	    			<div class="lotsnews_topleft_detail">
	    				<c:forEach items="${glnews}" var="a" begin="0" end="4">
							<div class="lotsnews_topleft_detail_new" onclick="javascript: window.open('/Yqwan/newsinfo.do?newsid=${a.newsid}','_blank');">
		    					<img src="${a.indexpicture}" width=121 height=70 title="${a.title}" alt="${a.title }"/>
		    					<div>
		    						${fn:substring(a.description,0,60)}
		    					</div>
	    					</div>
						</c:forEach>
	    			</div>
	    		</div>
	    		<div class="refresh_list">
		    		<div class="morerefresh">
		    			<span>最新活动</span>
		    		</div>
	    			<div class="refresh_list_neigou">
	    				<div class="refresh_list_neigou_twogame">
	    					<div class="grid">
		    					<c:forEach items="${neigou}" var="a" begin="0" end="2">
									<figure class="effect-sarah">
										<img src="http://www.199y.com/picture/yqwan/${a.indexpicture }" width=260 height=179 alt="${a.gamename }" title="${a.gamename }"/>
										<figcaption>
											<h2>${fn:substring(a.gamename,0,10)}</h2>
											<p>${fn:substring(a.descrip,0,30)}</p>
											<a href="###" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">View more</a>
										</figcaption>			
									</figure>
								</c:forEach>
							</div>
	    				</div>	    				
	    			</div>	    			
	    		</div>
			</div>
		</div>
		
		
		
<%--    <div class="addetail">
	    	<div class="toprank">
	    		<div class="toprank_ad">
	    			<div id="demo3" class="slideBox">
				 		 <ul class="items" id="items1">
				 			<c:forEach items="${neigou}" var="a" begin="0" end="4">
						    	<li><a href="###" title="${a.gamename }" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');" ><img src="http://www.199y.com/picture/yqwan/${a.indexpicture }" alt="${a.gamename }" title="${a.gamename }" width=260 height=198></a></li>
							</c:forEach>			   				 	
				  		</ul>
					</div>
	    		</div>
	    		<div class="toprank_allgame">
		    		<c:forEach items="${listhot}" var="a" begin="0" end="6">
				    	<div class="toprank_game" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
			    			<div class="toprank_game_img">
			    				<img src="http://www.199y.com/picture/yqwan/${a.mainpicture }" alt="${a.gamename }" title="${a.gamename }" width=56 height=56/>
			    			</div>
			    			<span>${fn:substring(a.gamename,0,8)}</span>
			    			<span>进入游戏</span>
	    				</div>
					</c:forEach>		
	    		</div>    		
	    	</div>   
	    	<div class="lotsnews">
	    		<div class="lotsnews_topleft">
	    			<div class="morenews">
	    				<span>近期新闻</span>
	    				<span onclick="javascript: window.open('/Yqwan/toNews.do','_blank');">更多 <img alt="更多" src="newindex/more_s.png"/></span>
	    			</div>
	    			<img src="newindex/xiah1.png"/>
	    			<div class="lotsnews_topleft_detail">
	    				<c:forEach items="${news}" var="a" begin="0" end="2">
							<div class="lotsnews_topleft_detail_new" onclick="javascript: window.open('/Yqwan/newsinfo.do?newsid=${a.newsid}','_blank');">
		    					<img src="${a.indexpicture}" width=121 height=70 title="${a.title}" alt="${a.title }"/>
		    					<div>
		    						${fn:substring(a.description,0,60)}
		    					</div>
	    					</div>
						</c:forEach>
	    			</div>
	    		</div>
	    		<div class="lotsnews_topright">
	    			<div class="morenews">
	    				<span>往日新闻</span>
	    				<span onclick="javascript: window.open('/Yqwan/toNews.do','_blank');">更多 <img src="newindex/more_s.png"/></span>
	    			</div>
	    			<img src="newindex/xiah1.png"/>
	    			<div class="lotsnews_topright_list">
	    				<c:forEach items="${news}" var="a" begin="3" end="10">
							<div class="lotsnews_topright_new" onclick="javascript: window.open('/Yqwan/newsinfo.do?newsid=${a.newsid}','_blank');">
		    					<strong>·</strong>
		    					<span>${a.description }</span>
		    					<span>${fn:substring(a.date,5,11)}</span>
	    					</div>
						</c:forEach> 				
	    			</div>
	    		</div>
	    		<div class="refresh_list">
		    		<div class="morerefresh">
		    			<span>更新列表</span>
		    		</div>
	    			<img src="newindex/xiah2.png"/>
	    			<div class="refresh_list_games">
	    				<div id="demo2" class="slideBox">
				 			<ul class="items" id="items">
				 			<c:forEach items="${neigou}" var="a">
								<li><a href="###" title="${a.gamename }" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');" ><img src="http://www.199y.com/picture/yqwan/${a.indexpicture }" width=335 height=256></a></li>
							</c:forEach>	
				  			</ul>
						</div>
	    			</div>
	    			<div class="refresh_list_neigou">
	    				<div class="refresh_list_neigou_twogame">
	    					<div class="grid">
		    					<c:forEach items="${neigou}" var="a" begin="0" end="1">
									<figure class="effect-sarah">
										<img src="http://www.199y.com/picture/yqwan/${a.indexpicture }" width=235 height=179 alt="${a.gamename }" title="${a.gamename }"/>
										<figcaption>
											<h2>${fn:substring(a.gamename,0,10)}</h2>
											<p>${fn:substring(a.descrip,0,30)}</p>
											<a href="###" onclick="javascript:window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">View more</a>
										</figcaption>			
									</figure>
								</c:forEach>								
							</div>
	    				</div>
	    				<div class="refresh_list_neigou_sixnews">
		    				<c:forEach items="${news}" var="a" begin="11" end="16">
		    					<div onclick="javascript: window.open('/Yqwan/newsinfo.do?newsid=${a.newsid}','_blank');">
		    						${a.title}
		    					</div>
							</c:forEach>
	    				</div>
	    			</div>
	    			<div class="adbanner" onclick="javascript:window.open('http://bsypt.199y.com','_blank');">
	    				<img src="newindex/banner.jpg"/>
	    			</div>
	    		</div>
	    	</div> 	
    	</div> --%>
    	<div class="bontique">
	    	<div class="morebontique">
		    	<span>精品游戏</span>
	    		<span onclick="javascript:window.open('/Yqwan/moregame.do?num=1&gametype='+encodeURI(encodeURI('精品游戏')),'_blank');">更多 <img src="newindex/more_s.png"/></span>
		    </div>
		    <img src="newindex/xiah3.png"/>
		    <div class="bontique_allgames">
		    	<c:forEach items="${boutique}" var="a">
			    	<div class="bontique_games" onclick="javascript: window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
				    	<div class="bontique_games_img"><img src="http://www.199y.com/picture/yqwan/${a.mainpicture}" height=75 width=75/></div>
				    	<div class="bontique_games_gamename">
				    		${fn:substring(a.gamename,0,5)}
				    	</div>
				    	<div class="bontique_games_detail">
				    	${fn:substring(a.descrip,0,12)}
				    	</div>
				    </div>
				</c:forEach>   
		    </div>
	    </div>
	    
	    <div class="commentbottomad">
	    	<div class="comment">
	    	<div class="morebontique">
		    	<span>热门讨论</span>
		    </div>
		    <img src="newindex/xiah4.png"/>
		    <c:forEach items="${comment}" var="a">
			    <div class="commentlist" onclick="javascript: window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
				    <strong>·</strong>
				    <div class="comment_gamename">[${fn:substring(a.gamename,0,5)}]</div>
				    <div class="comment_detail">${a.content }</div>
				  	<div class="comment_date">${fn:substring(a.date,0,10)}</div>
		  		</div>
			</c:forEach> 	  	
	    </div>
	    <div class="bottomad">
	    	<c:forEach items="${news}" var="a" begin="15" end="17">
			    <div class="bottomad_list" onclick="javascript: window.open('/Yqwan/newsinfo.do?newsid=${a.newsid}','_blank');">
		    		<div class="bottomad_list_img">
		    			<img src="${a.indexpicture}" width='98' height='50'/>
		    		</div>
		    		<div class="bottomad_list_title">
		    			${a.description}
		    		</div>
	    		</div>
			</c:forEach>	    	
	    </div>
	    </div>    
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
    
    <!-- 首页弹出广告位 
	<div id="adcenter" onclick="javascript:window.open('http://sgzn.199y.com','_blank')" style="z-index:9999;cursor:pointer;position:fixed;top:150px;left:50%;margin-left:-600px;width:1200px;height:750px;background:url(http://www.199y.com/picture/yqwan/201608/sgznindex.png) no-repeat;">
	</div>
	<div id="adclose" style="cursor:pointer;position:fixed;top:160px;left:50%;margin-left:580px;color:#fff;z-index:10000;font-size:16px">X关闭</div>
	<div class="backgr"></div>-->
	
	<!-- 首页两侧广告位 -->
	<div id="adleft1" style="background:url(http://www.199y.com/picture/yqwan/201609/indexbg_z.png) no-repeat;height:400px;width:200px;margin-left:-800px;position:fixed;top:325px;left:50%;cursor:pointer;" onclick="javascript:window.open('http://www.199y.com/Yqwan/startgame.do?gameid=60000047&serverid=1&originalpage=gameH5H','_blank')"></div>
	<div id="adright1" style="background:url(http://www.199y.com/picture/yqwan/201609/hongbao.png) no-repeat;height:400px;width:200px;margin-left:600px;position:fixed;top:325px;left:50%;cursor:pointer;" onclick="javascript:window.open('http://www.199y.com/Yqwan/recharge.do','_blank')"></div>
	<div id="hongbao" style="background:url() no-repeat;background-size:contain;height:10px;width:10px;position:fixed;top:85px;left:0px;cursor:pointer;" onclick="javascript:window.open('http://www.199y.com/Yqwan/recharge.do','_blank')"><img src="http://www.199y.com/picture/yqwan/201609/hongbao.gif" width=100% height=100%/></div>
<!--<div class="h"></div>
	<div class="x1">X</div>
	<div class="lrpa">
				  <div class="x2">X</div>
				  <div class="x3">X</div>
				  <object class="r" width="240" height="600" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="flash_obj" id="flash_obj">
					<param value="index/shupaiguanggao.swf" name="movie">
					<param value="high" name="quality">
					<param value="transparent" name="wmode">
					<param value="6.0.65.0" name="swfversion">
					<param value="always" name="allowScriptAccess">
					<param name="FlashVars" value="">
					
					
					<object width="240" height="600" data="index/shupaiguanggao.swf" type="application/x-shockwave-flash">
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
				  <object class="l" width="240" height="600" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="flash_obj" id="flash_obj">
					<param value="index/shupaiguanggao.swf" name="movie">
					<param value="high" name="quality">
					<param value="transparent" name="wmode">
					<param value="6.0.65.0" name="swfversion">
					<param value="always" name="allowScriptAccess">
					<param name="FlashVars" value="">
					 
					
					<object width="240" height="600" data="index/shupaiguanggao.swf" type="application/x-shockwave-flash">
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
		</div>   
    <object class="swf1" width="450" height="220" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="flash_obj" id="flash_obj">
						<param value="index/xsqst.swf" name="movie">
						<param value="high" name="quality">
						<param value="transparent" name="wmode">
						<param value="6.0.65.0" name="swfversion">
						<param value="always" name="allowScriptAccess">
						<param name="FlashVars" value="">
						
						
						<object class="swf1" width="450" height="220" data="index/xsqst.swf" type="application/x-shockwave-flash">
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
				  </object>--> 
    
    
  </body>
<link href="<%=request.getContextPath()%>/newindex/index.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/newindex/lb.platform.base.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.md5.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/newindex/index.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/newindex/xyjiuealie.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/index/slider/js/jquery.slideBox.js" type="text/javascript"></script>
		
<script>
/*jQuery(function($){
	$('#demo3').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10
	});
	$('#demo2').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : true,//不自动隐藏点选按键
		clickBarRadius : 10
	})	
});*/

</script>
<script type="text/javascript">
$(function(){
	$('#handl-prev').css('color','#ddd');
	$("#handl-prev").click(function(){
		$(this).css('color','#ddd').addClass("disabled").siblings("a").removeClass("disabled");
		$('#handl-next').css('color','#474849');
		$("#new_server").animate({top:"0px"});
	});
	$("#handl-next").click(function(){
		$(this).css('color','#ddd').addClass("disabled").siblings("a").removeClass("disabled");
		$('#handl-prev').css('color','#474849');
		$("#new_server").animate({top:"-280px"});
	});
	
	$('#adclose').click(function(){
		$('#adcenter,.backgr,#adclose').css('display','none');
	})

//	var w = $(window).width();
//	var width1 = w/2-600;
//	$('#adleft1').css('width',width1+'px').css('margin-left',-600-width1+"px");
//	$('#adright1').css('width',width1+'px').css('margin-left','600px');
});
</script>

</html>
