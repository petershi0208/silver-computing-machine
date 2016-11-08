package com.yqwan.domain;

public class Gamedistrict {
	private int id;
	private String gamename;
	private int gameid;
	private String gameregion;
	private String date;
	private String click;
	private int serverid;
	
	public int getServerid() {
		return serverid;
	}
	public void setServerid(int serverid) {
		this.serverid = serverid;
	}
	
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
}
