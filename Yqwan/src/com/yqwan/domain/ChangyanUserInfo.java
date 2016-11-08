package com.yqwan.domain;

import java.io.Serializable;

public class ChangyanUserInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public int user_id;//用户在自己网站的id 
    public String img_url;//用户头像地址
    public String profile_url;//用户主页地址
    public String sign;	//签名
    public String nickname; //昵称
    	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String imgUrl) {
		img_url = imgUrl;
	}
	public String getProfile_url() {
		return profile_url;
	}
	public void setProfile_url(String profileUrl) {
		profile_url = profileUrl;
	}
}
