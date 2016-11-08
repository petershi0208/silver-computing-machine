package com.daqian.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.daqian.dao.TradeDao;
import com.daqian.entity.Trade;

@Repository("tradedao")
public class JdbcTradeDao implements TradeDao{
	@Resource
	private DataSource ds;
	
	/*
	 * 更新充值成功后的状态
	 */
	public void updateState(String state,String date,String trade_no){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE trade SET state=?,date=? WHERE trade_no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,state);
			ps.setString(2,date);
			ps.setString(3,trade_no);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
	
	
	/*
	 * 通过订单号查询信息
	 * @see com.daqian.dao.TradeDao#findbytrade_no(java.lang.String)
	 */
	public Trade findbytrade_no(String no){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM trade WHERE trade_no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,no);
			rs = ps.executeQuery();
			if(rs.next()){
				Trade trade = new Trade();
				trade.setUsername(rs.getString("username"));
				trade.setTrade_no(rs.getString("trade_no"));
				trade.setMoney(rs.getString("money"));
				trade.setDate(rs.getString("date"));
				trade.setRealname(rs.getString("realname"));
				trade.setTelephone(rs.getString("telephone"));
				trade.setState(rs.getString("state"));
				trade.setType(rs.getString("type"));
				return trade;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}
	
	
	/**
	 * 插入充值或提现记录
	 */
	public void insert(Trade t) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="INSERT INTO trade (username,trade_no,money,date,realname,telephone,state,type) "+
						"VALUES "+
						"(?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,t.getUsername());
			ps.setString(2,t.getTrade_no());
			ps.setString(3,t.getMoney());
			ps.setString(4,t.getDate());
			ps.setString(5,t.getRealname());
			ps.setString(6,t.getTelephone());
			ps.setString(7, t.getState());
			ps.setString(8, t.getType());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 查询全部记录
	 */
	public List<Trade> all(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM trade WHERE state='完成'";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Trade> list = new ArrayList<Trade>();
			while(rs.next()){
				Trade trade = new Trade();
				trade.setId(rs.getInt("id"));
				trade.setUsername(rs.getString("username"));
				trade.setTrade_no(rs.getString("trade_no"));
				trade.setMoney(rs.getString("money"));
				trade.setDate(rs.getString("date"));
				trade.setRealname(rs.getString("realname"));
				trade.setTelephone(rs.getString("telephone"));
				trade.setState(rs.getString("state"));
				trade.setType(rs.getString("type"));
				list.add(trade);
			}	
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}

	/**
	 * 通过时间查询全部记录
	 */
	public List<Trade> findbydate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM trade WHERE where date between ? and ? AND state='完成'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<Trade> list = new ArrayList<Trade>();
			while(rs.next()){
				Trade trade = new Trade();
				trade.setId(rs.getInt("id"));
				trade.setUsername(rs.getString("username"));
				trade.setTrade_no(rs.getString("trade_no"));
				trade.setMoney(rs.getString("money"));
				trade.setDate(rs.getString("date"));
				trade.setRealname(rs.getString("realname"));
				trade.setTelephone(rs.getString("telephone"));
				trade.setState(rs.getString("state"));
				trade.setType(rs.getString("type"));
				list.add(trade);
			}	
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}
}
