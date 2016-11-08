package com.daqian.dao;

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

import com.daqian.entity.Admin;

@Repository("adminlogindao")
public class AdminLoginDao {
	@Resource
	private DataSource ds;
	
	/*
	 * 更新admin登录时间
	 */
	public void changelogintime(String name,String date){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn=ds.getConnection();
			String sql = "UPDATE admin SET logindate=? WHERE username = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,date);
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
	/*
	 * 修改admin密码
	 */
	public int updatepassword(Admin admin){
		Connection conn = null;
		PreparedStatement ps = null;
		int res = -1;
		try {
			conn=ds.getConnection();
			String sql = "update admin set password = ? WHERE id = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, admin.getPassword());
			ps.setInt(2, admin.getId());
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
	/*
	 * 添加admin
	 */
	public int insert(Admin admin){
		Connection conn = null;
		PreparedStatement ps = null;
		int res = -1;
		try {
			conn=ds.getConnection();
			String sql = "insert into admin(username,password,logindate,type) values(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,admin.getUsername());
			ps.setString(2, admin.getPassword());
			ps.setString(3, admin.getLogindate());
			ps.setString(4, admin.getType());
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
	
	/*
	 * 添加admin
	 */
	public int del(int id){
		Connection conn = null;
		PreparedStatement ps = null;
		int res = -1;
		try {
			conn=ds.getConnection();
			String sql = "delete from admin where id =?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
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
	
	/*
	 * 全部查询
	 */
	public List<Admin> admininfo(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM admin";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Admin> list = new ArrayList<Admin>();
			while(rs.next()){
				Admin admin = new Admin();
					admin.setId(rs.getInt("id"));
					admin.setPassword(rs.getString("password"));
					admin.setUsername(rs.getString("username"));
					admin.setLogindate(rs.getString("logindate"));
					admin.setType(rs.getString("type"));
				list.add(admin);
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
	 * 判断管理员登录成功与否
	 */
	public Admin login(String username){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM admin WHERE username=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			if(rs.next()){
				Admin admin = new Admin();
					admin.setPassword(rs.getString("password"));
					admin.setUsername(rs.getString("username"));
					admin.setLogindate(rs.getString("logindate"));
					admin.setType(rs.getString("type"));
				return admin;
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
