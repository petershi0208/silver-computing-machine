package com.yqwan.domain;

public class Trade {
	private int id;
	private String userid;
	private String openuserid;
	private String trade_no;
	private String money;
	private String gamename;
	private String gameregion;
	private String serverid;
	private String date;
	private String state;
	private String account;
	private String pay_method;
	private int gameid;
	private String goodsName;
	private String gameOrderId;
	private String ext;		//透传参数
	private String gameUrl;
	
	
	private int n;				//分页用
	
	private int count;
	
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public Trade(){};
	public Trade(String userid, String tradeNo, String money,
			String gamename, String gameregion, String date, String state,String account,
			String payMethod) {
		super();
		this.userid = userid;
		this.trade_no = tradeNo;
		this.money = money;
		this.gamename = gamename;
		this.gameregion = gameregion;
		this.date = date;
		this.state = state;
		this.account = account;
		this.pay_method = payMethod;
	}
	
	
	
	
	public String getServerid() {
		return serverid;
	}
	public void setServerid(String serverid) {
		this.serverid = serverid;
	}
	public String getOpenuserid() {
		return openuserid;
	}
	public void setOpenuserid(String openuserid) {
		this.openuserid = openuserid;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGameOrderId() {
		return gameOrderId;
	}
	public void setGameOrderId(String gameOrderId) {
		this.gameOrderId = gameOrderId;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getGameUrl() {
		return gameUrl;
	}
	public void setGameUrl(String gameUrl) {
		this.gameUrl = gameUrl;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String payMethod) {
		pay_method = payMethod;
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
	public String getTrade_no() {
		return trade_no;
	}
	public void setTrade_no(String tradeNo) {
		trade_no = tradeNo;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public String getGameregion() {
		return gameregion;
	}
	public void setGameregion(String gameregion) {
		this.gameregion = gameregion;
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
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
}
