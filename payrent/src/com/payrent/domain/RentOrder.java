package com.payrent.domain;

public class RentOrder {
	private int id;
	private String orderid;
	private String house_id;
	private String telephone;
	private String name;
	private String money;
	private String date;
	private String state;
	
	public RentOrder(){};
	
	public RentOrder(String orderid, String houseId, String telephone, String name,
			String money, String date, String state) {
		super();
		this.orderid = orderid;
		house_id = houseId;
		this.telephone = telephone;
		this.name = name;
		this.money = money;
		this.date = date;
		this.state = state;
	}

	public String getHouse_id() {
		return house_id;
	}

	public void setHouse_id(String houseId) {
		house_id = houseId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
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
	
}
