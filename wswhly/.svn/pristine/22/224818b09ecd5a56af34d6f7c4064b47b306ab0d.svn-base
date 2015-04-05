package com.hyzm.admin.service.serve.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.serve.ServeDao;
import com.hyzm.admin.service.serve.ServeService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class ServeServiceImpl implements ServeService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ServeDao dao;

	public String getServeList(String name,
			String state, int currentPage, int pageSize) {
		log.info("获取服务列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getServeListNum(name, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getServeList(name, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取服务列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public String getServeLookList(String name,
			String mobile, int currentPage, int pageSize) {
		log.info("获取观摩预约列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getServeLookListNum(name, mobile);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getServeLookList(name, mobile, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取服务列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getUserServeList(long serveid, String username, String state,
			int currentPage, int pageSize) {
		log.info("获取购买服务的用户信息列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getUserServeListNum(serveid, username, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getUserServeList(serveid, username, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取购买服务的用户信息列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addServe(String name, double price, String period, String memo) {
		log.info("添加服务");
		try {
			return dao.addServe(name, price, period, memo);
		} catch (Exception e) {
			log.error("添加服务异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delServe(long id, int state) {
		log.info("关闭/开启服务");
		try {
			return dao.delServe(id, state);
		} catch (Exception e) {
			log.error("关闭/开启服务异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updServe(long id, String name, double price, String period, String memo) {
		log.info("修改服务");
		try {
			return dao.updServe(id, name, price, period, memo);
		} catch (Exception e) {
			log.error("修改服务异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean addServeUser(long userid, long serviceid) {
		log.info("添加购买服务的用户信息");
		try {
			return dao.addServeUser(userid, serviceid);
		} catch (Exception e) {
			log.error("添加购买服务的用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delServeUser(long id) {
		log.info("删除购买服务的用户信息");
		try {
			return dao.delServeUser(id);
		} catch (Exception e) {
			log.error("删除购买服务的用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updServeUser(long id, int state) {
		log.info("修改购买状态");
		try {
			return dao.updServeUser(id, state);
		} catch (Exception e) {
			log.error("修改购买状态异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String autoServeName() {
		log.info("自动补全服务名称");
		try {
			return JSONArray.fromObject(dao.autoServeName()).toString();
		} catch (Exception e) {
			log.error("自动补全服务名称异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public Map<String, Object> getUsernameByName(String username) {
		log.info("获取用户信息");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getUsernameByName(username);
		} catch (Exception e) {
			log.error("获取用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

}
