package com.daqian.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.daqian.dao.BaseDAO;
import com.daqian.dao.DAO;
import com.daqian.entity.Productinfos;
import com.daqian.entity.UserAssets;
import com.daqian.entity.purchase;


public class JdbcDAO extends BaseDAO implements DAO {
	/*
	 * 产品表
	 * 通过产品名查询产品周期
	 */
	public Productinfos findByPname(String pname) {
		// TODO Auto-generated method stub
		String sql="select * from productinfos where productname=?";
		super.executeQuery(sql, new Object[]{pname});
		Productinfos p = new Productinfos();
		if (rs != null) {
			try {
				if(rs.next()){
					p.setProductname(rs.getString("productname"));
					p.setCycle(rs.getInt("cycle"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.CloseAll();
			}
		}
		return p;
	}
	/*
	 * 购买表
	 * 通过状态查询购买信息
	 */
	public List<purchase> findByState(String state) {
		// TODO Auto-generated method stub
		String sql="select * from purchase where state=?";
		super.executeQuery(sql, new Object[]{state});
		List<purchase> list = new ArrayList<purchase>();
		if (rs != null) {
			try {
				while(rs.next()){
					purchase p = new purchase();
					p.setId(rs.getInt("id"));
					p.setUsername(rs.getString("username"));
					p.setMoney(rs.getDouble("money"));
					p.setDate(rs.getString("date"));
					p.setState(rs.getString("state"));
					p.setProductname(rs.getString("productname"));
					p.setEarned(rs.getDouble("earned"));
					p.setExpectedannual(rs.getInt("expectedannual"));
					p.setAmount(rs.getInt("amount"));
					p.setMonthoryear(rs.getInt("monthoryear"));
					p.setStartdate(rs.getString("startdate"));
					p.setLastbackdate(rs.getString("lastbackdate"));
					list.add(p);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.CloseAll();
			}
		}
		return list;
	}
	/*
	 * 购买表
	 * 查询全部购买信息
	 */
	public List<purchase> findBya() {
		// TODO Auto-generated method stub
		String sql="select * from purchase";
		super.executeQuery(sql, null);
		List<purchase> list = new ArrayList<purchase>();
		if (rs != null) {
			try {
				while(rs.next()){
					purchase p = new purchase();
					p.setId(rs.getInt("id"));
					p.setUsername(rs.getString("username"));
					p.setMoney(rs.getDouble("money"));
					p.setDate(rs.getString("date"));
					p.setState(rs.getString("state"));
					p.setProductname(rs.getString("productname"));
					p.setEarned(rs.getDouble("earned"));
					p.setExpectedannual(rs.getInt("expectedannual"));
					p.setAmount(rs.getInt("amount"));
					p.setMonthoryear(rs.getInt("monthoryear"));
					p.setStartdate(rs.getString("startdate"));
					p.setLastbackdate(rs.getString("lastbackdate"));
					list.add(p);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.CloseAll();
			}
		}
		return list;
	}
	/*
	 * 用户资产表
	 * 通过用户名查询用户资产信息
	 */
	public UserAssets findByUsername(String username) {
		// TODO Auto-generated method stub
		String sql="select * from userassets where username=?";
		super.executeQuery(sql, new Object[]{username});
		UserAssets u = new UserAssets();
		if(rs!=null){
			try {
				if(rs.next()){
					u.setRolemoney(rs.getDouble("rolemoney"));
					u.setAvailablemoney(rs.getDouble("availablemoney"));
					u.setResidualmoney(rs.getDouble("residualmoney"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				this.CloseAll();
			}
		}
		return u;
	}
	/*
	 * 用户资产表
	 * 判断用户名修改可用金额，余额
	 */
	public void updateByusername(UserAssets u) {
		// TODO Auto-generated method stub
		String sql="update userassets set availablemoney=?,residualmoney=? where username=?";
		super.executeUpdate(sql, new Object[]{u.getAvailablemoney(),u.getResidualmoney(),u.getUsername()});
	}
	/*
	 * 购买表
	 * 判断日期，产品名修改购买状态为成功
	 */
	public void updatePurchase(String date,String pname) {
		// TODO Auto-generated method stub
		String sql="update purchase set state='完成' where startdate=? and productname=?";
		super.executeUpdate(sql, new Object[]{date,pname});	
	}
	/*
	 * 用户资产表
	 * 判断周期修改产品金额，余额，可用金额
	 */
	public void updateByCycle(UserAssets u) {
		// TODO Auto-generated method stub
		String sql="update userassets set rolemoney=?,availablemoney=?,residualmoney=?";
		super.executeUpdate(sql, new Object[]{u.getRolemoney(),u.getAvailablemoney(),u.getResidualmoney()});
	}
	/*
	 * 购买表
	 * 判断id修改上一次返还资金时间
	 */
	public void updateLastbackdateById(String lastbackdate,int id) {
		// TODO Auto-generated method stub
		String sql="update purchase set lastbackdate=? where id=?";
		super.executeUpdate(sql, new Object[]{lastbackdate,id});
	}
}
