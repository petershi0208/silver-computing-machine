package com.yqwan.domain;

public class LatestRegion {
	private int id;
	private String userid;
	private String nickname;
	private String battle;
	private String lv;
	private String gamename;
	private String region;
	private int serverid;
	private String date;
	private int count;

	
	public LatestRegion(String userid,String nickname,String gamename, String region,int serverid,
			String date) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.gamename = gamename;
		this.region = region;
		this.serverid = serverid;
		this.date = date;
	}
	
	public LatestRegion(){};
	
	

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

	public String getBattle() {
		return battle;
	}

	public void setBattle(String battle) {
		this.battle = battle;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}

	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	public int getServerid() {
		return serverid;
	}

	public void setServerid(int serverid) {
		this.serverid = serverid;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
