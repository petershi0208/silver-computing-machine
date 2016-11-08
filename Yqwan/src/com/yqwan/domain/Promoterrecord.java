package com.yqwan.domain;

public class Promoterrecord {
	private int id;
	private String userid;
	private int recommendperson;
	private double recommendmoney;
	private String date;
	private String state;
	private int personsum;
	private double moneysum;
	
	private double personavg;
	private double moneyavg;
	private Promoter promoter;
	
	
	public double getPersonavg() {
		return personavg;
	}
	public void setPersonavg(double personavg) {
		this.personavg = personavg;
	}
	public double getMoneyavg() {
		return moneyavg;
	}
	public void setMoneyavg(double moneyavg) {
		this.moneyavg = moneyavg;
	}
	public Promoter getPromoter() {
		return promoter;
	}
	public void setPromoter(Promoter promoter) {
		this.promoter = promoter;
	}
	public int getPersonsum() {
		return personsum;
	}
	public void setPersonsum(int personsum) {
		this.personsum = personsum;
	}
	public double getMoneysum() {
		return moneysum;
	}
	public void setMoneysum(double moneysum) {
		this.moneysum = moneysum;
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
	public int getRecommendperson() {
		return recommendperson;
	}
	public void setRecommendperson(int recommendperson) {
		this.recommendperson = recommendperson;
	}
	public double getRecommendmoney() {
		return recommendmoney;
	}
	public void setRecommendmoney(double recommendmoney) {
		this.recommendmoney = recommendmoney;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
