package com.hyzm.admin.dao.weixin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.weixin.WeixinDao;

@Repository
public class WeixinDaoImpl implements WeixinDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	private final static String getUserById = "select * from t_weixin where id = ? ";
	
	public Map<String, Object> getUserById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getUserById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取用户信息异常："+e.getMessage());
		}
	}
	
	public List<Map<String, Object>> getUserinfoList( String onesearch, String search,String state,String level,String duibi,String type,int pageSize, int currentPage)
			throws Exception {
		  String  sql="select * from t_weixin where  1=1";
		try {
		if(type.equals("1")){			
			if(search.equals("1")){
				sql+=" and id like "+"'%"+onesearch+"%'";
			}else if(search.equals("2")){
				sql+=" and username like "+"'%"+onesearch+"%'";
			}else if(search.equals("3")){
				sql+=" and mobile like "+"'%"+onesearch+"%'";
			}else if(search.equals("4")){
				sql+=" and realname like "+"'%"+onesearch+"%'";
			}else if(search.equals("5")){
				sql+=" and idcard like "+"'%"+onesearch+"%'";
			}else if(search.equals("6")){
				sql+=" and recommend like "+"'%"+onesearch+"%'";
			}
			if(!state.equals("")){
				sql+=" and state like "+"'%"+state+"%'";}
			if(!level.equals("")){
				sql+=" and level like "+"'%"+level+"%'";}	

		}else  if(type.equals("2")){	
			if(duibi.equals("1")){
				sql="select id, username,realname,mobile,idcard ,recommend,state,isgroup,'用户表' as aaa from t_user where realname like"+"'%"+onesearch+"%'"+"  union select id, username,realname,mobile,idcard ,recommend,state,isgroup,'微信表' as aaa from t_weixin where realname like"+"'%"+onesearch+"%'";
			}else if(duibi.equals("2")){
				sql="select id, username,realname,mobile,idcard ,recommend,state,isgroup,'用户表' as aaa  from t_user where mobile like"+"'%"+onesearch+"%'"+" union  select id, username,realname,mobile,idcard ,recommend,state,isgroup,'微信表' as aaa from t_weixin where mobile like"+"'%"+onesearch+"%'";
			}else if(duibi.equals("3")){				
				sql="select id,username,realname,mobile,idcard ,recommend,state,isgroup,'用户表' as aaa  from t_user where weixin like"+"'%"+onesearch+"%'"+"  union  select id, username,realname,mobile,idcard ,recommend,state,isgroup,'微信表' as aaa from t_weixin where weixin like"+"'%"+onesearch+"%'";
			}		
		}	
		        sql+=" order by id desc limit ? ,?";	
		return jdbcTemplate.queryForList(sql,new Object[]{(currentPage-1)*pageSize,pageSize,});
		} catch (Exception e) {
			throw new RuntimeException("获取用户列表异常："+e.getMessage());
		}
	
	}
	

	public long getUserinfoListNum(String onesearch, String search, String state,String level,String duibi,String type)
			throws Exception {
		  String sql="select count(id) from t_weixin where  1=1";
		try {
			if(type.equals("1")){
			if(search.equals("1")){
				sql+=" and id like "+"'%"+onesearch+"%'";
			}else if(search.equals("2")){
				sql+=" and username like "+"'%"+onesearch+"%'";
			}else if(search.equals("3")){
				sql+=" and mobile like "+"'%"+onesearch+"%'";
			}else if(search.equals("4")){
				sql+=" and realname like "+"'%"+onesearch+"%'";
			}else if(search.equals("5")){
				sql+=" and idcard like "+"'%"+onesearch+"%'";
			}else if(search.equals("6")){
				sql+=" and recommend like "+"'%"+onesearch+"%'";
			}
			if(!state.equals("")){
				sql+=" and state like "+"'%"+state+"%'";}
			if(!level.equals("")){
				sql+=" and level like "+"'%"+level+"%'";}		
		
			}else  if(type.equals("2")){	
				if(duibi.equals("1")){
					sql="select count(a.realname) from(select realname from t_user where realname like"+"'%"+onesearch+"%'"+"union  select realname from t_weixin where realname like"+"'%"+onesearch+"%') as a";
				}else if(duibi.equals("2")){
					sql="select count(a.mobile) from(select mobile from t_user where mobile like"+"'%"+onesearch+"%'"+"union  select mobile from t_weixin where mobile like"+"'%"+onesearch+"%') as a";
				}else if(duibi.equals("3")){	
					sql="select count(a.weixin) from(select weixin from t_user where weixin like"+"'%"+onesearch+"%'"+"union  select weixin from t_weixin where weixin like"+"'%"+onesearch+"%') as a";
				}
			  }	
			return jdbcTemplate.queryForLong(sql);
			} catch (Exception e) {
			throw new RuntimeException("获取用户数量异常："+e.getMessage());
		}
	}

	private final static String deleteUser = "update t_weixin set state = 3 where id = ?";

	public boolean deleteUser(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(deleteUser, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除用户异常："+e.getMessage());
		}
	}
	
	private final static String addUser = "insert into t_weixin (username, sex, mobile,weixin, createdate, email, realname, idcard, address,recommend) values (?,?,?,?,now(),?,?,?,?,?)";

	public boolean addUser(String username, int sex,
			String mobile, String email, String realname, String idcard, String address,String weixin, String recommend) throws Exception {
		try {
			int i = jdbcTemplate.update(addUser, new Object[]{username, sex, mobile,weixin, email, realname, idcard, address,recommend});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加用户信息异常："+e.getMessage());
		}
	}
	
	private final static String updUser = "update t_weixin set sex = ?, mobile = ?, email = ?, realname = ?, idcard = ?, address = ?,adminName = ?,desction =? where id = ?";

	public boolean updUser(int sex, String mobile, String email, String realname,
			String idcard, String address,String adminName,String desction, long id) throws Exception {
		try {
			int i = jdbcTemplate.update(updUser, new Object[]{sex, mobile, email, realname, idcard, address,adminName,desction, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改用户信息异常："+e.getMessage());
		}
	}

	}


