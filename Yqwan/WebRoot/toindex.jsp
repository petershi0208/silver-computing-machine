<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="javax.servlet.*"%>
<%@ page language="java" import="com.yqwan.service.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
  <span style="display:none;"><img src="http://www.199y.com/picture/yqwan/201607/baiduzhizhu.jpg" width='121' height='75' title="199Y游戏-国内最欢乐H5网页游戏平台" alt="199Y游戏-国内最欢乐H5网页游戏平台"/></span>
  	<%
  	HttpRequestDeviceUtils hrdu = new HttpRequestDeviceUtils();
  	Boolean flag = hrdu.isMobileDevice(request);
  	if(flag) response.sendRedirect("http://gamecenter.199y.com");
	if(!flag) request.getRequestDispatcher("/toindex.do").forward(request, response);
	%>
    <title>199y游戏-首页-国内最欢乐H5网页游戏平台</title>
    <meta name="keywords" content="199Y游戏,放置游戏,挂机游戏,游戏平台,IOS放置,安卓放置,苹果放置,PC放置,电脑放置,独立开发,独立开发游戏">
	<meta name="description" content="199Y游戏是国内第一家最全面内容最多的放置挂机等类型游戏平台，ZombieMonkey工作室旗下平台。欢乐游戏，快乐生活，就上199Y！">
  </head>
  
  <body>
  </body>
</html>
