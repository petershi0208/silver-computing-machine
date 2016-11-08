<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="dt1_files/hm.js"></script><script>
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
 <link href="<%=request.getContextPath()%>/dt1_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/dt1_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/dt1_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/dt1_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/dt1_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/dt1_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/dt1_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dt1_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dt1_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/dt1_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/dt1_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/dt1_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dt1_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dt1_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/dt1_files/lrtk.htm" rel="stylesheet" type="text/css">
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


<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="dt1_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
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
	<a href="index.htm"> <span class="about_top_shouye">首页</span> </a> 
	<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
	<a href="###"><span class="about_top_myAccount">公司动态</span></a>
	</div>
	<div class="about_introducecontent_center">
		<div class="about_introducecontent_center_left">

<link href="/Daqian/dt1_files/about.css" rel="stylesheet" type="text/css">
<script src="/Daqian/dt1_files/about.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="4" type="hidden">
 				<a id="anav1" href="<%=request.getContextPath()%>/user/aboutourself.jsp">
 				<div class="nav" id="nav1">
				公司介绍
				</div></a>
				<a style="color: white;" id="anav4" href="<%=request.getContextPath()%>/user/dynamic.jsp">
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
			互联网金融指导意见出台 P2P迎来行业的春天
			</div>
			<div class="about_introducecontent_center_right_title3">
			发布时间：2015-07-23&nbsp;&nbsp;来源：大钱财富</div>
			
			<p class="txtp">中国人民银行、工信部、公安部、银监会等十部委正式发布《关于促进互联网金融健康发展的指导意见》，首<br>次明确互联网金融的概念，并划分监管职能部门。此次《指导意见》确立了互联网支付、网络借贷、股权众筹融<br>资、互联网基金销售、互联网保险、互联网
			信托和互联网消费金融等互联网金融主要业态的监管职责分工，落实<br>了监管责任，明确了业务边界。《指导意见》的出现，也预示着对P2P行业正式告别“无监管”时代，向法制化、<br>规范化不断迈进。
			</p>
			<p class="txtp">
			 
《指导意见》中明确了P2P网贷企业和网贷业务的合法地位，为P2P网贷正了名，这一利好消息引来了整个互<br>联网金融行业的点赞声一片。作为首批国内的小微
额信贷P2P平台，大钱财富（DAQIANCAIFU）一直积极响应<br>国家号召，紧跟政策走在行业的前沿。作为一个真正合法、合规的P2P平台，早在政策出台前，大钱财富
<br>（DAQIANCAIFU）就一直是行业的佼佼者，通过不懈努力历经四年多的探索前行，如今已成长为具有500人规<br>模的P2P网贷企业，发展速度和企业规模令同行纷纷侧目。
			</p>
			<p style="font-size:14px;color:#000;padding-left:55px;font-family:Microsoft YaHei">可圈可点大钱财富（DAQIANCAIFU）大事记：</p>
			<p class="txtp">
			
             1.2013年，和中国行业支付的开创者和领导者易宝合作，开设资金托管，最大限度的保障了用户的资金安<br>全。
			</p>
			<p class="txtp">
			  2.2014年，大钱财富（DAQIANCAIFU）因其首创零用贷模式而受到广泛的关注，受CCTV《影响力对话》栏目邀<br>请，参与了访谈录制，向全国用户介绍了零用贷的由来及对行业产生的深远影响，并有幸成为了CCTV《影响力对<br>话》栏目的合作伙伴。
			</p>
			<p class="txtp">
			  3.2015年，和上海市最大规模、有着17年历史的律师事务所-上海锦天城律师事务所合作，致力于平台的合法<br>与合规性发展。
			</p>
			<p class="txtp">
			  
			4.公司创立至今，凭借出色的服务及创新模式荣获多种荣誉，上海市商务委员会优秀企业，上海市经济和信息<br>化委员会优秀企业，中国互联网金融行业协会会员单
			位，CCTV《影响力对话》栏目金融行业合作伙伴，上海电视<br>	台第一财经《商家》专访优秀单位，中国最具诚信互联网金融服务示范平台等。
			</p>
			<p class="txtp">
			
			大钱财富（DAQIANCAIFU）不仅在四年的发展过程中处处做到有效先行，更是在安全风控上做的非常专业。大钱<br>财富（DAQIANCAIFU）一直以打造零坏账体系为己
			任，不断累积完善的六大风控举措对贷前、贷中、贷后做了严密的<br>审核和监控，使得大钱财富（DAQIANCAIFU）成为用户值得信赖的安全平台。此次《指导意见》的
			出台，就如暗夜前<br>行之路上的照明灯，必将指引着大钱财富（DAQIANCAIFU）走的更远！		
			</p>
			<div><img src="<%=request.getContextPath()%>/dt1_files/spring.jpg" width="485" height="229"/></div>
	  </div>
			
			
		</div>
		
	</div>
	

	<div class="about_introducecontent_bottom"></div>
  

</center>


<link href="<%=request.getContextPath()%>/dt1_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>



</body></html>