package com.daqian.entity;


public class purchase {
	private int id;
	private String username;		//用户名
	private double money;			//理财产品金额
	private String date;			//购买时间
	private String state;			//购买的状态
	private String productname;		//产品名称
	private double earned;			//已赚金额
	private double expectedannual;	//预期年化
	private int amount;				//数量
	private int monthoryear;
	private String startdate;
	private String lastbackdate;
	private int sum;
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getLastbackdate() {
		return lastbackdate;
	}
	public void setLastbackdate(String lastbackdate) {
		this.lastbackdate = lastbackdate;
	}
	public int getMonthoryear() {
		return monthoryear;
	}
	public void setMonthoryear(int monthoryear) {
		this.monthoryear = monthoryear;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
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
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
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
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public double getEarned() {
		return earned;
	}
	public void setEarned(double earned) {
		this.earned = earned;
	}
	public double getExpectedannual() {
		return expectedannual;
	}
	public void setExpectedannual(double expectedannual) {
		this.expectedannual = expectedannual;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
