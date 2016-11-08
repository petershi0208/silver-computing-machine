<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="security_files/hm.js"></script><script>
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
 <link href="<%=request.getContextPath()%>/security_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/security_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/security_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/security_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/security_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/security_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/security_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/security_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/security_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/security_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>//security_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/security_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/security_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/security_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/security_files/lrtk.htm" rel="stylesheet" type="text/css">
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="/Daqian/guide_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
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
	<center style="background-color: #f3f4f8;">
<div id="aboutindex_content" style="widht:100%;">
	<div class="aboutindex_contentMain" style="height: 1130px;">
	<div class="aboutindex_top">
	<a href="<%=request.getContextPath()%>/user/index.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">安全保障</span></a>
	</div>
	<div class="safeindex_content_center">
		<div class="safeindex_content_left">
<link href="/Daqian/security_files/guide.css" rel="stylesheet" type="text/css">
<script src="/Daqian/security_files/guide.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="3" type="hidden">
 		<a id="anav5" href="<%=request.getContextPath()%>/user/guide.jsp">
 				<div class="nav" id="nav5">
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
				<a style="color: white;" id="anav3" href="<%=request.getContextPath()%>/user/security.jsp">
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav3">
				安全保障
				</div>
				</a>
				<a id="anav4" href="<%=request.getContextPath()%>/user/commonproblem.jsp">
				<div class="nav" id="nav4">
				常见问题
				</div>
				</a>
		  </div></div>
		<div class="safeindex_content_right">
		        <div class="safe_two">
		           <div class="safe_two_left">
                     <div class="safe_two_title">安全保障</div>
                     <div class="safe_two_title1" style="height: 70px;">360度全方位保障，安全理财无后顾之忧。在平台所有投资均享受本金垫付<br>保障原则，假如借款方逾期还款，平台将全额垫付</div>
                     <div class="safe_two_title">第三方银行资金托管 交易安全有保障</div>
                     <div class="safe_two_title2" style="height: 95px;">大钱财富已与易宝支付签订&lt;&lt;资金托管战略合作协议&gt;&gt;<br>实现资金托管平台<br>届时用户资金将专户专款专用，保障资金与交易安全</div>
                     <div class="safe_two_title">风险准备金不断增长，投资有保障</div>
                     <div class="safe_two_title3" style="height: 70px;">2011年9月起启动风险准备金计划，初始准备金1000万元人民币<br>每日按成交金额逐步计提年化计提准备金</div>
                     <div class="safe_two_title">3+2 完善的风险审核模式 规范的信贷审核</div>
                     <div class="safe_two_title3" style="height: 185px;">反欺诈调查体系：借款申请必须提交身份认证，工作证明，社保或公积金账户，银行流水，
							                                                               还款来源证明等多项必需申请<br />材料，进行信息真实性审核，建立反欺诈调查，防止申请虚假信息的发生<br>客户诚信度评价体系：对客户的借款用途，
							                                                               还款意愿和还款能力做出客观评价<br>综合资质判定体系：正常客户当场放款，风险客户当场拒<br />绝，暂无法判定的客户增加审核风控点，
							                                                               如还无法判断的客户拒绝借款<br>明审：面对面考察，目前所有借款均经过资深风控部门审核进行面对面交流<br>暗审：系统资信评分；老客户资信评级 </div>
                     <div class="safe_two_title">有效的还款保障 </div>
                     <div class="safe_two_title3" style="height: 75px;">完善的风控模型：大钱财富在业内一直以风控能力著称，累计5亿成交额坏账率不足1%<br>还款保障措施：法务部通过有效催收方式提供还款保障</div>
                     <div class="safe_two_title">网上安全交易 个人隐私保障</div>
                     <div class="safe_two_title3" style="height: 100px;">安全交易：账户交易将由战略合作第三方支付公司进行资金托管<br>信
息安全：投资人的账户信息与交易记录完整，
                                                                        
                                                                        
     不对外界进行任何泄漏<br>隐私保障：大钱财富将严格遵守国家相关法律法规，对用户隐私信息严格保护</div>
                     <div class="safe_two_title">法律法规保障 保护投资人权益</div>
                     <div class="safe_two_title3">投资法律保护：每一笔投资借款都有理财，借款协议，受法律保障<br>引进战略咨询顾问：对公司每个部门，理财/融资，
                     							      网贷平台，法务催收，人力资源都完全达到银监会要求的P2P公司的合<br />法合规要求<br>还款保障：专业的客服团队与催收团队，保障借款合同依法执行</div>
                   </div>
				</div>
		</div>
	</div>
</div></div></center>


<link href="<%=request.getContextPath()%>/security_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>

</body></html>