<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<head>
<title>帮助中心--大钱(DAQIAN)--P2P</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<link href="<%=request.getContextPath()%>/help_files/help_center.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/help_files/hm.js"></script><script type="text/javascript" src="<%=request.getContextPath()%>/help_files/help_center.js"></script>
<script type="<%=request.getContextPath()%>/text/javascript" src="help_files/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/help_files/jquery-client-1.js"></script>
<link type="<%=request.getContextPath()%>/text/css" rel="stylesheet" href="help_files/WdatePicker.css">


</head>

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="help_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>﻿

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>




 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/help_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/help_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/help_files/jquery-1_002.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/help_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/help_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/help_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/help_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/help_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/help_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/help_files/WdatePicker.js" type="text/javascript"></script>

<link href="<%=request.getContextPath()%>/help_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/help_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/help_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/help_files/lrtk.htm" rel="stylesheet" type="text/css">

<script src="<%=request.getContextPath()%>/js/head.js" type="text/javascript"></script>

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
	<center>
	 <div class="div_one_stratum">
			<div class="usercenter_navigationDiv_one">
			
			<div class="usercenter_navigationDiv_two">
				<p class="usercenter_navigationText_01">
					首页 
				<i class="usercenter_navigationText_02">&gt;</i>
					<span class="usercenter_navigationText_03">帮助中心</span>
					
				</p>
			</div>
						
			<div class="navigation_menu_leftDiv">
			
				<div style="background-color: rgb(231, 76, 60);" id="menuId" class="menu_One" onclick="btnMenu('01','menuFontcolor','myAccount','menuId'),switchMenu('myAccount')" onmouseover="selectdMenu('01','menuFontcolor','myAccount','menuId')" onmouseout="selectdOutMenu('01','menuFontcolor','myAccount','menuId')">
					    				   
					<div id="01" class="pojoImg_01"></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(255, 255, 255);" id="menuFontcolor" class="navigationFont">安全保障</div>	
				</div>
				
				<div style="display: none;" id="myAccount" class="secondLevel_menu_text">
					<a href="">
						<div id="secondBackImg_1" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_1','secondfont_1')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_1" class="secondFont">本金保障计划</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					
					 <a href="">
						<div id="secondBackImg_2" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_2','secondfont_2')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_2" class="secondFont">法律合规保障</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					
					<a href="">
						<div id="secondBackImg_3" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_3" class="secondFont">风控保障</div>	
						</div>
					</a>
					<div class="Pojo_div_02"></div>
					
					<a href="">
						<div id="secondBackImg_4" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_4','secondfont_4')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_4" class="secondFont">账户安全保障</div>	
						</div>
					</a>
					<div class="Pojo_div_02"></div>
					
					<a href="">
						<div id="secondBackImg_5" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_5','secondfont_5')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_5" class="secondFont">自我保护</div>	
						</div>
					</a>
				</div>
				
				<div class="Pojo_div_01"></div>
				<div style="background-color: rgb(231, 76, 60);" id="propertyId" class="menu_One" onclick="btnMenu('02','propertyManageFontcolor','propertyManage','propertyId'),switchMenu('propertyManage')" onmouseover="selectdMenu('02','propertyManageFontcolor','propertyManage','propertyId')" onmouseout="selectdOutMenu('02','propertyManageFontcolor','propertyManage','propertyId')">
					
					<div id="02" class="pojoImg_02"></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(255, 255, 255);" id="propertyManageFontcolor" class="navigationFont">新人指导</div>		 
				</div>
				<div style="display: none;" id="propertyManage" class="secondLevel_menu_text">
					<a href="">
						<div id="secondBackImg_6" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_6','secondfont_6')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_6" class="secondFont">注册</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_7" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_7','secondfont_7')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_7" class="secondFont">身份认证</div>	
						</div>
					</a>
				</div>
				
			
				<div class="Pojo_div_01"></div>
				<div style="background-color: rgb(231, 76, 60);" id="manageMoneyId" class="menu_One" onclick="btnMenu('03','manageMoneyFontcolor','manageMoney','manageMoneyId'),switchMenu('manageMoney')" onmouseover="selectdMenu('03','manageMoneyFontcolor','manageMoney','manageMoneyId')" onmouseout="selectdOutMenu('03','manageMoneyFontcolor','manageMoney','manageMoneyId')">
					<div id="03" class="pojoImg_03"></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(255, 255, 255);" id="manageMoneyFontcolor" class="navigationFont">我是投资者</div>		 
					 
				</div>
				
				<div style="display: none;" id="manageMoney" class="secondLevel_menu_text">
					<a href="">
						<div id="secondBackImg_10" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_10','secondfont_10')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_10" class="secondFont">投资须知</div>	
						</div>
					</a>
				
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_11" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_11','secondfont_11')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_11" class="secondFont">产品介绍</div>	
						</div>
					</a>
		
				</div>

				<div class="Pojo_div_01"></div>
				<div style="background-color: rgb(231, 76, 60);" id="borrowMoneyId" class="menu_One" onclick="btnMenu('04','borrowMoneyFontcolor','borrowMoney','borrowMoneyId'),switchMenu('borrowMoney')" onmouseover="selectdMenu('04','borrowMoneyFontcolor','borrowMoney','borrowMoneyId')" onmouseout="selectdOutMenu('04','borrowMoneyFontcolor','borrowMoney','borrowMoneyId')">
					<div id="04" class="pojoImg_04"></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(255, 255, 255);" id="borrowMoneyFontcolor" class="navigationFont">我是借入者</div>		 
					 	
				</div>
			
				<div style="display: none;" id="borrowMoney" class="secondLevel_menu_text">
					<a href="">
						<div id="secondBackImg_13" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_13','secondfont_13')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_13" class="secondFont">借款条件</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_14" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_14','secondfont_14')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_14" class="secondFont">产品介绍</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_15" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_15','secondfont_15')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_15" class="secondFont">融资费用</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_16" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_16','secondfont_16')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_16" class="secondFont">如何申请</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_17" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_17','secondfont_17')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_17" class="secondFont">认证资料</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_18" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_18','secondfont_18')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_18" class="secondFont">信用审核</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_20" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_20','secondfont_20')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_20" class="secondFont">放款</div>	
						</div>
					</a>		
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_21" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_21','secondfont_21')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_21" class="secondFont">如何还款</div>	
						</div>
					</a>		
				</div>
				<div class="Pojo_div_01"></div>		
			
				<div style="background-color: rgb(231, 76, 60);" id="messageManageId" class="menu_One" onclick="btnMenu('05','messageFontcolor','messageManage','messageManageId'),switchMenu('messageManage')" onmouseover="selectdMenu('05','messageFontcolor','messageManage','messageManageId')" onmouseout="selectdOutMenu('05','messageFontcolor','messageManage','messageManageId')">
					
					<div id="05" class="pojoImg_05"></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(255, 255, 255);" id="messageFontcolor" class="navigationFont">用户中心</div>		 
					 	
				</div>
				
				<div style="display: none;" id="messageManage" class="secondLevel_menu_text">
					<a href="">
						<div id="secondBackImg_22" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_22','secondfont_22')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_22" class="secondFont">充值</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					
					
					<a href="">
						<div id="secondBackImg_23" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_23','secondfont_23')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_23" class="secondFont">提现</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_24" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_24','secondfont_24')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_24" class="secondFont">安全认证</div>	
						</div>
					</a>	
					<div class="Pojo_div_02"></div>
					<a href="">
						<div id="secondBackImg_25" class="secondMenu" name="second_menu" onclick="btnSecondMenu('secondBackImg_25','secondfont_25')">
							<div class="secondPojo_div"></div>
							<div id="secondfont_25" class="secondFont">我的消息</div>	
						</div>
					</a>	
				</div>
				<input id="second_Img" name="second_Img" style="display: none;">
				<input id="second_font" name="second_font" style="display: none;">	
				<input id="menus" name="menus" style="display: none;">
				<input id="rank" name="rank" style="display: none;">
				<input id="fontcolor" name="fontcolor" style="display: none;">
				<input id="menu_id" name="menu_id" style="display: none;">
				<input id="secondbackimg" name="secondbackimg" style="display: none;">
				<input id="second_font" name="second_font" style="display: none;">
					</div>
						

				<div class="rightDiv" id="accountPandect">
					
