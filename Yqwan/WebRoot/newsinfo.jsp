<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0045)http://www.mofang.com/omei/1150-616141-1.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">

    
    <!--[if !IE]><!-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--<![endif]-->
    
    <title>${newsinfo.title}-199y游戏网</title>

    <meta name="keywords" content="${newsinfo.title}">

    <meta name="description" content="${newsinfo.title}">

        
   <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">


    

    

    
                
        
<link rel="stylesheet" type="text/css" href="newsinfo/pack_common_c24b4cb.css">
<link rel="stylesheet" type="text/css" href="newsinfo/show_article_8d5e0b3.css">
<link rel="stylesheet" type="text/css" href="newsinfo/widget_list_12a6fb5.css">
<link rel="stylesheet" type="text/css" href="newsinfo/pop_box_f45db00.css">
</head>

<body>

    
<div class="page">
<jsp:include page="head.jsp"/>
    <div class="out-con clearfix">
        
<style>
	.screen-AD{position: absolute;left: 0px;top: 0px;width: 100%;min-width: 1280px;height: auto;overflow: hidden;}
	.screen-AD .mofang-ad{width: 100%;position: relative;}
	.screen-AD .mofang-ad .mofang-ad-con{position: absolute;top: 100px;left: 50%;margin-left: -600px;display: block;width: 1200px;}
	.screen-AD .mofang-ad img{width: 100%;height: auto;display: block;margin: 0 auto;}
</style>

<div class="screen-AD">
  <div class="mofang-ad">
    <img src="newsinfo/20160411031428919.jpg" height="1066" width="1920" alt="" style="margin:0 auto">
  </div>
</div>        
<div class="arc-wrapper" style="margin-top: 100px;">
        <p class="arc-horn"><img src="newsinfo/article_horn_c9fba66.png"></p>
        <div class="arc-con">
            <div class="arc-con-title">
                <h1>${newsinfo.title }</h1>
                <p class="arc-title-crumbs">
                                            <a target="_blank" sl-processed="1"><img src="newsinfo/getuseravatar" alt="Innocent" class="arc-crumbs-photo"></a>
                        <a sl-processed="1"><span class="arc-crumbs-author">${newsinfo.author }</span></a>
                                        <span class="arc-crumbs-date">发表于：${newsinfo.date }</span>
                    <span class="arc-crumbs-from">来源：${newsinfo.origin }</span>
                </p>
            </div>
            
            <div class="arc-con-article clearfix">
                <div class="arc-article-left l">
 					<div class="arc-article-detail contte">
                        　　			${newsinfo.content }
                    </div>
                    
                    
                </div>
                

                <div class="arc-article-right s-conr ">  
                    <div class="arc-right-game">
                        <h3 class="arc-title-special"><a href="moregame.do?gametype=%25E7%25B2%25BE%25E5%2593%2581%25E6%25B8%25B8%25E6%2588%258F&num=1" target="_blank" class="arc-right-more" sl-processed="1">更多<s class="icon-more"></s></a>精品游戏</h3>
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
		</div>
   </div>
</div>
   
<script type="text/javascript">
    		$(function(){
    			var content=$(".contte").html();
  			    var content1 = content.replace(/@/g,"&").replace(/nowrap/g,"null");
  				$(".contte").html(content1);;
        	});
    	</script>
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
</body>
</html>