package com.yqwan.domain;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String userid;
	private String openuserid;
	private String headpicture;
	private String password;
	private String telephone;
	private String email;
	private String realname;
	private String idcard;
	private String gb;
	private String qq;
	private String sex;
	private String address;
	private String nickname;
	private String registdate;
	private String logindate;
	private String pwdproblem;
	private String spreadcode;
	
	
	
	
	
	public String getOpenuserid() {
		return openuserid;
	}
	public void setOpenuserid(String openuserid) {
		this.openuserid = openuserid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSpreadcode() {
		return spreadcode;
	}
	public void setSpreadcode(String spreadcode) {
		this.spreadcode = spreadcode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getHeadpicture() {
		return headpicture;
	}
	public void setHeadpicture(String headpicture) {
		this.headpicture = headpicture;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getLogindate() {
		return logindate;
	}
	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}
	public String getPwdproblem() {
		return pwdproblem;
	}
	public void setPwdproblem(String pwdproblem) {
		this.pwdproblem = pwdproblem;
	}
}