<link href="<%=request.getContextPath()%>/help_files/guide.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/help_files/guide.js" type="text/javascript"></script>
		<div class="commonindex_content_right" style="width:759px;height: auto;">
		        <div class="common_two" style="height:auto;">
		           <div class="common_two_left" style="height: auto;">
                     <div class="common_privcipal_top">
                         <div style="float:left;font-size:24px;">索引</div>
                         <div style="float:left;color:#555555;font-size:15px;margin-left:20px;font-family:Microsoft YaHei;margin-top: 5px;">
                           <a href="" onclick="btnSecondMenu('secondBackImg_5','secondfont_5')" style="float:right;"><div class="common_sy" style="width:90px;">自我保护</div></a>
                           <a href="" onclick="btnSecondMenu('secondBackImg_4','secondfont_4')" style="float:right;"><div class="common_sy" style="width:90px;">账户安全保障</div></a>
                           <a href="" onclick="btnSecondMenu('secondBackImg_3','secondfont_3')" style="float:right;"><div class="common_sy" style="width:90px;">风控保障</div></a>
                           <a href="" onclick="btnSecondMenu('secondBackImg_2','secondfont_2')" style="float:right;"><div class="common_sy" style="width:110px;">法律合规保障</div></a>
                           <a href="" style="float:right;"><div class="common_sy" style="width:110px;color:#e74c3c;">本金保障计划</div></a>
                           </div>  
                     </div>
                     <div class="common_privcipal">
                         <div style="float:left;">本金保障计划</div>
                     </div>
                     <div class="common_two_privcipal" id="privcipalbz" onclick="privcipalbz();">在大钱金融投资能保障本金安全吗？</div>
                     <div class="common_privcipal_title" style="display:none;" id="privcipaltitle">前端严格审核：国际领先的数据化风控模型，对达到评分标准的借款人予以核准出借。
