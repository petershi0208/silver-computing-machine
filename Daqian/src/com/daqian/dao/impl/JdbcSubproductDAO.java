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

import com.daqian.dao.SubproductDAO;
import com.daqian.entity.Subproduct;

@Repository("IInvestmentsDAO")
public class JdbcSubproductDAO implements SubproductDAO {
	@Resource
	private DataSource ds;
	
	public int add(Subproduct i) {
		int res=-1;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "INSERT INTO subproduct(pid,minamount,maxamount,yearreturn,duereturn,monthoryear,sperson,sdate) value(?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, i.getPid());
			ps.setInt(2, i.getMinamount());
			ps.setInt(3, i.getMaxamount());
			ps.setDouble(4, i.getYearreturn());
			ps.setDouble(5, i.getDuereturn());
			ps.setInt(6, i.getMonthoryear());
			ps.setString(7, i.getSperson());
			ps.setString(8, i.getSdate());
			res = ps.executeUpdate();
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
		return res;
		
	}

	public List<Subproduct> all() {
		// TODO Auto-generated method stub
		return null;
	}

	public Subproduct findById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "SELECT * FROM subproduct WHERE sid=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			Subproduct s = new Subproduct();
			rs = ps.executeQuery();
			if(rs.next()){
				s.setSid(rs.getInt("sid"));
				s.setPid(rs.getInt("pid"));
				s.setMaxamount(rs.getInt("maxamount"));
				s.setMinamount(rs.getInt("minamount"));
				s.setYearreturn(rs.getDouble("yearreturn"));
				s.setDuereturn(rs.getDouble("duereturn"));
				s.setMonthoryear(rs.getInt("monthoryear"));
				s.setSperson(rs.getString("sperson"));
				s.setSdate(rs.getString("sdate"));
			}
			return s;
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
	 * 根据id修改
	 * @see com.daqian.dao.ProductinfosDAO#updateLastmoneyById(int, int)
	 */
	public void updateById(Subproduct i) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "UPDATE subproduct SET pid=?,minamount=?,maxamount=?,yearreturn=?,duereturn=?,monthoryear=?,sperson=? WHERE sid=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, i.getPid());
			ps.setInt(2, i.getMinamount());
			ps.setInt(3, i.getMaxamount());
			ps.setDouble(4, i.getYearreturn());
			ps.setDouble(5, i.getDuereturn());
			ps.setInt(6, i.getMonthoryear());
			ps.setString(7, i.getSperson());
			ps.setInt(8, i.getSid());
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

	public List<Subproduct> findBydate(String date1, String date2) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "SELECT * FROM subproduct WHERE date between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<Subproduct> list = new ArrayList<Subproduct>();
			while(rs.next()){
				Subproduct s = new Subproduct();
				s.setSid(rs.getInt("sid"));
				s.setPid(rs.getInt("pid"));
				s.setMaxamount(rs.getInt("maxamount"));
				s.setMinamount(rs.getInt("minamount"));
				s.setYearreturn(rs.getDouble("yearreturn"));
				s.setDuereturn(rs.getDouble("duereturn"));
				s.setMonthoryear(rs.getInt("monthoryear"));
				s.setSperson(rs.getString("sperson"));
				s.setSdate(rs.getString("sdate"));
				list.add(s);
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

	public Subproduct findByPId(int Pid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "SELECT * FROM subproduct WHERE pid=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Pid);
			Subproduct s = new Subproduct();
			rs = ps.executeQuery();
			if(rs.next()){
				s.setSid(rs.getInt("sid"));
				s.setPid(rs.getInt("pid"));
				s.setMaxamount(rs.getInt("maxamount"));
				s.setMinamount(rs.getInt("minamount"));
				s.setYearreturn(rs.getDouble("yearreturn"));
				s.setDuereturn(rs.getDouble("duereturn"));
				s.setMonthoryear(rs.getInt("monthoryear"));
				s.setSperson(rs.getString("sperson"));
				s.setSdate(rs.getString("sdate"));
			}
			return s;
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
	
}
