package com.yqwan.domain;

public class Gameinfo {
	private int id;
	private String gamename;
	private int gameid;
	private String detaildescripe;
	private String picture;
	private String gamesize;
	private int commentnum;
	private String howstart;
	private String gamegoal;
	private String gameurl;
	private String phoneurl;
	private String code;
	
	private String indexpicture;		//外键用到 游戏列表的主图
	private int click;
	private String roletype;
	private String score;
	private String gametype;
	private String placetype;
	private String isBoutique;
	
	
	public String getPhoneurl() {
		return phoneurl;
	}
	public void setPhoneurl(String phoneurl) {
		this.phoneurl = phoneurl;
	}
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGametype() {
		return gametype;
	}
	public void setGametype(String gametype) {
		this.gametype = gametype;
	}
	public String getPlacetype() {
		return placetype;
	}
	public void setPlacetype(String placetype) {
		this.placetype = placetype;
	}
	public String getIsBoutique() {
		return isBoutique;
	}
	public void setIsBoutique(String isBoutique) {
		this.isBoutique = isBoutique;
	}
	public String getRoletype() {
		return roletype;
	}
	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public String getIndexpicture() {
		return indexpicture;
	}
	public void setIndexpicture(String indexpicture) {
		this.indexpicture = indexpicture;
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
	public String getDetaildescripe() {
		return detaildescripe;
	}
	public void setDetaildescripe(String detaildescripe) {
		this.detaildescripe = detaildescripe;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getGamesize() {
		return gamesize;
	}
	public void setGamesize(String gamesize) {
		this.gamesize = gamesize;
	}
	public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}
	public String getHowstart() {
		return howstart;
	}
	public void setHowstart(String howstart) {
		this.howstart = howstart;
	}
	public String getGamegoal() {
		return gamegoal;
	}
	public void setGamegoal(String gamegoal) {
		this.gamegoal = gamegoal;
	}
	public String getGameurl() {
		return gameurl;
	}
	public void setGameurl(String gameurl) {
		this.gameurl = gameurl;
	}
}
