package com.hyzm.admin.service.collection.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
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

import com.hyzm.admin.dao.collection.CollectionDao;
import com.hyzm.admin.service.collection.CollectionService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class CollectionServiceImpl implements CollectionService {

	private final Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private CollectionDao dao;


	public String getCollectionList(Date begindate, Date enddate, String type,String serialnum,
			String name, String owner,String userid, String username, String iscollection,
			String state, int currentPage, int pageSize) {
		log.info("获取藏品列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getCollectionListNum(begindate, enddate, type,serialnum,
					name, owner,userid, username, iscollection, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class,
					new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getCollectionList(
					begindate, enddate, type, serialnum,name, owner,userid, username,
					iscollection, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取藏品列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addCollection(int type, String name, String serialnum,
			long userid, String owner, String source, String note, String imgurl) {
		log.info("添加藏品");
		try {
			return dao.addCollection(type, name, serialnum, userid, owner,
					source, note, imgurl);
		} catch (Exception e) {
			log.error("添加藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delCollection(long id) {
		log.info("删除藏品");
		try {
			return dao.delCollection(id);
		} catch (Exception e) {
			log.error("添加藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updCollection(long id, int type, String name, String owner,
			String source, String note, String imgurl) {
		log.info("修改藏品");
		try {
			return dao.updCollection(id, type, name, owner, source, note,
					imgurl);
		} catch (Exception e) {
			log.error("修改藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean collectThing(long id, int iscollection) {
		log.info("收藏藏品");
		try {
			return dao.collectThing(id, iscollection);
		} catch (Exception e) {
			log.error("收藏藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean collectionShowOrHide(long id, int state) {
		log.info("收藏/隐藏藏品");
		try {
			return dao.collectionShowOrHide(id, state);
		} catch (Exception e) {
			log.error("收藏/隐藏藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getCollectionById(long id) {
		log.info("获取藏品");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getCollectionById(id);
		} catch (Exception e) {
			log.error("获取藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public String getTypeList(int currentPage, int pageSize) {
		log.info("获取藏品类型列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getTypeListNum();
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			List<Map<String, Object>> maplist = dao.getTypeList(currentPage,
					pageSize);
			map.put("rows", JSONArray.fromObject(maplist));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addType(String typename) {
		log.info("添加藏品类型");
		try {
			return dao.addType(typename);
		} catch (Exception e) {
			log.error("添加类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delType(long id) {
		log.info("删除藏品类型");
		try {
			return dao.delType(id);
		} catch (Exception e) {
			log.error("删除类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updType(long id, String typename) {
		log.info("修改藏品类型");
		try {
			return dao.updType(id, typename);
		} catch (Exception e) {
			log.error("修改类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String autoName() {
		log.info("自动补全藏品名称");
		try {
			return JSONArray.fromObject(dao.autoName()).toString();
		} catch (Exception e) {
			log.error("自动补全藏品名称异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	public String autoserialnum() {
		log.info("自动补全藏品编号");
		try {
			return JSONArray.fromObject(dao.autoserialnum()).toString();
		} catch (Exception e) {
			log.error("自动补全藏品编号异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String autoOwner() {
		log.info("自动补全归属");
		try {
			return JSONArray.fromObject(dao.autoOwner()).toString();
		} catch (Exception e) {
			log.error("自动补全归属异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getTypeCombobox() {
		log.info("获取藏品类型下拉列表");
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", 0);
			map.put("typename", "全部");
			list.add(map);
			for (Map<String, Object> mmap : dao.getTypeCombobox()) {
				list.add(mmap);
			}
			return JSONArray.fromObject(list).toString();
		} catch (Exception e) {
			log.error("获取藏品类型下拉列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String autoUsername() {
		log.info("自动补全上传者");
		try {
			return JSONArray.fromObject(dao.autoUsername()).toString();
		} catch (Exception e) {
			log.error("自动补全上传者异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	/**
	 * 合作审批 autor:haojk
	 */
	public boolean joinControl(long id, int state, Date begintime, Date endtime) {
		log.info("修改合作审批状态及起始日期");
		try {
			return dao.upjoinType(id, state, begintime, endtime);
		} catch (Exception e) {
			log.error("修改类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	
}
