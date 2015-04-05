package com.hyzm.admin.service.onlinepic.impl;

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

import com.hyzm.admin.dao.onlinepic.OnlinePicDao;
import com.hyzm.admin.service.onlinepic.OnlinePicService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class OnlinePicServiceImpl implements OnlinePicService {
private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private OnlinePicDao  dao;

	public int UpdateOnlinePicColl(Map<String, String> where) {
		log.info("修改在线图片鉴定藏品");
		try {
			return dao.UpdateOnlinePicColl(where);
		} catch (Exception e) {
			log.error("修改在线图片鉴定藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public int  getOnlinePicCollForCount(Map<String, String> where) {
		log.info("查询藏品个数");
		try {
			return dao.getOnlinePicCollForCount(where);
		} catch (Exception e) {
			log.error("查询藏品个数异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public String getOnlinePicCollForList(Map<String, String> where) {
		log.info("获取在线图片鉴定藏品列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getOnlinePicCollForCount(where);
//			if (total == 0) {
//				return "{total:0,rows:[]}";
//			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getOnlinePicCollForList(where);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取在线图片鉴定藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public Map<String, Object> getOnlinePicCollForMap(Map<String, String> where) {
		log.info("获取单个在线图片鉴定藏品");
		try {
			return dao.getOnlinePicCollForMap(where);
		} catch (Exception e) {
			log.error("获取单个在线图片鉴定藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	public String getOnlinePicProf(Map<String, String> where) {
		log.info("获取图片鉴定专家列表");
		try {
			 return JSONArray.fromObject(dao.getOnlinePicProf(where)).toString();
		} catch (Exception e) {
			log.error("获取图片鉴定专家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	public List<Map<String, Object>> getOnlinePicProflist(Map<String, String> where) {
		log.info("获取图片鉴定专家列表");
		try {
			 return dao.getOnlinePicProf(where);
		} catch (Exception e) {
			log.error("获取图片鉴定专家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	public String getOnlinePicType(Map<String, String> where) {
		log.info("获取图片鉴定类型列表");
		try {
			 return JSONArray.fromObject(dao.getOnlinePicType(where)).toString();
		} catch (Exception e) {
			log.error("获取图片鉴定类型列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public int AddOnlinePicProf(Map<String, String> map) {
		log.info("添加图片在线专家");
		try {
			return dao.AddOnlinePicProf(map);
		} catch (Exception e) {
			log.error("添加图片在线专家异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public int AddOnlinePicType(Map<String, String> map) {
		log.info("添加图片在线类型");
		try {
			return dao.AddOnlinePicType(map);
		} catch (Exception e) {
			log.error("添加图片在线类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public int UpdateOnlinePicProf(Map<String, String> map) {
		log.info("修改图片在线专家");
		try {
			return dao.UpdateOnlinePicProf(map);
		} catch (Exception e) {
			log.error("修改图片在线专家异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public int UpdateOnlinePicType(Map<String, String> map) {
		log.info("修改图片在线类型");
		try {
			return dao.UpdateOnlinePicType(map);
		} catch (Exception e) {
			log.error("修改图片在线类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}
	 

}
