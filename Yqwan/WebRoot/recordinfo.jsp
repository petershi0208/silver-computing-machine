<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>专辑-199y游戏</title>  
   		<meta name="keywords" content="专辑,游戏专辑">
   		<meta name="description" content="199y游戏专辑">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/record/record.css"/>
		<script src="<%=request.getContextPath()%>/record/jquery-1.4.3.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/record/record.js" type="text/javascript"></script>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"/>
    	<div class="recordbg"></div>
    	<div class="banner"></div>
   		<div class="infobanner">
   		<section id="rt-showcase-surround">
		    <div id="rt-showcase" class="slider-container rt-overlay-dark">
		        <div class="rt-container slider-container">
		            <div class="rt-grid-12 rt-alpha rt-omega">
		                
		                <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/record/style.css"/>
		                <!--[if IE]><link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/record/ie.css"/><![endif]-->
		                <!--[if lte IE 9]><script src="<%=request.getContextPath()%>/record/ie.js" type="text/javascript"></script></script><![endif]-->
		
		                <div class="csslider1 autoplay">
		                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_0" type="radio" class="cs_anchor slide">
		                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_1" type="radio" class="cs_anchor slide">
		                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_2" type="radio" class="cs_anchor slide">
		                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_3" type="radio" class="cs_anchor slide">
		                    <input name="cs_anchor1" autocomplete="off" id="cs_play1" type="radio" class="cs_anchor" checked>
		                    <input name="cs_anchor1" autocomplete="off" id="cs_pause1" type="radio" class="cs_anchor">
		                    <ul>
		                        <div style="width: 100%; visibility: hidden; font-size: 0px; line-height: 0;">
		                            <img src="http://www.199y.com/picture/yqwan/${record.banner}" alt="${record.name}" title="${record.name}" width='1200' height='320'/>
		                        </div>
								<li class="num0 img">
		                           	<img src="http://www.199y.com/picture/yqwan/${record.banner}" alt="${record.name}" title="${record.name}" width='1200' height='320'/>
		                        </li>
		                       
		                        <li class="num1 img">
		                            <a href="http://qst.199y.com" target="_blank"><img src="record/xiangsu.jpg" alt="像素骑士团" title="像素骑士团" /></a>
		                        </li>
		                        <li class="num2 img">
		                            <a href="http://bsypt.199y.com" target="_blank"><img src="record/baoshi.jpg" alt="宝石与爬塔" title="宝石与爬塔" /></a>
		                        </li>	
		                        <li class="num3 img">
		                            <a href="http://www.199y.com" target="_blank"><img src="record/sanguo.jpg" alt="三国之怒" title="三国之怒" /></a>
		                        </li>                    
		                    </ul>
		                    <div class="cs_description">
		                        <label class="num0">
		                            <span class="cs_title"><span class="cs_wrapper">${record.name}</span></span>
		                            
		                        </label>
		                        <label class="num1">
		                            <span class="cs_title"><span class="cs_wrapper">像素骑士团</span></span>
		                            
		                        </label>
		                        <label class="num2">
		                            <span class="cs_title"><span class="cs_wrapper">宝石与爬塔</span></span>	                            
		                        </label>
		                        <label class="num3">
		                            <span class="cs_title"><span class="cs_wrapper">三国之怒</span></span>	                            
		                        </label>
		                    </div>
		                    
		                    <div class="cs_arrowprev">
		                        <label class="num0" for="cs_slide1_0"></label>
		                        <label class="num1" for="cs_slide1_1"></label>
		                        <label class="num2" for="cs_slide1_2"></label>
		                        <label class="num3" for="cs_slide1_3"></label>
		                    </div>
		                    <div class="cs_arrownext">
		                        <label class="num0" for="cs_slide1_0"></label>
		                        <label class="num1" for="cs_slide1_1"></label>
		                        <label class="num2" for="cs_slide1_2"></label>
		                        <label class="num3" for="cs_slide1_3"></label>
		                    </div>
		                    
		                    <div class="cs_bullets">		                     
		                        <label class="num0" for="cs_slide1_0">
			                         <span class="cs_point"></span>
			                         <span class="cs_thumb"><img width='85' src="http://www.199y.com/picture/yqwan/${record.banner}" alt="${record.name }" title="${record.name }" /></span>
		                        </label>
		                        
		                        <label class="num1" for="cs_slide1_1">
		                            <span class="cs_point"></span>
		                            <span class="cs_thumb"><img width='85' src="record/xiangsu.jpg" alt="Typewriter" title="Typewriter" /></span>
		                        </label>
		                        <label class="num2" for="cs_slide1_2">
		                            <span class="cs_point"></span>
		                            <span class="cs_thumb"><img width='85' src="record/baoshi.jpg" alt="Bicycle" title="Bicycle" /></span>
		                        </label>
		                        <label class="num3" for="cs_slide1_3">
		                            <span class="cs_point"></span>
		                            <span class="cs_thumb"><img width='85' src="record/sanguo.jpg" alt="Bicycle" title="Bicycle" /></span>
		                        </label>
		                    </div>
		                </div>
		            </div>
		            <div class="clear"></div>
		        </div>
		    </div>
		</section>        <!-- /slider -->
   		</div>
   		<div class="infocenter">
   			<div class="infocenter_describe">
   			${record.describe}
   			</div>
   			<c:forEach items="${games}" var="a">
				<div class="infocenter_games">
	   				<div class="infocenter_game">
	   					<div class="infocenter_game_img">
	   						<img src="http://www.199y.com/picture/yqwan/${a.indexpicture }" width='230' height='161'/>
	   					</div>
	   					<div class="infocenter_game_detail">
	   						<div class="infocenter_game_detail_name">
	   							<div>${a.gamename}</div>
	   							<div>${a.score}分</div>
	   							<div></div>
	   						</div>
	   						<div class="infocenter_game_detail_desc">
	   							${a.detaildescripe}
	   						</div>
	   					</div>
	   					<div class="infocenter_game_start"><a href="gameinfo.do?gameid=${a.gameid}" target="_blank">开始游戏</a></div>
	   				</div>
	   			</div>
			</c:forEach>
   		</div>
   		<div class="infoc">
			<div class="infochat">
					<!--高速版-->
					<div id="SOHUCS" sid="${record.id}"></div>
					<script charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/changyan.js" ></script>
					<script type="text/javascript">
						window.changyan.api.config({
						appid: 'cyspwWHlh',
						conf: 'prod_dc1fe799c2edfedc580b4fc30882fbf0'
					});
				</script>
			</div>
		</div>		   		
   		
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>
