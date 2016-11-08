<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="dynamic_files/hm.js"></script><script>
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
 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/dynamic_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/dynamic_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/dynamic_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/dynamic_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/dynamic_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/dynamic_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/dynamic_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dynamic_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dynamic_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/dynamic_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/dynamic_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/dynamic_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dynamic_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dynamic_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dynamic_files/lrtk.htm" rel="stylesheet" type="text/css">
<style type="text/css">
#li-ul li a{ font-size:15px;height:22px;line-height: 22px}
</style>
<script type="text/javascript">

$(function(){	
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="dynamic_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<blockquote>
  <p>
    <input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
  </p>
</blockquote>
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
				
								
	</script>
<style>
#setpage a:link, #setpage a:visited, #setpage a:hover,.current,#info{border:1px solid #DDD;background:#ffffff;display:inline-block;margin:1px;text-decoration:none;font-size:12px;width:20px;height:20px;text-align:center;line-height:19px;color:#AAA;padding:1px 2px;} 
#setpage a:hover{border:1px solid #27cbc7;background:#dff9f8;color:#27cbc7;} 
.current{border:1px solid #83E7E4;background:#DFF9F8;margin:1px;color:#27CBC7;} 
#info{width:auto;}
</style>
<link href="<%=request.getContextPath()%>/dynamic_files/qq.css" rel="stylesheet" type="text/css">
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
 <div id="moquu_wxin" class="moquu_wxin"><a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=4008203288&amp;aty=0&amp;a=0&amp;curl=&amp;ty=1" target="blanket"> </a></div>
 <div id="moquu_wshare" class="moquu_wshare"><a href="http://www.lingyongdai.com/webApplicationAbout/zhucezhinan"></a></div>
 <a id="moquu_top" href="javascript:void(0)" style="display: none;"></a></div>
<div class="about_introducecontent">

	<div class="about_introducecontent_top">
	<a href="<%=request.getContextPath()%>/user/index1.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">公司动态</span></a>	</div>
	<div class="about_introducecontent_center">
		<div class="about_introducecontent_center_left">

<link href="<%=request.getContextPath()%>/dynamic_files/about.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/dynamic_files/about.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="4" type="hidden">
 				<a id="anav1" href="<%=request.getContextPath()%>/user/aboutourself.jsp">
 				<div class="nav" id="nav1">
				公司介绍				</div></a>
				<a style="color: white;" id="anav4" href="<%=request.getContextPath()%>/dynamic.do">
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav4">
				公司动态				</div>
				</a>
				<a href="<%=request.getContextPath()%>/user/media.jsp">
				<div class="nav">
				媒体动态			</div></a>
				<a id="anav6" href="<%=request.getContextPath()%>/user/Recruitment.jsp">
				<div class="nav" id="nav6">
				诚聘英才				</div></a>
				<!-- <a id="anav7" href="/webApplicationAbout/toMerchantsjoin">
				<div class="nav" id="nav7" >
				招商加盟
				</div></a> -->
				<a id="anav8" href="<%=request.getContextPath()%>/user/callme.jsp">
				<div class="nav" id="nav8">
		  联系我们				</div></a>		  </div>		</div>
		<div class="about_introducecontent_center_right" style="height:auto;overflow:hidden;padding-bottom:15px;margin-bottom:30px">
			<div class="about_introducecontent_center_right_title">
			最新动态			</div>
			
			 <div class="about_introducecontent_center_right_con">

			  <c:forEach items="${nlist }" var="n">
				<div class="about_introducecontent_center_right_txt">
				<div style="float: left;text-align: left;width: 80%"><ul><li><a href="news-info1.do?id=${n.id }">${n.title }</a></li></ul></div>
				<div style="float: right;">${n.date }</div>
				</div>
			  </c:forEach>
			   
<!--			<div class="about_introducecontent_center_right_txt">
				<div style="float: left;text-align: left;width: 80%"><ul><li><a href="<%=request.getContextPath()%>/user/dt2.jsp">大钱财富理财产品将上线试运营</a></li></ul></div>
				<div style="float: right;">2015年07月</div>
				</div>
				
			    
				<div class="about_introducecontent_center_right_txt">
				<div style="float: left;text-align: left;width: 80%"><ul><li><a  href="<%=request.getContextPath()%>/user/dt1.jsp">互联网金融指导意见出台 P2P迎来行业的春天</a></li></ul></div>
				<div style="float: right;">2015年07月</div>
				</div>  -->
				<div class="about_introducecontent_center_right_txt" style=" border: none;" onselectstart="return false">
					<div class="currentpage" style="float: right;">
						<div class="homepage" style="cursor: pointer;">首页</div>
						<div class="prepage" style="cursor: pointer;">上一页</div>
						<div class="curpage">${page }</div>
						<div class="nextpage" style="cursor: pointer;">下一页</div>
						<div class="lastpage" style="cursor: pointer;">末页</div>
						<span class="zong">共<span class="count">${count }</span>页</span>
						<input type="text" value="${page }" class="zdpage" style="width:20px;" />
						<button class="zdbtn" style="">跳转</button>
					</div>
				</div>
	</div>
	<div class="about_introducecontent_bottom"></div>
  </div>
 
</div>
</div></center>
<style>
	.currentpage{line-height:24px; margin:10px auto;}
	.currentpage .zong{float:left;}
	.currentpage .curpage{border-color:#ee7d2d;color:#ee7d2d;}
	.currentpage div{ float:left; width:30px; height:24px; border:1px #777 solid; color:#555; text-align:center; line-height:24px; margin-left:5px; margin-right:5px;}
	.currentpage .prepage,.currentpage .nextpage{width:50px;}
	.currentpage .homepage,.currentpage .lastpage{width:40px;}
</style>

<link href="<%=request.getContextPath()%>/dynamic_files/foot.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/page.js" type="text/javascript"></script>
<script type="text/javascript">
$(".currentpage").paging({
	pagename:'dynamic.do'
})
</script>

<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>



</body></html>