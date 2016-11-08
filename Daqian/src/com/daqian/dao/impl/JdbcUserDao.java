package com.daqian.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.daqian.dao.UserDao;
import com.daqian.entity.User;

@Repository("userdao")
public class JdbcUserDao implements UserDao{
	
	@Resource
	private DataSource ds;
	
	/**
	 * 实名认证
	 */
	public void changecard(String username,String realname,String card){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userinfo SET card=?,realname=? WHERE username = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,card);
			ps.setString(2,realname);
			ps.setString(3,username );
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
	 * 修改登录ip
	 * @param name
	 * @param ip
	 */
	public void changeloginip(String name,String ip){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userinfo SET localip=? WHERE telephone=? OR Email=? OR username = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ip);
			ps.setString(2, name);
			ps.setString(3, name);
			ps.setString(4, name);
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
	 * 修改登录时间
	 */
	public void changelogintime(String name,Date date){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userinfo SET lasttimelogin_date=? WHERE telephone=? OR Email=? OR username = ?";
			ps=conn.prepareStatement(sql);
			ps.setDate(1,date);
			ps.setString(2, name);
			ps.setString(3, name);
			ps.setString(4, name);
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
	 * 修改密码
	 */
	public void changepwd(String name,String password){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE userinfo SET password=? WHERE username = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,password);
			ps.setString(2, name);
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
		 * 通过手机号查找
		 */
	public User findByPhone(String phone){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo WHERE telephone=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,phone);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setTelephone(rs.getString("telephone"));
				user.setPassword(rs.getString("password"));
				return user;
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
	 * 通过username查找
	 * @param name
	 * @return
	 */
	public User findByName(String name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo WHERE username=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,name);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setTelephone(rs.getString("telephone"));
				user.setPassword(rs.getString("password"));
				user.setCard(rs.getString("card"));
				user.setRealname(rs.getString("realname"));
				return user;
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
	 * 登录判定
	 */
	public User login(String name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo WHERE telephone=? OR Email=? OR username=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,name);
			ps.setString(2, name);
			ps.setString(3, name);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setTelephone(rs.getString("telephone"));
				user.setPassword(rs.getString("password"));
				user.setLasttimelogin_date(rs.getDate("lasttimelogin_date"));
				user.setLocalip(rs.getString("localip"));
				user.setRole(rs.getString("role"));
				user.setCard(rs.getString("card"));
				user.setRealname(rs.getString("realname"));
				return user;
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
	 * 注册
	 */
	public void regist(User u) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="INSERT INTO userinfo (username,password,telephone,role,regist_date,lasttimelogin_date,localip) "+
						"VALUES "+
						"(?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,u.getUsername());
			ps.setString(2,u.getPassword());
			ps.setString(3,u.getTelephone());
			ps.setString(4,u.getRole());
			ps.setDate(5, u.getRegist_date());
			ps.setDate(6,u.getLasttimelogin_date());
			ps.setString(7, u.getLocalip());
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
	 * 根据注册时间查询
	 * @see com.daqian.dao.UserDao#findbydate(java.lang.String, java.lang.String)
	 */
	public List<User> findbydate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo where regist_date between ? and ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<User> list = new ArrayList<User>();
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setTelephone(rs.getString("telephone"));
				user.setEmail(rs.getString("email"));
				user.setCard(rs.getString("card"));
				user.setRole(rs.getString("role"));
				user.setRegist_date(rs.getDate("regist_date"));
				user.setLasttimelogin_date(rs.getDate("lasttimelogin_date"));
				user.setLocalip(rs.getString("localip"));
				user.setRealname(rs.getString("realname"));
				list.add(user);
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
	 * 通过登录时间查询
	 * @see com.daqian.dao.UserDao#findbydate(java.lang.String, java.lang.String)
	 */
	public List<User> findbyLogindate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo where lasttimelogin_date between ? and ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<User> list = new ArrayList<User>();
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setTelephone(rs.getString("telephone"));
				user.setEmail(rs.getString("email"));
				user.setCard(rs.getString("card"));
				user.setRole(rs.getString("role"));
				user.setRegist_date(rs.getDate("regist_date"));
				user.setLasttimelogin_date(rs.getDate("lasttimelogin_date"));
				user.setLocalip(rs.getString("localip"));
				user.setRealname(rs.getString("realname"));
				list.add(user);
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
	 * 通过注册时间和登录时间查询
	 * @see com.daqian.dao.UserDao#findbydate(java.lang.String, java.lang.String)
	 */
	public List<User> findbyLRdate(String date1, String date2, String date3, String date4) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo where regist_date between ? and ? and lasttimelogin_date between ? and ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			ps.setString(3, date3);
			ps.setString(4, date4);
			rs = ps.executeQuery();
			List<User> list = new ArrayList<User>();
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setTelephone(rs.getString("telephone"));
				user.setEmail(rs.getString("email"));
				user.setCard(rs.getString("card"));
				user.setRole(rs.getString("role"));
				user.setRegist_date(rs.getDate("regist_date"));
				user.setLasttimelogin_date(rs.getDate("lasttimelogin_date"));
				user.setLocalip(rs.getString("localip"));
				user.setRealname(rs.getString("realname"));
				list.add(user);
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
	 * 查询全部
	 * 
	 * @return
	 */
	public List<User> all(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM userinfo";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<User> list = new ArrayList<User>();
			while(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setTelephone(rs.getString("telephone"));
				user.setEmail(rs.getString("email"));
				user.setCard(rs.getString("card"));
				user.setRole(rs.getString("role"));
				user.setRegist_date(rs.getDate("regist_date"));
				user.setLasttimelogin_date(rs.getDate("lasttimelogin_date"));
				user.setLocalip(rs.getString("localip"));
				user.setRealname(rs.getString("realname"));
				list.add(user);
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
	 * 查询总人数
	 * @param name
	 * @return
	 */
	public User findCount(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT COUNT(*) count FROM userinfo";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setCount(rs.getInt("count"));
				return user;
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
	 * 查询日人数
	 * @param name
	 * @return
	 */
	public User findCountByDay(String date){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT COUNT(*) count FROM userinfo WHERE regist_date=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,date);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setCount(rs.getInt("count"));
				return user;
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
	 * 查询月人数
	 * @param name
	 * @return
	 */
	public User findCountByMonth(String date){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT COUNT(*) count FROM userinfo WHERE date_format(regist_date,'%Y-%m')=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,date);
			rs = ps.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setCount(rs.getInt("count"));
				return user;
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
