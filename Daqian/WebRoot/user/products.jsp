<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475"></script>
<script src="//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475"></script>
<script src="products_files/hm.js"></script>
<script src="products_files/hm.js"></script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大钱理财购买页面</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<link href="<%=request.getContextPath()%>/products_files/financialBuy.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/products_files/jquery-1.js"></script>
<link href="<%=request.getContextPath()%>/products_files/qq.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/products_files/jquery-client-1.js"></script>
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
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/products_files/WdatePicker_002.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/products_files/WdatePicker.css">
</head>
<body>
<input id="username" value="${username}" type="hidden"/>
<input id="card" value="${card}" type="hidden"/>
<input id="role" value="${role}" type="hidden"/>
<input id="availablemoney" value="${availablemoney }" type="hidden"/>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="products_files/My97DatePicker_002.htm" border="0" scrolling="no" frameborder="0"></iframe></div><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 0px; height: 0px;" src="products_files/My97DatePicker_002.htm" border="0" scrolling="no" frameborder="0"></iframe></div>
﻿

<script>
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
<title>产品详情</title>
<meta name="keywords" content="">
<meta name="description" content="">
 <link href="file:///D:/Documents/11/%E5%A4%A7%E9%92%B1/index_files/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/products_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/products_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/products_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/products_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/products_files/ligerDialog.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/products_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/products_files/WdatePicker.js" type="text/javascript"></script>

