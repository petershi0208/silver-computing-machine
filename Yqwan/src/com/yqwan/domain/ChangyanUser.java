package com.yqwan.domain;

import java.io.Serializable;

public class ChangyanUser implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int is_login;	//是否登录，0表示未登录，1表示已登录 
	 public ChangyanUserInfo user;
	public int getIs_login() {
		return is_login;
	}
	public void setIs_login(int isLogin) {
		is_login = isLogin;
	}
	public ChangyanUserInfo getUser() {
		return user;
	}
	public void setUser(ChangyanUserInfo user) {
		this.user = user;
	}

}
