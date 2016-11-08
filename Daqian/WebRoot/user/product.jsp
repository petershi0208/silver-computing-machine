<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="product_files/hm.js"></script><script src="product_files/hm_002.js"></script><script>
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
<title>大钱投资产品</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<meta name="keywords" content="">
<meta name="description" content="">
 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/product_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/product_files/all.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/jquery-1.7.1.min.js"></script>

<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/product_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/product_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/product_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/product_files/WdatePicker.js" type="text/javascript"></script><link type="text/css" rel="stylesheet" href="product_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/product_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/lrtk.htm" rel="stylesheet" type="text/css">
<style type="text/css">
#li-ul li a{ font-size:15px;height:22px;line-height: 22px}
*{margin:0;padding:0;list-style:none;}
body{font-family:'MicroSoft Yahei'}
#rightButton{ position:fixed; _position:absolute; top:500px; right:0; z-index:999999; display:block;}
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


<script src="<%=request.getContextPath()%>/js/head.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/base.js" type="text/javascript"></script>
</head>
<body>
<div>
<!--右侧图标-->
<div id="rightButton">
	<ul id="right_ul">
		<li id="right_qq" class="right_ico" show="qq" hide="tel"></li>
		<li id="right_tel" class="right_ico" show="tel" hide="qq"></li>
		<li id="right_tip" class="png">
		<p class="flagShow_p1 flag_tel">咨询电话</p>
		<p class="flagShow_p2 flag_tel line91">400-839-2088</p>
		<p class="flagShow_p1 flag_qq">咨询QQ</p>
		<p class="flagShow_p2 flag_qq">
		<a href="http://wpa.qq.com/msgrd?v=3&uin=1061465170&site=qq&menu=yes" target="_blank">
		<img border="0" src="<%=request.getContextPath()%>/totop/qiyeQQ.png"></a> 
		</li>
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
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="product_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
	<div style="width:100%; margin:0;">

		<center>
			<jsp:include page="header.jsp"/>
		</center>
	</div>

<div class="head_pojoDiv_05"></div>
	<script type="text/javascript">
			$(document).ready(function(){
					if($("#username").val()=="" || $("#username").val() == null){
						$("#welcome_username").css("display","none");
						$("#Not_loggedin").css("display","show");
					}else if($("#username").val()!="" || $("#username").val() != null){
						$("#welcome_username").css("display","show");
						$("#Not_loggedin").css("display","none");
					}
				
				});
// 			function showTime(){
//                                 var show_day=new Array('星期一','星期二','星期三','星期四','星期五','星期六','星期日');
//                                 var week_day = new Array(7);
//                                 week_day[0] = '日';
//                                 week_day[1] = '一';
//                                 week_day[2] = '二';
//                                 week_day[3] = '三';
//                                 week_day[4] = '四';
//                                 week_day[5] = '五';
//                                 week_day[6] = '六';
//                                 var time=new Date();
//                                 var day=time.getDay();
//                                 var now_time = time.toLocaleString() +' '  + '星期' + week_day[day];
//                                 document.getElementById('showtime').innerHTML=now_time;
//                                 setTimeout("showTime();",1000);
//                             }
                            

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
				
								
	</script><link href="<%=request.getContextPath()%>/product_files/bannerflash.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/home.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/base.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/financialpage.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/product_files/qq.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/product_files/jquery1.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/product_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/product_files/jquery-client-1.js"></script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?2289f8cbe986adeab7d307106695faab";
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
	<!-- 中间图片切换 代码 开始 -->
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