<link href="<%=request.getContextPath()%>/products_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/products_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/products_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/products_files/lrtk.htm" rel="stylesheet" type="text/css">
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
	<script src="<%=request.getContextPath()%>/js/head.js" type="text/javascript"></script>
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
	/*			function borproduct(){
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
		*/		
								
	</script>
	<center style="background-color: #f3f4f8;">
	   <div>
         <div id="moquu_wxin" class="moquu_wxin"><a href="javascript:void(0)"> </a></div>
        <div id="moquu_wshare" class="moquu_wshare"><a href="javascript:void(0)"></a></div>
        <a style="display: none;" id="moquu_top" href="javascript:void(0)"></a>
      </div>
        <div style="height:auto; width:100%;">
	       
	          <input name="onlineProduct" id="onlineProduct" value="H2015080601" type="hidden">
	          <input name="creatTimedate" id="creatTimedate" value="2015.08.06" type="hidden">
	          <input name="expireTimedate" id="expireTimedate" value="2015.08.07" type="hidden">
              <div class="financial">
			    <div class="financial_frist">
			       <p style="font-size:16px; color:#666666;display:inline; font-family:微软雅黑;">我要理财<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>&nbsp;产品介绍&nbsp;
			          <i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
			          <span style="color:#ca141d;font-size:16px;">${p.productname }&nbsp;(H    ${p.pdate}<span class="pid">${p.pid }</span>        期)&nbsp;</span>
			          <input value="H2015080601" id="onlineProductTermm" type="hidden">
		          </p> 
			    </div>
			  <div class="financial_two">
			    <div class="product">${p.productname }</div>
			    <div class="products">本息安全</div>
			  </div>
			  <div class="financial_frists">
                 <div style="width:55%;height:310px;float:left;">
                   <div style="width:100%;height:40px;">
                       <ul class="prod">
                             <li style="margin-left:103px;">金额</li>
                             <li>预期收益(年)</li>
                             <li>期限</li>
                       </ul>
                   </div>
                   <div style="width:100%;height:40px;">
                        <ul class="prods">
							 <li style="margin-left:40px;width: 170px;text-align: center;" ><sapn class="maxmoney">${p.maxmoney }</sapn><em>元</em></li>
                             <li style="margin-left:45px;color:#e74c3c;width: 90px;text-align: center;">
                             	${minp.yearreturn }~${maxp.yearreturn }%
                             </li>
                             <li id="judgeProType" style="margin-left:96px;color:#e74c3c;text-align: center;width: 80px;">${p.cycle }<em>个月</em></li>
                        </ul>
                   </div>
                   <div class="perdiv">
                   			<span class="lastmoney" style="display:none;">${p.lastmoney}</span>
                            <span class="per">
                            <em data-value="89" class="perem" id="percent_sm">
                            </em>
                            </span>&nbsp;&nbsp;
                            <span style="color:#595757;font-size:12px;" class="baif"></span>
                   </div>
                   <script type="text/javascript">
						
				   </script>
                   
                   <div style="width:100%;height:40px;">
                       <ul class="prod">
                            <li class="buyguem" style="margin-left:63px;margin-top:40px;">发布日期：<em style="color:#ee7d2d;">${p.pdate }</em></li>
                            <li style="margin-left:50px;margin-top:40px;">保障方式：
                                 <em style="float: right;"><div class="tubiao"></div>100%本息保障</em></li>
                        </ul>
                   </div>
               </div>
               <script type="text/javascript" src="/Daqian/js/base.js"></script>
	               <div class="bx"></div>
	               <div class="bg">
	                    <div style="width:60%;height:140px;float:left;">
	                         <ul style="line-height:32px;margin-top:15px;margin-left:27px;">
	                             <li style="font-size:16px;color:#555555;">年化收益</li>
	                             <li style="font-size:16px;color:#555555;"><em style="font-size:24px;font-weight: bold;font-family: arial;color:#e64c3c;">${minp.yearreturn }~${maxp.yearreturn }</em>%</li>
	                             <li style="font-size:12px;color:#666666;">投资收益是银行定期存款2-4倍</li>
	                         </ul>
	                    </div>          
	                    <div class="mobile"></div>
	                    <div>
	                    <c:if test="${p.lastmoney>0}">
	                   		<div class="yecz"><span>账户金额 ${availablemoney }元</span><a id="yecz">充值</a></div>
	                   		<input type="text" class="logindiv2" id="logindiv2" placeholder="输入金额需为100的整数倍" />
	                   		<div class="yecz2"></div>
	                   		<input value="投标" class="logindiv1" id="logindiv1"  type="button">
	                   		</div>
	                   		<script type="text/javascript">
								
							</script>
	                   		<div id="aa" class="qrtb" style="">
						<div style="height:47px; width:600px; border-bottom:1px #aaa solid; background-color:#f5f5f5;">
							<span class="tb">确认投标</span>
							<a href="javascript:;" title="关闭" class="close">
							<img src="<%=request.getContextPath()%>/products_files/close.png" />
							</a>
						</div>
							<form action="/Daqian/prodd.do" class="form1" id="form1" method="post">
							<div class="tbnr" style="">
								<input type="text" name="ppid" readonly="readonly" style="display:none;" value="${p.pid }" />
								<p>投标名称： <span class="ml30"><input type="text" class="pname" name="ppname" readonly="readonly" value="${p.productname }" /></span></p>
								<p>预计收益： <span class="ml30"><input type="text" class="vyear" name="vvyear" readonly="readonly"/>/年</span></p>
								<p>收益处理： <span class="ml30">收益返还账户</span></p>
								<p>理财期限： <span class="ml30">${p.cycle }个月</span></p>
								<p>可投金额： <span class="ml30">${p.lastmoney }</span></p>
								<p>产品总额： <span class="ml30">${p.maxmoney }</span></p>
								<p>付息：<span class="year">年付</span><span class="month">月付</span></p>
								<input type="text" name="monthoryear" class="monthoryear" readonly="readonly" style="display:none;" />
								<p>应付金额： <span class="ml30"><input type="text" class="yfmoney" name="aamount" readonly="readonly"/>元</span></span></p>
								<p>支付密码：<input type="password" name="uname" class="zfmm" id="paypwd" style="border:1px solid #aaa;width:100px"/>
									<span style="color:red;" id="paytext">初始密码为登录密码</span>
								</p>
								<div><input class="tongyi" type="checkbox" />我已经阅读并同意签署《<a href="#">${p.productname }服务协议书</a>》
									<span style="color:red;" id="pwdtext"></span>
								</div>
								<div class="xz">
									<input type="button" name="suubbb" id="abcdef" class="submit1" value="确定" />
									<input class="qx" type="button" value="取消"/>
								</div>
							</div>
							</form>
						</div>
						<div class="bj"></div>
	                    </c:if>
	                    <c:if test="${p.lastmoney==0}">
	                    <input value="本期产品已结束" class="logindiv"  type="button">
	                    </div>
	                    <div style="width: 272px;margin-left: 25px;color: red;font-family: Microsoft YaHei;font-size:12px;float:left;">已经有<span id="investApplicationTotal1">6</span>位聪明的投资者参与该理财宝项目， 敬请关注大钱财富其他产品！</div>
	                    </c:if>
	                    
	               </div>
		       </div>    
			      <div class="fin_prod">
			            <div class="protitle"><span>产品详情</span></div>
			            <div class="lines"></div>
			            <div class="fin_tab">
			               <table style="border:1px solid #e0e0e0;" cellpadding="0" cellspacing="0" width="100%">
								  <tbody><tr class="bigtd">
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;font-size:14px;" align="center" height="60" valign="middle" width="15%">加入期限</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;border-right: 1px dashed #e0e0e0;" align="center" valign="middle" width="35%">本期产品已结束</td>
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-bottom: 1px dashed #e0e0e0;border-right: 1px dashed #e0e0e0;" align="center" valign="middle" width="15%">到期日期</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;" align="center" valign="middle" width="35%">以满额复审通过日期为准开始计算利息</td>
								  </tr>
								  <tr class="bigtd">
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;border-top: 1px dashed #e0e0e0;" align="center" height="60" valign="middle">加入下线</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;border-right: 1px dashed #e0e0e0;" align="center" valign="middle">加入金额<span class="minmoney">1000</span>元起，且以100元<br>的倍数递增</td>
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-bottom: 1px dashed #e0e0e0;border-right: 1px dashed #e0e0e0;" align="center" valign="middle">加入上限</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;" align="center" valign="middle">
								       ${p.maxmoney}元
								    </td>
								  </tr>
								  <tr class="bigtd">
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;border-top: 1px dashed #e0e0e0;" align="center" height="60" valign="middle">赎回方式</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;border-right: 1px dashed #e0e0e0;" align="center" valign="middle"><span>活动标</span>到期时，系统当天自动退出。</td>
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-bottom: 1px dashed #e0e0e0;border-right: 1px dashed #e0e0e0;" align="center" valign="middle">相关费用</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;" align="center" valign="middle">加入费率：0.00%,管理费率：0.00%,<br>到期赎回费率：0.00。</td>
								  </tr>
								  <tr class="bigtd">
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;border-top: 1px dashed #e0e0e0;" align="center" height="60" valign="middle">利息处理方式</td>
								    <td style="border-right: 1px dashed #e0e0e0;" id="salesRemark" align="center" valign="middle">a.<!-- 利息复投<br/>b. -->利息返还账户</td>
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;" align="center" valign="middle">详细信息</td>
								    <td style="border-bottom: 1px dashed #e0e0e0;" align="center" valign="middle"><a id="dianjichakan" target="_blank" href="creditorinfo.do?id=${cc.id }">[点击查看]</a></td>
								  </tr>
								  <tr class="bigtd">
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;border-top: 1px dashed #e0e0e0;" align="center" height="60" valign="middle">债务人</td>
								    <td style="border-right: 1px dashed #e0e0e0;" id="salesRemark" align="center" valign="middle"><!-- 利息复投<br/>b. -->
								   	<c:if test="${fn:length(cc.uname)>2}">
								   		<c:out value="${fn:substring(cc.uname, 0, 1)}" />**<c:out value="${fn:substring(cc.uname, fn:length(cc.uname)-1, fn:length(cc.uname))}" />
								   	</c:if>
								   	<c:if test="${fn:length(cc.uname)==2}">
								   		<c:out value="${fn:substring(cc.uname, 0, 1)}" />**
								   	</c:if>
								    </td>
								    <td style="background:none repeat scroll 0 0 #fcf3f2;border-right: 1px dashed #e0e0e0;" align="center" valign="middle">信息</td>
								    <td align="center" valign="middle">
								    	手机<c:out value="${fn:substring(cc.phone, 0, 3)}" />****<c:out value="${fn:substring(cc.phone, 7,11 )}" />  
								    	身份证<c:out value="${fn:substring(cc.idcard, 0, 4)}" />****<c:out value="${fn:substring(cc.idcard, 14,18 )}" />  
								    </td>
								  </tr>
						   </tbody></table>
			               <div class="fin_go">
				                  <p class="start" style="margin-left: 60px;width:135px;">${p.pdate }开始招募</p>
				                  <p class="start" style="margin-left: 135px;width:90px;">首次自动投标</p>
				                  <p class="start" style="margin-left:180px;width:65px;">回款复投</p>
				                  <p class="start" style="margin-left: 110px;width:100px;">满标复审后确认</p>  
				                  <p class="startpho"></p>  
			               </div>
			           </div>
			      </div>
			      <div class="fin_bottom">
			            <div class="protitle" style="float:left;"><span>加入记录</span></div>
			            <div class="fin_time"><span>截至<span id="newDate">2015-10-15</span>&nbsp;&nbsp;共：<span id="investApplicationTotal">1</span>人次加入该计划</span></div>
			            <div class="lines" style="margin-top: 9px;"></div>
					    <div class="fin_foot">
					    <table id="tab" style="border:1px solid #e0e0e0;border-radius: 2px;" cellpadding="0" cellspacing="0" width="100%">
					         <tbody>
					         	<tr style=" background-image:url(../styles/web/image/financial/tab_title.png);font-size:14px;color:#555555">
								    <td align="center" height="40" valign="middle" width="11%">序号</td>
								    <td align="center" valign="middle" width="20%">投资人</td>
								    <td align="center" valign="middle" width="18%">投资金额&nbsp;(单位：元)</td>
								    <td align="center" valign="middle" width="35%">投资日期</td>
								    <td align="center" valign="middle" width="19%">状态</td>
  								 </tr>
  								 <c:forEach items="${pc }" var="puc">
  								 	<tr id="hh" class="title_td"> 
									<td align="center" height="40" valign="middle">1</td>
									<td align="center" valign="middle"><c:out value="${fn:substring(puc.username, 0, 3)}" />****<c:out value="${fn:substring(puc.username, 7,11 )}" />  </td>
									<td align="center" valign="middle">${puc.money }</td>
									<td align="center" valign="middle">${puc.date }</td>
									<td style="color:#ee7d2d;" align="center" valign="middle">${puc.state }</td>
									</tr>
  								 </c:forEach>
							</tbody>
						</table>
					    <div class="fin_foot" style="height:50px;">
