package com.hyzm.admin.dao.enroll.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.enroll.EnrollActivitieDao;

@Repository
public class EnrollActivitieDaoImpl implements EnrollActivitieDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final static String getEnrollActiveList = "select t.* from t_bm_info t where t.bm_time >= ? and t.bm_time <= ? and t.name like ? order by bm_time desc limit ?, ?";
	public List<Map<String, Object>> getEnrollActiveList(Date begindate, Date enddate, String name,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollActiveList, new Object[]{begindate, enddate, "%"+name+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取活动报名列表异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollActiveListNum = "select count(t.id) from t_bm_info t where t.bm_time >= ? and t.bm_time <= ? and t.name like ?";

	public long getEnrollActiveListNum(Date begindate, Date enddate, String name) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getEnrollActiveListNum, new Object[]{begindate, enddate, "%"+name+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取活动报名数量异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollActiveInfoList = "select r.id,r.bmid,r.code,r.createdate, r.validdate,u.id as uid,u.username,u.mobile,u.level,o.ordernum, count(s.bmrecordid) as collectionnum from t_bmrecord r left join t_user u on r.userid = u.id left join t_order o on r.orderid = o.id left join t_bm_collection s on s.bmrecordid = r.id where r.createdate >= ? and r.createdate <= ? and r.bmid = ? and u.username like ? group by r.id,r.bmid,r.code,r.createdate, r.validdate,u.id,u.username,o.ordernum order by r.id desc limit ?, ?";

	public List<Map<String, Object>> getEnrollActiveInfoList(Date begindate, Date enddate, String username, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollActiveInfoList, new Object[]{begindate, enddate, "%"+username+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名列表异常："+e.getMessage());
		}
	}
	
	
	private final static String getEnrollActiveInfoListCSV = "select r.id,r.bmid,r.code,r.createdate, r.validdate,u.id as uid,u.username,u.mobile,u.level,o.ordernum, count(s.bmrecordid) as collectionnum from t_bmrecord r left join t_user u on r.userid = u.id left join t_order o on r.orderid = o.id left join t_bm_collection s on s.bmrecordid = r.id where r.createdate >= ? and r.createdate <= ? and r.bmid = ? and u.username like ? group by r.id,r.bmid,r.code,r.createdate, r.validdate,u.id,u.username,o.ordernum order by r.id desc";

	public List<Map<String, Object>> getEnrollActiveInfoListCSV(Date begindate, Date enddate,  String username) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollActiveInfoListCSV, new Object[]{begindate, enddate, "%"+username+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名列表异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollActiveInfoListNum = "select count(r.id) from t_bmrecord r left join t_user u on r.userid = u.id where r.createdate >= ? and r.createdate <= ? and r.bmid = ? and u.username like ?";

	public long getEnrollActiveInfoListNum(Date begindate, Date enddate, String username)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getEnrollActiveInfoListNum, new Object[]{begindate, enddate, "%"+username+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名数量异常："+e.getMessage());
		}
	}
	private final static String getEnrollActiveListInfo ="select t.* from t_bm_info t where t.bm_time >= ? and t.bm_time <= ? and t.name like ? order by bm_time desc ";
	public List<Map<String, Object>> getEnrollActiveInfoList(Date begindate, Date enddate, String username) throws Exception {
		try {
			return jdbcTemplate.queryForList(getEnrollActiveListInfo, new Object[]{begindate, enddate, "%"+username+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取对应用户报名列表异常："+e.getMessage());
		}
	}
	
	

}
