<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="dt2_files/hm.js"></script><script>
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
<link href="http://www.lingyongdai.com/new_style/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/dt2_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/dt2_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/dt2_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/dt2_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/dt2_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/dt2_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/dt2_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dt2_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dt2_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/dt2_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/dt2_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/dt2_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dt2_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dt2_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dt2_files/lrtk.htm" rel="stylesheet" type="text/css">
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

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="dt2_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
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
<style>
#setpage a:link, #setpage a:visited, #setpage a:hover,.current,#info{border:1px solid #DDD;background:#ffffff;display:inline-block;margin:1px;text-decoration:none;font-size:12px;width:20px;height:20px;text-align:center;line-height:19px;color:#AAA;padding:1px 2px;} 
#setpage a:hover{border:1px solid #27cbc7;background:#dff9f8;color:#27cbc7;} 
.current{border:1px solid #83E7E4;background:#DFF9F8;margin:1px;color:#27CBC7;} 
#info{width:auto;}
</style>
<center style="background-color: #f3f4f8;">
<div class="about_introducecontent">

	<div class="about_introducecontent_top">
	<a href="<%=request.getContextPath()%>/user/index.jsp"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">公司动态</span></a>
	</div>
	<div class="about_introducecontent_center">
		<div class="about_introducecontent_center_left">

<link href="<%=request.getContextPath()%>/dt2_files/about.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/dt2_files/about.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="4" type="hidden">
 				<a id="anav1"  href="<%=request.getContextPath()%>/user/aboutourself.jsp">
 				<div class="nav" id="nav1">
				公司介绍
				</div></a>
				
				<a style="color: white;" id="anav4"  href="<%=request.getContextPath()%>/user/dynamic.jsp">
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav4">
				公司动态
				</div>
				</a>
				<a id="anav6"  href="<%=request.getContextPath()%>/user/Recruitment.jsp">
				<div class="nav" id="nav6">
				诚聘英才
				</div></a>
				<!-- <a id="anav7" href="/webApplicationAbout/toMerchantsjoin">
				<div class="nav" id="nav7" >
				招商加盟
				</div></a> -->
				<a id="anav8" href="<%=request.getContextPath()%>/user/callme.jsp">
				<div class="nav" id="nav8">
				联系我们
				</div></a>    
				   
		  </div>		</div>
		<div class="about_introducecontent_center_right" style="height:auto;margin-bottom:50px">
			<div class="about_introducecontent_center_right_title2">
			大钱财富理财产品即将上线 股市亏的钱从这里挣回来!
			</div>
			<div class="about_introducecontent_center_right_title3">
			发布时间：2015-07-23&nbsp;&nbsp;来源：大钱财富
			</div>
			<p class="txtp">2015年8月3日，零用贷线上理财平台将上线试运营。届时，线上理财平台将推出多款风险小、收益高、灵活<br />性强的理财产品。如月月盈、季度盈、年度盈、双年盈等。受邀参与测试的部分用户可便捷的在零用贷官网参与任<br>意款理财产品的选购。
			</p>
			<p class="txtp">
			零用贷是大钱财富(DAQIACAIFU)金融旗下的P2P理财平台，在2013年首创推出，主营投资理财和小微额信贷业<br />务。发展至今，零用贷一直恪守行业法规，与第三方支付平台易宝合作，公开、透明、安全的保障投资人的利益。
			</p>
			 <p class="txtp">
			 大钱财富金融成立于2011年，注册资金1亿元，总部位于上海。成立至今，已拥有21家分公司，分布于香港、北京、<br />上海、深圳、南京、无锡、苏州、杭州、宁波、温州、台州、嘉兴、金华、合肥等。是CCTV《影响力对话》栏目<br />和SMG《商家》的优秀合作伙伴。
			</p>
			 <p class="txtp">
			8月3日试运营当日，大钱财富将面向受邀的部分用户重磅推出“秒抢活动”，活动于上午十点开始，详情可登陆<br />大钱财富官网（DaQianCaiFu.com）。
			</p>
     		<p class="txtp">
			 
			</p><p style="text-align: center;margin-bottom:40px"><img  src="<%=request.getContextPath()%>/dt2_files/table.png"></p>
			<p></p>
	  </div>
			
			
		</div>
		
	</div>

	<div class="about_introducecontent_bottom"></div>
  

</center>


<link href="<%=request.getContextPath()%>/dt2_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>



</body></html>