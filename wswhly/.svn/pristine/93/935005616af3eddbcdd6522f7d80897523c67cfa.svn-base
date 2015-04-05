package com.hyzm.admin.service.message.impl;

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

import com.hyzm.admin.dao.message.MessageDao;
import com.hyzm.admin.service.message.MessageService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class MessageServiceImpl implements MessageService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MessageDao dao;

	public String getMessageList(String mobile, Date begindate, Date enddate,
			String state, int currentPage, int pageSize) {
		log.info("获取短信列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getMessageListNum(mobile, begindate, enddate, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getMessageList(mobile, begindate, enddate, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取短信列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public long addSmsSend(String mobile, String content, String state,
			int times, String backtime, String accountcount) {
		log.info("添加短信");
		try {
			return dao.addSmsSend(mobile, content, state, times, backtime, accountcount);
		} catch (Exception e) {
			log.error("添加短信异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public String getVipMessageList() {
		log.info("获取收费会员的通知短信");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Map<String, Object>> list = dao.getVipMessageList();
			if (list == null || list.size() == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", list.size());
			map.put("rows", JSONArray.fromObject(list));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取收费会员的通知短信异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean editVipMessage(long id, String content) {
		log.info("修改收费会员的通知短信");
		try {
			return dao.editVipMessage(id, content);
		} catch (Exception e) {
			log.error("修改收费会员的通知短信异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String gethfMessageList(Map<String, String> map) {
		try {
			Map<String, Object> resmap = new HashMap<String, Object>();
			long total = dao.gethfMessageListNum(map);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			resmap.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.gethfMessageList(map);
			resmap.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(resmap).toString();
		} catch (Exception e) {
			log.error("获取拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addhfMessage(Map<String, String> map) {
		return dao.addhfMessage(map);
	}

	public boolean editIshuif(Map<String, String> map) {
		return dao.editIshuif(map);
	}

}
