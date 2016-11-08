package com.payrent.domain;

public class YearPay {
	private String house_id;
	private String name;
	private String telephone;
	private String date;
	private String state;
	
	public YearPay(){}
	public YearPay(String houseId, String name, String telephone, String date,
			String state) {
		super();
		house_id = houseId;
		this.name = name;
		this.telephone = telephone;
		this.date = date;
		this.state = state;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String houseId) {
		house_id = houseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
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
