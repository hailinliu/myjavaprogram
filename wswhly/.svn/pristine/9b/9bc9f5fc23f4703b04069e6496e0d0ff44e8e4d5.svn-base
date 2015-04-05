package com.hyzm.admin.service.index.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.Constans;
import com.hyzm.admin.dao.index.IndexDao;
import com.hyzm.admin.service.index.IndexService;
import com.hyzm.bean.ColumnHighCharts;
import com.hyzm.util.DateJsonValueProcessor;
import com.hyzm.util.StringUtil;

@Service
public class IndexServiceImpl implements IndexService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private IndexDao dao;

	public String getEnrollInfo() {
		log.info("获取本期报名信息");
		try {
			List<ColumnHighCharts> chartList = new ArrayList<ColumnHighCharts>();
			ColumnHighCharts charts;
			Map<String, Object> map = null;
			Map<String, Object> enroll = dao.getCurrentEnroll();
			if (enroll == null || enroll.size() == 0) {
				map = new HashMap<String, Object>();
				map.put("enrollnum", 0);
				map.put("collectionnum", 0);
				map.put("enrollmoney", 0);
			} else {
				map = dao.getEnrollInfo(StringUtil.converLong(enroll.get("id")));
			}
			Iterator<Entry<String, Object>> iter = map.entrySet().iterator();
			int i = 0;
			while (iter.hasNext()) {
				charts = new ColumnHighCharts();
				Entry<String, Object> entry = (Entry<String, Object>)iter.next();
				charts.setY(Double.parseDouble(entry.getValue().toString()));
				charts.setColor(Constans.getColor(i));
				chartList.add(charts);
				i++;
			}
			return JSONArray.fromObject(chartList).toString();
		} catch (Exception e) {
			log.error("获取本期报名信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String showEnrollInfo() {
		log.info("获取本期报名结算信息");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> enroll = dao.getCurrentEnroll();
			if (enroll == null || enroll.size() == 0) {
				map.put("cycle", "无");
				map.put("enrollname", "无");
				map.put("begindate", "无");
				map.put("enddate", "无");
				map.put("validdate", "无");
				map.put("createdate", "无");
				map.put("enrollnum", 0);
				map.put("collectionnum", 0);
				map.put("enrollmoney", 0);
			} else {
				Map<String, Object> curMap = dao.getEnrollInfo(StringUtil.converLong(enroll.get("id")));
				map.put("cycle", enroll.get("cycle"));
				map.put("enrollname", enroll.get("title"));
				map.put("begindate", enroll.get("begindate"));
				map.put("enddate", enroll.get("enddate"));
				map.put("validdate", enroll.get("validdate"));
				map.put("createdate", enroll.get("createdate"));
				map.put("enrollnum", curMap.get("enrollnum"));
				map.put("collectionnum", curMap.get("collectionnum"));
				map.put("enrollmoney", curMap.get("enrollmoney"));
			}
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			return JSONObject.fromObject(map, jsonConfig).toString();
		} catch (Exception e) {
			log.error("获取本期报名结算信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询异常";
	}

}