<!-- 						    <div class="foot_div">第3页/共6页&nbsp; -->
<!-- 						            <a href="###" >首页</a>&nbsp; -->
<!-- 						            <a href="###" >上一页</a>&nbsp; -->
<!-- 						            <a href="###" >1</a>&nbsp; -->
<!-- 						            <a href="###" >2</a>&nbsp; -->
<!-- 						            <a href="###" >3</a>&nbsp; -->
<!-- 						            <a href="###" >4</a>&nbsp; -->
<!-- 						            <a href="###" >5</a>&nbsp; -->
<!-- 						            <a href="###" >6</a>&nbsp; -->
<!-- 						            <a href="###" >7</a>&nbsp; -->
<!-- 						            <a href="###" >下一页</a>&nbsp; -->
<!-- 						            <a href="###" >末页</a> -->
<!-- 						    </div> -->


<!--                                 <p> -->
<!--                                 <div class="green-black"><span class="disabled"> -->
<!--                                   <  Prev</span><span class="current">1</span> -->
<!--                                    <a href="#">2</a><a href="#">3</a> -->
<!--                                    <a href="#">4</a> -->
<!--                                    <a href="#">5</a> -->
<!--                                    <a href="#">6</a> -->
<!--                                    <a href="#">7</a>... -->
<!--                                    <a href="#">199</a> -->
<!--                                    <a href="#">200</a> -->
<!--                                    <a href="#">Next  > </a> -->
<!--                                  </div></p> -->
                                      <div id="setpage" style="margin:0 auto;text-align: center;"><div id="setpage"><span id="info">第1页/共1页</span><span class="current">1</span></div></div> 
						</div>
			      </div>
		 </div>
	
  </div>
  
