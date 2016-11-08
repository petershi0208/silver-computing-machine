package com.daqian.entity;

import java.sql.Date;


public class User {
	private int id;
	private String username;
	private String password;
	private String telephone;
	private String email;
	private String card;
	private String role;
	private Date regist_date;
	private Date lasttimelogin_date;
	private String localip;
	private String realname;
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getLocalip() {
		return localip;
	}

	public void setLocalip(String localip) {
		this.localip = localip;
	}

	public Date getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(Date registDate) {
		regist_date = registDate;
	}

	public Date getLasttimelogin_date() {
		return lasttimelogin_date;
	}

	public void setLasttimelogin_date(Date lasttimeloginDate) {
		lasttimelogin_date = lasttimeloginDate;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}
