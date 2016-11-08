package com.daqian.entity;

public class Productinfos {
	private int pid;
	private String productname;
	private int cycle;
	private int minmoney;
	private int maxmoney;
	private int lastmoney;
	private String person;
	private String pdate;
	private int count;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	


	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getCycle() {
		return cycle;
	}
	public void setCycle(int cycle) {
		this.cycle = cycle;
	}
	public int getMinmoney() {
		return minmoney;
	}
	public void setMinmoney(int minmoney) {
		this.minmoney = minmoney;
	}
	public int getMaxmoney() {
		return maxmoney;
	}
	public void setMaxmoney(int maxmoney) {
		this.maxmoney = maxmoney;
	}
	public int getLastmoney() {
		return lastmoney;
	}
	public void setLastmoney(int lastmoney) {
		this.lastmoney = lastmoney;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	private int sid;
	private String sperson;
	private int maxamount;
	private int minamount;
	private double yearreturn;
	private double duereturn;
	private int monthoryear;
	private String sdate;


	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSperson() {
		return sperson;
	}
	public void setSperson(String sperson) {
		this.sperson = sperson;
	}
	public int getMaxamount() {
		return maxamount;
	}
	public void setMaxamount(int maxamount) {
		this.maxamount = maxamount;
	}
	public int getMinamount() {
		return minamount;
	}
	public void setMinamount(int minamount) {
		this.minamount = minamount;
	}
	public double getYearreturn() {
		return yearreturn;
	}
	public void setYearreturn(double yearreturn) {
		this.yearreturn = yearreturn;
	}
	public double getDuereturn() {
		return duereturn;
	}
	public void setDuereturn(double duereturn) {
		this.duereturn = duereturn;
	}
	public int getMonthoryear() {
		return monthoryear;
	}
	public void setMonthoryear(int monthoryear) {
		this.monthoryear = monthoryear;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	private int currentpage;
	private int pagesize;
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
}
