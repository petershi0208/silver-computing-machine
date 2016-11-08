package com.yqwan.domain;

public class Comment {
	private int id;
	private String gamename;
	private int gameid;
	private String userid;
	private String content;
	private String date;
	private String state;
	private String headpicture;
	private String nickname;
	private int n;			//用于分页
	public Comment(String gamename,int gameid, String userid, String content, String date,
			String state) {
		super();
		this.gamename = gamename;
		this.gameid = gameid;
		this.userid = userid;
		this.content = content;
		this.date = date;
		this.state = state;
	}
	public Comment(){};
	
	
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getHeadpicture() {
		return headpicture;
	}
	public void setHeadpicture(String headpicture) {
		this.headpicture = headpicture;
	}
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
