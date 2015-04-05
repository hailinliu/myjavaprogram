package com.hyzm.admin.service.video.impl;

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

import com.hyzm.admin.dao.video.VideoDao;
import com.hyzm.admin.service.video.VideoService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class VideoServiceImpl implements VideoService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private VideoDao dao;

	public String getVideoList(String title, String proficient, Date begindate,
			Date enddate, String state,String videotype, int currentPage, int pageSize) {
		log.info("获取视频列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getVideoListNum(title, proficient, begindate, enddate, state,videotype);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getVideoList(title, proficient, begindate, enddate, state, videotype, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取视频列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addVideo(String title, String videoimg, String videoname, String proficient, String note,String videotype) {
		log.info("添加视频");
		try {
			return dao.addVideo(title, videoimg, videoname, proficient, note,videotype);
		} catch (Exception e) {
			log.error("添加视频异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delVideo(long id) {
		log.info("删除视频");
		try {
			return dao.delVideo(id);
		} catch (Exception e) {
			log.error("删除视频异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updVideo(long id, String title, String videoimg, String videoname,
			String proficient, String note,String videotype) {
		log.info("修改视频");
		try {
			return dao.updVideo(id, title, videoimg, videoname, proficient, note,videotype);
		} catch (Exception e) {
			log.error("修改视频异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getVideoById(long id) {
		log.info("获取视频");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getVideoById(id);
		} catch (Exception e) {
			log.error("获取视频异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public String autoTitle() {
		log.info("自动补全视频标题");
		try {
			return JSONArray.fromObject(dao.autoTitle()).toString();
		} catch (Exception e) {
			log.error("自动补全视频标题异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String autoProficient() {
		log.info("自动补全专家");
		try {
			return JSONArray.fromObject(dao.autoProficient()).toString();
		} catch (Exception e) {
			log.error("自动补全专家异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

}
