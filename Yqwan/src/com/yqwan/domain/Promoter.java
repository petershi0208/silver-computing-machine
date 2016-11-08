package com.yqwan.domain;

public class Promoter {
	private int id;
	private String userid;
	private String name;
	private String aliaccount;
	private String telephone;
	private String qq;
	private String recommendcode;
	private String date;
	private String state;
	
	public Promoter(String userid, String name, String aliaccount,
			String telephone, String qq, String recommendcode,String date, String state) {
		super();
		this.userid = userid;
		this.name = name;
		this.aliaccount = aliaccount;
		this.telephone = telephone;
		this.qq = qq;
		this.recommendcode = recommendcode;
		this.date = date;
		this.state = state;
	}
	public Promoter(){}
	
	
	public String getRecommendcode() {
		return recommendcode;
	}
	public void setRecommendcode(String recommendcode) {
		this.recommendcode = recommendcode;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAliaccount() {
		return aliaccount;
	}
	public void setAliaccount(String aliaccount) {
		this.aliaccount = aliaccount;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
