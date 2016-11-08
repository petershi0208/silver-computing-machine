<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="maleft">
	<div class="main_left fl">
		<div class="btns">
			<a class="btn_start" id="startgame" target="_blank"><span
				id="newDistrict"></span>
			</a>
			<div class="loginBefore" id="login-box">
				<div>
					<span>用户名：</span>
					<input type="text" id="txtUser">
				</div>
				<div>
					<span>密&nbsp;&nbsp;&nbsp;码：</span>
					<input type="password" id="txtPwd">
				</div>
			</div>
			<table width="200" height="126" style="display: none;">
				<tr>
					<td width="140" align="right" class="z22">
						用户名：
					</td>
					<td width="92" id="login_nickname">
						${user.nickname}
					</td>
				</tr>
				<tr>
					<td width="140" align="right" class="z22">
						最近登录服：
					</td>
					<td width="92" id="login_recent"></td>
					<input type="hidden" id="login_recentserverid" />
				</tr>
				<tr>
					<td width="140" align="right" class="z22">
						推荐服务器：
					</td>
					<td width="92" id="login_recomend"></td>
					<input type="hidden" id="login_recommendserverid" />
				</tr>
				<tr>
					<td align="right">
						<span id="login_out" style="cursor: pointer;">退出&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</td>
					<td align="right" class="gd" style="text-align: left;">
						<a href="server.jsp" target="_blank">服务器列表</a>
					</td>
				</tr>
			</table>

			<div class="button_login">
				<input class="btn_login" type="button" id="btn_login">
				<a href="http://www.199y.com/Yqwan/forgetOne.jsp">忘记密码？</a>
			</div>
			<div class="loginMag">
				<div>
					<a target="_blank"></a>
					<a target="_blank"></a>
					<a onClick="javascript:alert('暂未开放')"></a>
				</div>
			</div>
		</div>
		<div class="service">
			<div>
				<div>
					游戏介绍
				</div>
				<div>
					《龙降三国》是一款写实风格的三国策略卡牌手游。三个国家特点鲜明各有千秋，为您展现景区级的场景画面以及酷炫带感的角色造型,游戏里霸气精美的卡牌人物，华丽的技能特效，史诗般的场景和画面，更能与数千玩家同战沙场。
				</div>
				<div>
					<div></div>
					<div>
						<span class="kk"></span>
					</div>
					<div>
						<span class="kk"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>