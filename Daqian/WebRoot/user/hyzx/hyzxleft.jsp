<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/user/hyzx/css/help_center.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/help_center.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/user/hyzx/css/WdatePicker.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/left.js"></script>
</head>
<input id="role" style="display:none" value=${role} />
<div class="usercenter_navigationDiv_two">
				<p class="usercenter_navigationText_01">
					<a href="<%=request.getContextPath()%>/index.do">首页</a> 
				<i class="usercenter_navigationText_02">&gt;</i>
					<span class="usercenter_navigationText_03">个人中心</span>
					
				</p>
			</div>
						
			<div class="navigation_menu_leftDiv">
			
				<div style="background-color: rgb(255, 255, 255);" id="menuId" class="menu_One" onclick="btnMenu('01','menuFontcolor','myAccount','menuId'),switchMenu('myAccount')" onmouseover="selectdMenu('01','menuFontcolor','myAccount','menuId')" onmouseout="selectdOutMenu('01','menuFontcolor','myAccount','menuId')">
					    				   
					<div id="01" class="pojoImg_01"><img src="<%=request.getContextPath()%>/user/hyzx/images/555559.png" style="margin-left:5px;" /></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(55, 55, 55);" id="menuFontcolor" class="navigationFont">我的账户</div>	
				</div>
				
				<div style="display: none;" id="myAccount" class="secondLevel_menu_text">
					<a href="<%=request.getContextPath()%>/user/hyzx/zczl.jsp">
						<div id="secondBackImg_1" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_1" class="secondFont">资产总览</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					
					 <a href="###">
						<div id="secondBackImg_2" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_2" class="secondFont">个人信息基础</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					
					<a href="<%=request.getContextPath()%>/user/hyzx/anquan.jsp">
						<div id="secondBackImg_3" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_3" class="secondFont">安全信息</div>	
						</div>
					</a>
					<div class="Pojo_div_02"></div>
					
					<a href="<%=request.getContextPath()%>/user/hyzx/tgzhxx.jsp">
						<div id="secondBackImg_4" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_4" class="secondFont">托管账户信息</div>	
						</div>
					</a>
				</div>
				
				<div class="Pojo_div_01"></div>
				<div style="background-color: rgb(255, 255, 255);" id="propertyId" class="menu_One" onclick="btnMenu('02','propertyManageFontcolor','propertyManage','propertyId'),switchMenu('propertyManage')" onmouseover="selectdMenu('02','propertyManageFontcolor','propertyManage','propertyId')" onmouseout="selectdOutMenu('02','propertyManageFontcolor','propertyManage','propertyId')">
					
					<div id="02" class="pojoImg_02"><img src="<%=request.getContextPath()%>/user/hyzx/images/xz-3.png" style="margin-left:5px;" /></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(55, 55, 55);" id="propertyManageFontcolor" class="navigationFont">资产管理</div>		 
				</div>
				<div style="display: none;" id="propertyManage" class="secondLevel_menu_text">
					<a href="<%=request.getContextPath()%>/user/hyzx/cztx.jsp">
						<div id="secondBackImg_6" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_6" class="secondFont">充值提现</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					<a href="<%=request.getContextPath()%>/user/hyzx/jiaoyi.jsp">
						<div id="secondBackImg_7" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_7" class="secondFont">交易记录</div>	
						</div>
					</a>
				</div>
				
			
				<div class="Pojo_div_01"></div>
			<div id="manage2">
				<div style="background-color: rgb(255, 255, 255);" id="manageMoneyId" class="menu_One" onclick="btnMenu('03','manageMoneyFontcolor','manageMoney','manageMoneyId'),switchMenu('manageMoney')" onmouseover="selectdMenu('03','manageMoneyFontcolor','manageMoney','manageMoneyId')" onmouseout="selectdOutMenu('03','manageMoneyFontcolor','manageMoney','manageMoneyId')">
					<div id="03" class="pojoImg_03"><img src="<%=request.getContextPath()%>/user/hyzx/images/xz-4.png" style="margin-left:5px;" /></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(55, 55, 55);" id="manageMoneyFontcolor" class="navigationFont">理财管理</div>		 
					 
				</div>
				
				<div style="display: none;" id="manageMoney" class="secondLevel_menu_text">
					<a href="###">
						<div id="secondBackImg_10" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_10" class="secondFont">理财总览</div>	
						</div>
					</a>
				
					<div class="Pojo_div_02"></div>
					<a href="###">
						<div id="secondBackImg_11" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_11" class="secondFont">理财详情</div>	
						</div>
					</a>
		
				</div>
			</div>
			
			<div id="borrow2">
				<div class="Pojo_div_01"></div>
				<div style="background-color: rgb(255, 255, 255);" id="borrowMoneyId" class="menu_One" onclick="btnMenu('04','borrowMoneyFontcolor','borrowMoney','borrowMoneyId'),switchMenu('borrowMoney')" onmouseover="selectdMenu('04','borrowMoneyFontcolor','borrowMoney','borrowMoneyId')" onmouseout="selectdOutMenu('04','borrowMoneyFontcolor','borrowMoney','borrowMoneyId')">
					<div id="04" class="pojoImg_04"><img src="<%=request.getContextPath()%>/user/hyzx/images/xz-5.png" style="margin-left:5px;" /></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(55, 55, 55);" id="borrowMoneyFontcolor" class="navigationFont">借款管理</div>		 
					 	
				</div>
			
				<div style="display: none;" id="borrowMoney" class="secondLevel_menu_text">
					<a href="###">
						<div id="secondBackImg_13" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_13" class="secondFont">我的借款</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					<a href="###">
						<div id="secondBackImg_14" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_14" class="secondFont">借款申请查询</div>	
						</div>
					</a>	
				</div>
			</div>
				<div class="Pojo_div_01"></div>		
			
				<div style="background-color: rgb(255, 255, 255);" id="messageManageId" class="menu_One" onclick="btnMenu('05','messageFontcolor','messageManage','messageManageId'),switchMenu('messageManage')" onmouseover="selectdMenu('05','messageFontcolor','messageManage','messageManageId')" onmouseout="selectdOutMenu('05','messageFontcolor','messageManage','messageManageId')">
					
					<div id="05" class="pojoImg_05"><img src="<%=request.getContextPath()%>/user/hyzx/images/xz-6.png" style="margin-left:5px;" /></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(55, 55, 55);" id="messageFontcolor" class="navigationFont">消息管理</div>		 
					 	
				</div>
				
				<div style="display: none;" id="messageManage" class="secondLevel_menu_text">
					<a href="<%=request.getContextPath()%>/user/hyzx/znxx.jsp">
						<div id="secondBackImg_22" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_22" class="secondFont">站内消息</div>	
						</div>
					</a>
					
					<div class="Pojo_div_02"></div>
					
					
					<a href="<%=request.getContextPath()%>/user/hyzx/xxsz.jsp">
						<div id="secondBackImg_23" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_23" class="secondFont">消息设置</div>	
						</div>
					</a>	
				</div>
				<div class="Pojo_div_01"></div>	
				
				<div style="background-color: rgb(255, 255, 255);" id="giftManageId" class="menu_One" onclick="btnMenu('06','giftFontcolor','giftManage','giftManageId'),switchMenu('giftManage')" onmouseover="selectdMenu('06','giftFontcolor','giftManage','giftManageId')" onmouseout="selectdOutMenu('06','giftFontcolor','giftManage','giftManageId')">
					
					<div id="06" class="pojoImg_06"><img src="<%=request.getContextPath()%>/user/hyzx/images/xz-7.png" style="margin-left:5px;" /></div>
					<div class="pojo_div"></div>
					<div style="color: rgb(55, 55, 55);" id="giftFontcolor" class="navigationFont">我的奖励</div>		 
					 	
				</div>
				
				<div style="display: none;" id="giftManage" class="secondLevel_menu_text">
					<a href="<%=request.getContextPath()%>/user/hyzx/wdlp.jsp">
						<div id="secondBackImg_22" class="secondMenu" name="second_menu">
							<div class="secondPojo_div"></div>
							<div id="secondfont_22" class="secondFont">我的礼品</div>	
						</div>
					</a>

				</div>
		</div>