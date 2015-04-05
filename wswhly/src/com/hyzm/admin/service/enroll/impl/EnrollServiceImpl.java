package com.hyzm.admin.service.enroll.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.enroll.EnrollDao;
import com.hyzm.admin.service.enroll.EnrollService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class EnrollServiceImpl implements EnrollService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private EnrollDao dao;

	public String getEnrollList(Date begindate, Date enddate, String state,
			int currentPage, int pageSize) {
		log.info("获取报名活动列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getEnrollListNum(begindate, enddate, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getEnrollList(begindate, enddate, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取报名活动列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getEnrollInfoList(Date begindate, Date enddate, long enrollid, String username,
			int currentPage, int pageSize) {
		log.info("获取对应用户报名列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getEnrollInfoListNum(begindate, enddate, enrollid, username);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getEnrollInfoList(begindate, enddate, enrollid, username, currentPage, pageSize);
			 for(int i =0;i< maplist.size();i++){
		           Map<String, Object> mapdata= maplist.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					    if(entry.getKey().equals("level")){
					    	if(entry.getValue().equals(1)){
					    		entry.setValue("星级会员");
					    	}else if(entry.getValue().equals(2)){
					    		entry.setValue("贵宾会员");
					    	}else if(entry.getValue().equals(3)){
					    		entry.setValue("高级会员");
					    	}else if(entry.getValue().equals(4)){
					    		entry.setValue("超级会员");
					    	}else{
					    		entry.setValue("免费会员");
					    	}	
					    }
					 }		          
		     }
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取对应用户报名列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public boolean addEnroll(long cycle, String title, String content,
			Date begindate, Date enddate, Date validdate) {
		log.info("添加报名活动");
		try {
			return dao.addEnroll(cycle, title, content, begindate, enddate, validdate);
		} catch (Exception e) {
			log.error("添加报名活动异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean onOrOffEnroll(long id, int state) {
		log.info("开启/关闭报名活动");
		try {
			return dao.onOrOffEnroll(id, state);
		} catch (Exception e) {
			log.error("开启/关闭报名活动异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean editEnroll(long cycle, String title, String content,
			Date begindate, Date enddate, Date validdate, long id) {
		log.info("修改报名活动");
		try {
			return dao.editEnroll(cycle, title, content, begindate, enddate, validdate, id);
		} catch (Exception e) {
			log.error("修改报名活动异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getCollectionsByBmid(long bmid) {
		log.info("通过报名记录信息获取用户报名藏品");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Map<String, Object>> maplist = dao.getCollectionsByBmid(bmid);
			if (maplist == null || maplist.size() == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", maplist.size());
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取用户报名藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public Map<String, Object> exportCSV(Date begindate, Date enddate,
			long enrollid, String username) throws Exception {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> enroll = dao.getEnrollById(enrollid);
			map.put("enroll", enroll==null?new HashMap<String, Object>():enroll);
			List<Map<String, Object>> list = dao.getEnrollInfoList(begindate, enddate, enrollid, username);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
						 if(entry.getKey().equals("level")){
						    	if(entry.getValue().equals(1)){
						    		entry.setValue("星级会员");
						    	}else if(entry.getValue().equals(2)){
						    		entry.setValue("贵宾会员");
						    	}else if(entry.getValue().equals(3)){
						    		entry.setValue("高级会员");
						    	}else if(entry.getValue().equals(4)){
						    		entry.setValue("超级会员");
						    	}else{
						    		entry.setValue("免费会员");
						    	}	
					    }
					 }		          
		     }
			
			
			
			map.put("enrollInfoList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("导出csv异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

}
