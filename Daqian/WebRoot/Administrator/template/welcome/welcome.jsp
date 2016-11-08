<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Administrator/styles.css">
	-->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/html5.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/respond.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/PIE_IE678.js"></script>
	<![endif]-->
	<link href="<%=request.getContextPath()%>/Administrator/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/Administrator/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
	
	<link href="<%=request.getContextPath()%>/Administrator/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
  </head>
  
 <body>
<div class="pd-20" style="padding-top:20px;">
  <p class="f-20 text-success">欢迎使用大钱财富<span class="f-14">v2.3</span>后台模版！</p>
  <p>登录次数：18 </p>
  <p>上次登录IP：222.35.131.79.1  上次登录时间：${logindate }</p>
  <table class="table table-border table-bordered table-bg">
    <thead>
      <tr>
        <th colspan="9" scope="col">信息统计</th>
      </tr>
      <tr class="text-c">
        <th>统计</th>
		<th>新闻库</th>
        <th>产品库</th>
        <th>用户</th>
        <th>理财金额</th>
        <th>收益</th>
        <th>已审核借款</th>
        <th>未审核审核借款</th>
        <th>管理员</th>    
      </tr>
    </thead>
    <tbody>
      <tr class="text-c">
        <td>总数</td>
        <td>${news.count }</td>
        <td>${product.count }</td>
        <td>${user.count }</td>
        <td>${money.sum }</td>
        <td>${earned.sum }</td>
        <td>${audit.count }</td>
        <td>${notaudit.count }</td>
        <td></td>
      </tr>
      <tr class="text-c">
        <td>今日</td>
        <td>${newsday.count }</td>
        <td>${productday.count }</td>
        <td>${userday.count }</td>
        <td>${moneyday.sum }</td>
        <td>${earnedday.sum }</td>
        <td>${auditday.count }</td>
        <td>${notauditday.count }</td>
        <td></td>
      </tr>
      <tr class="text-c">
        <td>昨日</td>
        <td>${newsday1.count }</td>
        <td>${productday1.count }</td>
        <td>${userday1.count }</td>
        <td>${moneyday1.sum }</td>
        <td>${earnedday1.sum }</td>
        <td>${auditday1.count }</td>
        <td>${notauditday1.count }</td>
        <td></td>
      </tr>
      <tr class="text-c">
        <td>本月</td>
        <td>${newsmonth.count }</td>
        <td>${productmonth.count }</td>
        <td>${usermonth.count }</td>
        <td>${moneymonth.sum }</td>
        <td>${earnedmonth.sum }</td>
        <td>${auditmonth.count }</td>
        <td>${notauditmonth.count }</td>
        <td></td>
      </tr>
      <tr class="text-c">
        <td>上月</td>
        <td>${newsmonth1.count }</td>
        <td>${productmonth1.count }</td>
        <td>${usermonth1.count }</td>
        <td>${moneymonth1.sum }</td>
        <td>${earnedmonth1.sum }</td>
        <td>${auditmonth1.count }</td>
        <td>${notauditmonth1.count }</td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>
<footer class="footer">
  <p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>Copyright &copy;2015 H-ui.admin v2.3 All Rights Reserved.<br>
    本后台系统由<a href="/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.js"></script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>