运用反欺诈技术：<br>获得借款人授权，抓取借款人网络行为数据，进一步判断借款人的借款用途、还款能力以及还款意愿。
国<br>内先进的催款追款流程：在后端保障款项催收，使风险降到最低,催收部门经过专业培训上岗，具备现代化<br>领先的电话催收技巧。
建立专款专用的还款准备金对投资者本金和收益即时兑付 
专业的合伙人团队：具备<br>资深金融从业背景的高管团队、来自顶级金融信用机构的专家顾问
与专业机构合作：有着丰富经验的IT团队<br>与技术支持团队</div>
                     <div class="common_two_privcipal" style="padding-top: 10px;" id="privcipaljf" onclick="privcipaljf();">什么是大钱本金保障计划？</div>
                     <div class="common_privcipal_title" style="display:none;" id="privcipaljftitle">“大钱本金保障计划”是指在平台发生的适用本金保障计划的每笔借款，提取一定比例的金额放入风险基金<br>账户和平仓基金账户。当理财人投资的某笔受保障借款出现严
重逾期时（即逾期超过90天），我们将根据<br>“风险备用金账户风险基金账户和平仓基金账户向理财人偿付此笔借款的剩余出借本金或剩余出借本金和逾<br>期当期利
息。“本金保障计划”为理财人提供了有效的风险共担机制，分散了理财人投资行为所带来的信用<br>风险，营造了一个安全健康的投资环境，保障了理财人的权益。</div>
                     <div class="common_two_privcipal" style="padding-top: 10px;" id="privcipalyl" onclick="privcipalyl();">大钱的平台原理是什么？</div>
                     <div class="common_privcipal_title" style="display:none;" id="privcipalyltitle">大钱财富是村木金融旗下基于P2P信贷服务模式，为公众提供的资金出借入口。出借人可将手中的富裕资金<br>出借给村木金融平台推荐的、信用良好但缺少资金的大学生、工薪阶层、微小企业主等，帮助他们实现教育<br>培训、电脑及家电购买、装修、兼职创业等理想，通过利息收益获得较高、稳定的投资回报。</div>
                     <div class="common_two_privcipal" style="padding-top: 10px;" id="privcipalyq" onclick="privcipalyq();">发生逾期大钱怎么办？</div>
                     <div class="common_privcipal_title" style="display:none;" id="privcipalyqtitle">当发生逾期，大钱（DAqian）立即启动本金保障计划，率先垫付，然后进行严格的贷后管理，客服催收，法<br>务部催讨等。</div>
				     <div style="height: 118px;"></div>
				 </div>
		</div>
<script type="text/javascript">
	function privcipalbz(){
	var privcipal=document.getElementById("privcipaltitle").style.display;
	if(privcipal=="none"){
  	document.getElementById("privcipaltitle").style.display="block";
	}else{
	document.getElementById("privcipaltitle").style.display="none";
	   }
	}
  	function privcipaljf(){
	var privcipaljftitle=document.getElementById("privcipaljftitle").style.display;
	if(privcipaljftitle=="none"){
  	document.getElementById("privcipaljftitle").style.display="block";
	}else{
	document.getElementById("privcipaljftitle").style.display="none";
	   }
  	}
  	function privcipalyl(){
	var privcipalyltitle=document.getElementById("privcipalyltitle").style.display;
	if(privcipalyltitle=="none"){
  	document.getElementById("privcipalyltitle").style.display="block";
	}else{
	document.getElementById("privcipalyltitle").style.display="none";
	   }
  	}
  	function privcipalyq(){
	var privcipalyqtitle=document.getElementById("privcipalyqtitle").style.display;
	if(privcipalyqtitle=="none"){
  	document.getElementById("privcipalyqtitle").style.display="block";
	}else{
	document.getElementById("privcipalyqtitle").style.display="none";
	   }
  	}
</script>				</div>				
				
			</div>
		</div>  
	</div></center>
	<div class="div_bottom"></div>
	

<link href="<%=request.getContextPath()%>/help_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>



<script type="text/javascript">
	// 刷新加载
	window.onload = loadMenu();
</script>
</body></html>