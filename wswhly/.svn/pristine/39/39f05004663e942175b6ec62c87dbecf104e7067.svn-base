package com.hyzm.admin.dao.message.impl;

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

import com.hyzm.admin.dao.message.MessageDao;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getMessageList = "select t.* from t_sms_send t where t.mobile like ? and t.createtime >= ? and t.createtime <= ? and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getMessageList(String mobile,
			Date begindate, Date enddate, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getMessageList, new Object[]{"%"+mobile+"%", begindate, enddate, "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取短信列表异常："+e.getMessage());
		}
	}
	
	private final static String getMessageListNum = "select count(t.id) from t_sms_send t where t.mobile like ? and t.createtime >= ? and t.createtime <= ? and t.state like ?";

	public long getMessageListNum(String mobile, Date begindate, Date enddate,
			String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getMessageListNum, new Object[]{"%"+mobile+"%", begindate, enddate, "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取短信数量异常："+e.getMessage());
		}
	}
	
	private final static String addSmsSend = "insert into t_sms_send(mobile,content,createtime,state,times,backtime,accountcount) values(?,?,now(),?,?,?,?)";
	public long addSmsSend(final String mobile, final String content, final String state, final int times, final String backtime, final String accountcount) throws SQLException{
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addSmsSend,Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, mobile);
				ps.setString(2, content);
				ps.setString(3, state);
				ps.setInt(4, times);
				ps.setString(5, backtime);
				ps.setString(6, accountcount);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().longValue();
	}
	
	private final static String getVipMessageList = "select t.* from t_para_sms t order by t.id";

	public List<Map<String, Object>> getVipMessageList() throws Exception {
		try {
			return jdbcTemplate.queryForList(getVipMessageList);
		} catch (Exception e) {
			throw new RuntimeException("获取收费会员的通知短信异常："+e.getMessage());
		}
	}
	
	private final static String editVipMessage = "update t_para_sms set content = ? where id = ?";
	
	public boolean editVipMessage(long id, String content) throws Exception {
		try {
			int i = jdbcTemplate.update(editVipMessage, new Object[]{content, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改收费会员的通知短信异常："+e.getMessage());
		}
	}

	public List<Map<String, Object>> gethfMessageList(Map<String, String> map) {
		 try {
			 String sql=" select t.* from t_sms_huif t where 1=1";
				 if(map!=null){
					 if(map.get("ishuif")!=""&&!map.get("ishuif").equals("")){
						 sql+=" and t.ishuif="+map.get("ishuif");
					 }
					 if(map.get("mobile")!=""&&!map.get("mobile").equals("")){
						 sql+=" and t.mobile like '%"+map.get("mobile")+"%'";	
					 }								
				 }
				 sql+=" order by t.id desc limit "+(Integer.valueOf(map.get("currentPage"))-1)*Integer.valueOf(map.get("pageSize"))+", "+map.get("pageSize");
				return jdbcTemplate.queryForList(sql);
			} catch (Exception e) {
				throw new RuntimeException("获取回复列表异常："+e.getMessage());
			}
	}

	public long gethfMessageListNum(Map<String, String> map) {
		 try {
			 String sql=" select count(t.id)  from t_sms_huif t where 1=1";
				 if(map!=null){
					 if(map.get("ishuif")!=""&&!map.get("ishuif").equals("")){
						 sql+=" and t.ishuif="+map.get("ishuif");
					 }
					 if(map.get("mobile")!=""&&!map.get("mobile").equals("")){
						 sql+=" and t.mobile like '%"+map.get("mobile")+"%'";	
					 }					
				 }
				return jdbcTemplate.queryForLong(sql);
			} catch (Exception e) {
				throw new RuntimeException("获取回复列表异常："+e.getMessage());
			}
	}
	
	private final static String addsql="insert into t_sms_huif(mobile,content,createtime,ishuif) value(?,?,?,?)";
	public boolean addhfMessage(Map<String, String> map) {
		int i = jdbcTemplate.update(addsql,
				new Object[]{
				map.get("mobile"), 
				map.get("content"),
				map.get("createtime"),
				map.get("ishuif")
				});
		if(i>0){
			return true;
		}
		return false;
	}

	private final static String updsql="update t_sms_huif set ishuif = ? where id= ?";
	public boolean editIshuif(Map<String, String> map) {
		int i = jdbcTemplate.update(updsql,
				new Object[]{		
				map.get("ishuif"),
				map.get("id")
				});
		if(i>0){
			return true;
		}
		return false;
	}
	
}
