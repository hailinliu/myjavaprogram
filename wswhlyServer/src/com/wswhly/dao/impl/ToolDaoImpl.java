package com.wswhly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.wswhly.bean.tool.GetJobsRespBean;
import com.wswhly.bean.user.LoginRespBean;
import com.wswhly.bean.user.LoginRespBean.User;
import com.wswhly.dao.ToolDao;
import com.wswhly.dao.impl.UserDaoImpl.UserMapper;

@Repository
public class ToolDaoImpl implements ToolDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String addSmsSend = "insert into t_sms_send(mobile,content,createtime,state,times,backtime,accountcount) values(?,?,now(),?,?,?,?)";
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
	public int getcountBYmobile(String mobile,int time,String content){
		String sql="select * from t_sms_send where mobile=? and  DATE_ADD(backtime,INTERVAL ? SECOND) >NOW() and to_days(backtime)=to_days(NOW()) and content like ? ";
		if(time!=180){
			sql+=" and state=0";
		}
		List<Map<String,Object>> list = (List<Map<String,Object>>)jdbcTemplate.queryForList(sql, new Object[]{mobile,time,"%"+content+"%"});
		return list.size();
	}
	
	private final String addVerifyCode = "insert into t_verifycode(mobile,smsid,createtime,code) values(?,?,now(),?)";
	public boolean addVerifyCode(String mobile, long smsid, String code) throws SQLException{
		int i = jdbcTemplate.update(addVerifyCode,new Object[]{mobile,smsid,code});
		if(i>0)return true;else return false;
	}
	
	private final String querySms = "select * from t_para_sms where type = ?";
	public Map<String,Object> querySms(String type) throws SQLException{
		List<Map<String,Object>> list = (List<Map<String,Object>>)jdbcTemplate.queryForList(querySms, new Object[]{type});
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String queryJobs = "select * from t_job where state = 1";
	public List<GetJobsRespBean.Job> queryJobs() throws SQLException{
		return jdbcTemplate.query(queryJobs, new JobMapper());
	}
	
	protected class JobMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			GetJobsRespBean.Job job = new GetJobsRespBean().new Job();
			job.setId(rs.getLong("id"));
			job.setName(rs.getString("name"));
			return job;
		}
	}
	
	private final String queryVersion = "select version,content,path from t_version order by createdate desc";
	public Map<String, Object> queryVersion() throws SQLException{
		List<Map<String, Object>> list = jdbcTemplate.queryForList(queryVersion);
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
}
