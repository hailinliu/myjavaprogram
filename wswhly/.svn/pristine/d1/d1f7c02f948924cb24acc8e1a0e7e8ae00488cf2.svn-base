package com.hyzm.syslog.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.syslog.dao.SyslogDao;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class SyslogServiceImpl implements SyslogService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SyslogDao dao;

	public String getSyslogList(Date begindate, Date enddate, int currentPage,
			int pageSize) {
		log.info("浏览日志");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getSyslogListNum(begindate, enddate);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getSyslogList(begindate, enddate, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取日志列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public void addSyslog(String opmodel, String action, String content,
			String result, String opername, String ip, int model) {
		log.info("记录日志");
		try {
			dao.addSyslog(opmodel, action, content, result, opername, ip, model);
		} catch (Exception e) {
			log.error("记录日志异常："+e.getMessage());
			e.printStackTrace();
		}
	}

}
