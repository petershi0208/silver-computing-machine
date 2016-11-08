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


import com.daqian.dao.UserAssetsDao;
import com.daqian.entity.UserAssets;

@Repository("userassetsdao")
public class JdbcUserAssetsDao implements UserAssetsDao{
	@Resource
	private DataSource ds;
	
	/*
	 * 充值更新金额
	 */
	public void recharge(String username,double residualmoney,double availablemoney){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userassets SET residualmoney=?,availablemoney=? WHERE username = ?";
			ps=conn.prepareStatement(sql);
			ps.setDouble(1,residualmoney);
			ps.setDouble(2,availablemoney);
			ps.setString(3, username);
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
	
	
	/**
	 * 修改支付密码
	 */
	public void changepaypwd(String name,String password){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userassets SET paypassword=? WHERE username = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,password);
			ps.setString(2,name);
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
	
	/**
	 * 通过用户名插入密码
	 */
	public void insertpwd(String name,String password){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="UPDATE userassets SET paypassword=? WHERE username=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,password);
			ps.setString(2, name);

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
	 * 通过查找用户名获得资产
	 */
	public UserAssets findByName(String name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userassets WHERE username=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,name);
			rs = ps.executeQuery();
			if(rs.next()){
				UserAssets userassets = new UserAssets();
				userassets.setUsername(rs.getString("username"));
				userassets.setRolemoney(rs.getDouble("rolemoney"));
				userassets.setResidualmoney(rs.getDouble("residualmoney"));
				userassets.setAvailablemoney(rs.getDouble("availablemoney"));
				userassets.setPaypassword(rs.getString("paypassword"));
				return userassets;
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
	 * 注册初始化资产
	 */
	public void insert(UserAssets u) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="INSERT INTO userassets (username,rolemoney,residualmoney,availablemoney) "+
						"VALUES "+
						"(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,u.getUsername());
			ps.setDouble(2,u.getRolemoney());
			ps.setDouble(3,u.getResidualmoney());
			ps.setDouble(4,u.getAvailablemoney());

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
	 * 通过用户名修改用户可用金额
	 */
	public void update(double availablemoney,String username) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "UPDATE userassets SET availablemoney=? WHERE username=?";
			ps=conn.prepareStatement(sql);
			ps.setDouble(1, availablemoney);
			ps.setString(2, username);
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
	 * 通过用户名查询单个用户信息
	 * @see com.daqian.dao.PurchaseDao#findByPname(java.lang.String)
	 */
	public UserAssets findByUsername(String Username) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "SELECT * FROM userassets WHERE username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, Username);
			UserAssets p = new UserAssets();
			rs = ps.executeQuery();
			if(rs.next()){
				p.setRolemoney(rs.getDouble("rolemoney"));
				p.setResidualmoney(rs.getDouble("residualmoney"));
				p.setAvailablemoney(rs.getDouble("availablemoney"));
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
	 * 通过用户名需改余额，理财金额
	 * @see com.daqian.dao.PurchaseDao#findByPname(java.lang.String)
	 */
	public void updateMoneyByStateAndPname(double rolemoney,double residualmoney,String username) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection(); 
			String sql = "UPDATE userassets SET rolemoney=?,residualmoney=? WHERE username=?";
			//in(select username from purchase where state=? and productname=?)
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, rolemoney);
			ps.setDouble(2, residualmoney);
			ps.setString(3, username);
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
	 * 
	 * @see com.daqian.dao.PurchaseDao#findByPname(java.lang.String)
	 */
	public void updateEarned(double rolemoney,double residualmoney,String username) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection(); 
			String sql = "UPDATE userassets SET rolemoney=?,residualmoney=? WHERE username=?";
			
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, rolemoney);
			ps.setDouble(2, residualmoney);
			ps.setString(3, username);
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
	public void updateRAmoney(double rolemoney,double residualmoney,String username) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection(); 
			String sql = "UPDATE userassets SET residualmoney=?,availablemoney=? WHERE username=?";
			
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, rolemoney);
			ps.setDouble(2, residualmoney);
			ps.setString(3, username);
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
	
	/**
	 *	查询全部
	 *
	 */
	public List<UserAssets> all(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userassets";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<UserAssets> list = new ArrayList<UserAssets>();
			while(rs.next()){
				UserAssets userassets = new UserAssets();
				userassets.setId(rs.getInt("id"));
				userassets.setUsername(rs.getString("username"));
				userassets.setRolemoney(rs.getDouble("rolemoney"));
				userassets.setResidualmoney(rs.getDouble("residualmoney"));
				userassets.setAvailablemoney(rs.getDouble("availablemoney"));
				userassets.setTicket(rs.getString("ticket"));
				list.add(userassets);
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


	public int updatemoney(double residualmoney,
			double availablemoney,int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		int res = -1;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userassets SET residualmoney=?,availablemoney=? WHERE id = ?";
			ps=conn.prepareStatement(sql);
			ps.setDouble(1, residualmoney);
			ps.setDouble(2, availablemoney);
			ps.setInt(3, id);
			res = ps.executeUpdate();
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
		return res;
	}


	public UserAssets findById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "SELECT * FROM userassets WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			UserAssets p = new UserAssets();
			rs = ps.executeQuery();
			if(rs.next()){
				p.setRolemoney(rs.getDouble("rolemoney"));
				p.setResidualmoney(rs.getDouble("residualmoney"));
				p.setAvailablemoney(rs.getDouble("availablemoney"));
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
}
