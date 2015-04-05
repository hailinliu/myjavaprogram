package com.hyzm.syslog.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.syslog.dao.SyslogDao;

@Repository
public class SyslogDaoImpl implements SyslogDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getSyslogList = "select * from t_syslog where createdate >= ? and createdate <= ? order by id desc limit ?, ?";

	public List<Map<String, Object>> getSyslogList(Date begindate,
			Date enddate, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getSyslogList, new Object[]{begindate, enddate, (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("浏览日志异常："+e.getMessage());
		}
	}
	
	private final static String getSyslogListNum = "select count(id) from t_syslog where createdate >= ? and createdate <= ?";

	public long getSyslogListNum(Date begindate, Date enddate) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getSyslogListNum, new Object[]{begindate, enddate});
		} catch (Exception e) {
			throw new RuntimeException("日志数量异常："+e.getMessage());
		}
	}
	
	private final static String addSyslog = "insert into t_syslog (opmodel, action, content, result, opername, ip, createdate, model) values (?,?,?,?,?,?,now(),?)";

	public void addSyslog(String opmodel, String action, String content,
			String result, String opername, String ip, int model)
			throws Exception {
		try {
			jdbcTemplate.update(addSyslog, new Object[]{opmodel, action, content, result, opername, ip, model});
		} catch (Exception e) {
			throw new RuntimeException("记录日志异常："+e.getMessage());
		}
	}

}
