package com.yqwan.domain;

/**
 * 游戏接口地址对象
 * @author Administrator
 *
 */
public class Game {
	private String gamename;			//游戏名字	
	private String loginpath;			//登录地址	
	private String paypath;			//支付地址
	private String checkpath;			//查询角色地址
	private String key;					//秘钥
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public String getLoginpath() {
		return loginpath;
	}
	public void setLoginpath(String loginpath) {
		this.loginpath = loginpath;
	}
	public String getPaypath() {
		return paypath;
	}
	public void setPaypath(String paypath) {
		this.paypath = paypath;
	}
	public String getCheckpath() {
		return checkpath;
	}
	public void setCheckpath(String checkpath) {
		this.checkpath = checkpath;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
}
