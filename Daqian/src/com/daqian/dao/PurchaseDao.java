package com.daqian.dao;

import java.util.List;

import com.daqian.entity.purchase;

public interface PurchaseDao {
	public List<purchase> findNum(String name);
	public List<purchase> findByName(String name,int n);
	
	
	
	public void add(purchase pc);
	public purchase findMoneyByUnamePname(String Username);
	public List<purchase> findByPname(String productname);
	public List<purchase> findByPaname(String productname);
	public List<purchase> findBycpname(String productname);
	public void updateState(String startdate,String lastbackdate,String pname);
	
	public List<purchase> findBydate(String date1,String date2);
	public List<purchase> findBystartdate(String date1, String date2);
	public List<purchase> findBySD(String date1, String date2, String date3, String date4);
	public List<purchase> findByLastbackdate(String date1, String date2);
	
	public List<purchase> all();
	public purchase findSum();
	public purchase findSumByday(String date);
	public purchase findSumBymonth(String date);
	public purchase findSumEarned();
	public purchase findSumEarnedByDay(String date);
	public purchase findSumEarnedByMonth(String date);
}
