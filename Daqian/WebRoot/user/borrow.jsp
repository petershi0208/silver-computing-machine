<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head><script src="borrow_files/hm.js"></script><script src="borrow_files/hm_002.js"></script><script>
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
<title>大钱财富-借款</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">

<meta name="keywords" content="">
<meta name="description" content="">
 <link href="<%=request.getContextPath()%>/borrow_files/ligerui-all.css" rel="stylesheet" type="text/css">
 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">

    <link href="<%=request.getContextPath()%>/borrow_files/all.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/borrow_files/index.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/borrow_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/borrow_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/borrow_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/borrow_files/ligerDialog.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/borrow_files/index.js" type="text/javascript"></script>
	<script  src="<%=request.getContextPath()%>/index_files/jquery-1.7.1.min.js" type="text/javascript"></script><!-- 客服联动-->


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/borrow_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/borrow_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/borrow_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/borrow_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="borrow_files/WdatePicker.css">

<link href="<%=request.getContextPath()%>/borrow_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/borrow_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/borrow_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/borrow_files/lrtk.htm" rel="stylesheet" type="text/css">



<style type="text/css">
#li-ul li a{ font-size:15px;height:22px;line-height: 22px}
.STYLE1 {font-size: 36px}
*{margin:0;padding:0;list-style:none;}
body{font-family:'MicroSoft Yahei'}
#rightButton{ position:fixed; _position:absolute; top:208px; right:0; z-index:999999; display:block;}
#right_ul{ position:relative;}
#right_qq{ background:url(/Daqian/totop/qq.png) no-repeat; width:68px; height:74px; }
#right_tel{ background: url(/Daqian/totop/02.png) no-repeat; width:68px; height:77px; }
#right_tip{  background:url(/Daqian/totop/flag_right.png) no-repeat; width:252px; height:91px; position:absolute; right:70px; top:-10px; display:none; z-index:999999; }
.flagShow_p1{ float:left; margin-left:15px; _margin-left:5px; font-size:15px; line-height:25px;}
.flagShow_p2{ float:left; margin-left:70px; _margin-left:5px; font-size:18px;  color:#FA7C00;}
.flagShow_p2 a{ display:block; margin: 20px 0 5px 12px; line-height:0;}
.flagShow_p2 span{ margin: 0 0 0 14px; }
.flag_qq{ display:none;}
#backToTop{z-index:999999; display:none;}
a.backToTop_a{  background: url(/Daqian/totop/01.png) no-repeat; width:68px; height:79px; display:block; }
a.backToTop_a:active{  background:url(/Daqian/totop/01.png) no-repeat; }
.line91{ line-height:91px; }
</style>

<script src="<%=request.getContextPath()%>/js/head.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/borrow_files/borrowdetail.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/borrow_files/detail.js" type="text/javascript"></script>
</head>

<body>
<div>
<!--右侧图标-->
<div id="rightButton">
	<ul id="right_ul">
		<li id="right_qq" class="right_ico" show="qq" hide="tel"></li>
		<li id="right_tel" class="right_ico" show="tel" hide="qq"></li>
		<li id="right_tip" class="png">
		<p class="flagShow_p1 flag_tel">咨询电话</p>
		<p class="flagShow_p2 flag_tel line91">400-839-2088</p>
		<p class="flagShow_p1 flag_qq">咨询QQ</p>
		<p class="flagShow_p2 flag_qq">
		<a href="http://wpa.qq.com/msgrd?v=3&uin=1061465170&site=qq&menu=yes" target="_blank">
		<img border="0" src="/Daqian/totop/qiyeQQ.png"></a> 
		</li>
        
	</ul><br />
</div>

<script type="text/javascript">
$(document).ready(function(e) {
	$("#rightButton").css("right", "0px");
	
    var button_toggle = true;
	$(".right_ico").live("mouseover", function(){
		var tip_top;
		var show= $(this).attr('show');
		var hide= $(this).attr('hide');
		tip_top = show == 'tel' ?  65 :  -10;
		button_toggle = false;
		$("#right_tip").css("top" , tip_top).show().find(".flag_"+show).show();
		$(".flag_"+hide).hide();
		
	}).live("mouseout", function(){
		button_toggle = true;
		hideRightTip();
	});
	
	
	$("#right_tip").live("mouseover", function(){
		button_toggle = false;
		$(this).show();
	}).live("mouseout", function(){
		button_toggle = true;
		hideRightTip();
	});
	
	function hideRightTip(){
		setTimeout(function(){		
			if( button_toggle ) $("#right_tip").hide();
		}, 500);
	}
	
	$("#backToTop").live("click", function(){
		var _this = $(this);
		$('html,body').animate({ scrollTop: 0 }, 500 ,function(){
			_this.hide();
		});
	});

	$(window).scroll(function(){
		var htmlTop = $(document).scrollTop();
		if( htmlTop > 0){
			$("#backToTop").fadeIn();	
		}else{
			$("#backToTop").fadeOut();
		}
	});
});
</script>


<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 0px; height: 0px;" src="index_files/My97DatePicker_002.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
<input id="huodongbiaoId" name="huodongbiaoId" value="H2015080601" type="hidden">
	<div style="width:100%; margin:0;">

		<center>
			<div id="top">

				<div class="head_pojoDiv_01">
					<div class="head_pojoDiv_02">


						<div class="head_leftService_DIV">
							<a href="">
								<div id="head_phone">
										<div id="imgs"><img src="<%=request.getContextPath()%>/index_files/huiseipone.png" style="margin-left:30px; margin-top:-2px;" onmousemove="this.src='<%=request.getContextPath()%>/index_files/whiteipone.png'" onmouseout="this.src='<%=request.getContextPath()%>/index_files/huiseipone.png'" height="23px" width="190px"></div>
								</div>
						  </a>
					  </div>
                        <div class="head_concern">
                        <a target="_blank" href="">
                        <div id="head_con">
                        <span class="concern_we">关注我们</span>
                        <div id="imgs">
						<nobr><img src="<%=request.getContextPath()%>/index_files/wb.png"></nobr><nobr>
						</nobr><nobr><img src="<%=request.getContextPath()%>/index_files/wx.png"></nobr><nobr>
						</nobr></div><nobr>
                        </nobr></div><nobr>
                        
                        </nobr></a><nobr>
                        
                        </nobr></div><nobr>
					   <div class="head_weixin_div">
                        <a href="#">
                        <div id="head_weixin" onmouseover="disBlock('imgs_ios');" onmouseout="disNone('imgs_ios');">
                        <div id="imgs"></div>
                        </div>
                        </a>
                        <a href="#">
                        <div id="head_mobile" >
                        <div id="imgs_ios" style="display: none;">
                         <div style="float:left;">
                        	<p>
                        		<img src="<%=request.getContextPath()%>/index_files/erweima.png" alt="">
                        	</p>
                        	<p style="text-align:center">苹果系统</p>
                         </div>
                         <div style="float:left;margin-left:5%;">
	                        <p>
	                            <img src="<%=request.getContextPath()%>/index_files/erweima.png" alt="">
	                        </p>
                        	<p style="text-align:center">安卓系统</p>
                          </div>
                           <em id="up"></em>
                        </div>
                      
                       <!--  <div id="imgs_android" style="margin-left:10px;"></div> -->
                        </div>
                        </a>
                      </div>
                         

					  <div class="head_right_Div">				
							<input id="username" name="username" value=${username}>
							
                          <span style="display: none;" id="welcome_username" class="head_right_Font">
                           	  <span class="head_right_Font03">您好，</span>
                            	
                           	  <a title="个人信息" href="http://www.lingyongdai.com/webApplicationUserCenter?secondBackImg=secondBackImg_1&amp;secondfont=secondfont_1&amp;menu=myAccount&amp;rank=01&amp;Fontcolor=menuFontcolor&amp;menuid=menuId&amp;secondbackimg=secondBackImg_1&amp;secondfont=secondfont_1" style="color: #FFF;">
                           		  <span class="head_right_Font02">${username}</span>&nbsp;&nbsp;                           	  </a>
                              <a title="退出" href="/Daqian/destroy.do">
                            	  <span id="head_03" class="head_right_Font02">[退出]</span>                              </a> &nbsp;&nbsp;
              
                              <a title="系统消息" href="http://www.lingyongdai.com/webApplicationUserCenter/getMessagerie?secondBackImg=secondBackImg_16&amp;secondfont=secondfont_16&amp;menu=messageManage&amp;rank=05&amp;Fontcolor=messageFontcolor&amp;menuid=messageManageId&amp;secondbackimg=secondBackImg_16&amp;secondfont=secondfont_16"> 
								  <span id="head_03" class="head_right_Font02">消息</span> </a>  
								  
								<a href="<%=request.getContextPath()%>/user/help.jsp"> 
							  <span id="head_03" class="head_right_Font02" style="margin-left:20px;">帮助</span></a>
						</span>
					         
                          <span style="" id="Not_loggedin">
							  <a href="<%=request.getContextPath()%>/user/registered.jsp"> 
								  <span id="head_01" class="head_right_Font">快速注册</span>							  </a> 
								
							  <a href="<%=request.getContextPath()%>/user/login.jsp"> 
								  <span id="head_02" class="head_right_Font">立即登录</span>	 </a>
								  
								  <a href="<%=request.getContextPath()%>/user/help.jsp"> 
							  <span id="head_03" class="head_right_Font02">帮助</span></a>
								  </span> 
							
						  
					</div>
					</nobr></div><nobr>
				</nobr></div><nobr>
				

			
				<div class="head_tow_div">

					<div class="head_tow_div_02">
						<div class="head_tow_div_03">
							<a href="<%=request.getContextPath()%>/index.do" title="LOGO">
								<div class="head_pojoDiv_04"></div>
								<div class="head_logoImg">
								<img src="<%=request.getContextPath()%>/index_files/logo.png" height="48" width="159">								</div>
							</a>

							<div class="head_title02Img">
							<img src="<%=request.getContextPath()%>/index_files/l.png" style="margin-left:15px; margin-top:-10px">
							</div>

								<div class="head_title03Img"><img src="<%=request.getContextPath()%>/index_files/ll.png" height="25" width="270"></div>
						 		<a href="<%=request.getContextPath()%>/index.do"  style="position:relative; color: #666666; font-size:18px; left:-10px; top:13px">首页</a>
								<a href="<%=request.getContextPath()%>/product.do"  style="position:relative; color: #666666; font-size:18px; left:0px; top:13px">我要理财</a>							
								<a href="<%=request.getContextPath()%>/user/borrow.jsp"  style="position:relative; color: #666666; font-size:18px; left:10px; top:13px">我要借款</a>
								<a href="<%=request.getContextPath()%>/tomember.do"  style="position:relative; color: #666666; font-size:18px; left:20px; top:13px">会员中心</a>
								<a href="<%=request.getContextPath()%>/user/guide.jsp"  style="position:relative; color: #666666; font-size:18px; left:30px; top:13px">新人指南</a>
								<a href="<%=request.getContextPath()%>/user/aboutourself.jsp"  style="position:relative; color: #666666; font-size:18px; left:40px; top:13px">关于我们</a>
											
					   	</div>
					</div>
				</div>
			</nobr></div><nobr>
		</nobr></center><nobr>
	</nobr></div><nobr>
	<div class="head_pojoDiv_05"></div>
	<script type="text/javascript">
		/*	$(document).ready(function(){
					if($("#username").val()=="" || $("#username").val() == null){
						$("#welcome_username").css("display","none");
						$("#Not_loggedin").css("display","show");
					}else if($("#username").val()!="" || $("#username").val() != null){
						$("#welcome_username").css("display","show");
						$("#Not_loggedin").css("display","none");
					}
				
				});
           */                 

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
				
								
</script><link href="<%=request.getContextPath()%>/borrow_files/timetable.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/borrow_files/qq.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/borrow_files/jquery-client-1.js"></script>

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?2e5582fe3431cca088602860ebc4c88a";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

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
        <div style="height:auto; width:100%;">
			<form action="/luckLoginLoan/lockloan" method="post" id="form">
			  <div class="pro_index">
                <div class="pro_frist">
                  <p style="font-size:16px; color:#666666;display:inline; font-family:微软雅黑;">我要借款&nbsp; <i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>&nbsp; <span style="color:#ca141d;">产品介绍</span></p>
                </div>
                <input type="hidden" id="username" value="${username}"/>     
                <input type="hidden" id="realname" value="${realname}"/>
                <input type="hidden" id="role" value="${role}"/>        
			    <div class="pro_box"> <a>
                  <div class="pro_img"> <img src="<%=request.getContextPath()%>/borrow_files/sb.png" width="210" height="240" /> </div>
                  </a>
			        <div class="pro_info">
			          <div class="pro_infotop"> <a>
                        <div class="infotop_left"> <img src="<%=request.getContextPath()%>/borrow_files/danbao.png" width="33" height="33" /> </div>
			            </a>
			              <div class="infotop_right">
			                <h3> <a href="###"> </a><a href="" target="_blank"> 【大钱】--零花钱 </a> </h3>
			                <p></p>
		                </div>
			            <!-- @hanzg 2015/07/10体验标 右侧显示体验标标记-->
                          <div class="posi_new" style="float: right;width: 38px;height: 38px;margin: 12px 18px 0px 20px;"> </div>
			            <!-- 新手标使用infotop_full 非新手标使用infotop_kong-->
                        <div class="infotop_kong"></div>
		              </div>
			          <div class="pro_infobot">
                        <div class="infobot_1">
                          <p class="one_tit">申请条件:</p>
                          <br />
                          <p class="one">• 18-55周岁大陆本地人</p>
                          <br />
                          <p class="one">• 当前在职公积金每月缴纳</p>
                          <p class="one"> &nbsp&nbsp一定数额</p>
                        </div>
                        <div class="infobot_1">
                          <p class="one_tit">准备资料:</p>
                          <br />
                          <p class="one">• 身份证</p>
                          <br />
                          <p class="one">• 社保或劳动合同</p>
                        </div>
                        <div ><a><img src="<%=request.getContextPath()%>/borrow_files/xq.png" align="middle" style="margin-top:60px; margin-left:40px; cursor:pointer;" id="linghuaqian"/></a></div>
		              </div>
		          </div>
                </div>
                 <div class="borrowdetail" id="borrowdetail2">
                	<p class="detailp">借款方式</p>
                	<p class="detailp2">借款额度：500-30000</p>
                	<p class="detailp2">借款利率：按周收取服务费</p>
                	<p class="detailp2">借款期限：一周或以上</p>
                	<p class="detailp2">放款速度：当天放款</p>
                
                	<a id="ling"><img src="<%=request.getContextPath()%>/borrow_files/apply.png"/></a>
                </div>
                
                <div class="pro_box">
                  <div class="pro_img"> <img src="<%=request.getContextPath()%>/borrow_files/gx.png" width="211" height="240" /> </div>
                  <div class="pro_info">
                    <div class="pro_infotop">
                      <div class="infotop_left"><img src="<%=request.getContextPath()%>/borrow_files/danbao.png" width="33" height="33" /></div>
                      <div class="infotop_right">
                        <h3> <a href="" target="_blank"> 【大钱】--急用贷</a></h3>
                      </div>
                      <!-- @hanzg 2015/07/10体验标 右侧显示体验标标记-->
                      <div class="posi_new" style="float: right;width: 38px;height: 38px;margin: 12px 18px 0px 20px;"> </div>
                      <!-- 新手标使用infotop_full 非新手标使用infotop_kong-->
                    </div>
                    <div class="pro_infobot">
                      <div class="infobot_1">
                        <p class="one_tit">申请条件:</p>
                        <br />
                        <p class="one">• 18-55周岁大陆公民</p>
                        <p class="one">• 当前在职公积金每月缴纳</p>
                    	<p class="one"> &nbsp&nbsp一定数额</p>
                        <p class="one">• 有住房</p>
                        
                      </div>
                      <div class="infobot_1">
                        <p class="one_tit">准备资料:</p>
                        <br />
                        <p class="one">• 身份证</p>
                        <p class="one">• 房产证</p>
                        <p class="one">• 社保或劳动合同</p>
                      </div>
                      <a><img src="<%=request.getContextPath()%>/borrow_files/xq.png" align="middle" style="margin-top:60px; margin-left:40px;cursor:pointer;" id="jiyongdai"/> </a>
                    </div>
                  </div>
                </div>
                <div class="borrowdetail" id="borrowdetail">
                	<p class="detailp">借款方式</p>
                	<p class="detailp2">借款额度：5000-30000</p>
                	<p class="detailp2">借款利率：按周收取服务费</p>
                	<p class="detailp2">借款期限：三个月以上</p>
                	<p class="detailp2">放款速度：当天放款</p>
                	<img id="ji" src="<%=request.getContextPath()%>/borrow_files/apply.png"/>
                </div>
                
                
			    <div class="pro_box"> <a>
                  <div class="pro_img"> <img src="<%=request.getContextPath()%>/borrow_files/yh.png" width="209" height="240" /> </div>
                  </a>
			        <div class="pro_info">
			          <div class="pro_infotop"> <a>
                        <div class="infotop_left"> <img src="<%=request.getContextPath()%>/borrow_files/danbao.png" width="33" height="33" /> </div>
			            </a>
			              <div class="infotop_right">
			                <h3> <a href="###"> </a><a href="" target="_blank"> 【大钱】--家用贷 </a> </h3>
			                <p></p>
		                </div>
			            <!-- @hanzg 2015/07/10体验标 右侧显示体验标标记-->
                          <div class="posi_new" style="float: right;width: 38px;height: 38px;margin: 12px 18px 0px 20px;"> </div>
			            <!-- 新手标使用infotop_full 非新手标使用infotop_kong-->
                          <div class="infotop_kong"></div>
		              </div>
			          <div class="pro_infobot">
                        <div class="infobot_1">
                          <p class="one_tit">申请条件:</p>
                          <br />
                          <p class="one">• 18-55周岁大陆本地人</p>   
                          <p class="one">• 当前在职公积金每月缴纳</p>
                          <p class="one"> &nbsp&nbsp一定数额</p>
                          <p class="one">• 有住房</p>
                        </div>
                        <div class="infobot_1">
                          <p class="one_tit">准备资料:</p>
                          <br />
                          <p class="one">• 身份证</p>
                          <p class="one">• 房产证</p>
                          <p class="one">• 社保或劳动合同 </p>
                        </div>
                        <div> <a><img src="<%=request.getContextPath()%>/borrow_files/xq.png" align="middle" style="margin-top:60px; margin-left:40px; cursor:pointer;" id="jiayongdai"/></a></div>
		              </div>
		          </div>
                </div>
                 <div class="borrowdetail" id="borrowdetail3">
                	<p class="detailp">借款方式</p>
                	<p class="detailp2">借款额度：10000-50000</p>
                	<p class="detailp2">借款利率：按周收取服务费</p>
                	<p class="detailp2">借款期限：一个月或以上</p>
                	<p class="detailp2">放款速度：当天放款</p>
                	<img id="jia" src="<%=request.getContextPath()%>/borrow_files/apply.png"/>
                </div>
                
                
			    <div class="pro_box"> <a>
                  <div class="pro_img"> <img src="<%=request.getContextPath()%>/borrow_files/qy.png" width="209" height="240" /> </div>
                  </a>
			        <div class="pro_info">
			          <div class="pro_infotop"> <a>
                        <div class="infotop_left"> <img src="<%=request.getContextPath()%>/borrow_files/danbao.png" width="33" height="33" /> </div>
			            </a>
			              <div class="infotop_right">
			                <h3> <a href="###"> </a><a href="" target="_blank"> 【大钱】--商业贷 </a> </h3>
			                <p></p>
		                </div>
			            <!-- @hanzg 2015/07/10体验标 右侧显示体验标标记-->
                          <div class="posi_new" style="float: right;width: 38px;height: 38px;margin: 12px 18px 0px 20px;"> </div>
			            <!-- 新手标使用infotop_full 非新手标使用infotop_kong-->
                          <div class="infotop_kong"></div>
		              </div>
			          <div class="pro_infobot">
                        <div class="infobot_1">
                          <p class="one_tit">申请条件:</p>
                          <br />
                          <p class="one">• 18-55周岁大陆本地人</p>
                          <p class="one">• 有住房</p>
                          <p class="one">• 企业主且有公司流水</p>
                        </div>
                        <div class="infobot_1">
                          <p class="one_tit">准备资料:</p>
                          <br />
                          <p class="one">• 身份证和房产证</p>
                          <p class="one">• 近期对账单</p>                     
                          <p class="one">• 企业营业执照</p>
                        </div>
                        <div> <a><img src="<%=request.getContextPath()%>/borrow_files/xq.png" align="middle" style="margin-top:60px; margin-left:40px;cursor:pointer;" id="shangyongdai"/></a></div>
		              </div>
		          </div>
                </div>
                 <div class="borrowdetail" id="borrowdetail4">
                	<p class="detailp">借款方式</p>
                	<p class="detailp2">借款额度：50000-100000</p>
                	<p class="detailp2">借款利率：按周收取服务费</p>
                	<p class="detailp2">借款期限：三个月以上</p>
                	<p class="detailp2">放款速度：当天放款</p>
                	<img id="shang" src="<%=request.getContextPath()%>/borrow_files/apply.png"/>
                </div>
                
			    <a href="javascript:alert('%E7%B3%BB%E7%BB%9F%E5%8D%87%E7%BA%A7%E4%B8%AD%EF%BC%8C%E6%95%AC%E8%AF%B7%E6%9C%9F%E5%BE%85!');">		      
		        </a>
		        
		     	</div>
            </form>
   </div>
       </div>
</center>


<link href="<%=request.getContextPath()%>/borrow_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"/>
</center>



</body>
</html>