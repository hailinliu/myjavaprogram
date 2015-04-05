package com.hyzm.admin.service.enroll.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.enroll.EnrollActivitieDao;
import com.hyzm.admin.service.enroll.EnrollActivitieService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class EnrollActivitieServiceImpl implements EnrollActivitieService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private EnrollActivitieDao dao;

	public String getEnrollActiveList(Date begindate, Date enddate, String name,
			int currentPage, int pageSize) {
		log.info("获取报名活动列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getEnrollActiveListNum(begindate, enddate, name);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getEnrollActiveList(begindate, enddate, name, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取报名活动列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getEnrollActiveInfoList(Date begindate, Date enddate, String username,
			int currentPage, int pageSize) {
		log.info("获取对应用户报名列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getEnrollActiveInfoListNum(begindate, enddate,  username);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getEnrollActiveInfoList(begindate, enddate, username, currentPage, pageSize);
			 for(int i =0;i< maplist.size();i++){
		           Map<String, Object> mapdata= maplist.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					    if(entry.getKey().equals("level")){
					    	if(entry.getValue().equals(1)){
					    		entry.setValue("VIP会员");
					    	}else if(entry.getValue().equals(2)){
					    		entry.setValue("VIP高级会员");
					    	}else if(entry.getValue().equals(3)){
					    		entry.setValue("VIP贵宾会员");
					    	}else if(entry.getValue().equals(4)){
					    		entry.setValue("VIP超级会员");
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
	
	


	public Map<String, Object> exportCSV(Date begindate, Date enddate, String username) throws Exception {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> list = dao.getEnrollActiveInfoList(begindate, enddate, username);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
						 if(entry.getKey().equals("email")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("sex")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("idcard")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("ipcard")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("address")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("visa")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("useTime")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("style")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("lader")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("joins")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("description")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
						    	}
						  }else if(entry.getKey().equals("name")){
						    	if(entry.getValue()==null){
						    		entry.setValue("");
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
