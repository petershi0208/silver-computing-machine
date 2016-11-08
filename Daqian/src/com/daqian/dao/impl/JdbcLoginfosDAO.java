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

import com.daqian.dao.LoginfosDAO;
import com.daqian.entity.Loginfoss;

@Repository("LoginfosDAO")
public class JdbcLoginfosDAO implements LoginfosDAO {
	@Resource
	private DataSource ds;
	/**
	 * 日志添加
	 */
	public void add(Loginfoss log) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql = "INSERT INTO loginfos (tablename,type,content,adminname,date) VALUES (?,?,?,?,?)";
			ps =conn.prepareStatement(sql);
			ps.setString(1, log.getTablename());
			ps.setString(2, log.getType());
			ps.setString(3, log.getContent());
			ps.setString(4, log.getAdminname());
			ps.setString(5, log.getDate());
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
	 * 查询全部
	 * @see com.daqian.dao.LoginfosDAO#all()
	 */
	public List<Loginfoss> all() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM loginfos";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Loginfoss> list = new ArrayList<Loginfoss>();
			while(rs.next()){
				Loginfoss log = new Loginfoss();
				log.setId(rs.getInt("id"));
				log.setTablename(rs.getString("tablename"));
				log.setContent(rs.getString("content"));
				log.setAdminname(rs.getString("adminname"));
				log.setType(rs.getString("type"));
				log.setDate(rs.getString("date"));
				list.add(log);
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
	 * 通过时间查询
	 * @see com.daqian.dao.LoginfosDAO#findBydate(java.lang.String, java.lang.String)
	 */
	public List<Loginfoss> findBydate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM loginfos where date between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<Loginfoss> list = new ArrayList<Loginfoss>();
			while(rs.next()){
				Loginfoss log = new Loginfoss();
				log.setId(rs.getInt("id"));
				log.setTablename(rs.getString("tablename"));
				log.setContent(rs.getString("content"));
				log.setAdminname(rs.getString("adminname"));
				log.setType(rs.getString("type"));
				log.setDate(rs.getString("date"));
				list.add(log);
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
