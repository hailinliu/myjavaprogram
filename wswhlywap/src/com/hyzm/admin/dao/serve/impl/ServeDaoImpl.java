package com.hyzm.admin.dao.serve.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.serve.ServeDao;

@Repository
public class ServeDaoImpl implements ServeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getServeList = "select t.*, IFNULL((select count(us.serviceid) from t_user_service us where us.serviceid = t.id),0) as countnum from t_service t where t.name like ? and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getServeList(String name, String state, int currentPage, int pageSize)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getServeList, new Object[]{"%"+name+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取服务列表异常："+e.getMessage());
		}
	}
	//lizhan
	private final static String getServeLookList = "SELECT a.username,a.collectionname,a.collectiontime,b.mobile ,c.serialnum,b.realname from t_collection_order a, t_user b, t_collection_us c where a.userid=b.id  and a.collectionid= c.id and a.username like ? and b.mobile like ? order by a.id desc limit ?, ?";
	public List<Map<String, Object>> getServeLookList(String name, String mobile, int currentPage, int pageSize)
	throws Exception {
     try {
	return jdbcTemplate.queryForList(getServeLookList, new Object[]{"%"+name+"%", "%"+mobile+"%", (currentPage-1)*pageSize, pageSize});
         } catch (Exception e) {
	      throw new RuntimeException("获取观摩预约列表异常："+e.getMessage());
         }
       }

	private final static String getServeLookListNum = "select count(t.id) from t_collection_order t where t.username like ? and t.usermobile like ?";

	public long getServeLookListNum(String name,
			String mobile) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getServeLookListNum, new Object[]{"%"+name+"%", "%"+mobile+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取观摩预约数量异常："+e.getMessage());
		}
	}
	///===
	private final static String getServeListNum = "select count(t.id) from t_service t where t.name like ? and t.state like ?";

	public long getServeListNum(String name,
			String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getServeListNum, new Object[]{"%"+name+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取服务数量异常："+e.getMessage());
		}
	}
	
	private final static String getUserServeList = "select t.id as suid, s.name as servicename, u.username, t.date1, t.date2, t.date3, t.date4, t.date5, t.state from t_user_service t left join t_service s on t.serviceid = s.id left join t_user u on t.userid = u.id where t.serviceid = ? and u.username like ? and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getUserServeList(long serveid,
			String username, String state, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getUserServeList, new Object[]{serveid, "%"+username+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取购买服务的用户信息列表异常："+e.getMessage());
		}
	}
	
	private final static String getUserServeListNum = "select count(t.userid) from t_user_service t left join t_user u on t.userid = u.id where t.serviceid = ? and u.username like ? and t.state like ?";

	public long getUserServeListNum(long serveid, String username, String state)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getUserServeListNum, new Object[]{serveid, "%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取购买服务的用户信息数量异常："+e.getMessage());
		}
	}
	
	private final static String addServe = "insert into t_service (name, price, period, memo, state) values (?, ?, ?, ?, 1)";

	public boolean addServe(String name, double price, String period, String memo)
			throws Exception {
		try {
			int i = jdbcTemplate.update(addServe, new Object[]{name, price, period, memo});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加服务异常："+e.getMessage());
		}
	}
	
	private final static String delServe = "update t_service set state = ? where id = ?";

	public boolean delServe(long id, int state) throws Exception {
		try {
			int i = jdbcTemplate.update(delServe, new Object[]{state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("开启/关闭服务异常："+e.getMessage());
		}
	}
	
	private final static String updServe = "update t_service set name = ?, price = ?, period = ?, memo = ? where id = ?";

	public boolean updServe(long id, String name, double price, String period, String memo)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updServe, new Object[]{name, price, period, memo, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改服务异常："+e.getMessage());
		}
	}
	
	private final static String addServeUser = "insert into t_user_service (userid, serviceid, date1) values (?, ?, now())";

	public boolean addServeUser(long userid, long serviceid) throws Exception {
		try {
			int i = jdbcTemplate.update(addServeUser, new Object[]{userid, serviceid});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加购买服务的用户信息异常："+e.getMessage());
		}
	}
	
	private final static String delServeUser = "delete from t_user_service where id = ?";

	public boolean delServeUser(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delServeUser, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除购买服务的用户信息异常："+e.getMessage());
		}
	}
	
	private final static String updServeUser = "update t_user_service set date? = now(), state = ? where id = ?";

	public boolean updServeUser(long id, int state) throws Exception {
		try {
			int i = jdbcTemplate.update(updServeUser, new Object[]{state, state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改购买状态异常："+e.getMessage());
		}
	}

	private final static String autoServeName = "select t.name from t_service t order by t.id desc";

	public List<Map<String, Object>> autoServeName() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoServeName);
		} catch (Exception e) {
			throw new RuntimeException("自动补全服务名称异常："+e.getMessage());
		}
	}
	
	private final static String getUsernameByName = "select t.* from t_user t where t.ismanager = 0 and t.username = ?";

	public Map<String, Object> getUsernameByName(String username)
			throws Exception {
		try {
			return jdbcTemplate.queryForMap(getUsernameByName, new Object[]{username});
		} catch (Exception e) {
			throw new RuntimeException("获取用户异常："+e.getMessage());
		}
	}

}
