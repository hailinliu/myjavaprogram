package com.hyzm.admin.service.vote.impl;

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

import com.hyzm.admin.dao.vote.VoteDao;
import com.hyzm.admin.service.vote.VoteService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class VoteServiceImpl implements VoteService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private VoteDao dao;
	
	public Map<String, Object> getCollectionById(long id) {
		log.info("获取藏品信息");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getCollectionById(id);
		} catch (Exception e) {
			log.error("获取藏品信息异常：");
			e.printStackTrace();
		}
		return map;
	}

	public String getVoteCollectionList(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String issue, String issuetype,
			String state, int currentPage, int pageSize) {
		log.info("获取藏品列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getVoteCollectionListNum(begindate, enddate, type, serialnum, name,username,userid, issue, issuetype, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getVoteCollectionList(begindate, enddate, type,serialnum ,name,username,userid, issue, issuetype, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getVipCollectionList(Date begindate, Date enddate,
			String type, String serialnum,String name,String username,String userid, String state, int currentPage, int pageSize) {
		log.info("获取会员藏品列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getVipCollectionListNum(begindate, enddate, type, serialnum,name,username,userid, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getVipCollectionList(begindate, enddate, type, serialnum,name,username,userid, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取会员藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addVoteCollection(int type, String name, String serialnum,
			long userid, String note, String imgurl, String issue) {
		log.info("添加藏品信息");
		try {
			return dao.addVoteCollection(type, name, serialnum, userid, note, imgurl, issue);
		} catch (Exception e) {
			log.error("添加藏品信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delVoteCollection(long id, int state) {
		log.info("删除藏品信息");
		try {
			return dao.delVoteCollection(id, state);
		} catch (Exception e) {
			log.error("删除藏品信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updVoteCollection(long id, int type, String name,
			String note, String imgurl, String issue) {
		log.info("修改藏品信息");
		try {
			return dao.updVoteCollection(id, type, name, note, imgurl, issue);
		} catch (Exception e) {
			log.error("修改藏品信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getActivityBmList(String cycle, String title, Date begindate,
			Date enddate, String type, String state, int currentPage,
			int pageSize) {
		log.info("获取活动报名列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getActivityBmListNum(cycle, title, begindate, enddate, type, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getActivityBmList(cycle, title, begindate, enddate, type, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取会员藏品数量异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addBm(long cycle, String title, String content,
			Date begindate, Date enddate, int type) {
		log.info("添加活动报名");
		try {
			return dao.addBm(cycle, title, content, begindate, enddate, type);
		} catch (Exception e) {
			log.error("添加活动报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delBm(long id, int state) {
		log.info("删除活动报名");
		try {
			return dao.delBm(id, state);
		} catch (Exception e) {
			log.error("删除活动报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updBm(long id, long cycle, String title, String content, Date begindate, Date enddate) {
		log.info("修改活动报名");
		try {
			return dao.updBm(id, cycle, title, content, begindate, enddate);
		} catch (Exception e) {
			log.error("修改活动报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
