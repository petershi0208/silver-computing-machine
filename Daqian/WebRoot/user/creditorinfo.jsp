<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'creditorinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	table{font-family:"微软雅黑";}
	th{color:#333333;}
	td{color:red;}
</style>
  </head>
  
  <body>
  <c:if test="${purcha != null}">
  		<c:if test="${a=='err' }">
	    <table border="1" align="center" style="border-collapse:collapse; border-width:thin; border-style:solid; text-align:center;" bordercolor="#666666"  height="800" width="1000">
		<tr>
			<th>姓名</th>
			<td width="40px">
				<c:if test="${fn:length(r.uname)>2}">
					<c:out value="${fn:substring(r.uname, 0, 1)}" />**<c:out value="${fn:substring(r.uname, fn:length(r.uname)-1, fn:length(r.uname))}" />
				</c:if>
				<c:if test="${fn:length(r.uname)==2}">
					<c:out value="${fn:substring(r.uname, 0, 1)}" />**
				</c:if>
			</td>
			<th>性别</th>
			<td>${r.sex }</td>
			<th>婚姻状况</th>
			<td>${r.marital }</td>
			<th>身份证号</th>
			<td>
				<c:out value="${fn:substring(r.idcard, 0, 4)}" />****<c:out value="${fn:substring(r.idcard, 14,18 )}" />  
			</td>
		</tr>
		<tr>
			<th>年龄</th>
			<td>${r.age }</td>
			<th>手机</th>
			<td>
				<c:out value="${fn:substring(r.phone, 0, 3)}" />****<c:out value="${fn:substring(r.phone, 7,11 )}" />
			</td>
			<th>固定电话</th>
			<td>
				<c:out value="${fn:substring(r.telephone, 0, 3)}" />****<c:out value="${fn:substring(r.telephone, 7,11 )}" />
			</td>
			<th>申请金额</th>
			<td>${r.money }</td>
		</tr>
		<tr>
			<th width="40px">本地房产</th>
			<td colspan="2">${r.localhouse }</td>
			<th>居住状况</th>
			<td colspan="4">
				<span style="display:none;" class="live1">${r.live }</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>自建</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>自购</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>租用</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>单位</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>与父母同住</span>
			</td>
		</tr>
		<tr>
			<th>社保</th>
			<td colspan="3">${r.sociensure }</td>
			<th>公积金</th>
			<td colspan="3">${r.commpf }</td>
		</tr>
		<tr>
			<th rowspan="5">单位</th>
			<th>单位名称</th>
			<td colspan="6">******</td>
		</tr>
		<tr>
			<th>单位地址</th>
			<td colspan="3">******</td>
			<th>电话</th>
			<td colspan="2">${r.unit_phone }</td>
		</tr>
		<tr>
			<th>单位性质</th>
			<td colspan="6">${r.unit_nature }</td>
		</tr>
		<tr>
			<th>职位</th>
			<td>${r.position }</td>
			<th>学历</th>
			<td colspan="4">${r.education }</td>
		</tr>
		<tr>
			<th>工资收入</th>
			<td colspan="6">${r.wages }</td>
		</tr>
		<tr>
			<th rowspan="6">家庭情况</th>
			<th colspan="2">家庭人数</th>
			<td colspan="3">${r.home_number }</td>
			<th>微信</th>
			<td colspan="2">
				<c:out value="${fn:substring(r.wechat, 0, 3)}" />****
				<c:out value="${fn:substring(r.wechat, fn:length(r.wechat)-4, fn:length(r.wechat))}" />
			</td>
		</tr>
		<tr>
			<th rowspan="2">地址</th>
			<th colspan="2">户籍地地址</th>
			<td colspan="2">***</td>
			<th>户号</th>
			<td colspan="2">***</td>
		</tr>
		<tr>
			<th colspan="2">现居住地址</th>
			<td colspan="5">***</td>
		</tr>
		<tr>
			<th>直系亲属人</th>
			<th>关系</th>
			<td>${r.rela1 }</td>
			<th>姓名</th>
			<td>
				<c:if test="${fn:length(r.rela1_name)>2}">
					<c:out value="${fn:substring(r.rela1_name, 0, 1)}" />**<c:out value="${fn:substring(r.rela1_name, fn:length(r.rela1_name)-1, fn:length(r.rela1_name))}" />
				</c:if>
				<c:if test="${fn:length(r.rela1_name)==2}">
					<c:out value="${fn:substring(r.rela1_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td>
				<c:out value="${fn:substring(r.rela1_phone, 0, 3)}" />****<c:out value="${fn:substring(r.rela1_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th>直系亲属人</th>
			<th>关系</th>
			<td>${r.rela2 }</td>
			<th>姓名</th>
			<td>
				<c:if test="${fn:length(r.rela2_name)>2}">
					<c:out value="${fn:substring(r.rela2_name, 0, 1)}" />**<c:out value="${fn:substring(r.rela2_name, fn:length(r.rela2_name)-1, fn:length(r.rela2_name))}" />
				</c:if>
				<c:if test="${fn:length(r.rela2_name)==2}">
					<c:out value="${fn:substring(r.rela2_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td>
				<c:out value="${fn:substring(r.rela2_phone, 0, 3)}" />****<c:out value="${fn:substring(r.rela2_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th width="50px">配偶/男女朋友</th>
			<th>关系</th>
			<td>${r.rela3 }</td>
			<th>姓名</th>
			<td>
				<c:if test="${fn:length(r.rela3_name)>2}">
					<c:out value="${fn:substring(r.rela3_name, 0, 1)}" />**<c:out value="${fn:substring(r.rela3_name, fn:length(r.rela3_name)-1, fn:length(r.rela3_name))}" />
				</c:if>
				<c:if test="${fn:length(r.rela3_name)==2}">
					<c:out value="${fn:substring(r.rela3_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td>
				<c:out value="${fn:substring(r.rela3_phone, 0, 3)}" />****<c:out value="${fn:substring(r.rela3_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th rowspan="2">联系人</th>
			<th>同事姓名</th>
			<td colspan="3">
				<c:if test="${fn:length(r.contact1_name)>2}">
					<c:out value="${fn:substring(r.contact1_name, 0, 1)}" />**<c:out value="${fn:substring(r.contact1_name, fn:length(r.contact1_name)-1, fn:length(r.contact1_name))}" />
				</c:if>
				<c:if test="${fn:length(r.contact1_name)==2}">
					<c:out value="${fn:substring(r.contact1_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td colspan="2">
				<c:out value="${fn:substring(r.contact1_phone, 0, 3)}" />****<c:out value="${fn:substring(r.contact1_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th>朋友姓名</th>
			<td colspan="3">
				<c:if test="${fn:length(r.contact2_name)>2}">
					<c:out value="${fn:substring(r.contact2_name, 0, 1)}" />**<c:out value="${fn:substring(r.contact2_name, fn:length(r.contact2_name)-1, fn:length(r.contact2_name))}" />
				</c:if>
				<c:if test="${fn:length(r.contact2_name)==2}">
					<c:out value="${fn:substring(r.contact2_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td colspan="2">
				<c:out value="${fn:substring(r.contact2_phone, 0, 3)}" />****<c:out value="${fn:substring(r.contact2_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th colspan="8">
				相关联系人信息不承担相关责任，借款是否让家属或者朋友知晓：
				<span style="color:red;">
					<span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>是
					<span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;">&radic;</span>否
				</span>
			</th>
		</tr>
		<tr>
			<td colspan="8">
				购买该产品后可以得到详细信息
			</td>
		</tr>
	</table>
	</c:if>
	<c:if test="${a=='suc' }">
	<table border="1" align="center" style="border-collapse:collapse; border-width:thin; border-style:solid; text-align:center;" bordercolor="#666666"  height="800" width="1000">
		<tr>
			<th>姓名</th>
			<td width="40px">${r.uname }</td>
			<th>性别</th>
			<td>${r.sex }</td>
			<th>婚姻状况</th>
			<td>${r.marital }</td>
			<th>身份证号</th>
			<td>${r.idcard }</td>
		</tr>
		<tr>
			<th>年龄</th>
			<td>${r.age }</td>
			<th>手机</th>
			<td>${r.phone }</td>
			<th>固定电话</th>
			<td>${r.telephone }</td>
			<th>申请金额</th>
			<td>${r.money }</td>
		</tr>
		<tr>
			<th width="40px">本地房产</th>
			<td colspan="2">${r.localhouse }</td>
			<th>居住状况</th>
			<td colspan="4">
				<span style="display:none;" class="live1">${r.live }</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>自建</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>自购</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>租用</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>单位</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>与父母同住</span>
			</td>
		</tr>
		<tr>
			<th>社保</th>
			<td colspan="3">${r.sociensure }</td>
			<th>公积金</th>
			<td colspan="3">${r.commpf }</td>
		</tr>
		<tr>
			<th rowspan="5">单位</th>
			<th>单位名称</th>
			<td colspan="6">${r.unit_name }</td>
		</tr>
		<tr>
			<th>单位地址</th>
			<td colspan="3">${r.unit_site }</td>
			<th>电话</th>
			<td colspan="2">${r.unit_phone }</td>
		</tr>
		<tr>
			<th>单位性质</th>
			<td colspan="6">${r.unit_nature }</td>
		</tr>
		<tr>
			<th>职位</th>
			<td>${r.position }</td>
			<th>学历</th>
			<td colspan="4">${r.education }</td>
		</tr>
		<tr>
			<th>工资收入</th>
			<td colspan="6">${r.wages }</td>
		</tr>
		<tr>
			<th rowspan="6">家庭情况</th>
			<th colspan="2">家庭人数</th>
			<td colspan="3">${r.home_number }</td>
			<th>微信</th>
			<td colspan="2">${wechat }</td>
		</tr>
		<tr>
			<th rowspan="2">地址</th>
			<th colspan="2">户籍地地址</th>
			<td colspan="2">${r.home_registry }</td>
			<th>户号</th>
			<td colspan="2">${r.home_registryid }</td>
		</tr>
		<tr>
			<th colspan="2">现居住地址</th>
			<td colspan="5">${r.address }</td>
		</tr>
		<tr>
			<th>直系亲属人</th>
			<th>关系</th>
			<td>${r.rela1 }</td>
			<th>姓名</th>
			<td>${r.rela1_name }</td>
			<th>电话</th>
			<td>${r.rela1_phone }</td>
		</tr>
		<tr>
			<th>直系亲属人</th>
			<th>关系</th>
			<td>${r.rela2 }</td>
			<th>姓名</th>
			<td>${r.rela2_name }</td>
			<th>电话</th>
			<td>${r.rela2_phone }</td>
		</tr>
		<tr>
			<th width="50px">配偶/男女朋友</th>
			<th>关系</th>
			<td>${r.rela3 }</td>
			<th>姓名</th>
			<td>${r.rela3_name }</td>
			<th>电话</th>
			<td>${r.rela3_phone }</td>
		</tr>
		<tr>
			<th rowspan="2">联系人</th>
			<th>同事姓名</th>
			<td colspan="3">${r.contact1_name }</td>
			<th>电话</th>
			<td colspan="2">${r.contact1_phone }</td>
		</tr>
		<tr>
			<th>朋友姓名</th>
			<td colspan="3">${r.contact2_name }</td>
			<th>电话</th>
			<td colspan="2">${r.contact2_phone }</td>
		</tr>
		<tr>
			<th colspan="8">
				相关联系人信息不承担相关责任，借款是否让家属或者朋友知晓：
				<span style="color:red;">
					<span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;"></span>是
					<span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;">&radic;</span>否
				</span>
			</th>
		</tr>
		<tr>
			<td colspan="8">
				购买该产品后可以得到详细信息
			</td>
		</tr>
	</table>
	</c:if>
  </c:if>
  <c:if test="${purcha == null}">
	   <table border="1" align="center" style="border-collapse:collapse; border-width:thin; border-style:solid; text-align:center;" bordercolor="#666666"  height="800" width="1000">
		<tr>
			<th>姓名</th>
			<td width="40px">
				<c:if test="${fn:length(r.uname)>2}">
					<c:out value="${fn:substring(r.uname, 0, 1)}" />**<c:out value="${fn:substring(r.uname, fn:length(r.uname)-1, fn:length(r.uname))}" />
				</c:if>
				<c:if test="${fn:length(r.uname)==2}">
					<c:out value="${fn:substring(r.uname, 0, 1)}" />**
				</c:if>
			</td>
			<th>性别</th>
			<td>${r.sex }</td>
			<th>婚姻状况</th>
			<td>${r.marital }</td>
			<th>身份证号</th>
			<td>
				<c:out value="${fn:substring(r.idcard, 0, 4)}" />****<c:out value="${fn:substring(r.idcard, 14,18 )}" />  
			</td>
		</tr>
		<tr>
			<th>年龄</th>
			<td>${r.age }</td>
			<th>手机</th>
			<td>
				<c:out value="${fn:substring(r.phone, 0, 3)}" />****<c:out value="${fn:substring(r.phone, 7,11 )}" />
			</td>
			<th>固定电话</th>
			<td>
				<c:out value="${fn:substring(r.telephone, 0, 3)}" />****<c:out value="${fn:substring(r.telephone, 7,11 )}" />
			</td>
			<th>申请金额</th>
			<td>${r.money }</td>
		</tr>
		<tr>
			<th width="40px">本地房产</th>
			<td colspan="2">${r.localhouse }</td>
			<th>居住状况</th>
			<td colspan="4">
				<span style="display:none;" class="live1">${r.live }</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>自建</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>自购</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>租用</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>单位</span>
				<span class="live"><span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>与父母同住</span>
			</td>
		</tr>
		<tr>
			<th>社保</th>
			<td colspan="3">${r.sociensure }</td>
			<th>公积金</th>
			<td colspan="3">${r.commpf }</td>
		</tr>
		<tr>
			<th rowspan="5">单位</th>
			<th>单位名称</th>
			<td colspan="6">******</td>
		</tr>
		<tr>
			<th>单位地址</th>
			<td colspan="3">******</td>
			<th>电话</th>
			<td colspan="2">${r.unit_phone }</td>
		</tr>
		<tr>
			<th>单位性质</th>
			<td colspan="6">${r.unit_nature }</td>
		</tr>
		<tr>
			<th>职位</th>
			<td>${r.position }</td>
			<th>学历</th>
			<td colspan="4">${r.education }</td>
		</tr>
		<tr>
			<th>工资收入</th>
			<td colspan="6">${r.wages }</td>
		</tr>
		<tr>
			<th rowspan="6">家庭情况</th>
			<th colspan="2">家庭人数</th>
			<td colspan="3">${r.home_number }</td>
			<th>微信</th>
			<td colspan="2">
				<c:out value="${fn:substring(r.wechat, 0, 3)}" />****
				<c:out value="${fn:substring(r.wechat, fn:length(r.wechat)-4, fn:length(r.wechat))}" />
			</td>
		</tr>
		<tr>
			<th rowspan="2">地址</th>
			<th colspan="2">户籍地地址</th>
			<td colspan="2">***</td>
			<th>户号</th>
			<td colspan="2">***</td>
		</tr>
		<tr>
			<th colspan="2">现居住地址</th>
			<td colspan="5">***</td>
		</tr>
		<tr>
			<th>直系亲属人</th>
			<th>关系</th>
			<td>${r.rela1 }</td>
			<th>姓名</th>
			<td>
				<c:if test="${fn:length(r.rela1_name)>2}">
					<c:out value="${fn:substring(r.rela1_name, 0, 1)}" />**<c:out value="${fn:substring(r.rela1_name, fn:length(r.rela1_name)-1, fn:length(r.rela1_name))}" />
				</c:if>
				<c:if test="${fn:length(r.rela1_name)==2}">
					<c:out value="${fn:substring(r.rela1_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td>
				<c:out value="${fn:substring(r.rela1_phone, 0, 3)}" />****<c:out value="${fn:substring(r.rela1_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th>直系亲属人</th>
			<th>关系</th>
			<td>${r.rela2 }</td>
			<th>姓名</th>
			<td>
				<c:if test="${fn:length(r.rela2_name)>2}">
					<c:out value="${fn:substring(r.rela2_name, 0, 1)}" />**<c:out value="${fn:substring(r.rela2_name, fn:length(r.rela2_name)-1, fn:length(r.rela2_name))}" />
				</c:if>
				<c:if test="${fn:length(r.rela2_name)==2}">
					<c:out value="${fn:substring(r.rela2_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td>
				<c:out value="${fn:substring(r.rela2_phone, 0, 3)}" />****<c:out value="${fn:substring(r.rela2_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th width="50px">配偶/男女朋友</th>
			<th>关系</th>
			<td>${r.rela3 }</td>
			<th>姓名</th>
			<td>
				<c:if test="${fn:length(r.rela3_name)>2}">
					<c:out value="${fn:substring(r.rela3_name, 0, 1)}" />**<c:out value="${fn:substring(r.rela3_name, fn:length(r.rela3_name)-1, fn:length(r.rela3_name))}" />
				</c:if>
				<c:if test="${fn:length(r.rela3_name)==2}">
					<c:out value="${fn:substring(r.rela3_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td>
				<c:out value="${fn:substring(r.rela3_phone, 0, 3)}" />****<c:out value="${fn:substring(r.rela3_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th rowspan="2">联系人</th>
			<th>同事姓名</th>
			<td colspan="3">
				<c:if test="${fn:length(r.contact1_name)>2}">
					<c:out value="${fn:substring(r.contact1_name, 0, 1)}" />**<c:out value="${fn:substring(r.contact1_name, fn:length(r.contact1_name)-1, fn:length(r.contact1_name))}" />
				</c:if>
				<c:if test="${fn:length(r.contact1_name)==2}">
					<c:out value="${fn:substring(r.contact1_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td colspan="2">
				<c:out value="${fn:substring(r.contact1_phone, 0, 3)}" />****<c:out value="${fn:substring(r.contact1_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th>朋友姓名</th>
			<td colspan="3">
				<c:if test="${fn:length(r.contact2_name)>2}">
					<c:out value="${fn:substring(r.contact2_name, 0, 1)}" />**<c:out value="${fn:substring(r.contact2_name, fn:length(r.contact2_name)-1, fn:length(r.contact2_name))}" />
				</c:if>
				<c:if test="${fn:length(r.contact2_name)==2}">
					<c:out value="${fn:substring(r.contact2_name, 0, 1)}" />**
				</c:if>
			</td>
			<th>电话</th>
			<td colspan="2">
				<c:out value="${fn:substring(r.contact2_phone, 0, 3)}" />****<c:out value="${fn:substring(r.contact2_phone, 7,11 )}" />
			</td>
		</tr>
		<tr>
			<th colspan="8">
				相关联系人信息不承担相关责任，借款是否让家属或者朋友知晓：
				<span style="color:red;">
					<span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;position: relative; top:3px;"></span>是
					<span style="height:13px;width:13px;border:1px solid red; display:inline-block; font-size:9px; line-height:13px;">&radic;</span>否
				</span>
			</th>
		</tr>
		<tr>
			<td colspan="8">
				购买该产品后可以得到详细信息
			</td>
		</tr>
	</table>
  </c:if>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		$(function(){
			var live = $(".live1").text();
			$(".live").each(function(){
				if($(this).text()==live){
					$(this).children("span").text("√");
					$(this).children("span").css("top","0px");
				}
			});
		});
	</script>
  </body>
</html>
