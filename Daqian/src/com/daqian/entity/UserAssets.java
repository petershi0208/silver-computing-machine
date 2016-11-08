package com.daqian.entity;

public class UserAssets {
	private int id;
	private String username;		//用户名
	private double rolemoney;		//理财资金or借款资金
	private double residualmoney;	//账户余额（包括冻结）
	private double availablemoney;	//可用金额（非冻结金额）
	private String paypassword;		//支付密码
	public String getPaypassword() {
		return paypassword;
	}
	public void setPaypassword(String paypassword) {
		this.paypassword = paypassword;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public double getRolemoney() {
		return rolemoney;
	}
	public void setRolemoney(double rolemoney) {
		this.rolemoney = rolemoney;
	}
	public double getResidualmoney() {
		return residualmoney;
	}
	public void setResidualmoney(double residualmoney) {
		this.residualmoney = residualmoney;
	}
	public double getAvailablemoney() {
		return availablemoney;
	}
	public void setAvailablemoney(double availablemoney) {
		this.availablemoney = availablemoney;
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	private String ticket;			//优惠券
}
