package com.hyzm.admin.dao.email.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.email.EmailDao;


@Repository
public class EmailDaoImpl implements EmailDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getEmailList = "select t.* from t_mail_send t where t.mailaddress like ? and t.createtime >= ? and t.createtime <= ? and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getEmailList(String mailaddress,
			Date begindate, Date enddate, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEmailList, new Object[]{"%"+mailaddress+"%", begindate, enddate, "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取邮件列表异常："+e.getMessage());
		}
	}

	private final static String getEmailListNum = "select count(t.id) from t_mail_send t where t.mailaddress like ? and t.createtime >= ? and t.createtime <= ? and t.state like ?";
	public long getEmailListNum(String mailaddress, Date begindate,
			Date enddate, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getEmailListNum, new Object[]{"%"+mailaddress+"%", begindate, enddate, "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取短信数量异常："+e.getMessage());
		}
	}

	private final static String addEmailSend = "insert into t_mail_send(mailaddress,content,state,createtime,subject,files) values(?,?,?,now(),?,?)";
	public long addEmailSend(final String mailaddress,final String content,final String state,
			final String subject,final String files) throws SQLException {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addEmailSend,Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, mailaddress);
				ps.setString(2, content);
				ps.setString(3, state);		
				ps.setString(4, subject);
				ps.setString(5, files);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().longValue();
	}
	
	
	
}
