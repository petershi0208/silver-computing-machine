<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/user/hyzx/css/right.css" rel="stylesheet" type="text/css">
<div style="right: 0px;" id="rightButton">
	<ul id="right_ul">
		<li id="right_qq" class="right_ico" show="qq" hide="tel"></li>
		<li id="right_tel" class="right_ico" show="tel" hide="qq"></li>
		<li id="right_tip" class="png">
		<p class="flagShow_p1 flag_tel">咨询电话</p>
		<p class="flagShow_p2 flag_tel line91">400-839-2088</p>
		<p class="flagShow_p1 flag_qq">咨询QQ</p>
		<p class="flagShow_p2 flag_qq">
		<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1061465170&amp;site=qq&amp;menu=yes" target="_blank">
		<img src="<%=request.getContextPath()%>/user/hyzx/totop/qiyeQQ.png" border="0"></a> 
		</p></li>
        <li><div id="backToTop"><a href="javascript:;" onfocus="this.blur();" class="backToTop_a png"></a></div></li>
	</ul>
</div>