package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Trade;

@Repository("tradedao")
public interface ITradeDao {
	public void insert(Trade trade);
	public Trade findbytrade_no(String trade_no);
	public void updateState(Trade trade);
	public void updateAccount(Trade trade);
	
	public List<Trade> paging(String userid,int currentpage,int pagesize);
	public int count(String userid);
	
	public String findByUserid(String userid);			//获得玩家最近的充值游戏
	public List<Trade> findAllByUserid(String userid);			//获得玩家全部充值记录
	
	public int ifCount(String userid);
	
	/**
	 * 充值记录分页
	 * @return
	 */
	public List<Trade> listpagetrade(Trade trade);
	
	public List<Trade> gamemoney(Trade trade); //游戏消费金额
	public List<Trade> regionmoney(String userid);//每个人每个游戏消费金额
}