</div></center>

<script>
 /* 查看协议   */
	function financingAgreement(obj){
        obj.href="/webAgreement/financingAgreement?onlineProduct="+ document.getElementById("onlineProduct").value
    +"&creatTimedate="+document.getElementById("creatTimedate").value+"&expireTimedate="+document.getElementById("expireTimedate").value;
    }
	function judgeLogin()
	{
		var onlineProductTermm=document.getElementById("onlineProductTermm").value;
		var sm_sm=100;
		//alert(onlineProductTermm);
		//alert(sm_sm);
		 window.location.href="/webApplicationSign/login?flagJudgeLogin=cj&onlineProductTermm="+onlineProductTermm+"&sm_sm="+sm_sm;
	}
	
	
	var totalpage, pagesize, cpage, count, curcount, outstr,investApplicationTotal;
	//初始化 
	cpage = 1;
	//totalpage = document.getElementById("totalpage").value;
	totalpage = 50;
	pagesize = 10;
	outstr = "";
	var onlineProductTermm=document.getElementById("onlineProductTermm").value;
	function gotopage(target) {

		cpage =target; //把页面计数定位到第几页 
		 $.ajax({	url : "/webApplicationFinancialInvest/findProBuyerPageShow",
					data : "target=" + cpage + "&onlineProductTermm=" + onlineProductTermm,
					type : 'post',
					dataType : 'json',
					success : function(message) {
						totalpage=message.message.total;
						investApplicationTotal=message.message.investApplicationTotal;
						setpage();
						var list=message.message.list;
						$("#tab tr:gt(0)").remove();
						//将返回的数据追加到表格  
						for(var i=0;i<list.length;i++) {
			$("#tab").append( "<tr id='hh' class='title_td'> "
									+ "<td height='40' align='center' valign='middle'> "
									+ (i+1+((cpage-1)*10))
									+ "</td>"
									+ "<td align='center' valign='middle'>"
									+ list[i].user_nickname
									+ "</td>"
									+ "<td align='center' valign='middle'>"
									+ (list[i].principal+"").split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('')
									+ "</td>"
									+ "<td align='center' valign='middle'>"
									+ list[i].create_time
									+ "</td>"
									+ "<td align='center' valign='middle' style='color:#ee7d2d;'>"
									+ "成功"
									+ "</td>"
									+ "</tr>");
		    		};
		    		document.getElementById("investApplicationTotal").innerHTML=investApplicationTotal;
		    		document.getElementById("investApplicationTotal1").innerHTML=investApplicationTotal;
		    
 	   		}
       });
    

	}
	//window.onload = gotopage();
	
 function setpage() {
		
 		var afterpage = 0; //终止页
		var pagenow = cpage;
		var beforepage = 0;//起始页
		for ( var i = 0; i < 10; i++) {
			if (pagenow % 10 == 0) {
				afterpage = pagenow;
				beforepage = pagenow - 9;
				break;
			}
			pagenow += 1;
		}
		if (cpage == 1) {
			outstr = outstr + "";
		} else {
			outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("
					+ (cpage - 1 == 0 ? 1 : cpage - 1)
					+ ")' style='width:50px;'>上一页</a>";
		}

		if (afterpage - totalpage > 0) {
			afterpage = totalpage;
		}
		for (count = beforepage; count <= afterpage; count++) {
			if (count != cpage) {
				outstr = outstr
						+ "<a href='javascript:void(0)' onclick='gotopage("
						+ count + ")'>" + count + "</a>";
			} else {
				outstr = outstr + "<span class='current' >" + count + "</span		>";
			}
		}

		if (cpage == totalpage) {
			outstr = outstr + "";
		} else {
			outstr = outstr + "<a href='javascript:void(0)' onclick='gotopage("
					+ (cpage + 1 >= totalpage ? totalpage : cpage + 1)
					+ ")' style='width:40px;'>下一页</a>";
		}

		document.getElementById("setpage").innerHTML = "<div id='setpage'><span id='info'>第"
				+ cpage + "页/共" + totalpage + "页<\/span>" + outstr + "<\/div>";
		
		outstr = "";
		

	}
	gotopage(1);//调用分页 
	
	
	window.onload=function()
	{	
		//给数字加逗号，距离1,000,000,000
		document.getElementById("principalId").innerHTML=("100000"+"").split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('')+"<em>元</em>";
		//判断客户点击的产品是不是产品——周周乐或者是月月盈，如果是的话将改变其利息处理的方式。
		if(("H2015080601").charAt(0)=="W")
			{
			document.getElementById("judgeProType").innerHTML="1<em >周</em>";
			document.getElementById("salesRemark").innerHTML="a.到期还本付息";
			}
		if(("H2015080601").charAt(0)=="A")
		{
		document.getElementById("salesRemark").innerHTML="a.到期还本付息";
		}
		//获取当前的时间yyyy-mm-dd
		 var nowDate = new Date();
		 var year = nowDate.getFullYear();
		 var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1): nowDate.getMonth() + 1;
		 var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
		 var dateStr = year + "-" + month + "-" + day;
		 document.getElementById("newDate").innerHTML=dateStr;
		 document.getElementById("percent_sm").style.width=100+"%";
		 var onlineProduct_name = "活动标";
		  
		  $.ajax({
			    url : "/toAgreement",
			    data : "productName="+onlineProduct_name,
				type : 'post',
				dataType : 'json',
				success : function(message) {
					var record = message.message.record;
					var login = message.message.login;
					if(login==1 && record!=null){
						document.getElementById("dianjichakan").href="/webApplicationUserCenter/getDaiDaiAgreement?productName=活动标&productTerm=H2015080601&agreementId="+record.invest_agreement_id+"&returnDate="+record.return_date;
					}else{
						document.getElementById("dianjichakan").href="/webAgreement/financingAgreement";
					}
				}
		  });
	}
</script>

<link href="<%=request.getContextPath()%>/products_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>


</body></html>