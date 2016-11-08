package com.yihuo.domain;

public class House {
	private int id;						//
	private String house_id;				//
	private String money;				//
	private String date;				//
	private String mode;				//
	private String renter_telephone;	//
	private String renter_phone;		//
	private String renter_name;			//
	
	public House(){}
	
	public House(int id, String houseId, String money, String date,
			String mode, String renterTelephone, String renterPhone,
			String renterName) {
		super();
		this.id = id;
		house_id = houseId;
		this.money = money;
		this.date = date;
		this.mode = mode;
		renter_telephone = renterTelephone;
		renter_phone = renterPhone;
		renter_name = renterName;
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
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getRenter_telephone() {
		return renter_telephone;
	}
	public void setRenter_telephone(String renterTelephone) {
		renter_telephone = renterTelephone;
	}
	public String getRenter_phone() {
		return renter_phone;
	}
	public void setRenter_phone(String renterPhone) {
		renter_phone = renterPhone;
	}
	public String getRenter_name() {
		return renter_name;
	}
	public void setRenter_name(String renterName) {
		renter_name = renterName;
	}
	
}
