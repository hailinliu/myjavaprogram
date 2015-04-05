package com.hyzm.admin.service.job.impl;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.job.JobDao;
import com.hyzm.admin.service.job.JobService;

@Service
public class JobServiceImpl implements JobService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private JobDao dao;

	public String getJobList() {
		log.info("获取职业列表");
		try {
			return JSONArray.fromObject(dao.getJobList()).toString();
		} catch (Exception e) {
			log.error("获取职业列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean addJob(String name) {
		log.info("添加职业");
		try {
			return dao.addJob(name);
		} catch (Exception e) {
			log.error("添加职业异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delJob(long id) {
		log.info("删除职业");
		try {
			return dao.delJob(id);
		} catch (Exception e) {
			log.error("删除职业异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updJob(long id, String name) {
		log.info("修改职业");
		try {
			return dao.updJob(id, name);
		} catch (Exception e) {
			log.error("修改职业异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
