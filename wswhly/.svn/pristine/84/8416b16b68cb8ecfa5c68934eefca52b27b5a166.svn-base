package com.hyzm.admin.dao.enroll.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.enroll.EnrollDao;

@Repository
public class EnrollDaoImpl implements EnrollDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getEnrollList = "select t.* from t_bm t where t.createdate >= ? and t.createdate <= ? and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getEnrollList(Date begindate, Date enddate, String state,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollList, new Object[]{begindate, enddate, "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取活动报名列表异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollListNum = "select count(t.id) from t_bm t where t.createdate >= ? and t.createdate <= ? and t.state like ?";

	public long getEnrollListNum(Date begindate, Date enddate, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getEnrollListNum, new Object[]{begindate, enddate, "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取活动报名数量异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollInfoList = "select r.id,r.bmid,r.code,r.createdate, r.validdate,u.id as uid,u.username,u.mobile,u.level,o.ordernum, count(s.bmrecordid) as collectionnum from t_bmrecord r left join t_user u on r.userid = u.id left join t_order o on r.orderid = o.id left join t_bm_collection s on s.bmrecordid = r.id where r.createdate >= ? and r.createdate <= ? and r.bmid = ? and u.username like ? group by r.id,r.bmid,r.code,r.createdate, r.validdate,u.id,u.username,o.ordernum order by r.id desc limit ?, ?";

	public List<Map<String, Object>> getEnrollInfoList(Date begindate, Date enddate, long enrollid, String username, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollInfoList, new Object[]{begindate, enddate, enrollid, "%"+username+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名列表异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollInfoListCSV = "select r.id,r.bmid,r.code,r.createdate, r.validdate,u.id as uid,u.username,u.mobile,u.level,o.ordernum, count(s.bmrecordid) as collectionnum from t_bmrecord r left join t_user u on r.userid = u.id left join t_order o on r.orderid = o.id left join t_bm_collection s on s.bmrecordid = r.id where r.createdate >= ? and r.createdate <= ? and r.bmid = ? and u.username like ? group by r.id,r.bmid,r.code,r.createdate, r.validdate,u.id,u.username,o.ordernum order by r.id desc";

	public List<Map<String, Object>> getEnrollInfoList(Date begindate, Date enddate, long enrollid, String username) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollInfoListCSV, new Object[]{begindate, enddate, enrollid, "%"+username+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名列表异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollInfoListNum = "select count(r.id) from t_bmrecord r left join t_user u on r.userid = u.id where r.createdate >= ? and r.createdate <= ? and r.bmid = ? and u.username like ?";

	public long getEnrollInfoListNum(Date begindate, Date enddate, long enrollid, String username)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getEnrollInfoListNum, new Object[]{begindate, enddate, enrollid, "%"+username+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名数量异常："+e.getMessage());
		}
	}
	
	private final static String addEnroll = "insert into t_bm (cycle, title, content, begindate, enddate, validdate, state, createdate) values (?,?,?,?,?,?,1,now())";

	public boolean addEnroll(long cycle, String title, String content,
			Date begindate, Date enddate, Date validdate) throws Exception {
		try {
			int i = jdbcTemplate.update(addEnroll, new Object[]{cycle, title, content, begindate, enddate, validdate});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加报名活动："+e.getMessage());
		}
	}
	
	private final static String onOrOffEnroll = "update t_bm set state = ? where id = ?";

	public boolean onOrOffEnroll(long id, int state) throws Exception {
		try {
			int i = jdbcTemplate.update(onOrOffEnroll, new Object[]{state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("开启/关闭报名异常："+e.getMessage());
		}
	}
	
	private final static String editEnroll = "update t_bm set cycle = ?, title = ?, content = ?, begindate = ?, enddate = ?, validdate = ? where id = ?";

	public boolean editEnroll(long cycle, String title, String content,
			Date begindate, Date enddate, Date validdate, long id)
			throws Exception {
		try {
			int i = jdbcTemplate.update(editEnroll, new Object[]{cycle, title, content, begindate, enddate, validdate, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改报名活动异常："+e.getMessage());
		}
	}
	
	private final static String getCollectionsByBmid = "select t.name, t.uploaddate, u.username from (select c.name, c.userid, c.uploaddate from t_bm_collection t left join t_collection c on t.collectionid = c.id where t.bmrecordid = ?) t left join t_user u on t.userid = u.id group by t.uploaddate, t.name, u.username";

	public List<Map<String, Object>> getCollectionsByBmid(long bmid)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getCollectionsByBmid, new Object[]{bmid});
		} catch (Exception e) {
			throw new RuntimeException("获取用户藏品信息异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollById = "select t.* from t_bm t where t.id = ?";

	public Map<String, Object> getEnrollById(long id) {
		try {
			return jdbcTemplate.queryForMap(getEnrollById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取报名活动异常："+e.getMessage());
		}
	}

}
