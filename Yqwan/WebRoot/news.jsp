<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
    <!--[if !IE]><!-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--<![endif]-->
    <title>新闻</title>

    <meta name="keywords" content="">
    <meta name="description" content="">
	 
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">  
		
		<link rel="stylesheet" type="text/css" href="news/list_per_arc_f164d71.css">
		<link rel="stylesheet" type="text/css" href="news/list_article_c74ccd2.css">
		<link rel="stylesheet" type="text/css" href="news/widget_list_12a6fb5.css">
		<link rel="stylesheet" type="text/css" href="news/pop_box_f45db00.css">
<!--	<script type="text/javascript" src="news/sea_a7e0084.js"></script>
		<script type="text/javascript" src="news/sea-config_c35bbbb.js"></script>  -->	
		
		

	</head>

<body>  
<div class="page">
	<jsp:include page="head.jsp"/>
	<div class="out-con clearfix">
                <div class="public-wrapper">
        <div class="public-info-bg list-info-bg">
            <div class="public-info list-info">
                <p class="list-info-type"></p>
            </div>
        </div> 
        <div class="public-con-wrapper">
            <div class="public-con clearfix">
                <div class="l public-con-left list-con-left">
                	<div class="lefttype" id="lefttype">
                		<div id="gonggao">游戏公告</div>
                		<div id="gonglue">游戏攻略</div>
                		<div id="huodong">最新活动</div>
                	</div>
                    <div class="public-tabs-wrapper list-tabs-wrapper">
                        <div class="public-tabs-con public-tabs-all show" id="public-tabs-all">
                        	<c:forEach items="${news}" var="a">
								<dl class="public-mb20">
                                        <dt class="public-tabs-pic">
                                            <a href="newsinfo.do?newsid=${a.newsid }" target="_blank"><img src="${a.indexpicture}" alt="${a.title }" title="${a.title }"></a>
                                            
                                        </dt>
                                        <dd class="public-tabs-title"><a href="newsinfo.do?newsid=${a.newsid }" target="_blank">${a.title }</a></dd>
                                        <dd class="public-tabs-word">${a.description }</dd>
                                        <dd class="public-tabs-crumbs">
                                            <span class="public-tabs-author">作者：${a.author }</span>
                                            <span class="public-tabs-date">时间：${a.date }</span>
                                        </dd>
                        		</dl>
							</c:forEach>                            
                        </div>
                    </div>
                    <div class="public-loading public-mb20"></div>
                    <p class="errtext"></p>
                    <a id="ckmore" href="javascript:void(0);" class="public-more public-mb20" data-catid="1" data-pagenum="10" data-curpage="2">查看更多</a>
                </div>
                <div class="public-con-right s-conr">
                	
                    <div class="public-right-game">
                        <h3 class="public-mb20"><a href="moregame.do?gametype=%25E7%25B2%25BE%25E5%2593%2581%25E6%25B8%25B8%25E6%2588%258F&num=1" class="public-right-more" target="_blank">更多<s class="icon-more"></s></a>推荐游戏</h3>
	                    <c:forEach items="${bontique}" var="a">
							<dl class="rec-game">
	        					<dt class="rec-game-icon">
		            				<a onclick="javascript: window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">
		            					<img src="http://www.199y.com/picture/yqwan/${a.mainpicture }" alt="${a.gamename }" title="${a.gamename}">
		            				</a>
	       						 </dt>
						        <dd class="rec-game-name">
						            <a onclick="javascript: window.open('/Yqwan/gameinfo.do?gameid=${a.gameid}','_blank');">${a.gamename}</a>
						            <span style="display:none;width:65px;height:30px;">
						               
						            </span>
						        </dd>
	        					<dd class="rec-game-desc">${fn:substring(a.descrip,0,20)}</dd>     
			        			<dd class="rec-game-keywords">
			                    	<a onclick="javascript: window.open('/Yqwan/moregame.do?num=1&gametype='+encodeURI(encodeURI('${a.gametype}')),'_blank');">${a.gametype}
			                    		</a>
				                    <a onclick="javascript: window.open('/Yqwan/classifymoregame.do?num=1&placetype=${a.placetype}&roletype='+encodeURI(encodeURI('${a.roletype}')),'_blank');">
				  						${a.roletype}</a>			  							  							
			                    </dd>
    						</dl>
						</c:forEach>
                    </div> 
                    <div class="public-right-welfare">
                        <h3 class="public-mb20"><a href="codecentre.do" class="public-right-more" target="_blank">更多<s class="icon-more"></s></a>最新福利</h3>
                         <c:forEach items="${gift}" var="a">
                        	 <p class="public-welfare-list"><a href="giftDetail.do?id=${a.id }" target="_blank"><span>领取</span>${a.giftname }</a></p>
                         </c:forEach>
	       
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>
    

    
    
        
<!-- 弹出框开始 -->
<!-- 遮罩层开始 -->
<!-- <div class="mask-bg">
    
</div> -->
<!-- 遮罩层结束 -->
<jsp:include page="foot.jsp"></jsp:include> 
		
	<style type="text/css">
		
		.footauto{
			margin-top:45px;
		}
		.footinfo span{
			padding-top:4px;
			
		}
		.footultext{
			padding-top:53px;
		}
		</style>
<!--	<style type="text/css">
		#head_news{
			background-color:#1182e5;
			color:white;
			text-decoration:none;
			display:block;
			width:75px;
			height:85px;	
		}
		.footulpic{
			margin-left:40px;
			margin-top:16px;
		}
		.footultext{
			margin-left:80px;	
			margin-top:17px;
		}
		.foot>span{
			font-size:13px;
		}
		.footinfo span:nth-child(1){
			margin-top:25px;
		}
		.footinfo a {
		    color: #8d8f8f;
		    text-decoration: none;
		}
		</style>  -->
	</body>
<link rel="stylesheet" type="text/css" href="news/pack_common_c24b4cb.css">
<script type="text/javascript" src="news/news.js"></script>
</html>