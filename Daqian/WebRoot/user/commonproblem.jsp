<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="commonproblem_files/hm.js"></script><script>
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
 <link href="<%=request.getContextPath()%>/commonproblem_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/commonproblem_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/commonproblem_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/commonproblem_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/commonproblem_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/commonproblem_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/commonproblem_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/commonproblem_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/commonproblem_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/commonproblem_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/commonproblem_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/commonproblem_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/commonproblem_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/commonproblem_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/commonproblem_files/lrtk.htm" rel="stylesheet" type="text/css">
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="guide_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
	<div style="width:100%; margin:0;">

		<center>
			<jsp:include page="header.jsp"/>
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
				
								
	</script><center style="background-color: #f3f4f8;">
<div id="aboutindex_content" style="widht:100%;">
	<div class="aboutindex_contentMain" style="height: 1350px;">
	<div class="aboutindex_top">
	<a href="<%=request.getContextPath() %>/index.do"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">常见问题</span></a>
	</div>
	<div class="commonindex_content_center">
		<div class="commonindex_content_left">
<link href="/Daqian/commonproblem_files/guide.css" rel="stylesheet" type="text/css">
<script src="/Daqian/commonproblem_files/guide.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="4" type="hidden">
 		<a id="anav5" href="<%=request.getContextPath() %>/user/guide.jsp">
 				<div class="nav" id="nav5">
				账户注册
				</div></a>
 				<a id="anav1" href="<%=request.getContextPath() %>/user/borrowguide.jsp">
 				<div class="nav" id="nav1">
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
				<a style="color: white;" id="anav4" href="<%=request.getContextPath() %>/user/commonproblem.jsp">
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav4">
				常见问题
				</div>
				</a>
		  </div></div>
		<div class="commonindex_content_right">
		        <div class="common_two">
		           <div class="common_two_left">
                     <div class="common_two_title">
                      
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">1、如何在网站注册？</div>
                     <div class="common_two_title1" style="height: 50px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;进入网站首页点击“快速注册”，按网站相关注册流程添加个人信息，并通过实名验证、手机认证、邮箱认证、银行卡绑定、登录密码和交易密码设置等相关操作。</div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">2、如何修改网站登陆密码和交易密码？</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;进入网站点击“我的账户”进入“安全信息”，可以根据自身想法修改或重置密码。</div>
                    <!--  <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">3、如何绑定和修改自己的E-mail 帐户？</div>
                     <div class="common_two_title1" style="height: 45px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;进入网站点击“我的账户”进入“安全信息”，可以根据自身想法修改或重置密码。</div> -->
                     <div class="common_two_title">
                         <div style="float:left;">我要投资</div>
                     </div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">1、什么是自动投标？</div>
                     <div class="common_two_title1" style="height: 70px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
自动投标是通过用户预先设定投标规则，可以在无需登录的情况下系统按用户设定自动代为投标的投资交易流程。自动投标为工作繁忙、经常出差以及不经常上网的
投资者提供了省时省心的高效服务，而实际上da大钱网贷平台目前理财产品标都支持100%自动投标，让用户更舒适的享受投资过程 。</div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">2、平台还款方式？</div>
					 <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;按月到期全额付息方式：每月付息，理财产品到期后支付所有本金和收益。</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;按季度付息：每季度付息，理财产品到期后支付所有本金和收益。</div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">3、网站理财产品有哪些？</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;周周乐：预期年化收益 9%，到期一次性还本付息。</div>
					 <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月月盈：按月付息，预期年化收益10%，每月以相等的付息数额偿还理财产品利息和成本，即按月全额本息还款。</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一季宝：期限3个月，预期年化收益11%-12.5%，可选按月付息或按季度付息，到期后全额本息支付给客户。</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;双季赢：期限6个月，预期年化收益12%-13.5%，可选按月付息或按季度付息，到期后全额本息支付给客户。</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三季富：期限9个月，预期年化收益 13-14.5%，	可选按月付息或按季度付息，到期后全额本息支付给客户。</div>
                     <div class="common_two_title1" style="height: 45px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四季丰：期限12个月，预期年化收益 14-15.5%，	可选按月付息或按季度付息，到期后全额本息支付给客户。</div>
                     <div class="common_two_title">
                         <div style="float:left;">我要借款</div>
                     </div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">1、借款产品有哪些？</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;借款产品主要有：零用贷白领2.0，零用贷白领3.0，零用贷金领3.0 。</div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">2、借款操作流程有哪些?</div>
					 <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;借款者可以在网站提出申请，也可联系当地分公司办理相关业务，具体操作流程如下：</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
借款申请（提交申请资料）&nbsp;&nbsp;&nbsp;风控调查&nbsp;&nbsp;&nbsp;信审审
批&nbsp;&nbsp;&nbsp;贷款签约&nbsp;&nbsp;&nbsp;财务放款。</div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">3、什么是提前一次性全额还款?</div>
                     <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;借款产品主要有：零用贷白领2.0，零用贷白领3.0，零用贷金领3.0。</div>
              
                     <div class="common_two_title1" style="height: 65px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提前一次性全额还款：借款人在借款期限内提前把剩余的借款金额一次性全部还清。重信金融承诺，提前全额还款无任何违约金和利息。</div>
                     <div class="common_two_title">
                         <div style="float:left;">法律保护</div>
                     </div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">1、电子合同受法律保护吗？</div>
                     <div class="common_two_title1" style="height: 95px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
通过网站审核的
                                                                        
                                                                  
借款方向投资方借贷，双方通过平台的电子借贷协议，明确双方的债务与债权关系。依据中华<br />人民共和国合同法第十一条规定：“书面形式是指合同书、                                                       
信件和数据电文（包括电报、电传、传真、电子数据交换和电子邮件）等可以有形地表现所载内容的形式”，网站上电子合同与传统合同具有同等的法律
效力，网站服务<br />仅向符合中华人民共和国有关法律法规及本公司相关规定的合格投资者和借款人提供。</div>
                     <div class="common_two_title1" style="height: 25px;font-size: 15px;color:#55555;">2、如何查询我的借款协议？</div>
					 <div class="common_two_title1" style="height: 25px;color:#3598d8;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在网站 “会员中心”页面左侧“借款管理”，点击“我的借款”，进入已投标项目列表，点击“查看借款协议”。</div>
                   </div>
				</div>
		</div>
	</div>
</div></div></center>

<link href="<%=request.getContextPath()%>/commonproblem_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>


</body></html>