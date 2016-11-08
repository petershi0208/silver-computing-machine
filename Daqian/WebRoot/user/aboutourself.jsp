<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="aboutourself_files/hm.js"></script><script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>


<title>大钱财富-关于我们</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
 <link href="<%=request.getContextPath()%>/aboutourself_files/ligerui-all.css" rel="stylesheet" type="text/css">
 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
<script src="<%=request.getContextPath()%>/introduction_files/jquery-1.js" type="text/javascript"></script>
    <link href="<%=request.getContextPath()%>/aboutourself_files/all.css" rel="stylesheet" type="text/css">


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->

<link type="text/css" rel="stylesheet" href="aboutourself_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/aboutourself_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/aboutourself_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/aboutourself_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/aboutourself_files/lrtk.htm" rel="stylesheet" type="text/css">



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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="aboutourself_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
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
	<a  href="index.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">公司介绍</span></a>
	</div>
	
	<div class="aboutindex_content_center">
		<div class="aboutindex_content_left">
<link href="<%=request.getContextPath() %>/aboutourself_files/about.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/aboutourself_files/about.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="1" type="hidden">
 				<a style="color: white;" id="anav1" href="<%=request.getContextPath() %>/user/aboutourself.jsp">
 				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav1">
				公司介绍
			</div></a>
			<a id="anav4"  href="<%=request.getContextPath() %>/dynamic.do">
				<div class="nav" id="nav4">
				公司动态
				</div>
				</a>
				
				<a href="<%=request.getContextPath()%>/user/media.jsp">
				<div class="nav">
				媒体动态			</div></a>
				
				<a id="anav6" href="<%=request.getContextPath() %>/user/Recruitment.jsp">
				<div class="nav" id="nav6">
				诚聘英才
				</div></a>
				<!-- <a id="anav7" href="/webApplicationAbout/toMerchantsjoin">
				<div class="nav" id="nav7" >
				招商加盟
				</div></a> -->
				<a id="anav8" href="<%=request.getContextPath() %>/user/callme.jsp">
				<div class="nav" id="nav8">
				联系我们
				</div></a>    
				   
		  </div></div>
		<div class="aboutindex_content_right">
			<div class="aboutindex_content_right_pic">
			<img src="<%=request.getContextPath()%>/aboutourself_files/new_aboutUs.png" height="280" width="790">
			<!-- <img src="/styles/web/image/jie/business.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/cctv_yingxiang.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/lingyongdai_product.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/lingyongdai_safe.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/personal.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/personal_permission.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/shanghai_message.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/shanghai_web.png" style="margin-top:2%;" />
			<img src="/styles/web/image/jie/yingxiang_permission.png" style="margin-top:2%;" />
			 -->
			</div>
			<div class="aboutindex_content_right_txt">
				<div class="aboutindex_content_right_txtbody">
					<div class="aboutindex_content_right_txt_title">大钱财富简介 Group Introduction</div>				
					<div class="aboutindex_content_right_txt_txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宁波大钱资产管理有限公司（简称"大钱财富"）是大钱资产管理（上海）有限公司旗下全资子公司，于2008年成立总部位于上海。大钱财富根据客户现有的资产配置、风险偏好、家庭结构等因素，为客户量身定制理财规划，提供悉心专业的财富管理顾问、精确及时的财富管理资讯和品种丰富的投资理财产品，帮助客户实现安全、稳定的财富增值。我们专注于您独特的财富目标，让您安心畅享资本收益</div>					
					<div class="aboutindex_content_right_txt_subtitle">我们的价值观</div>
					<div class="aboutindex_content_right_txt_txt">大钱财富，财富天下。</div>
					<div class="aboutindex_content_right_txt_subtitle">我们的愿景</div>
					<div class="aboutindex_content_right_txt_txt">我们专注于客户资金需求，始终以客户为尊，服务至上,为商家和个人提供更多的财富增值服务。</div>
					<div class="aboutindex_content_right_txt_subtitle">我们的使命</div>
					<div class="aboutindex_content_right_txt_txt">要融资找大钱，保障您的财富升值！</div>
					<div class="aboutindex_content_right_txt_subtitle">我们的理念</div>
					<div class="aboutindex_content_right_txt_txt">诚信：诚信为本，服务至上<br>
					高效：以人为本，精益求精<br>
					财富：到期收益，连本带利<br>
					安全：三方托管，资金安全
					</div>
					<div class="aboutindex_content_right_txt_subtitle">我们的员工</div>
					<div class="aboutindex_content_right_txt_txt">
					  <p>信任员工，鼓励其发展。<br>
					给每个人人生的舞台，给每个人充分发挥自己的机会<br>
					开心工作，快乐生活<br>
					让我们共同进步，共同实现梦想					</p>
					  <p><img src="<%=request.getContextPath()%>/aboutourself_files/a.png" width="788" height="392" style="margin-left:-27px" /> </p>
					</div>
				</div>
			</div>
		</div>
	<div class="aboutindex_content_bottom"></div>
	</div>
</div></div></center>


<link href="<%=request.getContextPath()%>/index_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"/>
</center>




</body></html>