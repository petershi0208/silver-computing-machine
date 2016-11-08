<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="callme_files/hm.js"></script><script>
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
<title>大钱财富-联系我们</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<meta name="keywords" content="">
<meta name="description" content="">
<link  href="index_files/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/callme_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/callme_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/callme_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/callme_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/callme_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/callme_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/callme_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/callme_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/callme_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/callme_files/WdatePicker.js" type="text/javascript">
</script><link type="text/css" rel="stylesheet" href="/Daqian/callme_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/callme_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/callme_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/callme_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/callme_files/lrtk.htm" rel="stylesheet" type="text/css">
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="callme_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
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
				
								
	</script>
	<style>
#setpage a:link, #setpage a:visited, #setpage a:hover,.current,#info{border:1px solid #DDD;background:#ffffff;display:inline-block;margin:1px;text-decoration:none;font-size:12px;width:20px;height:20px;text-align:center;line-height:19px;color:#AAA;padding:1px 2px;} 
#setpage a:hover{border:1px solid #27cbc7;background:#dff9f8;color:#27cbc7;} 
.current{border:1px solid #83E7E4;background:#DFF9F8;margin:1px;color:#27CBC7;} 
#info{width:auto;}
</style>
<center style="background-color: #f3f4f8;">
<div id="aboutindex_content" style="widht:100%;margin-top:-1%;">
	<div class="aboutindex_contentMain">
	<div class="aboutindex_top">
	<br>
	<a  href="<%=request.getContextPath()%>/user/index.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">公司介绍</span></a>
	</div>
			<div class="about_callMeContent_center">
				<div class="about_callMeContent_center_left">
<link href="<%=request.getContextPath()%>/callme_files/about.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/callme_files/about.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="8" type="hidden">
			<a id="anav1" href="http://www.lingyongdai.com/webApplicationAbout"> </a>
			<div class="nav" id="nav1">			  
			
			<a href="<%=request.getContextPath()%>/user/aboutourself.jsp">公司介绍</a> </div>
			<a id="anav4" href="">
				</a>
			<div class="nav" id="nav4">
			<a href="<%=request.getContextPath()%>/dynamic.do">	公司动态</a>
				</div>
				
				<a href="<%=request.getContextPath()%>/user/media.jsp">
				<div class="nav">
				媒体动态			</div></a>
				
				
			<a id="anav6" href="">
				</a>
			<div class="nav" id="nav6">
				<a href="<%=request.getContextPath()%>/user/Recruitment.jsp">诚聘英才</a>				</div>
				<!-- <a id="anav7" href="/webApplicationAbout/toMerchantsjoin">
				<div class="nav" id="nav7" >
				招商加盟
				</div></a> -->
				<a style="color: white;" id="anav8" href="">
				</a>
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav8" >
				  <a href="<%=request.getContextPath()%>/user/callme.jsp">联系我们</a>				
				 </div>    
				   
		  </div></div>
						<div class="about_callMeContent_center_about_right">
							<div class="about_callMeContent_center_about_right_pic"><img src="/Daqian/callme_files/new_callMe .jpg" width="790" height="305" /></div>
							
							<div class="about_callMeContent_center_about_right_adress_bgc" style="height:auto;margin-bottom:20px">
								<div class="about_callMeContent_center_about_right_adress_title"> 联系我们</div>
								
								<!-- <div class="about_callMeContent_city">上海</div> -->
								<div class="about_callMeContent_center_about_right_adress"> 				
									<div><ul><li><span style="color:#ff0000;font-size:14px;font-weight:bold">总部地址：</span></li></ul></div>
									<div class="about_callMeContent_center_about_right_blackadress">上海市逸仙路2816号华滋奔腾大厦A1205-1206室</div>
									<div class="about_callMeContent_center_about_right_phone"><div style="float: left;margin-right: 120px;">电话：400—839-2088</div><div>邮编：200441</div></div>			
								</div>
								
								<div class="about_callMeContent_center_about_right_adress"> 				
									<div><ul><li><span style="color:#ff0000;font-size:14px;font-weight:bold ">宁波分公司地址：</span></li></ul></div>
									<div class="about_callMeContent_center_about_right_blackadress">宁波市海曙区契闸街56号都市仁和中心一楼 </div>
									<div class="about_callMeContent_center_about_right_phone"><div style="float: left;margin-right: 120px;">电话：400-839-2088</div><div>邮编：315010</div></div>			
								</div>	
														
							</div>
										
				</div>
			</div>
			<div class="about_bottom"></div>	
	</div>
</div>
</center>

<link href="/Daqian/callme_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"/>
</center>



</body></html>