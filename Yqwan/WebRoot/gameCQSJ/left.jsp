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
					《传奇世界H5》是由盛大唯一正版授权，蝴蝶互动倾力打造并发行的首款《传奇世界》Html 5游戏。游戏以可视化挂机为核心玩法，百分百还原了《传奇世界》的核心精髓，同时结合Html 5特性，使得玩家无需下载客户端点击即玩！
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