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

import com.daqian.dao.PurchaseDao;
import com.daqian.entity.purchase;

@Repository
public class JdbcPurchaseDao implements PurchaseDao{
	
	@Resource
	private DataSource ds;
	
	
	/**
	 * 该用户购买的记录一共几条
	 */
	public List<purchase> findNum(String name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<purchase> list = new ArrayList<purchase>();
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM purchase WHERE username=? AND state='成功'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setProductname(rs.getString("productname"));
				p.setMoney(rs.getDouble("money"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				list.add(p);
			}
			return list;
		}catch (SQLException e) {
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
	 * 分页
	 */
	public List<purchase> findByName(String name,int n){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<purchase> list = new ArrayList<purchase>();
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM purchase WHERE username=? AND state='成功'  LIMIT ?,3";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, 3*(n-1));
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setProductname(rs.getString("productname"));
				p.setMoney(rs.getDouble("money"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				p.setDate(rs.getString("date"));
				list.add(p);
			}
			return list;
		}catch (SQLException e) {
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
	
	/*
	 * 添加购买信息数据
	 * @see com.daqian.dao.PurchaseDao#add(com.daqian.entity.purchase)
	 */
	
	public void add(purchase pc) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "INSERT INTO purchase(username,money,date,state,productname,earned,expectedannual,amount,monthoryear) value(?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, pc.getUsername());
			ps.setDouble(2, pc.getMoney());
			ps.setString(3, pc.getDate());
			ps.setString(4, pc.getState());
			ps.setString(5, pc.getProductname());
			ps.setDouble(6, pc.getEarned());
			ps.setDouble(7, pc.getExpectedannual());
			ps.setDouble(8, pc.getAmount());
			ps.setInt(9, pc.getMonthoryear());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
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
	 * 根据用户名查询单个用户信息
	 * @see com.daqian.dao.PurchaseDao#findMoneyByUnamePname(java.lang.String)
	 */
	public purchase findMoneyByUnamePname(String Username) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "SELECT * FROM purchase WHERE username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, Username);
			purchase p = new purchase();
			rs = ps.executeQuery();
			if(rs.next()){
//				p.setRolemoney(rs.getDouble("rolemoney"));
//				p.setResidualmoney(rs.getDouble("residualmoney"));
//				p.setAvailablemoney(rs.getDouble("availablemoney"));	
				
			}
			return p;
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
		return null;
	}
	/*
	 * 根据用户状态和用户名查询购买信息集合
	 * @see com.daqian.dao.PurchaseDao#findByPname(java.lang.String)
	 */
	public List<purchase> findByPname(String productname) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where state='冻结' and productname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, productname);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setUsername(rs.getString("username"));
				p.setEarned(rs.getDouble("earned"));
				p.setMoney(rs.getDouble("money"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setState(rs.getString("state"));
				list.add(p);
			}
			return list;
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
		return null;
	}
	/*
	 * 根据产品名，状态更改用户状态，起售日期
	 * @see com.daqian.dao.PurchaseDao#findByPname(java.lang.String)
	 */
	public void updateState(String startdate,String lastbackdate,String pname) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "UPDATE purchase SET state='成功',startdate=?,lastbackdate=? where state='冻结' and productname=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, startdate);
			ps.setString(2, lastbackdate);
			ps.setString(3, pname);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
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
	 * 根据状态，产品名查询购买表集合
	 * @see com.daqian.dao.PurchaseDao#findByPname(java.lang.String)
	 */
	public List<purchase> findBycpname(String productname) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where state='成功' and productname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, productname);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setUsername(rs.getString("username"));
				p.setEarned(rs.getDouble("earned"));
				p.setMoney(rs.getDouble("money"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setState(rs.getString("state"));
				list.add(p);
			}
			return list;
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
		return null;
	}
	
	/*
	 * 通过时间查询
	 * @see com.daqian.dao.PurchaseDao#findBydate(java.lang.String, java.lang.String)
	 */
	public List<purchase> findBydate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where date between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setId(rs.getInt("id"));
				p.setUsername(rs.getString("username"));
				p.setMoney(rs.getDouble("money"));
				p.setDate(rs.getString("date"));
				p.setState(rs.getString("state"));
				p.setProductname(rs.getString("productname"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setStartdate(rs.getString("startdate"));
				p.setLastbackdate(rs.getString("lastbackdate"));
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	/*
	 * 通过产品开始时间查询
	 * @see com.daqian.dao.PurchaseDao#findBystartdate(java.lang.String, java.lang.String)
	 */
	public List<purchase> findBystartdate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where startdate between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setId(rs.getInt("id"));
				p.setUsername(rs.getString("username"));
				p.setMoney(rs.getDouble("money"));
				p.setDate(rs.getString("date"));
				p.setState(rs.getString("state"));
				p.setProductname(rs.getString("productname"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setStartdate(rs.getString("startdate"));
				p.setLastbackdate(rs.getString("lastbackdate"));
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	/*
	 * 通过返回收益时间查询
	 */
	public List<purchase> findByLastbackdate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where lastbackdate between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setId(rs.getInt("id"));
				p.setUsername(rs.getString("username"));
				p.setMoney(rs.getDouble("money"));
				p.setDate(rs.getString("date"));
				p.setState(rs.getString("state"));
				p.setProductname(rs.getString("productname"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setStartdate(rs.getString("startdate"));
				p.setLastbackdate(rs.getString("lastbackdate"));
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	/*
	 * 通过产品开始时间和购买时间查询
	 * @see com.daqian.dao.PurchaseDao#findBySD(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public List<purchase> findBySD(String date1, String date2, String date3, String date4) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where date between ? and ? and startdate between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			ps.setString(3, date3);
			ps.setString(4, date4);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setId(rs.getInt("id"));
				p.setUsername(rs.getString("username"));
				p.setMoney(rs.getDouble("money"));
				p.setDate(rs.getString("date"));
				p.setState(rs.getString("state"));
				p.setProductname(rs.getString("productname"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setStartdate(rs.getString("startdate"));
				p.setLastbackdate(rs.getString("lastbackdate"));
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 *	查询所有
	 */
	public List<purchase> all(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<purchase> list = new ArrayList<purchase>();
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM purchase";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setId(rs.getInt("id"));
				p.setUsername(rs.getString("username"));
				p.setMoney(rs.getDouble("money"));
				p.setDate(rs.getString("date"));
				p.setState(rs.getString("state"));
				p.setProductname(rs.getString("productname"));
				p.setEarned(rs.getDouble("earned"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setAmount(rs.getInt("amount"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setStartdate(rs.getString("startdate"));
				p.setLastbackdate(rs.getString("lastbackdate"));
				list.add(p);
			}
			return list;
		}catch (SQLException e) {
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
	/*
	 * 查询总投资金额
	 * @see com.daqian.dao.PurchaseDao#findSum()
	 */
	public purchase findSum() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select SUM(money) sum from purchase";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				purchase p = new purchase();
				p.setSum(rs.getInt("sum"));
				return p;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * 查询日投资金额
	 */
	public purchase findSumByday(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select SUM(money) sum from purchase where date=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			if(rs.next()){
				purchase p = new purchase();
				p.setSum(rs.getInt("sum"));
				return p;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * 查询月投资金额
	 */
	public purchase findSumBymonth(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select SUM(money) sum from purchase where date_format(date,'%Y-%m')=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			if(rs.next()){
				purchase p = new purchase();
				p.setSum(rs.getInt("sum"));
				return p;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * 查询总收益
	 */
	public purchase findSumEarned() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select SUM(earned) sum from purchase";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				purchase p = new purchase();
				p.setSum(rs.getInt("sum"));
				return p;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * 查询日收益
	 */
	public purchase findSumEarnedByDay(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select SUM(earned) sum from purchase where date=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			if(rs.next()){
				purchase p = new purchase();
				p.setSum(rs.getInt("sum"));
				return p;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	 * 查询月收益
	 */
	public purchase findSumEarnedByMonth(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select SUM(earned) sum from purchase where date_format(date,'%Y-%m')=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			if(rs.next()){
				purchase p = new purchase();
				p.setSum(rs.getInt("sum"));
				return p;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public List<purchase> findByPaname(String productname) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from purchase where productname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, productname);
			List<purchase> list = new ArrayList<purchase>();
			rs = ps.executeQuery();
			while(rs.next()){
				purchase p = new purchase();
				p.setUsername(rs.getString("username"));
				p.setEarned(rs.getDouble("earned"));
				p.setMoney(rs.getDouble("money"));
				p.setDate(rs.getString("date"));
				p.setExpectedannual(rs.getDouble("expectedannual"));
				p.setState(rs.getString("state"));
				list.add(p);
			}
			return list;
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
		return null;
	}
}
