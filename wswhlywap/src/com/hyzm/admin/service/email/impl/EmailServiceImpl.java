package com.hyzm.admin.service.email.impl;

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

import com.hyzm.admin.dao.email.EmailDao;
import com.hyzm.admin.service.email.EmailService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class EmailServiceImpl implements EmailService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private EmailDao dao;

	public String getEmailList(String mailaddress, Date begindate,
			Date enddate, String state, int currentPage, int pageSize) {
		log.info("获取邮件列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getEmailListNum(mailaddress, begindate, enddate, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getEmailList(mailaddress, begindate, enddate, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取邮件列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public long addEmailSend(String mailaddress, String content, String state,
			String subject, String files) {
		log.info("添加邮件");
		try {
			return dao.addEmailSend(mailaddress, content, state, subject, files);
		} catch (Exception e) {
			log.error("添加邮件异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}



	
}
