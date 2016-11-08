<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="//hm.baidu.com/hm.js?35598d4b0b1bf60863375bfd5cef6e80"></script><script src="//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475"></script><script src="index_files/hm_002.js"></script><script src="index_files/hm.js"></script><script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="renderer" content="webkit">
<title>大钱财富-首页</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<meta name="keywords" content="">
<meta name="description" content="">
 <link href="<%=request.getContextPath()%>/index_files/ligerui-all.css" rel="stylesheet" type="text/css">
 <link href="file:///D:/Documents/%E5%A4%A7%E9%92%B1/%E9%9B%B6%E7%94%A8%E8%B4%B7-%E9%87%8D%E4%BF%A1%28ZHONGXIN%29%E9%87%91%E8%9E%8D-P2P_files/logotitle.ico" rel="shortcut icon">
    <link href="<%=request.getContextPath()%>/index_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/index_files/jquery-1_003.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/index_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/js/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/index_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/index_files/ligerDialog.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/index_files/jquery-1.js" type="text/javascript"></script><!-- 客服联动-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/jquery-1_002.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/jquery.js"></script>



<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/index_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/index_files/jquery_004.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/index_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/index_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/index_files/WdatePicker_002.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/index_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/index_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/index_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/index_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/index_files/lrtk.htm" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/index_files/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
#li-ul li a{ font-size:15px;height:22px;line-height: 22px}
*{margin:0;padding:0;list-style:none;}
body{font-family:'MicroSoft Yahei'}
#rightButton{ position:fixed; _position:absolute; top:600px; right:0; z-index:999999; display:block;}
#right_ul{ position:relative;}
#right_qq{ background:url(<%=request.getContextPath()%>/totop/qq.png) no-repeat; width:68px; height:74px; }
#right_tel{ background: url(<%=request.getContextPath()%>/totop/02.png) no-repeat; width:68px; height:77px; }
#right_tip{  background:url(<%=request.getContextPath()%>/totop/flag_right.png) no-repeat; width:252px; height:91px; position:absolute; right:70px; top:-10px; display:none; z-index:999999; }
.flagShow_p1{ float:left; margin-left:15px; _margin-left:5px; font-size:15px; line-height:25px;}
.flagShow_p2{ float:left; margin-left:70px; _margin-left:5px; font-size:18px;  color:#FA7C00;}
.flagShow_p2 a{ display:block; margin: 20px 0 5px 12px; line-height:0;}
.flagShow_p2 span{ margin: 0 0 0 14px; }
.flag_qq{ display:none;}
#backToTop{z-index:999999; display:none;}
a.backToTop_a{  background: url(<%=request.getContextPath()%>/totop/01.png) no-repeat; width:68px; height:79px; display:block; }
a.backToTop_a:active{  background:url(<%=request.getContextPath()%>/totop/01.png) no-repeat; }
.line91{ line-height:91px; }
</style>
<script type="text/javascript">

	
	function replaceUrl(id,term,sm,productName,enables,logins){
	    var hrefs = ""; 
		if(enables==0){
			hrefs = "/webApplicationFinancialInvest/financialLogout?onLineProductTerm="+term+"&sm_sm="+sm;
		}else{
			if(logins=="1"){
				hrefs = "/webApplicationFinancialInvest/financialBuyLogin?onLineProductTerm="+term+"&sm_sm="+sm;
			}else{
				hrefs = "/webApplicationFinancialInvest/financialBuy?onLineProductTerm="+term+"&sm_sm="+sm;
			}
		}
				
		document.getElementById(id).href=hrefs;
		document.getElementById(id).innerHTML=productName;
		document.getElementById(id).title=productName;
	}
});

function disBlock(id){
	document.getElementById(id).style.display='block';
}

function disNone(id){
	document.getElementById(id).style.display='none';
}
</script>
<script src="<%=request.getContextPath()%>/js/base.js" type="text/javascript"></script>
</head>

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="<%=request.getContextPath()%>/index_files/My97DatePicker_002.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<div>
<!--右侧图标-->
<div style="right: 0px;" id="rightButton">
	<ul id="right_ul">
		<li id="right_qq" class="right_ico" show="qq" hide="tel"></li>
		<li id="right_tel" class="right_ico" show="tel" hide="qq"></li>
		<li id="right_tip" class="png">
		<p class="flagShow_p1 flag_tel">咨询电话</p>
		<p class="flagShow_p2 flag_tel line91">400-839-2088</p>
		<p class="flagShow_p1 flag_qq">咨询QQ</p>
		<p class="flagShow_p2 flag_qq">
		<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1061465170&amp;site=qq&amp;menu=yes" target="_blank">
		<img src="<%=request.getContextPath()%>/totop/qiyeQQ.png" border="0"></a> 
		</p></li>
        <li><div id="backToTop"><a href="javascript:;" onfocus="this.blur();" class="backToTop_a png"></a></div></li>
	</ul>
</div>



<script type="text/javascript">
$(document).ready(function(e) {
	$("#rightButton").css("right", "0px");
	
    var button_toggle = true;
	$(".right_ico").live("mouseover", function(){
		var tip_top;
		var show= $(this).attr('show');
		var hide= $(this).attr('hide');
		tip_top = show == 'tel' ?  65 :  -10;
		button_toggle = false;
		$("#right_tip").css("top" , tip_top).show().find(".flag_"+show).show();
		$(".flag_"+hide).hide();
		
	}).live("mouseout", function(){
		button_toggle = true;
		hideRightTip();
	});
	
	
	$("#right_tip").live("mouseover", function(){
		button_toggle = false;
		$(this).show();
	}).live("mouseout", function(){
		button_toggle = true;
		hideRightTip();
	});
	
	function hideRightTip(){
		setTimeout(function(){		
			if( button_toggle ) $("#right_tip").hide();
		}, 500);
	}
	
	$("#backToTop").live("click", function(){
		var _this = $(this);
		$('html,body').animate({ scrollTop: 0 }, 500 ,function(){
			_this.hide();
		});
	});

	$(window).scroll(function(){
		var htmlTop = $(document).scrollTop();
		if( htmlTop > 0){
			$("#backToTop").fadeIn();	
		}else{
			$("#backToTop").fadeOut();
		}
	});
});
</script>




