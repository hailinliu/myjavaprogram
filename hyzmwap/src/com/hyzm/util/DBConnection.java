package com.hyzm.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {

	private static String url = "jdbc:mysql//localhost:3306/bbsTest";
	private static String username = "root";
	private static String password = "root";
	private Connection con = null;

	private static DBConnection dbcon = null;

	static {
		try {
			// 注册驱动有如下方式：
			// 1.通过驱动管理器注册驱动，但会注册两次，并且会对类产生依赖。如果该类不存在那就报错了。
			// DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			// 2.与3类似
			// System.setProperty("jdbc.drivers","com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver");// 推荐使用方式
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public static DBConnection getInitDBConnection() {
		if (dbcon == null) {
			synchronized (DBConnection.class) {
				if (dbcon == null) {
					dbcon = new DBConnection();
				}
			}
		}
		return dbcon;
	}

	private DBConnection() {

	}

	public Connection getConnection() {
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public void closeConnection(ResultSet rs, Statement statement,
			Connection con) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