.hover{background-color: #dbdbdb;}
.tabEven { background: #f9f9f9;} 
</style>

	<!-- <center style="background-color: #f3f4f8;"> -->
	<center> 
	
	<div>
 <div id="moquu_wxin" class="moquu_wxin"><a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4008203288&amp;aty=0&amp;a=0&amp;curl=&amp;ty=1" target="blanket"> </a></div>
 <div id="moquu_wshare" class="moquu_wshare"><a href="http://www.lingyongdai.com/webApplicationAbout/zhucezhinan"></a></div>
 <a id="moquu_top" href="javascript:void(0)" style="display: none;"></a>
</div>
<div style="height: auto; width:100%;" id="containDivvv">
	<form action="/luckLoginLoan/lockloan" method="post" id="form">
        <div class="financial">
			  <div class="financial_frist">
			   <p style="font-size:16px; color:#666666;display:inline; font-family:微软雅黑;">&nbsp;</p>
			   <p style="font-size:16px; color:#666666;display:inline; font-family:微软雅黑;">&nbsp;</p><br />
			   <p style="font-size:16px; color:#666666;display:inline; font-family:微软雅黑;">首页&nbsp;<i style="font-family: serif;margin: 0 5px ; font-style: normal;font-weight:bold;">&gt;</i>
			     <span style="color:#ca141d;font-family:微软雅黑;">我要理财</span></p>
			  </div>
			  <div class="head_k">
			  <div style="width:967px;"><span class="gay f22">投资效果</span></div>
			  <div class="box">
			      <div class="head">
			        <div class="box_ziti">加入用户数</div>
			        <div class="box_ti">41,529</div>
			      </div>
			      <div class="head_s"></div>
			      <div class="head1">
			        <div class="box_ziti">累计总金额(￥)</div>
			        <div class="box_ti">404,432,000</div>
			        
			      </div>
			      <div class="head_s1"></div>
			      <div class="head2">
			        <div class="box_ziti">已为用户赚取(￥)</div>
			        <div class="box_ti">6,437,781</div>
			        
			      </div>
			      <div class="head_s2"></div>
			      <div class="head3">
			        <div class="box_ziti">资金利用率</div>
			        <div class="box_ti">97.83%</div>
			        
			      </div>
			  </div>
			  </div>
	 <div class="www51buycom" style="z-index:3;width:967px;height:200px;margin-top:20px;">
	 <img src="<%=request.getContextPath()%>/product_files/photo1 .png"/>
	</div>
		
	 <div style="height: 54px; width:965px;margin-top: 20px">
		 <table style="width: 100%;height:100%;border: 0px;background-color: white;" cellpadding="0" cellspacing="0">
			<tbody><tr>
				<td style="width: 8%;height:100%;text-align: center;">
					<img src="<%=request.getContextPath()%>/product_files/daidaibao.png">
				</td>
				<td style="width: 10%;height:100%;color: #0E87D6;font-size: 24px;font-family: 微软雅黑;">
					理财宝
				</td>
				<td style="width: 24%;height:100%;font-size: 15px;font-family: 微软雅黑;color:#565656;">—财富人生，从这里起航！</td>
				<td style="width: 36%;height:100%;font-size: 15px;font-family: 微软雅黑;color:red">理财计划将会在全天随机发布，感谢您的关注。</td>
				<td style="width: 12%;height:100%"></td>
			</tr> 
		 </tbody></table>
	 </div>
	 <!--/about-->
    <div class="home-major clearfix">
    
        <div class="home-main">
            <div class="main-items amp-only">
                <div id="ampBanner" class="main-banner slide-mid-banner slideBanner">
                    <div class="slide-mid-bar"></div>
                </div>
				<div class="main-pro" id="main-pro">
							<c:forEach items="${aaa }" var="a">
		                                <div class="pro-items" style="background:#fff">
		                                    <a class="pro-inner pro-link start-link"  href="<%=request.getContextPath()%>/products.do?id=${a.pid}">
		                                        <div class="pro-title">
		                                         <div class="new_invest" style="margin-left:-130px"></div>
			                                       <strong class="pro-name" style="font-family: Microsoft YaHei;">${a.productname } <!-- 新客收益翻倍计划 --></strong>
		                                            <span class="pro-bank">(H${a.pdate }期)</span>
		                                        </div>
		                                        
		                                        <div class="pro-box clearfix">
		                                            <div class="pro-info">
		                                                <ul class="pro-info-list">
		                                                     <li style="width:180px;">年化
		                                                     	<i style="color:#e74c3c;width: 150px; font-size: 23px;">
		                                                     	<c:forEach items="${minlist}" begin="${a.pid-1}" end="${a.pid-1}" var="min">${min.yearreturn}</c:forEach>~
																<c:forEach items="${maxlist}" begin="${a.pid-1}" end="${a.pid-1}" var="max">${max.yearreturn}</c:forEach>%
		                                                     	</i>                                              
		                                                    </li>
		                                                    <li style="width:140px;">周期<b>${a.cycle }</b>个月</li>
		                                                    <li style="width:200px;">起投金额<b>${a.minmoney }</b>元</li>
		                                                     <li><b></b> 
		                              <!-- <dl class="pro_photo"></dl>
				                     <dt style="width:120px;margin-left:40px;font-size:12px;color:#0187c6;margin-top:20px;">100%本息保障</dt> -->
				                     <div style="margin-left:40px;margin-top:-30px;width:120px;">
				                        <div style="background: url(product_files/home_approve.png) repeat scroll 0 0 rgba(0, 0, 0, 0);background-size: 100% 100%;height: 14px;width: 14px;float:left;"></div>
				                        <div style="font-size:12px;color:#0187c6;float:left;">100%本息保障</div>
				                     </div>
				                     <c:if test="${fn:length(aaa)!=0}">
										<span class="alist" style="display:none;" >${fn:length(aaa)}</span>
									</c:if>
				                     <span class="lastmoney${a.pid }" style="display:none;">${a.lastmoney }</span>
				                     <span class="maxmoney" style="display:none;">${a.maxmoney }</span>
				                   <!--  <dd style="width:120px;font-size:12px;color:#595757;margin-left:40px;">0人次已加入</dd> -->
		                                </li></ul>
		                             </div>
		                                            
		                                <div class="pro-handler">
		                                   <div class="pro-handler-inner">
		                                      <div class="pro-start bank-process" style="width:125px;">
		                                        <span class="percent" style="width:80px;"><em data-value="89" style="width:${a.lastmoney/a.maxmoney*100}%;"></em></span><span style="color:#595757;font-size:11px;"><fmt:formatNumber type="number" value="${a.lastmoney/a.maxmoney*100}" maxFractionDigits="2"/>%</span>	                                                       
		                                       </div>
		                                        <c:if test="${a.lastmoney==0 }">
		                                            <div class="pro-handler-btn"><span class="btn-link right-link2">已售完</span></div>
												</c:if>
												<c:if test="${a.lastmoney>0 }">
													<div class="pro-handler-btn"><span class="btn-link right-link2" style="background-color:#0093CC;">立即抢购</span></div>
												</c:if>						
		                                     </div>
		                            	</div>
		                            </div>
		                         </a>
		                        </div>
	                        </c:forEach>

		    			</div>
		    		</div>
		    	</div>
		    </div>
		</div>
	</form>
	</div></center>
	<!--  -->
 <script>
			function a(obj)
			{
				var i = obj.rowIndex-2;
				var term = document.getElementById("term"+i).value.trim();
				//alert(term);
				window.location.href="/webApplicationFinancialInvest/financialLogout?onLineProductTerm="+term+"&sm_sm=100";
			}
 
			$(".www51buycom").slide({
				titCell : ".num ul",
				mainCell : ".51buypic",
				effect : "fold",
				autoPlay : true,
				delayTime : 700,
				autoPage : true
			});
			
			function trTurnColor()
			{
			$("#tab tr:gt(1):odd").addClass("tabEven"); 
			$("#tab tr:gt(1)").hover(function() {   

				$(this).children("td").addClass("hover");   

				}, function() {   

				$(this).children("td").removeClass("hover");   

				}); 
			}
			
			var totalpage, pagesize, cpage, count, curcount, outstr,investApplicationTotal,term,c,returnDate,invest_product_status;
			//初始化 
			cpage = 1;
			//totalpage = document.getElementById("totalpage").value;
			totalpage = 50;
			pagesize = 10;
			outstr = "";
			function gotopage(target) {
				cpage =target; //把页面计数定位到第几页 
				 $.ajax({	url : "/webApplicationFinancialInvest/findProHistoryList",
							data : "target=" + cpage,
							type : 'post',
							dataType : 'json',
							success : function(message) {
								totalpage=message.message.total;
								proHistoryTotal=message.message.proHistoryTotal;
								setpage();
								var list=message.message.list;
 								$("#tab tr:gt(1)").remove();
								//将返回的数据追加到表格  
					for(var i=0;i<list.length;i++) {
						if(list[i].invest_term=="7"){term="1周";}else{term=list[i].invest_term+"个月"}
						if(list[i].return_date==null){returnDate="";}else{returnDate=list[i].return_date;}
						if(list[i].invest_product_status==null){invest_product_status="已退出";}else{invest_product_status=list[i].invest_product_status;}
						if(list[i].c==null){c="0";returnDate="";}else{c=list[i].c;}
						
						var principal=(list[i].principal+"").split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('');
					$("#tab").append( "<tr class='title_td' onclick='a(this)'> "
											+ "<td height='40' align='center' valign='middle'> "
											+ list[i].onlineProduct_name +"&nbsp("+list[i].onlineProduct_term+")"
											+ "</td>"
											+ "<td align='center' valign='middle'>"
											+ principal
											+ "元</td>"
											+ "<td align='center' valign='middle'>"
											+ c
											+ "</td>"
											+ "<td align='center' valign='middle'>"
											+ term
											+ "</td>"
											+ "<td align='center' valign='middle'>"
											+ list[i].y_interest_rate
											+ "%</td>"
											+ "<td align='center' valign='middle'>"
											+ returnDate
											+ "</td>"
											+ "<td align='center' valign='middle' style='color:#0187c6;'>"
											+ invest_product_status
											+ "</td>"
											+ "<input type='hidden' value=' "+ list[i].onlineProduct_term +"' id='term"+ i +"'/>"
											+ "</tr>"
											);
				    		}; 
				     trTurnColor();
		 	   		} 
		       });
		    

			}
			
			 function setpage() {
					
			 		var afterpage = 0; //终止页
					var pagenow = cpage;
					var beforepage = 0;//起始页
					for ( var i = 0; i < 10; i++) {
						if (pagenow % 10 == 0) {
							afterpage = pagenow;
							beforepage = pagenow - 9;
							break;
						}
						pagenow += 1;
					}
					if (cpage == 1) {
						outstr = outstr + "";
					} else {
						outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("
								+ (cpage - 1 == 0 ? 1 : cpage - 1)
								+ ")' style='width:50px;'>上一页</a>";
					}

					if (afterpage - totalpage > 0) {
						afterpage = totalpage;
					}
					for (count = beforepage; count <= afterpage; count++) {
						if (count != cpage) {
							outstr = outstr
									+ "<a href='javascript:void(0)' onclick='gotopage("
									+ count + ")'>" + count + "</a>";
						} else {
							outstr = outstr + "<span class='current' >" + count + "</span		>";
						}
					}

					if (cpage == totalpage) {
						outstr = outstr + "";
					} else {
						outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("
								+ (cpage + 1 >= totalpage ? totalpage : cpage + 1)
								+ ")' style='width:40px;'>下一页</a>";
					}

					document.getElementById("setpage").innerHTML = "<div id='setpage'><span id='info'>第"
							+ cpage + "页/共" + totalpage + "页<\/span>" + outstr + "<\/div>";
					
					outstr = "";

				}
				gotopage(1);//调用分页
				trTurnColor();

				window.onload=function()
				{	
					for(var i=0;i<6;i++)
					{
					document.getElementById("principal"+i).innerHTML=(document.getElementById("principal"+i).innerHTML+"").split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('');
					}
				}
</script>
		

<link href="<%=request.getContextPath()%>/product_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>



</body></html>
<!--[if lte IE 6]>
<script src="js/phone/PNG.js" type="text/javascript"></script>
<script>
        if( typeof(PNG) == 'object') PNG.fix('.png');
    </script>
<![endif]-->