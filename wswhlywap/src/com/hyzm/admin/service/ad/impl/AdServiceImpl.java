package com.hyzm.admin.service.ad.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.ad.AdDao;
import com.hyzm.admin.service.ad.AdService;

@Service
public class AdServiceImpl implements AdService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdDao dao;

	public String getAdImageList() {
		log.info("获取广告位列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Map<String, Object>> list = dao.getAdImageList();
			if (list == null || list.size() == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", list.size());
			map.put("rows", JSONArray.fromObject(list));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取广告位列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public boolean addAdImage(String name, String imgname, String url) {
		log.info("添加广告内容");
		try {
			return dao.addAdImage(name, imgname, url);
		} catch (Exception e) {
			log.error("添加广告内容异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean editAdImage(int id, String imgname, String url, int state) {
		log.info("修改广告内容");
		try {
			return dao.editAdImage(id, imgname, url, state);
		} catch (Exception e) {
			log.error("修改广告内容异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getAdById(int id) {
		log.info("获取广告内容");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getAdById(id);
		} catch (Exception e) {
			log.error("获取广告内容异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	
	
	 /*****************************************************APP华丽丽分割线*******************************************************/
	public boolean addAPP(Map<String, String> map) {
	
		return dao.addAPP(map);
	}

}
