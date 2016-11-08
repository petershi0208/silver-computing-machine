<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="investmentguide_files/hm.js"></script><script>
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
<title>大钱财富</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<meta name="keywords" content="">
<meta name="description" content="">
 <link href="<%=request.getContextPath()%>/investmentguide_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/investmentguide_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/investmentguide_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/investmentguide_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/investmentguide_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/investmentguide_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/investmentguide_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/investmentguide_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/investmentguide_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/investmentguide_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/investmentguide_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/investmentguide_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/investmentguide_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/investmentguide_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/investmentguide_files/lrtk.htm" rel="stylesheet" type="text/css">
<style type="text/css">
#li-ul li a{ font-size:15px;height:22px;line-height: 22px}
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
</head>

<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="guide_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
	<div style="width:100%; margin:0;">

		<center>
			<jsp:include page="header.jsp"></jsp:include>
		</center>
	</div>


	<div class="head_pojoDiv_05"></div>
	<script type="text/javascript">
			
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
				
								
	</script><center style="background-color: #f3f4f8;">
<div id="aboutindex_content" style="widht:100%;">
	<div class="aboutindex_contentMain" style="height: 760px;">
	<div class="aboutindex_top">
	<a href="<%=request.getContextPath()%>/user/index.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">投资指南</span></a>
	</div>
	<div class="investindex_content_center">
		<div class="investindex_content_left">
<link href="<%=request.getContextPath()%>/investmentguide_files/guide.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/investmentguide_files/guide.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="2" type="hidden">
 		<a id="anav5" href="<%=request.getContextPath()%>/user/guide.jsp">
 				<div class="nav" id="nav5">
				账户注册
				</div></a>
 				<a id="anav1" href="<%=request.getContextPath()%>/user/borrowguide.jsp">
 				<div class="nav" id="nav1">
				借款指南
				</div></a>
				<a style="color: white;" id="anav2" href="<%=request.getContextPath()%>/user/investmentguide.jsp">
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav2">
				投资指南
				</div>
				</a>
				<a id="anav3" href="<%=request.getContextPath()%>/user/security.jsp">
				<div class="nav" id="nav3">
				安全保障
				</div>
				</a>
				<a id="anav4" href="<%=request.getContextPath()%>/user/commonproblem.jsp">
				<div class="nav" id="nav4">
				常见问题
				</div>
				</a>
		  </div></div>
		<div class="investindex_content_right  zhu-zong">
		      <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/investmentguide_files/zhu-one.png" class="zhu-img"><span class="zhu-span"><em>选择理财产品：</em>点击导航“我要理财”，查看产品详情，根据个人需要，选择适合的理财<br />产品，点击“立即抢购”。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
              </div><!--zhu-div-->
		     <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/investmentguide_files/zhu-two.png" class="zhu-img"><span class="zhu-span"><em>输入理财金额：</em>根据个人情况，输入购买金额，点击“购买”，跳转到第三方支付平台，<br />输入支付密码进行购买确认。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
            </div><!--zhu-div-->
		        
	</div>
</div></div></div></center>

<link href="<%=request.getContextPath()%>/investmentguide_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>


</body></html>