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
import com.wswhly.bean.user.LoginRespBean;
import com.wswhly.dao.UserDao;
import com.wswhly.util.DateUtil;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryUserByName = "select t.*,t1.name as jobname from t_user t left join t_job t1 on t.job=t1.id where t.username = ? and t.ismanager = 0";
	public LoginRespBean.User queryUserByName(String username) throws SQLException{
		List<LoginRespBean.User> list = jdbcTemplate.query(queryUserByName, new Object[]{username}, new UserMapper());
		if(list.size() > 0)
			return list.get(0);
		return null;
	}
	
	protected class UserMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			LoginRespBean.User user = new LoginRespBean().new User();
			user.setId(rs.getLong("id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setSex(rs.getInt("sex"));
			user.setMobile(rs.getString("mobile"));
			user.setEmail(rs.getString("email"));
			user.setIdcard(rs.getString("idcard"));
			user.setJob(rs.getString("job"));
			user.setRealname(rs.getString("realname"));
			user.setPoint(rs.getInt("point"));
			user.setMoney(rs.getDouble("money"));
			user.setJobname(rs.getString("jobname"));
			user.setAddress(rs.getString("address"));
			user.setState(rs.getString("state"));
			user.setOpenId(rs.getString("openId"));
			user.setIdcardimg(rs.getString("idcardimg"));
			user.setWeixin(rs.getString("weixin"));
			user.setBaibaoshopstate(rs.getString("baibaoshopstate"));
			String createdate = rs.getString("createdate");
			if(createdate != null && createdate.length() > 10)
				user.setCreatedate(createdate.substring(0, 10));
			
			user.setLevel(rs.getString("level"));
			String leveltime = rs.getString("leveltime");
			if(leveltime != null && leveltime.length() > 10)
				user.setLeveltime(leveltime.substring(0, 10));
			return user;
		}
	}
	
	private final String addUser = "insert into t_user(username, password, mobile, model, createdate,openId) VALUES(?,?,?,2,now(),?)";
	public int addUser(final String username, final String password, final String mobile,final String openId) throws SQLException{
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addUser,Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, username);
				ps.setString(2, password);
				ps.setString(3, mobile);
				ps.setString(4, openId);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
	
	private final String verifyUserName = "select count(*) from t_user where username = ?";
	public boolean verifyUserName(String username) throws SQLException{
		int i = jdbcTemplate.queryForInt(verifyUserName,new Object[]{username});
		if(i>0)return true;else return false;
	}

	private final String verifyMobile = "select count(*) from t_user where mobile = ?";
	public boolean verifyMobile(String mobile) throws SQLException{
		int i = jdbcTemplate.queryForInt(verifyMobile,new Object[]{mobile});
		if(i>0)return true;else return false;
	}
	
	private final String modifyEmail = "update t_user set email = ? where id = ?";
	public boolean modifyEmail(long id,String email) throws SQLException{
		int i = jdbcTemplate.update(modifyEmail,new Object[]{email,id});
		if(i>0)return true;else return false;
	}
	
	private final String modifyMobile = "update t_user set mobile = ? where id = ?";
	public boolean modifyMobile(long id,String mobile) throws SQLException{
		int i = jdbcTemplate.update(modifyMobile,new Object[]{mobile,id});
		if(i>0)return true;else return false;
	}
	
	private final String modifyRealname = "update t_user set realname = ? where id = ?";
	public boolean modifyRealname(long id,String realname) throws SQLException{
		int i = jdbcTemplate.update(modifyRealname,new Object[]{realname,id});
		if(i>0)return true;else return false;
	}
	
	private final String modifyIdcard = "update t_user set idcard = ? where id = ?";
	public boolean modifyIdcard(long id,String idcard) throws SQLException{
		int i = jdbcTemplate.update(modifyIdcard,new Object[]{idcard,id});
		if(i>0)return true;else return false;
	}
	private final String modifyIdcardimg = "update t_user set idcardimg = ? where id = ?";
	public boolean modifyIdcardimg(long id,String idcardimg) throws SQLException{
		int i = jdbcTemplate.update(modifyIdcardimg,new Object[]{idcardimg,id});
		if(i>0)return true;else return false;
	}
	private final String modifyJob = "update t_user set job = ? where id = ?";
	public boolean modifyJob(long id,int job) throws SQLException{
		int i = jdbcTemplate.update(modifyJob,new Object[]{job,id});
		if(i>0)return true;else return false;
	}
	
	private final String modifyAddress = "update t_user set address = ? where id = ?";
	public boolean modifyAddress(long id,String address) throws SQLException{
		int i = jdbcTemplate.update(modifyAddress,new Object[]{address,id});
		if(i>0)return true;else return false;
	}
	
	private final String modifyPassword = "update t_user set password = ? where id = ?";
	public boolean modifyPassword(long id,String password) throws SQLException{
		int i = jdbcTemplate.update(modifyPassword,new Object[]{password,id});
		if(i>0)return true;else return false;
	}
	private final String modifyBaibaoshopstate = "update t_user set baibaoshopstate = 2,updbaibaotime=now() where id = ?";
	public boolean modifyBaibaoshopstate(long id) throws SQLException{
		int i = jdbcTemplate.update(modifyBaibaoshopstate,new Object[]{id});
		if(i>0)return true;else return false;
	}
	private final String modifyMoney= "update t_user set money = ? where id = ?";
	public boolean modifyMoney(long id,double money) throws SQLException{
		int i = jdbcTemplate.update(modifyMoney,new Object[]{money,id});
		if(i>0)return true;else return false;
	}
	
	private final String modifyPoints= "update t_user set point = ? where id = ?";
	public boolean modifyPoints(long id,int points) throws SQLException{
		int i = jdbcTemplate.update(modifyPoints,new Object[]{points,id});
		if(i>0)return true;else return false;
	}
	
	
	private final String modifyPasswordByMobile = "update t_user set password = ? where mobile = ?";
	public boolean modifyPasswordByMobile(String mobile,String password) throws SQLException{
		int i = jdbcTemplate.update(modifyPasswordByMobile,new Object[]{password,mobile});
		if(i>0)return true;else return false;
	}
	
	private final String verifyMobileCode = "select code from t_verifycode where mobile = ? and createtime > ? order by createtime desc limit 0,1";
	public boolean verifyMobileCode(String mobile, String verifycode) throws SQLException{
		List<String> list = jdbcTemplate.queryForList(verifyMobileCode,new Object[]{mobile,DateUtil.addMinute(-15)},String.class);
		if(list.size()>0){
			if(list.get(0).equals(verifycode)){
				return true;
			}
		}
		return false;
	}
	
	private final String verifyPwd = "select count(*) from t_user where id = ? and password = ?";
	public boolean verifyPwd(long userid,String password) throws SQLException{
		int i = jdbcTemplate.queryForInt(verifyPwd,new Object[]{userid,password});
		if(i>0)return true;else return false;
	}
	
	private final String modifyLevel = "update t_user set level = ?,leveltime = ? where id = ?";
	public boolean modifyLevel(long userid,String level,String date) throws SQLException{
		int i = jdbcTemplate.update(modifyLevel,new Object[]{level,date,userid});
		if(i>0)return true;else return false;
	}
	private final String loginByopenId = "select *  from t_user where openId like ?";
	public Map<String, Object> Login(String openId) throws Exception {
		if(openId!=null&&openId.trim()!=""&&!openId.trim().equals("")){
			return jdbcTemplate.queryForMap(loginByopenId,new Object[]{"%"+openId+"%"});
		}
		return null;
	}
	
	public boolean upOpenIdBymobile(String mobile,String openId) throws SQLException{
		String sql=" select count(*) from t_user where (openId is null  or openId='' )and mobile = ?";
		int i = jdbcTemplate.queryForInt(sql,new Object[]{mobile});
		if(i>0){
			String sql1 = "update t_user t set t.openId =? where t.mobile = ?";
			int j = jdbcTemplate.update(sql1,new Object[]{","+openId,mobile});
			if(j>0){return true;}else{return false;}
		}else{
			String upOpenIdBymobile = "update t_user t set t.openId =CONCAT(t.openId,?) where t.mobile = ?";
			int k = jdbcTemplate.update(upOpenIdBymobile,new Object[]{","+openId,mobile});
			if(k>0){return true;}else{return false;}
		}
	}
}
