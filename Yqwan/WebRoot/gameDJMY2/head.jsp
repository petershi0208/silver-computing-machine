<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/gameDJMY2/css/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/gameDJMY2/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/gameDJMY2/js/jquery.md5.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/gameDJMY2/js/all.js"></script>
<input type="hidden" id="nickname" value="${user.nickname}"/>
<input type="hidden" id="userid" value="${user.userid}"/>
	<div class="win1000">
    		<img src="/Yqwan/gameXSQST/images/logobaidi.png" width=185 height=58 class="logo" onclick="javascript:window.open('http://www.199y.com');" id="headlogo"/>
<%--    	<img src="images/t1.png" width="50" height="50">
    		<img src="images/t2.png" width="50" height="50">
    		<img src="images/t3.png" width="50" height="50">
    		<img src="images/t4.png" width="50" height="50">
    		<img src="images/t5.png" width="50" height="50">--%>
    		<span class="gw"><a href="http://www.199y.com" target="_blank">官网首页</a></span><span>|</span>
    		<span><a href="http://www.199y.com/toRegistOne.do" target="_blank">快速注册</a></span><span>|</span>
    		<span id="head_recharge"><a target="_blank">游戏充值</a></span><span>|</span>
    		<span><a href="http://tieba.baidu.com/f?ie=utf-8&kw=%E5%88%80%E5%89%91%E9%AD%94%E8%8D%AF2&fr=search" target="_blank">玩家论坛</a></span>
    </div>
    <div class="head"></div>

