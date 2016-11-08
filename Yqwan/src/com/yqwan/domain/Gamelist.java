package com.yqwan.domain;

public class Gamelist {
	private int id;
	private String gamename;
	private int gameid;
	private String gametype;
	private String descrip;
	private String placetype;
	private String roletype;
	private String mainpicture;
	private String toppicture;
	private String indexpicture;
	private String isBoutique;
	private String isrecommend;
	private String click;
	private String date;
	private String gameregion;
	private int serverid;
	private String score;
	private int n;				//用于分页
	
	private String ddate;
	
	
	private Gameinfo gameinfo;
	
	public Gameinfo getGameinfo() {
		return gameinfo;
	}
	public void setGameinfo(Gameinfo gameinfo) {
		this.gameinfo = gameinfo;
	}
	
	
	
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public int getServerid() {
		return serverid;
	}
	public void setServerid(int serverid) {
		this.serverid = serverid;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getGameregion() {
		return gameregion;
	}
	public void setGameregion(String gameregion) {
		this.gameregion = gameregion;
	}
	
	
	public int getGameid() {
		return gameid;
	}
	public void setGameid(int gameid) {
		this.gameid = gameid;
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
	public String getGametype() {
		return gametype;
	}
	public void setGametype(String gametype) {
		this.gametype = gametype;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	public String getPlacetype() {
		return placetype;
	}
	public void setPlacetype(String placetype) {
		this.placetype = placetype;
	}
	public String getRoletype() {
		return roletype;
	}
	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}
	public String getMainpicture() {
		return mainpicture;
	}
	public void setMainpicture(String mainpicture) {
		this.mainpicture = mainpicture;
	}
	public String getToppicture() {
		return toppicture;
	}
	public void setToppicture(String toppicture) {
		this.toppicture = toppicture;
	}
	public String getIndexpicture() {
		return indexpicture;
	}
	public void setIndexpicture(String indexpicture) {
		this.indexpicture = indexpicture;
	}
	public String getIsBoutique() {
		return isBoutique;
	}
	public void setIsBoutique(String isBoutique) {
		this.isBoutique = isBoutique;
	}
	public String getIsrecommend() {
		return isrecommend;
	}
	public void setIsrecommend(String isrecommend) {
		this.isrecommend = isrecommend;
	}
	
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
