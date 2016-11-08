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

import com.daqian.dao.ProductinfosDAO;
import com.daqian.entity.Productinfos;

@Repository("IProductinfosDAO")
public class JdbcProductinfosDAO implements ProductinfosDAO {
	@Resource
	private DataSource ds;
	
	/*
	 * 添加数据
	 * @see com.daqian.dao.ProductinfosDAO#add(com.daqian.entity.Productinfos)
	 */
	public int add(Productinfos p) {
		int res = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "INSERT INTO productinfos(productname,cycle,maxmoney,minmoney,lastmoney,person,pdate) value(?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, p.getProductname());
			ps.setDouble(2, p.getCycle());
			ps.setInt(3, p.getMaxmoney());
			ps.setInt(4, p.getMinmoney());
			ps.setInt(5, p.getLastmoney());
			ps.setString(6, p.getPerson());
			ps.setString(7, p.getPdate());
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
	/*
	 * 查询全部
	 * @see com.daqian.dao.ProductinfosDAO#all()
	 */
	public List<Productinfos> all() {
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM productinfos p order by p.pid desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Productinfos> list = new ArrayList<Productinfos>();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setPid(rs.getInt("p.pid"));
				p.setProductname(rs.getString("productname"));
				p.setCycle(rs.getInt("cycle"));
				p.setMinmoney(rs.getInt("minmoney"));
				p.setMaxmoney(rs.getInt("maxmoney"));
				p.setLastmoney(rs.getInt("lastmoney"));
				p.setPerson(rs.getString("person"));
				p.setPdate(rs.getString("pdate"));
				list.add(p);
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
	 * 根据id查询单个数据
	 * @see com.daqian.dao.ProductinfosDAO#findById(int)
	 */
	public Productinfos findById(int id) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM productinfos p where pid=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			Productinfos p = new Productinfos();
			if(rs.next()){
				p.setPid(rs.getInt("p.pid"));
				p.setProductname(rs.getString("productname"));
				p.setCycle(rs.getInt("cycle"));
				p.setMinmoney(rs.getInt("minmoney"));
				p.setMaxmoney(rs.getInt("maxmoney"));
				p.setLastmoney(rs.getInt("lastmoney"));
				p.setPerson(rs.getString("person"));
				p.setPdate(rs.getString("pdate"));
			}
			return p;
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
	 * 根据产品id查询最大回报率集合
	 * @see com.daqian.dao.ProductinfosDAO#findBymaxsun()
	 */
	public List<Productinfos> findBymaxsun() {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select yearreturn,duereturn from subproduct where duereturn in(SELECT max(duereturn) FROM productinfos p INNER JOIN subproduct s ON p.pid=s.pid group by p.pid);";
			ps = conn.prepareStatement(sql);
			List<Productinfos> list = new ArrayList<Productinfos>();
			rs = ps.executeQuery();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
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
	 * 根据产品id查询最小回报率集合
	 * @see com.daqian.dao.ProductinfosDAO#findBymaxsun()
	 */
	public List<Productinfos> findByminsun() {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select yearreturn,duereturn from subproduct where duereturn in(SELECT min(duereturn) FROM productinfos p INNER JOIN subproduct s ON p.pid=s.pid group by p.pid);";
			ps = conn.prepareStatement(sql);
			List<Productinfos> list = new ArrayList<Productinfos>();
			rs = ps.executeQuery();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
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
	 * 根据产品id查询单个最大回报率
	 * @see com.daqian.dao.ProductinfosDAO#findBymaxsun()
	 */
	public Productinfos findmaxByid(int id) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select yearreturn,duereturn from subproduct where duereturn=(SELECT max(duereturn) FROM productinfos p INNER JOIN subproduct s ON p.pid=s.pid where s.pid=?);";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			Productinfos p = new Productinfos();
			if(rs.next()){
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
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
	 * 根据产品id查询单个最小回报率
	 * @see com.daqian.dao.ProductinfosDAO#findBymaxsun()
	 */
	public Productinfos findminByid(int id) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select yearreturn,duereturn from subproduct where duereturn=(SELECT min(duereturn) FROM productinfos p INNER JOIN subproduct s ON p.pid=s.pid where s.pid=?);";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			Productinfos p = new Productinfos();
			if(rs.next()){
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
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
	 * 根据购买金额，产品id 查询回报率
	 * @see com.daqian.dao.ProductinfosDAO#findmoneyByid(int, int, int)
	 */
	public Productinfos findmoneyByid(int pid,int monthoryear,int amount) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=ds.getConnection();
			String sql = "select * from subproduct s inner join productinfos p on p.pid=s.pid where s.pid=? and monthoryear=? and minamount<=? and maxamount>?;";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, monthoryear);
			ps.setInt(3, amount);
			ps.setInt(4, amount);
			rs = ps.executeQuery();
			Productinfos p = new Productinfos();
			if(rs.next()){
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
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
	 * 根据产品id修改剩余金额
	 * @see com.daqian.dao.ProductinfosDAO#updateLastmoneyById(int, int)
	 */
	public void updateLastmoneyById(int lastmoney,int pid) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "UPDATE productinfos SET lastmoney=? WHERE pid=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, lastmoney);
			ps.setInt(2, pid);
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
	 * 通过时间查询
	 * @see com.daqian.dao.ProductinfosDAO#findBydate(java.lang.String, java.lang.String)
	 */
	public List<Productinfos> findBydate(String date1, String date2) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM productinfos p where pdate between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<Productinfos> list = new ArrayList<Productinfos>();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setPid(rs.getInt("p.pid"));
				p.setProductname(rs.getString("productname"));
				p.setCycle(rs.getInt("cycle"));
				p.setMinmoney(rs.getInt("minmoney"));
				p.setMaxmoney(rs.getInt("maxmoney"));
				p.setLastmoney(rs.getInt("lastmoney"));
				p.setPerson(rs.getString("person"));
				p.setPdate(rs.getString("pdate"));
				list.add(p);
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
	 * 根据id修改
	 * @see com.daqian.dao.ProductinfosDAO#updateLastmoneyById(int, int)
	 */
	public void updateById(Productinfos p) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "UPDATE productinfos SET productname=?,cycle=?,maxmoney=?,minmoney=?,lastmoney=? WHERE pid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, p.getProductname());
			ps.setDouble(2, p.getCycle());
			ps.setInt(3, p.getMaxmoney());
			ps.setInt(4, p.getMinmoney());
			ps.setInt(5, p.getLastmoney());
			ps.setInt(6, p.getPid());
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
	 * 查询全部
	 * @see com.daqian.dao.ProductinfosDAO#all()
	 */
	public List<Productinfos> paging(int currentpage,int pagesize) {
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM productinfos p inner join subproduct s on s.pid=p.pid order by p.pid desc limit ?,?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, currentpage);
			ps.setInt(2, pagesize);
			rs = ps.executeQuery();
			List<Productinfos> list = new ArrayList<Productinfos>();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setPid(rs.getInt("p.pid"));
				p.setProductname(rs.getString("productname"));
				p.setCycle(rs.getInt("cycle"));
				p.setMinmoney(rs.getInt("minmoney"));
				p.setMaxmoney(rs.getInt("maxmoney"));
				p.setLastmoney(rs.getInt("lastmoney"));
				p.setPerson(rs.getString("person"));
				p.setPdate(rs.getString("pdate"));
				p.setSid(rs.getInt("s.sid"));
				p.setMaxamount(rs.getInt("maxamount"));
				p.setMinamount(rs.getInt("minamount"));
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setSperson(rs.getString("sperson"));
				p.setSdate(rs.getString("sdate"));
				list.add(p);
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
	 * 表连接查询
	 * @see com.daqian.dao.ProductinfosDAO#findById(int)
	 */
	public List<Productinfos> pall() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM productinfos p inner join subproduct s on s.pid=p.pid order by s.sid desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Productinfos> list = new ArrayList<Productinfos>();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setPid(rs.getInt("p.pid"));
				p.setProductname(rs.getString("productname"));
				p.setCycle(rs.getInt("cycle"));
				p.setMinmoney(rs.getInt("minmoney"));
				p.setMaxmoney(rs.getInt("maxmoney"));
				p.setLastmoney(rs.getInt("lastmoney"));
				p.setPerson(rs.getString("person"));
				p.setPdate(rs.getString("pdate"));
				p.setSid(rs.getInt("s.sid"));
				p.setMaxamount(rs.getInt("maxamount"));
				p.setMinamount(rs.getInt("minamount"));
				p.setYearreturn(rs.getDouble("yearreturn"));
				p.setDuereturn(rs.getDouble("duereturn"));
				p.setMonthoryear(rs.getInt("monthoryear"));
				p.setSperson(rs.getString("sperson"));
				p.setSdate(rs.getString("sdate"));
				list.add(p);
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
	 * 查询产品数量
	 * @see com.daqian.dao.ProductinfosDAO#findCount()
	 */
	public Productinfos findCount() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT COUNT(*) count FROM productinfos p";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				Productinfos p = new Productinfos();
				p.setCount(rs.getInt("count"));
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
	/*
	 * 查询日产品数量
	 * @see com.daqian.dao.ProductinfosDAO#findCountByDay(java.lang.String)
	 */
	public Productinfos findCountByDay(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT COUNT(*) count FROM productinfos p where pdate=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			if(rs.next()){
				Productinfos p = new Productinfos();
				p.setCount(rs.getInt("count"));
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
	/*
	 * 查询月产品数量
	 * @see com.daqian.dao.ProductinfosDAO#findCountByMonth(java.lang.String)
	 */
	public Productinfos findCountByMonth(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT COUNT(*) count FROM productinfos p where date_format(pdate,'%Y-%m')=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			if(rs.next()){
				Productinfos p = new Productinfos();
				p.setCount(rs.getInt("count"));
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
	public Productinfos findByPname(String productname){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT pid FROM productinfos p where productname = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, productname);
			rs = ps.executeQuery();
			if(rs.next()){
				Productinfos p = new Productinfos();
				p.setPid(rs.getInt("pid"));
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
	public void delete(String productname) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql= "delete from productinfos p where productname = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, productname);
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
	public List<Productinfos> findBySperson(String sperson) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT p.productname FROM productinfos p inner join subproduct s on s.pid=p.pid where s.sperson=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sperson);
			rs = ps.executeQuery();
			List<Productinfos> list = new ArrayList<Productinfos>();
			while(rs.next()){
				Productinfos p = new Productinfos();
				p.setProductname(rs.getString("productname"));
				list.add(p);
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
