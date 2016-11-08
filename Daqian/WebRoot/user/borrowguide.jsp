<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="guide_files/hm.js"></script><script>
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
<meta name="description" content=" ">
 <link href="<%=request.getContextPath()%>/guide_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/guide_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/guide_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/guide_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/guide_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/guide_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/guide_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/guide_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/guide_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/guide_files/WdatePicker.js" type="text/javascript"></script><link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/guide_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/guide_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/guide_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/guide_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/guide_files/lrtk.htm" rel="stylesheet" type="text/css">
<style type="text/css">
#li-ul li a{ font-size:15px;height:22px;line-height: 22px}
</style>
<script type="text/javascript">
$(function(){
	
	$.ajax({
		url : "/getProductDetails",
		type : "post",
		dataType : "json",
		success : function(message) {
			var error = message.message.error;
			var logins = message.message.login;
			if (error == "0") {
				var lists =  message.message.list;
				if (lists.length > 0) {
                     for ( var i = 0; i < lists.length; i++) {
                    	var onlineProductName = lists[i].onlineProduct_name;
         				var term = lists[i].onlineProduct_term;
         				var sm = lists[i].sm;
         				var enables =lists[i].enable;
         				if(null==sm || ""==sm){
         					sm="0";
         				}
         				if(onlineProductName=="活动标"){
         					$("#huodongbiaoId").val(term);
         					replaceUrl("xinshoubiao",term,sm,onlineProductName,enables,logins);
         				}else if(onlineProductName=="新手标"){
         					replaceUrl("xinshoubiao",term,sm,onlineProductName,enables,logins);
         				}
         				
						if(onlineProductName=="周周乐"){
							replaceUrl("zhouzhoule",term,sm,onlineProductName,enables,logins);
         				}
						if(onlineProductName=="月月盈"){
							replaceUrl("yueyueying",term,sm,onlineProductName,enables,logins);
         				}
						if(onlineProductName=="一季宝"){
							replaceUrl("yijibao",term,sm,onlineProductName,enables,logins);
         				}
						if(onlineProductName=="双季盈"){
							replaceUrl("shuangjiying",term,sm,onlineProductName,enables,logins);
         				}
						if(onlineProductName=="三季富"){
							replaceUrl("sanjifu",term,sm,onlineProductName,enables,logins);
         				}
						if(onlineProductName=="四季丰"){
							replaceUrl("sijifeng",term,sm,onlineProductName,enables,logins);
         				}
					}
				}
			}
		 }
	}); 
	
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="<%=request.getContextPath()%>/guide_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
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
				
								
	</script><link href="<%=request.getContextPath()%>/guide_files/qq.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/guide_files/jquery-client-1.js"></script>
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
<center style="background-color: #f3f4f8;">
<div>
 <div id="moquu_wxin" class="moquu_wxin"><a href="" target="blanket"> </a></div>
 <div id="moquu_wshare" class="moquu_wshare"><a href=""></a></div>
 <a id="moquu_top" href="javascript:void(0)" style="display: none;"></a>
</div>
 
<div id="aboutindex_content" style="widht:100%;">
	<div class="aboutindex_contentMain" style="height: 760px;">
	<div class="aboutindex_top">
	<a href="<%=request.getContextPath()%>/index.do"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">借款指南</span></a>
	</div>
	<div class="investindex_content_center">
		<div class="investindex_content_left">
<link href="<%=request.getContextPath()%>/guide_files/guide.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/guide_files/guide.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="1" type="hidden">
 		<a id="anav5" href="<%=request.getContextPath() %>/user/guide.jsp">
 				<div class="nav" id="nav5">
				账户注册
				</div></a>
 				<a style="color: white;" id="anav1" href="<%=request.getContextPath() %>/user/borrowguide.jsp">
 				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav1">
				借款指南
				</div></a>
				<a id="anav2" href="<%=request.getContextPath() %>/user/investmentguide.jsp">
				<div class="nav" id="nav2">
				投资指南
				</div>
				</a>
				<a id="anav3" href="<%=request.getContextPath() %>/user/security.jsp">
				<div class="nav" id="nav3">
				安全保障
				</div>
				</a>
				<a id="anav4" href="<%=request.getContextPath() %>/user/commonproblem.jsp">
				<div class="nav" id="nav4">
				常见问题
				</div>
				</a>
		  </div></div>
		<div class="aboutindex_content_right  zhu-zong investindex_content_right">
		<div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/borrowguide_files/zhu-one.png" class="zhu-img"><span class="zhu-span"><em>选择借款产品：</em>点击导航“我要借款”，查看产品详情，根据个人需要，选择适合的借款<br />产品，点击申请借款。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
	      </div><!--zhu-div-->
		     <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/borrowguide_files/zhu-two.png" class="zhu-img"><span class="zhu-span"><em>填写申请资料：</em>根据提示，完善申请资料，点击提交申请，我们将对您填写的资料进行审<br />核。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
            </div><!--zhu-div-->
		    <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/borrowguide_files/zhu-three.png" class="zhu-img"><span class="zhu-span"><em>查看借款状态：</em>点击导航“会员中心”，在左侧菜单栏中“借款管理”的子菜单“借款申请查询”中，可以查看历史借款申<br />请状态。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		   </div><!--zhu-div-->
		<!--<div class="photo_two">
				 <div class="photo_three">
				<div class="photo_go">什么是 "零用贷" ？</div>
				<div class="photo_zhinan"></div>
				<div class="photo_zhinan1">
				    <div class="ling">零</div>
				    <div class="ling_frist">用贷是上海重信（ZHONGXIN）金融信息服务有限公司为满足普通大众的日常生活中急需资金的需要，同时结合国内</div>
				    <div class="ling_two">外先进的金融运作模式，为大众百姓特别设计的 一款融资金融产品。只要申请人年龄不超过55岁，当前有工作或在校大学生，能满足一定要求的都可以当场获得资金支持，解决客户的燃眉之急。</div>
				</div>
				</div>
				</div>
				<div class="photo_two1">
				<div class="photo_three">
					 <div class="photo_go" style="margin-top:0px;">为什么选择 "零用贷" ？</div>
					<div style="width:100%;height:300px;">
					<div class="xuanzhe">
					   <div class="shenq"></div>
					   <div style="float: left;font-family: Microsoft YaHei;font-size: 14px;line-height: 30px;text-align: left;width: 73%;">
					      <div style="color: #555555;font-family: Microsoft YaHei;font-size: 18px;padding-left: 25px;">申请门槛低</div>
					      <div style="padding-left: 25px;">有工作，缴社保或当前为在校大学生即可</div>
					   </div>
					   <div style="width:100%;height:140px;"></div>
					   <div class="jiandan"></div>
					   <div style="float: left;font-family: Microsoft YaHei;font-size: 14px;line-height: 45px;text-align: left;width: 73%;">
					      <div style="color: #555555;font-family: Microsoft YaHei;font-size: 18px;padding-left: 25px;">手续简便</div>
					      <div style="padding-left: 25px;line-height: 20px;">线上线下都可申请无需要繁琐资料，只需提供一张身份证、社保信息；或一张学生证即可</div>
					   </div>
					</div>
					<div class="xuanzhe1">
					   <div class="shenqs"></div>
					   <div style="float: left;font-family: Microsoft YaHei;font-size: 14px;line-height: 30px;text-align: left;width: 73%;">
					      <div style="color: #555555;font-family: Microsoft YaHei;font-size: 18px;padding-left: 25px;">当场放款</div>
					      <div style="padding-left: 25px;">只需短短的20分钟，真正解决您的燃眉之急</div>
					   </div>
					   <div style="width:100%;height:140px;"></div>
					   <div class="jiandans"></div>
					   <div style="float: left;font-family: Microsoft YaHei;font-size: 14px;line-height: 45px;text-align: left;width: 73%;">
					      <div style="color: #555555;font-family: Microsoft YaHei;font-size: 18px;padding-left: 25px;">还款灵活</div>
					      <div style="padding-left: 25px;line-height: 20px;">按天计算、周结服务费随借随还，自由安排还款计划</div>
					   </div>
					</div>
					</div>
				</div>
				</div>
				<div class="photo_two2">
				<div class="photo_three" style="margin-top:20px;">
						<div class="photo_go">如何快速获得资金？</div>
						<div class="m_sucess">
                            <div style="color: #555555;font-family: Microsoft YaHei;font-size: 18px;width:100%;height: 50px;padding-left: 25px;text-align: left;">只需四步，20分钟即得资金支持</div>
                            <div style="color: #666666;font-family: Microsoft YaHei;font-size: 14px;line-height: 28px;padding-left: 20px;text-align: left;width: 100%;">
                                                                                                          第一步 &nbsp;&nbsp;&nbsp;官网申请或拨打客服热线<br/>
                                                                                                          第二步 &nbsp;&nbsp;&nbsp;客户专员将尽快联系您预约面签<br/>
                                                                                                          第三步 &nbsp;&nbsp;&nbsp;准备相关资料现场审核<br/>
                                                                                                          第四步 &nbsp;&nbsp;&nbsp;审核通过当场签约放款
                            </div>
                        </div>
						<div class="m_sucesstwo">
						   <div class="guide_a"></div>
						   <div class="guide_b"></div>
						   <div style="width:100%;height:30px; float: left;"></div>
						   <div class="guide_c"></div>
						   <div class="guide_d"></div>
						</div>
				</div>
				</div>
		</div>
	<div class="aboutindex_content_bottom"></div> -->
	</div>
</div></div></div></center>

<link href="<%=request.getContextPath()%>/borrowguide_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"/>
</center>


</body></html> 