package com.daqian.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.daqian.dao.PhoneCodeDao;
import com.daqian.entity.phonecode;

@Repository("phonecodedao")
public class JdbcPhoneCodeDao implements PhoneCodeDao{
	@Resource
	private DataSource ds;
	
	public phonecode findByphone(String phone){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM phonecode WHERE phone=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			if(rs.next()){
				phonecode p = new phonecode();
				p.setCode(rs.getString("code"));
				p.setPhone(rs.getString("phone"));
				return p;
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
	 * 获得手机验证码
	 */
	public void add(String phone,String code) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql = "INSERT INTO phonecode (phone,code) VALUES (?,?) ";
			ps =conn.prepareStatement(sql);
			ps.setString(1, phone);
			ps.setString(2, code);
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
	 * 删除手机验证码
	 * @param code
	 */
	public void delete(String phone){
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql = "DELETE FROM phonecode WHERE phone=?";
			ps =conn.prepareStatement(sql);
			ps.setString(1, phone);
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
}
