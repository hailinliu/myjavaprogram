package com.hyzm.admin.dao.job.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.job.JobDao;

@Repository
public class JobDaoImpl implements JobDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getJobList = "select * from t_job order by id";

	public List<Map<String, Object>> getJobList() throws Exception {
		try {
			return jdbcTemplate.queryForList(getJobList);
		} catch (Exception e) {
			throw new RuntimeException("浏览职业列表异常："+e.getMessage());
		}
	}
	
	private final static String addJob = "insert into t_job (name, state) values (?, 1)";

	public boolean addJob(String name) throws Exception {
		try {
			int i = jdbcTemplate.update(addJob, new Object[]{name});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加职业信息异常："+e.getMessage());
		}
	}
	
	private final static String delJob = "update t_job set state = 2 where id = ?";

	public boolean delJob(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delJob, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除职业信息异常："+e.getMessage());
		}
	}
	
	private final static String updJob = "update t_job set name = ? where id = ?";

	public boolean updJob(long id, String name) throws Exception {
		try {
			int i = jdbcTemplate.update(updJob, new Object[]{name, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改职业信息异常："+e.getMessage());
		}
	}

}
