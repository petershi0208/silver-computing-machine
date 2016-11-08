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

import com.daqian.dao.BorrowDao;
import com.daqian.entity.borrow;

@Repository("borrowdao")
public class JdbcBorrowDao implements BorrowDao{
	@Resource
	private DataSource ds;
	
	
	
	
	/**
	 * 插入借款信息
	 */
	public void insert(borrow b) {
			Connection conn = null;
			PreparedStatement ps = null;
			try {
				conn = ds.getConnection();
				String sql ="INSERT INTO borrow (username,productname,principal,interest,state,borrowdate,realname,card,city,graduate,deadline,files) "+
							"VALUES "+
							"(?,?,?,?,?,?,?,?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1,b.getUsername());
				ps.setString(2,b.getProductname());
				ps.setInt(3,b.getPrincipal());
				ps.setDouble(4,b.getInterest());
				ps.setString(5,b.getState());
				ps.setDate(6,b.getBorrowdate());
				ps.setString(7, b.getRealname());
				ps.setString(8, b.getCard());
				ps.setString(9, b.getCity());
				ps.setString(10, b.getGraduate());
				ps.setString(11, b.getDeadline());
				ps.setString(12, b.getFile());
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
	 * 查询全部
	 */
	public List<borrow> all(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM borrow";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<borrow> list = new ArrayList<borrow>();
			while(rs.next()){
				borrow b = new borrow();
				b.setId(rs.getInt("id"));
				b.setUsername(rs.getString("username"));
				b.setProductname(rs.getString("productname"));
				b.setPrincipal(rs.getInt("principal"));
				b.setInterest(rs.getInt("interest"));
				b.setState(rs.getString("state"));
				b.setBorrowdate(rs.getDate("borrowdate"));
				b.setRealname(rs.getString("realname"));
				b.setCard(rs.getString("card"));
				b.setCity(rs.getString("city"));
				b.setGraduate(rs.getString("graduate"));
				b.setDeadline(rs.getString("deadline"));
				b.setFile(rs.getString("files"));
				list.add(b);
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
	 * 根据时间查询
	 */
	public List<borrow> findByDate(String date1, String date2) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM borrow where borrowdate between ? and ?";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<borrow> list = new ArrayList<borrow>();
			while(rs.next()){
				borrow b = new borrow();
				b.setId(rs.getInt("id"));
				b.setUsername(rs.getString("username"));
				b.setProductname(rs.getString("productname"));
				b.setPrincipal(rs.getInt("principal"));
				b.setInterest(rs.getInt("interest"));
				b.setState(rs.getString("state"));
				b.setBorrowdate(rs.getDate("borrowdate"));
				b.setRealname(rs.getString("realname"));
				b.setCard(rs.getString("card"));
				b.setCity(rs.getString("city"));
				b.setGraduate(rs.getString("graduate"));
				b.setDeadline(rs.getString("deadline"));
				b.setFile(rs.getString("files"));
				list.add(b);
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
	/*
	 * 根据状态修改
	 * @see com.daqian.dao.BorrowDao#updateState(java.lang.String, int)
	 */
	public void updateState(String state, int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="UPDATE borrow SET state=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,state);
			ps.setInt(2,id);
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
	/*
	 * 计算总投资额
	 * @see com.daqian.dao.BorrowDao#findSum()
	 */
	public borrow findCount(String state) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT count(id) count FROM borrow where state=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, state);
			rs = ps.executeQuery();
			if(rs.next()){
				borrow b = new borrow();
				b.setCount(rs.getInt("count"));
				return b;
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
	/*
	 * 根据天计算投资额
	 * @see com.daqian.dao.BorrowDao#findSum()
	 */
	public borrow findCountByDay(String state,String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT count(id) count FROM borrow where state=? and borrowdate=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setString(2, date);
			rs = ps.executeQuery();
			if(rs.next()){
				borrow b = new borrow();
				b.setCount(rs.getInt("count"));
				return b;
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
	/*
	 * 根据月计算投资额
	 * @see com.daqian.dao.BorrowDao#findSum()
	 */
	public borrow findCountByMonth(String state,String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT count(id) count FROM borrow where state=? and date_format(borrowdate,'%Y-%m')=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setString(2, date);
			rs = ps.executeQuery();
			if(rs.next()){
				borrow b = new borrow();
				b.setCount(rs.getInt("count"));
				return b;
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
}
