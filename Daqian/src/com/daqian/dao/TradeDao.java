package com.daqian.dao;

import java.util.List;

import com.daqian.entity.Trade;


public interface TradeDao {
	public Trade findbytrade_no(String no);		//根据订单查询
	public void insert(Trade t);				//插入订单记录
	
	public List<Trade> all();
	public List<Trade> findbydate(String date1, String date2);
	public void updateState(String state,String date,String trade_no);
}
