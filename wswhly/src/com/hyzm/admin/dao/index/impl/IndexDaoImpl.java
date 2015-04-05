package com.hyzm.admin.dao.index.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.index.IndexDao;

@Repository
public class IndexDaoImpl implements IndexDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getCurrentEnroll = "select * from t_bm where begindate < now() and enddate > now()";
	
	public Map<String, Object> getCurrentEnroll() throws Exception {
		try {
			List<Map<String, Object>> list = jdbcTemplate.queryForList(getCurrentEnroll);
			if(list.size() > 0)
				return list.get(0);
			return null;
		} catch (Exception e) {
			throw new RuntimeException("获取当前报名异常："+e.getMessage());
		}
	}
	
	private final static String getEnrollInfo = "select (select count(id) from t_bmrecord where bmid = ?) as enrollnum" +
			", (select count(t.collectionid) from t_bm_collection t left join t_bmrecord b on t.bmrecordid = b.id where b.bmid = ?) as collectionnum" +
			", (select count(t.collectionid)/100 from t_bm_collection t left join t_bmrecord b on t.bmrecordid = b.id where b.bmid = ?) as enrollmoney" +
			" from dual";

	public Map<String, Object> getEnrollInfo(long bmid) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getEnrollInfo, new Object[]{bmid, bmid, bmid});
		} catch (Exception e) {
			throw new RuntimeException("获取本期报名信息异常："+e.getMessage());
		}
	}

}
