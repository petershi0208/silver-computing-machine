package com.daqian.dao;

import java.util.List;

import com.daqian.entity.borrow;

public interface BorrowDao {
	public void insert(borrow b);
	public List<borrow> all();
	public List<borrow> findByDate(String date1,String date2);
	public void updateState(String state,int id);
	public borrow findCount(String state);
	public borrow findCountByMonth(String state,String date);
	public borrow findCountByDay(String state,String date);
}
