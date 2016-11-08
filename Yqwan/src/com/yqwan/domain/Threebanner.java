package com.yqwan.domain;

public class Threebanner {
	private int id;
	private String gamename;
	private int gameid;
	private String gamepicture;
	private String bannerdate;
	private String largegamepicture;
	private String detaildescripe;
	
	private int maxserverid;
	private String ddate;
	
	
	
	
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public int getMaxserverid() {
		return maxserverid;
	}
	public void setMaxserverid(int maxserverid) {
		this.maxserverid = maxserverid;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getDetaildescripe() {
		return detaildescripe;
	}
	public void setDetaildescripe(String detaildescripe) {
		this.detaildescripe = detaildescripe;
	}
	public String getLargegamepicture() {
		return largegamepicture;
	}
	public void setLargegamepicture(String largegamepicture) {
		this.largegamepicture = largegamepicture;
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
	public String getGamepicture() {
		return gamepicture;
	}
	public void setGamepicture(String gamepicture) {
		this.gamepicture = gamepicture;
	}
	public String getBannerdate() {
		return bannerdate;
	}
	public void setBannerdate(String bannerdate) {
		this.bannerdate = bannerdate;
	}
}
