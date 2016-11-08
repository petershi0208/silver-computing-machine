<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery.md5.js"></script>
<script type="text/javascript" src="js/all.js"></script>

<input type="hidden" id="nickname" value="${user.nickname}"/>
<input type="hidden" id="userid" value="${user.userid}"/>

	<div class="win1000">
    		<img src="images/logobaidi.png" width=185 height=58 class="logo" onclick="javascript:window.open('http://www.199y.com','_blank');" id="headlogo"/>
<%--    	<img src="images/t1.png" width="50" height="50">
    		<img src="images/t2.png" width="50" height="50">
    		<img src="images/t3.png" width="50" height="50">
    		<img src="images/t4.png" width="50" height="50">
    		<img src="images/t5.png" width="50" height="50">--%>
    		<span class="gw"><a href="http://mhjy.199y.com" target="_blank">官网首页</a></span><span>|</span>
    		<span id="head_regist"><a target="_blank">快速注册</a></span><span>|</span>
    		<span id="head_recharge"><a target="_blank">游戏充值</a></span><span>|</span>
    		<span><a onclick="javascript:alert('待开放中');return;">玩家论坛</a></span>
    </div>
    <div class="head"></div>

