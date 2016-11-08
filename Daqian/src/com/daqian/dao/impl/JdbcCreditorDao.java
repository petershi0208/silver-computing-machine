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

import com.daqian.dao.CreditorDao;
import com.daqian.entity.Creditor;
import com.daqian.entity.purchase;
@Repository("CreditorDao")
public class JdbcCreditorDao implements CreditorDao {
	@Resource
	private DataSource ds;
	/*
	 * (non-Javadoc)
	 * @see com.daqian.dao.CreditorDao#add(com.daqian.entity.Creditor)
	 */
	public void add(Creditor creditor) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql = "INSERT INTO creditor(" +
					"uname,sex,marital,idcard,age,phone,telephone," +
					"money,localhouse,live,sociensure,commpf," +
					"unit_name,unit_site,unit_nature,unit_phone," +
					"position,education,wages," +
					"home_number,home_registry,home_registryid,address,wechat," +
					"rela1,rela1_name,rela1_phone," +
					"rela2,rela2_name,rela2_phone," +
					"rela3,rela3_name,rela3_phone," +
					"contact1_name,contact1_phone," +
					"contact2_name,contact2_phone,date) " +
					"VALUES (" +
					"?,?,?,?,?,?,?," +
					"?,?,?,?,?," +
					"?,?,?,?,?," +
					"?,?,?,?," +
					"?,?,?," +
					"?,?,?," +
					"?,?,?," +
					"?,?,?," +
					"?,?," +
					"?,?,?)";
			ps =conn.prepareStatement(sql);
			ps.setString(1, creditor.getUname());ps.setString(2, creditor.getSex());ps.setString(3, creditor.getMarital());
			ps.setString(4, creditor.getIdcard());ps.setString(5, creditor.getAge());ps.setString(6, creditor.getPhone());
			ps.setString(7, creditor.getTelephone());ps.setInt(8, creditor.getMoney());ps.setString(9, creditor.getLocalhouse());
			ps.setString(10, creditor.getLive());ps.setString(11, creditor.getSociensure());ps.setString(12, creditor.getCommpf());
			ps.setString(13, creditor.getUnit_name());ps.setString(14, creditor.getUnit_site());ps.setString(15, creditor.getUnit_nature());
			ps.setString(16, creditor.getUnit_phone());ps.setString(17, creditor.getPosition());ps.setString(18, creditor.getEducation());
			ps.setString(19, creditor.getWages());ps.setString(20, creditor.getHome_number());ps.setString(21, creditor.getHome_registry());
			ps.setString(22, creditor.getHome_registryid());ps.setString(23, creditor.getAddress());ps.setString(24, creditor.getWechat());
			ps.setString(25, creditor.getRela1());ps.setString(26, creditor.getRela1_name());ps.setString(27, creditor.getRela1_phone());
			ps.setString(28, creditor.getRela2());ps.setString(29, creditor.getRela2_name());ps.setString(30, creditor.getRela2_phone());
			ps.setString(31, creditor.getRela3());ps.setString(32, creditor.getRela3_name());ps.setString(33, creditor.getRela3_phone());
			ps.setString(34, creditor.getContact1_name());ps.setString(35, creditor.getContact1_phone());ps.setString(36, creditor.getContact2_name());
			ps.setString(37, creditor.getContact2_phone());ps.setString(38, creditor.getDate());
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
	public int update(Creditor creditor) {
		// TODO Auto-generated method stub
		int res = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
	
			String sql = "UPDATE creditor set " +
					"uname=?,sex=?,marital=?,idcard=?,age=?,phone=?,telephone=?," +
					"money=?,localhouse=?,live=?,sociensure=?,commpf=?," +
					"unit_name=?,unit_site=?,unit_nature=?,unit_phone=?," +
					"position=?,education=?,wages=?," +
					"home_number=?,home_registry=?,home_registryid=?,address=?,wechat=?," +
					"rela1=?,rela1_name=?,rela1_phone=?," +
					"rela2=?,rela2_name=?,rela2_phone=?," +
					"rela3=?,rela3_name=?,rela3_phone=?," +
					"contact1_name=?,contact1_phone=?," +
					"contact2_name=?,contact2_phone=? " +
					"where id=?";
			ps =conn.prepareStatement(sql);
			ps.setString(1, creditor.getUname());ps.setString(2, creditor.getSex());ps.setString(3, creditor.getMarital());
			ps.setString(4, creditor.getIdcard());ps.setString(5, creditor.getAge());ps.setString(6, creditor.getPhone());
			ps.setString(7, creditor.getTelephone());ps.setInt(8, creditor.getMoney());ps.setString(9, creditor.getLocalhouse());
			ps.setString(10, creditor.getLive());ps.setString(11, creditor.getSociensure());ps.setString(12, creditor.getCommpf());
			ps.setString(13, creditor.getUnit_name());ps.setString(14, creditor.getUnit_site());ps.setString(15, creditor.getUnit_nature());
			ps.setString(16, creditor.getUnit_phone());ps.setString(17, creditor.getPosition());ps.setString(18, creditor.getEducation());
			ps.setString(19, creditor.getWages());ps.setString(20, creditor.getHome_number());ps.setString(21, creditor.getHome_registry());
			ps.setString(22, creditor.getHome_registryid());ps.setString(23, creditor.getAddress());ps.setString(24, creditor.getWechat());
			ps.setString(25, creditor.getRela1());ps.setString(26, creditor.getRela1_name());ps.setString(27, creditor.getRela1_phone());
			ps.setString(28, creditor.getRela2());ps.setString(29, creditor.getRela2_name());ps.setString(30, creditor.getRela2_phone());
			ps.setString(31, creditor.getRela3());ps.setString(32, creditor.getRela3_name());ps.setString(33, creditor.getRela3_phone());
			ps.setString(34, creditor.getContact1_name());ps.setString(35, creditor.getContact1_phone());ps.setString(36, creditor.getContact2_name());
			ps.setString(37, creditor.getContact2_phone());ps.setInt(38, creditor.getId());
			res = ps.executeUpdate();
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
		return res;
	}
	
