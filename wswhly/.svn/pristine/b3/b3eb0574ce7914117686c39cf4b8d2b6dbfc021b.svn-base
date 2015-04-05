package com.hyzm.admin.service.proficient.impl;

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

import com.hyzm.admin.dao.proficient.ProficientDao;
import com.hyzm.admin.service.proficient.ProficientService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class ProficientServiceImpl implements ProficientService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ProficientDao dao;

	public String getProficientList(String name, String speciality,
			String appellation, String state, int currentPage, int pageSize) {
		log.info("获取专家信息列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getProficientListNum(name, speciality, appellation, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getProficientList(name, speciality, appellation, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取专家信息列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean addProficient(String name, String imgurl, String speciality,
			String appellation, String note,String orderc,String isbqhx,String hxqh) {
		log.info("添加专家信息");
		try {
			return dao.addProficient(name, imgurl, speciality, appellation, note,orderc,isbqhx,hxqh);
		} catch (Exception e) {
			log.error("添加专家信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delProficient(long id) {
		log.info("删除专家信息");
		try {
			return dao.delProficient(id);
		} catch (Exception e) {
			log.error("删除专家信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updProficient(long id, String name, String imgurl,
			String speciality, String appellation, String note,String orderc,String isbqhx,String hxqh) {
		log.info("修改专家信息");
		try {
			return dao.updProficient(id, name, imgurl, speciality, appellation, note,orderc,isbqhx,hxqh);
		} catch (Exception e) {
			log.error("修改专家信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getProficientById(long id) {
		log.info("通过id获取专家信息");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getProficientById(id);
		} catch (Exception e) {
			log.error("获取专家信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public String autoName() {
		log.info("自动补全专家名");
		try {
			return JSONArray.fromObject(dao.autoName()).toString();
		} catch (Exception e) {
			log.error("自动补全专家名异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String autoAppellation() {
		log.info("自动补全称谓");
		try {
			return JSONArray.fromObject(dao.autoAppellation()).toString();
		} catch (Exception e) {
			log.error("自动补全称谓异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String autoSpeciality() {
		log.info("自动补全专长");
		try {
			return JSONArray.fromObject(dao.autoSpeciality()).toString();
		} catch (Exception e) {
			log.error("自动补全专长异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

}
