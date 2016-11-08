<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
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

<script src="<%=request.getContextPath()%>/guide_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/guide_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/guide_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/guide_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/guide_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/guide_files/lrtk.htm" rel="stylesheet" type="text/css">
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="guide_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
	<div style="width:100%; margin:0;">

		<center>
			<jsp:include page="header.jsp"></jsp:include>
		</center>
	</div>

	<div class="head_pojoDiv_05"></div>
	<script type="text/javascript">


                            

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

<link href="<%=request.getContextPath()%>/guide_files/qq.css" rel="stylesheet" type="text/css">
<script src="guide_files/jquery-client-1.js"></script>
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
	<a href="<%=request.getContextPath()%>/user/index.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">账户注册</span></a>
	</div>
	<div class="investindex_content_center">
		<div class="investindex_content_left">
		
<link href="<%=request.getContextPath()%>/guide_files/guide.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/guide_files/guide.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="5" type="hidden">
 		<a style="color: white;" id="anav5" href="<%=request.getContextPath()%>/user/guide.jsp">
 				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav5">
				账户注册
				</div></a>
 				<a id="anav1" href="<%=request.getContextPath()%>/user/borrowguide.jsp">
 				<div class="nav" id="nav1">
				借款指南
				</div></a>
				<a id="anav2" href="<%=request.getContextPath()%>/user/investmentguide.jsp">
				<div class="nav" id="nav2">
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
		<div class="investindex_content_right zhu-zong">
		     <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/guide_files/zhu-one.png" class="zhu-img"><span class="zhu-span"><em>注册账号：</em>打开大钱官网（<a href="<%=request.getContextPath()%>/user/registered.jsp">http://www.Daqianvip.com/</a>），点击页面右上方“快速注册”<br />按钮，输入信息进行立即注册。</span></p>
		        <p></p>
		        <p></p>
		     </div><!--zhu-div-->
		     <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/guide_files/zhu-two.png" class="zhu-img"><span class="zhu-span"><em>实名认证：</em>登录官网后，进入“会员中心”菜单，点击左侧“我的账户”菜单的“托管账户<br />信息”子菜单，创建托管账户，进行实名认证，并注册第三方会员账户。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		   </div><!--zhu-div-->
		    <div class="zhu-div">
		        <p><img src="<%=request.getContextPath()%>/guide_files/zhu-three.png" class="zhu-img"><span class="zhu-span"><em>绑定银行卡：</em>开通第三方资金托管账户后，进行添加银行卡，方便会员的资金充值与提现。<br />点击添加银行卡，进行绑卡操作。</span></p>
		        <p>&nbsp;</p>
		        <p>&nbsp;</p>
		   </div><!--zhu-div-->
				
		</div>
	<div class="aboutindex_content_bottom"></div>
	</div>
</div></div></center>

<link href="<%=request.getContextPath()%>/guide_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>


</body></html>