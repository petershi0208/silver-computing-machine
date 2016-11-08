package com.yqwan.domain;

public class News {
	private int id;
	private String newsid;
	private String indexpicture;
	private String title;
	private String content;
	private String author;
	private String date;
	private String origin;
	private String description;
	
	private String type;
	private String state;
	private String gamename;
	private int n;
	
	public News(){}
	public News(String newsid, String indexpicture, String title,
			String content, String author, String date, String origin,
			String description) {
		super();
		this.newsid = newsid;
		this.indexpicture = indexpicture;
		this.title = title;
		this.content = content;
		this.author = author;
		this.date = date;
		this.origin = origin;
		this.description = description;
	}
	
	public News(int id, String newsid, String indexpicture, String title,
			String content, String author, String date, String origin,
			String description, String type, String state, String gamename) {
		super();
		this.id = id;
		this.newsid = newsid;
		this.indexpicture = indexpicture;
		this.title = title;
		this.content = content;
		this.author = author;
		this.date = date;
		this.origin = origin;
		this.description = description;
		this.type = type;
		this.state = state;
		this.gamename = gamename;
	}
	
	
	public int getN() {
		return n;
	}
	public void setN(int n) {
		this.n = n;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGamename() {
		return gamename;
	}
	public void setGamename(String gamename) {
		this.gamename = gamename;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNewsid() {
		return newsid;
	}
	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}
	public String getIndexpicture() {
		return indexpicture;
	}
	public void setIndexpicture(String indexpicture) {
		this.indexpicture = indexpicture;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