<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 0px; height: 0px;" src="<%=request.getContextPath()%>/index_files/My97DatePicker_002.htm" border="0" scrolling="no" frameborder="0"></iframe>
</div>

<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
	
<div style="width:100%; margin:0;">
	<center>
		<jsp:include page="header.jsp"/>
	</center>
</div><nobr>

	<div class="head_pojoDiv_05"></div>
	<script type="text/javascript">
			$(document).ready(function(){
					if($("#username").val()=="" || $("#username").val() == null){
						$("#welcome_username").css("display","none");
						$("#Not_loggedin").css("display","block");
					}else if($("#username").val()!="" || $("#username").val() != null){
						$("#welcome_username").css("display","block");
						$("#Not_loggedin").css("display","none");
					}				
				});
                            

			        /*判断浏览器版本是否过低*/
					function getIEversion(){
						var b_name = navigator.appName; 
						var b_version = navigator.appVersion; 
						var version = b_version.split(";"); 
						
						if (b_name == "Microsoft Internet Explorer") { 
							var trim_version = version[1].replace(/[ ]/g, ""); 					
							if (trim_version == "MSIE8.0" || trim_version == "MSIE7.0" || trim_version == "MSIE6.0") { 
								alert("此浏览器版本过低，请到指定网站去下载相关版本。"); 
								//然后跳到需要连接的下载网站
								//window.location.href="http://windows.microsoft.com/zh-CN/internet-explorer/download-ie"; 
							}
						}
					}
					
 

				//加入收藏
				function addFavorite2() {
				     var url = window.location;
				     var title = document.title;
				     var ua = navigator.userAgent.toLowerCase();
				     if (ua.indexOf("360se") > -1) {
				         alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
				     }
				     else if (ua.indexOf("msie 8") > -1) {
				         window.external.AddToFavoritesBar(url, title); //IE8
				     }
				     else if (document.all) {
				   try{
				    window.external.addFavorite(url, title);
				   }catch(e){
				    alert("您的浏览器不支持,请按 Ctrl+D 手动收藏!");
				   }
				     }
				     else if (window.sidebar) {
				         window.sidebar.addPanel(title, url, "");
				     }
				     else {
				   alert("您的浏览器不支持,请按 Ctrl+D 手动收藏!");
				     }
				 }
				
				 
				//设为首页
				function SetHome(url){
					if (document.all) {
						document.body.style.behavior='url(#default#homepage)';
						document.body.setHomePage(url);
					}else{
						alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
					}
				}
				//借款页面跳转
				function borproduct(){
					if($("#username").val()=="" || $("#username").val() == null){
						 window.location.href = "/webApplicationLoan/borProducts";
					}else if($("#username").val()!="" || $("#username").val() != null){
					 $.ajax({ 
						        url: "/webApplicationLoanApply/borvalproduct", 
						        dataType: 'json', 
						        error : function() {
						        $.ligerDialog.question("请求异常！请联系管理员...");
							      },
				                success:function(meg){
				                if(meg.statusCode== 300){
				                 window.location.href = "/webApplicationLoanApply/borMessage?productname="+meg.message+"&statu="+meg.navTabId;
				                }else{
				                 window.location.href = "/webApplicationLoan/borProducts";
				                }
                         }
                          });
					}
				}
				
								
	</script> 
<link href="<%=request.getContextPath()%>/index_files/webIndex.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/index_files/ZX_index.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/index_files/qq.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/jquery-1_002_002.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/jquery_003.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/webIndex.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/rong.js"></script>
<script src="<%=request.getContextPath()%>/index_files/DD_belatedPNG_0.js"></script>
<script src="<%=request.getContextPath()%>/index_files/jquery-client-1.js"></script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?35598d4b0b1bf60863375bfd5cef6e80";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<script type="text/javascript">
 function b() {
	h = $(window).height(),
	t = $(document).scrollTop(),
	t > h ? $("#moquu_top").show() : $("#moquu_top").hide();
}
$(document).ready(function() {
	b(),
	$("#moquu_top").click(function() {
		$(document).scrollTop(0)
	})
}),
$(window).scroll(function() {
	b()
}); 
 
 
</script>
<script>
	DD_belatedPNG
			.fix('.flash_bar,#tit_fc1,#tit_fc2,#tit_fc3,#tit_fc4,#tit_fc5,#tit_fc6,#flashLine');
</script>
<script>
   $(function(){
     $(".gong").hide();
     $(".block-div").hide();
     $(".gong-p").click(function(){
       $(".gong").fadeIn();
       $(".block-div").fadeIn();
     });
     $(".gong-cha").click(function(){
      $(".gong").fadeOut();
      $(".block-div").fadeOut();
     })
   })
