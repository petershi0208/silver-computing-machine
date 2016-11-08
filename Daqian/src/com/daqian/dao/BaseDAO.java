package com.daqian.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDAO {
	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/daqian?useUnicode=true&amp;characterEncoding=utf-8";
	private static final String DBUSER = "root";
	private static final String DBPWD = "11111111";
	protected PreparedStatement ps;
	protected Connection conn;
	protected ResultSet rs;

	/**
	 * 静态块加载驱动
	 */
	static {
		try {
			Class.forName(DBDRIVER);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}

	/**
	 * 打开数据库连接
	 */
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 执行查询的方法
	 * 
	 * @param sql
	 *            查询的sql语句
	 * @param params
	 *            所需要的参数
	 */
	public void executeQuery(String sql, Object[] params) {
		getConnection();
		try {
			ps = conn.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 执行增删改的方法
	 * 
	 * @param sql
	 *            操作的sql语句
	 * @param params
	 *            所需要的参数
	 * @return 返回受影响的行数
	 */
	public int executeUpdate(String sql, Object[] params) {
		getConnection();
		int res = -1;
		try {
			ps = conn.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
			}
			res = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.CloseAll();
		}
		return res;
	}

	/**
	 * 关闭的方法
	 */
	public void CloseAll() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}
}
