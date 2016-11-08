package com.yqwan.domain;

public class Cdkeyinfo {
	private int id;
	private String cdkey;
	private int giftid;
	private int isreceive;
	private String receiptor;
	private String giftname;
	private int n;
	private String gamename;
	private String timelimit;
	private String activationdate;
	private String date;
	
	
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public String getTimelimit() {
		return timelimit;
	}
	public void setTimelimit(String timelimit) {
		this.timelimit = timelimit;
	}
	public String getActivationdate() {
		return activationdate;
	}
	public void setActivationdate(String activationdate) {
		this.activationdate = activationdate;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getReceiptor() {
		return receiptor;
	}
	public void setReceiptor(String receiptor) {
		this.receiptor = receiptor;
	}
	public String getGiftname() {
		return giftname;
	}
	public void setGiftname(String giftname) {
		this.giftname = giftname;
	}
	//	private Giftinfo gift;
//	
//	public Giftinfo getGift() {
//		return gift;
//	}
//	public void setGift(Giftinfo gift) {
//		this.gift = gift;
//	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCdkey() {
		return cdkey;
	}
	public void setCdkey(String cdkey) {
		this.cdkey = cdkey;
	}
	public int getGiftid() {
		return giftid;
	}
	public void setGiftid(int giftid) {
		this.giftid = giftid;
	}
	public int getIsreceive() {
		return isreceive;
	}
	public void setIsreceive(int isreceive) {
		this.isreceive = isreceive;
	}
}