</script>
<style>
.num li {
	width: 35px;
}
body{
	margin: 0;
	padding: 0;
}
#setpage a:link, #setpage a:visited, #setpage a:hover,.current,#info{border:1px solid #DDD;background:#ffffff;display:inline-block;margin:1px;text-decoration:none;font-size:12px;width:20px;height:20px;text-align:center;line-height:19px;color:#AAA;padding:1px 2px;} 
#setpage a:hover{border:1px solid #27cbc7;background:#dff9f8;color:#27cbc7;} 
.current{border:1px solid #83E7E4;background:#DFF9F8;margin:1px;color:#27CBC7;} 
#info{width:auto;}
.gong-p{margin:0 auto;width:1000px; margin-bottom:40px;padding-left:60px;cursor: pointer;}
.gong-cha{position:absolute;top:0;right:0px}
.gong{position: absolute;top:80%;left:30%;z-index:100}
.block-div{background-color:#000;height:3000px; position:absolute;opacity: 0.5;width:100%;top:0;z-index:10}

.banner-box{min-width:1210px;height:420px;position:relative;overflow:hidden;}
.banner-box .bd{ width:100% !important;}
.banner-box .bd li .m-width {width:auto;margin:0 auto;overflow:hidden;}
.banner-box .bd li{width:100% !important;height:360px;}
.banner-box .bd li a{display:block;background-size:auto;}

.banner-btn{width:1210px;position:absolute;top:120px;left:50%;margin-left:-605px;}
.banner-btn a{display:block;width:49px;height:104px;position:absolute;top:0;filter:alpha(opacity=40);-moz-opacity:0.4;-khtml-opacity:0.4;opacity:0.4;}
.banner-box .hd {position:absolute;top:210px;left:537px;}
.banner-box .hd ul li{width:12px;height:12px;border-radius :50%;text-indent:-9999px;margin-right:20px;background:#ccc;float:left;cursor:pointer;}
.banner-box .hd ul li.on{background:#DA324D;}
</style>

<center style="background-color:#f3f4f8;margin-bottom:-30px">
<script type="text/javascript" src="<%=request.getContextPath()%>/index_files/jquery.SuperSlide.2.1.1.js"></script>
<div>
 <div id="moquu_wxin" class="moquu_wxin"><a href="" target="blanket"> </a></div>
 <div id="moquu_wshare" class="moquu_wshare"><a href=""></a></div>
 <a id="moquu_top" href="javascript:void(0)" style="display: none;"></a>
</div>
	
<div class="index_PojoDiv_09">	
	<div class="index_PojoDiv_05">			
		<div class="index_PojoDiv_08" style="text-align: left;"><a style="color: rgb(102, 102, 102);" href="index.do">首页</a> - 更多产品</div>			
			<input value="" id="isLogin" type="hidden">	
		<div style="height: auto;float: left;width: 71.7%;">
			<div class="index_product_DIV" id="main-pro">
			
			
			<c:forEach items="${aaa}" var="a">	
			<a href="<%=request.getContextPath()%>/products.do?id=${a.pid }">			
			<div id="productList02" style="margin-top:auto;">
				<div class="index_productName">
					<span style="font-family: Microsoft YaHei;font-size:18px;font-weight:bold;">
						<img src="<%=request.getContextPath()%>/index_files/xin.png" style="position:relative; top:10px; right:10px"/>${a.productname }
					</span>
					<span style="margin-left:8px;font-size:14px;">W${a.pdate }期</span>
				</div>
				<div class="annual_interest_rate">年化
					<span class="annual_interest_rate_TEXT">
						${a.yearreturn }%
					</span>
				</div>
				<div class="product_period">周期
					<span class="product_period_TEXT">${a.cycle }</span>个月
				</div>
				<div class="product_limit">总额
					<span class="product_limit_TEXT maxmoney">${a.maxmoney }</span>元
				</div>
				<div class="product_Pojo_DIV">
					<div class="product_Pojo_Img"></div>
					<div class="product_Pojo_Font_01">100%本息保障</div>
				</div>
				<div class="product_Pojo_DIV_02">
				
			
					<div style="margin-bottom: 15px">
						<div class="product_plan_01">
							<div style="width: ${a.lastmoney/a.maxmoney*100 }%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px">
							</div>
						</div>
						<div class="product_plan_TEXT">
							<span style="color:#595757;font-size:15px;"><fmt:formatNumber type="number" value="${100-a.lastmoney/a.maxmoney*100}" maxFractionDigits="2"/>%</span>
						</div>
					</div>

					<c:if test="${a.lastmoney==0 }">
					<div class="product_Btn_Img2" style="background-color:#CFCFCF;">已售完</div>
					</c:if>
					<c:if test="${a.lastmoney!=0 }">
					<div class="product_Btn_Img2" style="background-color:#0093CC;">投标</div>
					</c:if>
					<div class="product_Pojo_DIV_03"></div>
				</div>
			</div>
			</a>
			</c:forEach>
			
				<div class="currentpage">
					<div class="prepage" style="cursor: pointer;">上一页</div>
					<div class="curpage">${page }</div>
					<div class="nextpage" style="cursor: pointer;">下一页</div>
					<span class="zong">共<span class="count">${count }</span>页</span>
				</div>
			</div>			     	
					    <!-- 之前的分页<div id="setpage" style="margin: 620px auto 0;text-align: center;" ></div>  -->
		</div>
<style>
	.currentpage{line-height:24px; margin:10px auto;}
	.currentpage .zong{float:left;}
	.currentpage .curpage{border-color:#ee7d2d;color:#ee7d2d;}
	.currentpage div{cursor:pointer; float:left; width:40px; height:24px; border:1px #777 solid; color:#555; text-align:center; line-height:24px; margin-left:5px; margin-right:5px;}
	.currentpage .prepage{width:70px;}
	.currentpage .nextpage{width:70px;}
</style>
<script type="text/javascript">
$(function(){
	var curpage = parseInt($(".curpage").text());
	var count = parseInt($(".count").text());	
	for(var i=curpage+2;i>curpage;i--){
		if(i<=count){
			$(".curpage").after("<div class='page'>"+i+"</div>");
		}
	}
	for(var j=curpage-2;j<curpage;j++){
		if(j>0){
			$(".curpage").before("<div class='page'>"+j+"</div>");
		}
	}
	$(".page").click(function(){
		var page = $(this).text();
		location.href="moreproduct.do?page="+page;
	});
	$(".prepage").click(function(){
		var prepage = parseInt($(".curpage").text())-1;
		if(prepage>0){
			location.href="moreproduct.do?page="+prepage;
		}
	});
	$(".nextpage").click(function(){
		var nextpage = parseInt($(".curpage").text())+1;
		if(count>=nextpage){
			location.href="moreproduct.do?page="+nextpage;
		}
	});
});
</script>
		
		
		<div class="index_PojoDiv_10">
			<div class="medium_Div">
				<div class="home_moduleTitle">媒体报道</div>
					<div id="mediaReport" class="mediaReport_div">
						<ul>
                     		<br><br>
							<li>
								<span><img src="<%=request.getContextPath()%>/index_files/news_list.png" style="float:left;padding-left:6px;vertical-align:middle;" height="13" width="10">
								<a href="" target="_blank" title="大钱财富，未来信贷主流模式">大钱财富，未来信贷主流模式</a><br>
								</span>
							</li>
							
				    		<li>
				    			<span>
				    			<img src="<%=request.getContextPath()%>/index_files/news_list.png" style="float:left;padding-left:6px;vertical-align:middle;" height="13" width="10">
				    			<a href="" target="_blank" title="大钱金融古北分公司开业：诚信为本">大钱金融古北分公司开业：诚信为本</a><br>
				    			</span>
				   			</li>
				   			
				    		<li>
				    			<span>
				    				<img src="<%=request.getContextPath()%>/index_files/news_list.png" style="float:left;padding-left:6px;vertical-align:middle;" height="13" width="10">
				   					 <a href="" target="_blank" title="CCTV《影响力对话》：大数据下信用风险管理 "><!--CCTV《影响力对话》：大数据下信用风险管理  -->
				     				CCTV《影响力对话》：大数据下信用...</a>
				     			</span>
				     		</li>
						</ul>
				</div>
			</div> 
			<div class="dynamicState">
				<div class="home_moduleTitle">大钱动态</div>
				<div id="mediaReport" class="mediaReport_div">
					<div style="overflow: hidden; position: relative; height: 180px;" class="news-container">
					
						<ul style="position: absolute; margin: 0px; padding: 0px; top: 0px;">		
						<br>				   									
							<c:forEach items="${nlist }" var="nl" begin="0" end="10">
								<li style="margin: 0px; padding: 0px; height: 30px; display: list-item; opacity: 1;">
									<span class="dynamicState_new_Img">
									 	<img src="<%=request.getContextPath()%>/index_files/news_list.png" height="13" width="10">
									 </span> 
									<span class="dynamicState_new__Font">
										<a href="<%=request.getContextPath()%>/dynamic.do" title="${nl.title }">${nl.title }</a>
									</span> 								
								</li>
							</c:forEach>	
						</ul>
				  </div>
				</div>	
			</div> 
			<div class="index_FAQ">
            	<div class="home_moduleTitle">常见问题</div>
                <div id="mediaReport" class="mediaReport_div">
                	<div style="overflow: hidden; position: relative; height: 190px;" class="issue">
						<ul style="position: absolute; margin: 0px; padding: 0px; top: 0px;">
						 <br>                                                                                                               
							<li style="margin: 0px; padding: 0px; height: 38px; opacity: 1;">
                            	<span class="index_FAQ_Img">
                            		<img src="<%=request.getContextPath()%>/index_files/news_list.png" height="13" width="10">
                                </span>  
                                <span class="dynamicState_new__Font">
                                    <a href="<%=request.getContextPath()%>/user/commonproblem.jsp" title="如何用网银还款？">如何用网银还款？</a>
                                </span>                              
                           	</li>
                           	
                           	<li style="margin: 0px; padding: 0px; height: 38px;">
                            	<span class="index_FAQ_Img">
                            		<img src="<%=request.getContextPath()%>/index_files/news_list.png" height="13" width="10">
                                </span>  
                                <span class="dynamicState_new__Font">
                                    <a href="<%=request.getContextPath()%>/user/commonproblem.jsp" title="什么是等额本息还款法？">什么是等额本息还款法？</a>
                                </span>                               
                           	</li>
                           	
                           	<li style="margin: 0px; padding: 0px; height: 38px;">
                            	<span class="index_FAQ_Img">
                            		<img src="<%=request.getContextPath()%>/index_files/news_list.png" height="13" width="10">
                                </span>                                 
                                <span class="dynamicState_new__Font">
                                    <a href="<%=request.getContextPath()%>/user/commonproblem.jsp" title="个人信用报告查询">个人信用报告查询！</a>
                                </span>                                  
                           	</li>
                         </ul>
					</div>     
                </div>
            </div>           
		</div>
	</div>				
</div>


<script type="text/javascript">
$(document).ready(function(){

	$(".prev,.next").hover(function(){
		$(this).stop(true,false).fadeTo("show",0.9);
	},function(){
		$(this).stop(true,false).fadeTo("show",0.4);
	});
	
	$(".banner-box").slide({
		titCell:".hd ul",
		mainCell:".bd ul",
		effect:"fold",
		interTime:3500,
		delayTime:500,
		autoPlay:true,
		autoPage:true, 
		trigger:"click" 
	});

});	

var outstr1="" ;
var a=0 ;
function gotopage() {
	 $.ajax({	url : "/webApplicationFinancialInvest/findProPageShow2",
				type : 'post',
				dataType : 'json',
				success : function(message) {
					var list=message.message.list;	
					var getCurrentUser=message.message.getCurrentUser;
					for(var i=0;i<list.length;i++)
					{
					var tem=list[i].onlineProduct_name;
					var invest_term=list[i].invest_term;
					var principal=(list[i].principal+"").split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('');
					var enable=list[i].enable;
					//得到当前产品得到购买人数
					var ct=list[i].c;
					if(ct==null)
						{
						ct=0;
						}
					//得到当前产品已被购买的总额
					
					var sm=list[i].sm;

					if(sm==null)
					{
					sm=0;
					}
					else
					{
					
					//alert(sm);
					}
					if(getCurrentUser=="logout")
						{
						a=0;
						}
					else
						{
						a=1;
						}
					//没登陆用户时，访问页面且为周周乐，因为要判断页面显示为月还是星期，且这个产品目前是有效的。
					if(a==0&&list[i].onlineProduct_name=="活动标"&&enable==1)
						{		
								 invest_term=1;
								 list[i].y_interest_rate=list[i].y_interest_rate-14;
								 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuy?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'>"
								 +"<div id='productList02'   style='height:150px;'>"
								 +"<div class='index_activity'><p style=\"text-align:center;font-size:14px;align:top;\"><span style=''><img src='../../new_style/web_image/home_page/xin_shou-1.png' style='margin:15px 30%'></span><br/>"
								 +"<span style=\"color:#fff;font-size:13px;font-family:'微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\">新老用户均可参与</span><br/><span style=\"color:#fff;font-size:14px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\"></span><span style=\"color:white;font-size:13px; font-family:'微软雅黑'; padding-left:10px;display:inline-block;\">年化10%+14%赠送收益</span><br/><span style=\"color:white;display:inline-block;margin:7px\">"+
								 "每天上午十点开抢</span><br/><span style=\"color:white;display:inline-block;\">新用户还可享红包和返现</span>"
								 +"</p></div><div class='index_productName' style=\"font-size:20px;margin-left:23px;margin-top:-10px;\" >"+list[i].onlineProduct_name+"第"+list[i].onlineProduct_term+"期&nbsp;&nbsp;&nbsp;新客</div>"+
								 "<div class='index_activity_pn'></div>"
								  +"<div class='product_limit' style=\"margin-top:22px;margin-left:30px;\">总金额<br/><br/><span class='product_limit_TEXT'></span>"+principal+"元</div>"
								 +"<div class='annual_interest_rate'  style='width:100%;margin-top:-95px;margin-left:38%;'>年化<br/><div style='margin-top:10px;'><span class='annual_interest_rate_TEXT' style='font-size:25px;'>"+list[i].y_interest_rate+"%</span><span style='color:#e74c3c;'>+14<img src='../styles/web/image/financial/song.png'  /></span></div>"
								 +"</div><div class='product_period'  style=\"margin-top:-95px;margin-left:55%;\">期限<br/><br/><span class='product_period_TEXT' ></span>"+invest_term+"月</div>"
								 +"</div><div class='product_period'  style='margin-top:-100px;margin-left:62%;'>保障方式<br/><br/><span class='product_period_TEXT' ></span>100%本息保障</div>"
								   +"<div class='product_plan_01' style='margin-top:-20px;margin-left:190px;width:300px;'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT' style='margin-top:-25px;margin-left:500px;'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='activity_Btn_Img' style='margin-top:-80px;margin-left:580px;background-color:#33A1C9;padding-top:10px'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";   	          										  										  
						} 
						else if(a==1&&list[i].onlineProduct_name=="活动标"&&enable==1)
						{		
								  invest_term=1;
								  list[i].y_interest_rate=list[i].y_interest_rate-14;
								 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuyLogin?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'>"+
								 "<div id='productList02'   style='height:150px;'>"
								 +"<div class='index_activity'><p style=';text-align:center;font-size:14px;align:top;'><span style=''><img src='../../new_style/web_image/home_page/xin_shou-1.png' style='margin:15px 30%'></span><br/>"+
								 "<span style=\"color:#fff;font-size:13px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\" >新老用户均可参与</span><br/><span style=\"color:#fff;font-size:14px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\"></span><span style=\"color:white;font-size:13px; font-family:'微软雅黑'; padding-left:10px;display:inline-block;\">年化10%+14%赠送收益</span><br/><span style='color:white;display:inline-block;margin:7px'>"+
								 "每天上午十点开抢</span><br/><span style='color:white;display:inline-block;'>新用户还可享红包和返现</span>"
								 +"</p></div><div class='index_productName' style='font-size:20px;margin-left:23px;margin-top:-10px;';>"+list[i].onlineProduct_name+"第"+list[i].onlineProduct_term+"期&nbsp;&nbsp;&nbsp;新客</div>"+
								 "<div class='index_activity_pn'></div>"
								 +"<div class='product_limit' style='margin-top:22px;margin-left:30px;'>总金额<br/><br/><span class='product_limit_TEXT'></span>"+principal+"元</div>"
								 +"<div class='annual_interest_rate'  style='width:100%;margin-top:-95px;margin-left:38%;'>年化<br/><div style='margin-top:10px;'><span class='annual_interest_rate_TEXT' style='font-size:25px;'>"+list[i].y_interest_rate+"%</span><span style='color:#e74c3c;'>+14<img src='../styles/web/image/financial/song.png'  /></span></div>"
								 +"</div><div class='product_period'  style='margin-top:-95px;margin-left:55%;'>期限<br/><br/><span class='product_period_TEXT' ></span>"+invest_term+"月</div>"
								 +"</div><div class='product_period'  style='margin-top:-100px;margin-left:62%;'>保障方式<br/><br/><span class='product_period_TEXT' ></span>100%本息保障</div>"
								   +"<div class='product_plan_01' style='margin-top:-20px;margin-left:190px;width:300px;'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT' style='margin-top:-25px;margin-left:500px;'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='activity_Btn_Img'  style='margin-top:-80px;margin-left:580px;background-color:#33A1C9;padding-top:10px'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";   	          										  										  
						} 
						else if(list[i].onlineProduct_name=="活动标"&&enable==0)
						{		
								 invest_term=1;
								 list[i].y_interest_rate=list[i].y_interest_rate-14;
								 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialLogout?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm=100'>"+
								 "<div id='productList02'   style='height:150px;'>"
								 +"<div class='index_activity'><p style=';text-align:center;font-size:14px;align:top;'><span style=''><img src='../../new_style/web_image/home_page/xin_shou-1.png' style='margin:15px 30%'></span><br/>"+
								 "<span style=\"color:#fff;font-size:13px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\">新老用户均可参与</span><br/><span style=\"color:#fff;font-size:14px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;'></span><span style='color:white;font-size:13px; font-family:'微软雅黑'; padding-left:10px;display:inline-block;\">年化10%+14%赠送收益</span><br/><span style='color:white;display:inline-block;margin:7px'>"+
								 "每天上午十点开抢</span><br/><span style='color:white;display:inline-block;'>新用户还可享红包和返现</span>"
								 +"</p></div><div class='index_productName' style='font-size:20px;margin-left:23px;margin-top:-10px;';>"+list[i].onlineProduct_name+"第"+list[i].onlineProduct_term+"期&nbsp;&nbsp;&nbsp;新客</div>"+
								 "<div class='index_activity_pn'></div>"
								 +"<div class='product_limit' style='margin-top:22px;margin-left:30px;'>总金额<br/><br/><span class='product_limit_TEXT'></span>"+principal+"元</div>"
								 +"<div class='annual_interest_rate'  style='width:100%;margin-top:-95px;margin-left:38%;'>年化<br/><div style='margin-top:10px;'><span class='annual_interest_rate_TEXT' style='font-size:25px;'>"+list[i].y_interest_rate+"%</span><span style='color:#e74c3c;'>+14<img src='../styles/web/image/financial/song.png'  /></span></div>"
								 +"</div><div class='product_period'  style='margin-top:-95px;margin-left:55%;'>期限<br/><br/><span class='product_period_TEXT' ></span>"+invest_term+"月</div>"
								 +"</div><div class='product_period'  style='margin-top:-100px;margin-left:62%;'>保障方式<br/><br/><span class='product_period_TEXT' ></span>100%本息保障</div>"
								 +"<div class='product_plan_01' style='margin-top:-20px;margin-left:190px;width:300px;'><div style='width: 100%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT' style='margin-top:-25px;margin-left:500px;'><span style='color:#595757;font-size:15px;'>100%</span></div></div>"
						 +"<div class='activity_Btn_Img' style='margin-top:-40px;margin-left:570px;background-color:#CFCFCF'>已售完</div><div class='product_Pojo_DIV_03'></div></div></div></a>";   	          										  										  
						} else if(a==0&&list[i].onlineProduct_name=="新手标"&&enable==1)
						{		
								 invest_term=1;
								 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuy?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'>"
								 +"<div id='productList02'   style='height:150px;'>"
								 +"<div class='index_activity'><p style=\"text-align:center;font-size:14px;align:top;\"><span style=''><img src='../../new_style/web_image/home_page/xin_shou.png' style='margin:15px 30%'></span><br/>"
								 +"<span style=\"color:#fff;font-size:13px;font-family:'微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\">新老用户均可参与</span><br/><span style=\"color:#fff;font-size:14px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\"></span><br/><br/><span style=\"color:white;font-size:13px; font-family:'微软雅黑'; padding-left:10px;display:inline-block;\">年化10%+14%赠送收益</span><br/><span style=\"color:white;display:inline-block;margin:7px\">"+
								 "每天上午十点开抢</span><br/><span style=\"color:white;display:inline-block;\">新用户还可享红包和返现</span>"
								 +"</p></div><div class='index_productName' style=\"font-size:20px;margin-left:23px;margin-top:-10px;\" >"+"【新客翻倍收益计划】"+"第"+list[i].onlineProduct_term+"期&nbsp;&nbsp;&nbsp;新客</div>"+
								 "<div class='index_activity_pn'></div>"
								  +"<div class='product_limit' style=\"margin-top:22px;margin-left:30px;\">总金额<br/><br/><span class='product_limit_TEXT'></span>"+principal+"元</div>"
								 +"<div class='annual_interest_rate'  style='width:100%;margin-top:-95px;margin-left:38%;'>年化<br/><div style='margin-top:10px;'><span class='annual_interest_rate_TEXT' style='font-size:25px;'>"+list[i].y_interest_rate+"%</span><span style='color:#e74c3c;'>(8%+8%)</span></div>"
								 +"</div><div class='product_period'  style=\"margin-top:-95px;margin-left:55%;\">期限<br/><br/><span class='product_period_TEXT' ></span>"+invest_term+"月</div>"
								 +"</div><div class='product_period'  style='margin-top:-100px;margin-left:62%;'>保障方式<br/><br/><span class='product_period_TEXT' ></span>100%本息保障</div>"
								   +"<div class='product_plan_01' style='margin-top:-20px;margin-left:190px;width:300px;'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT' style='margin-top:-25px;margin-left:500px;'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='activity_Btn_Img' style='margin-top:-80px;margin-left:580px;background-color:#33A1C9;padding-top:10px'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";   	          										  										  
						} 
						else if(a==1&&list[i].onlineProduct_name=="新手标"&&enable==1)
						{		
								  invest_term=1;
								 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuyLogin?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'>"+
								 "<div id='productList02'   style='height:150px;'>"
								 +"<div class='index_activity'><p style=';text-align:center;font-size:14px;align:top;'><span style=''><img src='../../new_style/web_image/home_page/xin_shou.png' style='margin:15px 30%'></span><br/>"+
								 "<span style=\"color:#fff;font-size:13px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\" >新老用户均可参与</span><br/><span style=\"color:#fff;font-size:14px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\"></span><br/><br/><span style=\"color:white;font-size:13px; font-family:'微软雅黑'; padding-left:10px;display:inline-block;\">年化10%+14%赠送收益</span><br/><span style='color:white;display:inline-block;margin:7px'>"+
								 "每天上午十点开抢</span><br/><span style='color:white;display:inline-block;'>新用户还可享红包和返现</span>"
								 +"</p></div><div class='index_productName' style='font-size:20px;margin-left:23px;margin-top:-10px;';>"+"【新客翻倍收益计划】"+"第"+list[i].onlineProduct_term+"期&nbsp;&nbsp;&nbsp;新客</div>"+
								 "<div class='index_activity_pn'></div>"
								 +"<div class='product_limit' style='margin-top:22px;margin-left:30px;'>总金额<br/><br/><span class='product_limit_TEXT'></span>"+principal+"元</div>"
								 +"<div class='annual_interest_rate'  style='width:100%;margin-top:-95px;margin-left:38%;'>年化<br/><div style='margin-top:10px;'><span class='annual_interest_rate_TEXT' style='font-size:25px;'>"+list[i].y_interest_rate+"%</span><span style='color:#e74c3c;'>(8%+8%)</span></div>"
								 +"</div><div class='product_period'  style='margin-top:-95px;margin-left:55%;'>期限<br/><br/><span class='product_period_TEXT' ></span>"+invest_term+"月</div>"
								 +"</div><div class='product_period'  style='margin-top:-100px;margin-left:62%;'>保障方式<br/><br/><span class='product_period_TEXT' ></span>100%本息保障</div>"
								   +"<div class='product_plan_01' style='margin-top:-20px;margin-left:190px;width:300px;'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT' style='margin-top:-25px;margin-left:500px;'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='activity_Btn_Img'  style='margin-top:-80px;margin-left:580px;background-color:#33A1C9;padding-top:10px'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";   	          										  										  
						} 
						else if(list[i].onlineProduct_name=="新手标"&&enable==0)
						{		
								 invest_term=1;
								 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialLogout?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm=100'>"+
								 "<div id='productList02'   style='height:150px;'>"
								 +"<div class='index_activity'><p style=';text-align:center;font-size:14px;align:top;'><span style=''><img src='../../new_style/web_image/home_page/xin_shou.png' style='margin:15px 30%'></span><br/>"+
								 "<span style=\"color:#fff;font-size:13px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;\">新老用户均可参与</span><br/><span style=\"color:#fff;font-size:14px;font-family: '微软雅黑','Microsoft YaHei','Lucida Grande','Helvetica Neue',Helvetica,Arial,'Hiragino Sans GB','Hiragino Sans GB W3','Microsoft YaHei UI','WenQuanYi Micro Hei',sans-serif;'></span><br/><br/><span style='color:white;font-size:13px; font-family:'微软雅黑'; padding-left:10px;display:inline-block;\">年化10%+14%赠送收益</span><br/><span style='color:white;display:inline-block;margin:7px'>"+
								 "每天上午十点开抢</span><br/><span style='color:white;display:inline-block;'>新用户还可享红包和返现</span>"
								 +"</p></div><div class='index_productName' style='font-size:20px;margin-left:23px;margin-top:-10px;';>"+"【新客翻倍收益计划】"+"第"+list[i].onlineProduct_term+"期&nbsp;&nbsp;&nbsp;新客</div>"+
								 "<div class='index_activity_pn'></div>"
								 +"<div class='product_limit' style='margin-top:22px;margin-left:30px;'>总金额<br/><br/><span class='product_limit_TEXT'></span>"+principal+"元</div>"
								 +"<div class='annual_interest_rate'  style='width:100%;margin-top:-95px;margin-left:38%;'>年化<br/><div style='margin-top:10px;'><span class='annual_interest_rate_TEXT' style='font-size:25px;'>"+list[i].y_interest_rate+"%</span><span style='color:#e74c3c;'>(8%+8%)</span></div>"
								 +"</div><div class='product_period'  style='margin-top:-95px;margin-left:55%;'>期限<br/><br/><span class='product_period_TEXT' ></span>"+invest_term+"月</div>"
								 +"</div><div class='product_period'  style='margin-top:-100px;margin-left:62%;'>保障方式<br/><br/><span class='product_period_TEXT' ></span>100%本息保障</div>"
								 +"<div class='product_plan_01' style='margin-top:-20px;margin-left:190px;width:300px;'><div style='width: 100%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT' style='margin-top:-25px;margin-left:500px;'><span style='color:#595757;font-size:15px;'>100%</span></div></div>"
						 +"<div class='activity_Btn_Img' style='margin-top:-40px;margin-left:570px;background-color:#CFCFCF'>已售完</div><div class='product_Pojo_DIV_03'></div></div></div></a>";   	          										  										  
						} 
					//用户登陆时，访问页面且为周周乐，且这个产品目前是有效的。
					else if(a==1&&invest_term==7&&enable==1)
						{
						 invest_term=1;
						 list[i].y_interest_rate=list[i].y_interest_rate-2;
						 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuyLogin?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'><div id='productList02' style='margin-top:auto;'>"
						 +"<div class='index_productName'  ><span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'>"+list[i].onlineProduct_name+"</span><span style='margin-left:8px;font-size:14px;'>（"+list[i].onlineProduct_term+"期）</span></div>"
						 +"<div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+list[i].y_interest_rate+"</span>%"
						 +"+<span style='color: #d7000f;font-size: 23px;'>2<img src='../styles/web/image/financial/song.png'  /></span>"
						 +"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+invest_term+"</span>周</div>"
						 +"<div class='product_limit'>总额<span class='product_limit_TEXT'>"+principal+"</span>元</div>"
						 +"<div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div>"
						 /* <div class='product_Pojo_Font_02'>"+ct+"人已经加入</div> */+"</div><div class='product_Pojo_DIV_02'><div style='margin-bottom: 15px'>"
						 +"<div class='product_plan_01'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='product_Btn_Img'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";          	 	
						}
					//用户登陆时，访问页面且为其他产品。不是（周周乐），且这个产品目前是有效的。
					else if(a==1&&invest_term!=7&&enable==1)
					{
						list[i].y_interest_rate=list[i].y_interest_rate-2;
						outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuyLogin?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'><div id='productList02' style='margin-top:auto;'>"
						 +"<div class='index_productName'><span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'>"+list[i].onlineProduct_name+"</span><span style='margin-left:8px;font-size:14px;'>（"+list[i].onlineProduct_term+"期）</span></div>"
						 +"<div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+list[i].y_interest_rate+"</span>%"
						 +"+<span style='color: #d7000f;font-size: 23px;'>2</span><span ><img src='../styles/web/image/financial/song.png' /></span>"
						 +"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+invest_term+"</span>个月</div>"
						 +"<div class='product_limit'>总额<span class='product_limit_TEXT'>"+principal+"</span>元</div>"
						 +"<div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div>"
						 /* <div class='product_Pojo_Font_02'>"+ct+"人已经加入</div> */+"</div><div class='product_Pojo_DIV_02'><div style='margin-bottom: 15px'>"
						 +"<div class='product_plan_01'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='product_Btn_Img'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";          	 	
					}
					//没有用户登陆时，访问页面且为其他产品。不是（周周乐），且这个产品目前是有效的。
					else if(a==0&&invest_term!=7&&enable==1)
					{
						list[i].y_interest_rate=list[i].y_interest_rate-2;
						outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuy?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'><div id='productList02' style='margin-top:auto;'>"
						 +"<div class='index_productName' ><span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'>"+list[i].onlineProduct_name+"</span><span style='margin-left:8px;font-size:14px;'>（"+list[i].onlineProduct_term+"期）</span></div>"
						 +"<div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+list[i].y_interest_rate+"</span>%"
						 +"+<span style='color: #d7000f;font-size: 23px;'>2<img src='../styles/web/image/financial/song.png'  /></span>"
						 +"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+invest_term+"</span>个月</div>"
						 +"<div class='product_limit'>总额<span class='product_limit_TEXT'>"+principal+"</span>元</div>"
						 +"<div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div>"
						 /* <div class='product_Pojo_Font_02'>"+ct+"人已经加入</div> */+"</div><div class='product_Pojo_DIV_02'><div style='margin-bottom: 15px'>"
						 +"<div class='product_plan_01'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='product_Btn_Img'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";          	   	      		
					}
					//产品下架，不可以点进去，所有根本不要考虑下面个页面的展示，访问页面且为其他产品。不是（周周乐），且这个产品目前是下架的。
					else if(list[i].onlineProduct_name == '周周乐'&&enable==0)
					{
						 invest_term=1;
						 list[i].y_interest_rate=list[i].y_interest_rate-2;
						 outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialLogout?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm=100'><div id='productList02' style='margin-top:auto;'>"
						 +"<div class='index_productName' ><span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'>"+list[i].onlineProduct_name+"</span><span style='margin-left:8px;font-size:14px;'>（"+list[i].onlineProduct_term+"期）</span></div>"
						 +"<div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+list[i].y_interest_rate+"</span>%"
						 +"+<span style='color: #d7000f;font-size: 23px;'>2<img src='../styles/web/image/financial/song.png'   /></span>"
						 +"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+invest_term+"</span>周</div>"
						 +"<div class='product_limit'>总额<span class='product_limit_TEXT'>"+principal+"</span>元</div>"
						 +"<div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div>"
						  /* <div class='product_Pojo_Font_02'>"+ct+"人已经加入</div> */+"</div><div class='product_Pojo_DIV_02'><div style='margin-bottom: 15px'>"
						 +"<div class='product_plan_01'><div style='width: 100%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>100%</span></div></div>"
						 +"<div class='product_Btn_Img2'>已售完</div><div class='product_Pojo_DIV_03'></div></div></div></a>";          	    		
					}else if(list[i].onlineProduct_name == '周周乐'&&enable==1)
					{
					
						list[i].y_interest_rate=list[i].y_interest_rate-2;
						outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialBuy?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm="+sm+"'><div id='productList02' style='margin-top:auto;'>"
						 +"<div class='index_productName' ><span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'>"+list[i].onlineProduct_name+"</span><span style='margin-left:8px;font-size:14px;'>（"+list[i].onlineProduct_term+"期）</span></div>"
						 +"<div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+list[i].y_interest_rate+"</span>%"
						 +"+<span style='color: #d7000f;font-size: 23px;'>2<img src='../styles/web/image/financial/song.png'   /></span>"
						 +"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+invest_term+"</span>个月</div>"
						 +"<div class='product_limit'>总额<span class='product_limit_TEXT'>"+principal+"</span>元</div>"
						 +"<div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div>"
						  /* <div class='product_Pojo_Font_02'>"+ct+"人已经加入</div> */+"</div><div class='product_Pojo_DIV_02'><div style='margin-bottom: 15px'>"
						 +"<div class='product_plan_01'><div style='width: "+sm+"%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>"+sm+"%</span></div></div>"
						 +"<div class='product_Btn_Img'>立即抢购</div><div class='product_Pojo_DIV_03'></div></div></div></a>";          	   	      		
					}
					//产品下架，不可以点进去，所有根本不要考虑下面个页面的展示，访问页面且为周周乐，且这个产品目前是下架的。
					else if(invest_term!=7&&enable==0)
					{
						list[i].y_interest_rate=list[i].y_interest_rate-2;
						outstr1=outstr1 + "<a href='/webApplicationFinancialInvest/financialLogout?onLineProductTerm="+list[i].onlineProduct_term+"&sm_sm=100'><div id='productList02' style='margin-top:auto;'>"
						 +"<div class='index_productName' ><span style='font-family: Microsoft YaHei;font-size:18px;font-weight:bold;'>"+list[i].onlineProduct_name+"</span><span style='margin-left:8px;font-size:14px;'>（"+list[i].onlineProduct_term+"期）</span></div>"
						 +"<div class='annual_interest_rate'>年化<span class='annual_interest_rate_TEXT'>"+list[i].y_interest_rate+"</span>%"
						 +"+<span style='color: #d7000f;font-size: 23px;'>2<img src='../styles/web/image/financial/song.png'  /></span>"
						 +"</div><div class='product_period'>周期<span class='product_period_TEXT'>"+invest_term+"</span>个月</div>"
						 +"<div class='product_limit'>总额<span class='product_limit_TEXT'>"+principal+"</span>元</div>"
						 +"<div class='product_Pojo_DIV'><div class='product_Pojo_Img'></div><div class='product_Pojo_Font_01'>100%本息保障</div>"
						  /* <div class='product_Pojo_Font_02'>"+ct+"人已经加入</div> */+"</div><div class='product_Pojo_DIV_02'><div style='margin-bottom: 15px'>"
						 +"<div class='product_plan_01'><div style='width: 100%; height: 8px;background-color: #EE7D2D ;float: left;border-radius:5px'></div></div>"
						 +"<div class='product_plan_TEXT'><span style='color:#595757;font-size:15px;'>100%</span></div></div>"
						 +"<div class='product_Btn_Img2'>已售完</div><div class='product_Pojo_DIV_03'></div></div></div></a>";          	   		
					}
					}
				document.getElementById("main-pro").innerHTML=outstr1;	
				outstr1="";
	   		}
  });
}
gotopage();//调用分页 

</script>

<!-- WPA Button Begin 
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAwMDY3MV8yNzE5NThfNDAwODIwMzI4OF8"></script>
 WPA Button End -->


<link href="<%=request.getContextPath()%>/index_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"/>
</center>




</div></body></html>
