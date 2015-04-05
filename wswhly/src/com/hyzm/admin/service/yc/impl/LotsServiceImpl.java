package com.hyzm.admin.service.yc.impl;

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

import com.hyzm.admin.dao.yc.LotsDao;
import com.hyzm.admin.service.yc.LotsService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class LotsServiceImpl implements LotsService {
private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private LotsDao dao;
	
	public boolean addLots(Map<String, String> map) {
		return dao.addLots(map);
	}

	public Map<String, Object> getLots(Map<String, String> map) {
		return dao.getLots(map);
	}

	public String getLotsList(Map<String, String> map) {
		try {
			Map<String, Object> resmap = new HashMap<String, Object>();
			long total = dao.getlotsListNum(map);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			resmap.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getLotsList(map);
			resmap.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(resmap).toString();
		} catch (Exception e) {
			log.error("获取拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean upaLots(Map<String, String> map) {
		return dao.upaLots(map);
	}

}
