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

import com.daqian.dao.NewsDAO;
import com.daqian.entity.News;

@Repository("NewsDAO")
public class INewsDAO implements NewsDAO {
	@Resource
	private DataSource ds;
	
	
	/*
	 * 通过状态分页查询
	 * @see com.daqian.dao.NewsDAO#findByState(java.lang.String)
	 */
	public List<News> findByState1(String state,int page) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM news WHERE state=? order by id desc limit ?,15";
			ps=conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setInt(2, page);
			rs = ps.executeQuery();
			List<News> list = new ArrayList<News>();
			while(rs.next()){
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setImage(rs.getString("image"));
				news.setDate(rs.getString("date"));
				news.setState(rs.getString("state"));
				list.add(news);
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
	 * 添加
	 * @see com.daqian.dao.NewsDAO#add(com.daqian.entity.News)
	 */
	public void add(News n) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="INSERT INTO NEWS (title,content,date,image,state) VALUE(?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,n.getTitle());
			ps.setString(2,n.getContent());
			ps.setString(3,n.getDate());
			ps.setString(4,n.getImage());
			ps.setString(5,n.getState());
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
	 * @see com.daqian.dao.NewsDAO#all()
	 */
	public List<News> all() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM news order by id desc";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			List<News> list = new ArrayList<News>();
			while(rs.next()){
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setImage(rs.getString("image"));
				news.setDate(rs.getString("date"));
				news.setState(rs.getString("state"));
				list.add(news);
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
	 * @see com.daqian.dao.NewsDAO#all()
	 */
	public List<News> findByDate(String date1, String date2) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM news WHERE date between ? and ? order by id desc";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date1);
			ps.setString(2, date2);
			rs = ps.executeQuery();
			List<News> list = new ArrayList<News>();
			while(rs.next()){
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setImage(rs.getString("image"));
				news.setDate(rs.getString("date"));
				news.setState(rs.getString("state"));
				list.add(news);
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
	 * 通过状态查询
	 * @see com.daqian.dao.NewsDAO#findByState(java.lang.String)
	 */
	public List<News> findByState(String state) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM news WHERE state=? order by id desc";
			ps=conn.prepareStatement(sql);
			ps.setString(1, state);
			rs = ps.executeQuery();
			List<News> list = new ArrayList<News>();
			while(rs.next()){
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setImage(rs.getString("image"));
				news.setDate(rs.getString("date"));
				news.setState(rs.getString("state"));
				list.add(news);
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
	 * 通过id查询
	 * @see com.daqian.dao.NewsDAO#findById(int)
	 */
	public News findById(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM news WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			News news = new News();
			if(rs.next()){	
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setImage(rs.getString("image"));
				news.setDate(rs.getString("date"));
				news.setState(rs.getString("state"));	
			}	
			return news;
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
	 * 通过id修改
	 * @see com.daqian.dao.NewsDAO#updateById(com.daqian.entity.News)
	 */
	public void updateById(News n) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="UPDATE news SET title=?,content=?,image=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,n.getTitle());
			ps.setString(2,n.getContent());
			ps.setString(3,n.getImage());
			ps.setInt(4,n.getId());
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
	  * 审核
	  * @see com.daqian.dao.NewsDAO#updateState(java.lang.String, int)
	  */
	public void updateState(String state,int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ds.getConnection();
			String sql ="UPDATE news SET state=? where id=?";
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
	 * 查询总新闻数
	 * @see com.daqian.dao.NewsDAO#findCount()
	 */
	public News findCount() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT COUNT(*) count FROM news";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			News news = new News();
			if(rs.next()){	
				news.setCount(rs.getInt("count"));	
			}	
			return news;
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
	 * 查询日新闻数
	 * @see com.daqian.dao.NewsDAO#findCountByDay(java.lang.String)
	 */
	public News findCountByDay(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT COUNT(*) count FROM news WHERE date=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			News news = new News();
			if(rs.next()){	
				news.setCount(rs.getInt("count"));
			}	
			return news;
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
	 * 查询月新闻数
	 * @see com.daqian.dao.NewsDAO#findCountByMonth(java.lang.String)
	 */
	public News findCountByMonth(String date) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql= "SELECT COUNT(*) count FROM news WHERE date_format(date,'%Y-%m')=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			News news = new News();
			if(rs.next()){	
				news.setCount(rs.getInt("count"));
			}	
			return news;
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