	public Creditor findByname(String name) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from creditor where uname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			if(rs.next()){
				Creditor c = new Creditor();
				c.setId(rs.getInt("id"));
				c.setUname(rs.getString("uname"));
				c.setIdcard(rs.getString("idcard"));
				c.setPhone(rs.getString("phone"));
				c.setAddress(rs.getString("address"));
				c.setDate(rs.getString("date"));
				return c;
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

	public List<Creditor> all() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from creditor order by id desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Creditor> list = new ArrayList<Creditor>();
			while(rs.next()){
				Creditor c = new Creditor();
				c.setId(rs.getInt("id"));
				c.setUname(rs.getString("uname"));
				c.setIdcard(rs.getString("idcard"));
				c.setPhone(rs.getString("phone"));
				c.setAddress(rs.getString("address"));
				c.setDate(rs.getString("date"));
				list.add(c);
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

	public Creditor findById(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from creditor where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				Creditor c = new Creditor();
				c.setId(rs.getInt("id"));
				c.setUname(rs.getString("uname"));
				c.setSex(rs.getString("sex"));
				c.setMarital(rs.getString("marital"));
				c.setIdcard(rs.getString("idcard"));
				c.setAge(rs.getString("age"));
				c.setPhone(rs.getString("phone"));
				c.setTelephone(rs.getString("telephone"));
				c.setMoney(rs.getInt("money"));
				c.setLocalhouse(rs.getString("localhouse"));
				c.setLive(rs.getString("live"));
				c.setSociensure(rs.getString("sociensure"));
				c.setCommpf(rs.getString("commpf"));
				c.setUnit_name(rs.getString("unit_name"));
				c.setUnit_site(rs.getString("unit_site"));
				c.setUnit_nature(rs.getString("unit_nature"));
				c.setUnit_phone(rs.getString("unit_phone"));
				c.setPosition(rs.getString("position"));
				c.setEducation(rs.getString("education"));
				c.setWages(rs.getString("wages"));
				c.setHome_number(rs.getString("home_number"));
				c.setHome_registry(rs.getString("home_registry"));
				c.setHome_registryid(rs.getString("home_registryid"));
				c.setAddress(rs.getString("address"));
				c.setWechat(rs.getString("wechat"));
				c.setRela1(rs.getString("rela1"));
				c.setRela1_name(rs.getString("rela1_name"));
				c.setRela1_phone(rs.getString("rela1_phone"));
				c.setRela2(rs.getString("rela2"));
				c.setRela2_name(rs.getString("rela2_name"));
				c.setRela2_phone(rs.getString("rela2_phone"));
				c.setRela3(rs.getString("rela3"));
				c.setRela3_name(rs.getString("rela3_name"));
				c.setRela3_phone(rs.getString("rela3_phone"));
				c.setContact1_name(rs.getString("contact1_name"));
				c.setContact1_phone(rs.getString("contact1_phone"));
				c.setContact2_name(rs.getString("contact2_name"));
				c.setContact2_phone(rs.getString("contact2_phone"));
				c.setDate(rs.getString("date"));
				return c;
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

	public int delete(int id) {
		// TODO Auto-generated method stub
		int res =-1;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql = "DELETE FROM CREDITOR WHERE ID = ?";
			ps =conn.prepareStatement(sql);
			ps.setInt(1, id);
			res = ps.executeUpdate();
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
		return res;
	}

}
