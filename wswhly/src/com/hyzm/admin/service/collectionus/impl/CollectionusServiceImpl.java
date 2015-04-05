package com.hyzm.admin.service.collectionus.impl;

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

import com.hyzm.admin.dao.collecitonus.CollectionusDao;
import com.hyzm.admin.service.collectionus.CollectionusService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class CollectionusServiceImpl implements CollectionusService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private CollectionusDao dao;

	public String getCollectionList(Date begindate, Date enddate, String type, String style, String name,String serialnum,String username,
			String state,String pricearea, int currentPage, int pageSize) {
		log.info("获取藏品列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getCollectionListNum(begindate, enddate, type, style, name,serialnum, username, state,pricearea);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getCollectionList(begindate, enddate, type, style, name,serialnum, username, state,pricearea, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addCollection(int type, int style, String name, String serialnum,
			long userid, String note, String imgurl,String imgurltitle, String tvnum) {
		log.info("添加藏品");
		try {
			return dao.addCollection(type, style, name, serialnum, userid, note, imgurl,imgurltitle, tvnum);
		} catch (Exception e) {
			log.error("添加藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delCollection(long id) {
		log.info("删除藏品");
		try {
			return dao.delCollection(id);
		} catch (Exception e) {
			log.error("添加藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updCollection(long id, int type, int style, String name, String note, String imgurl, String imgurltitle,String tvnum) {
		log.info("修改藏品");
		try {
			return dao.updCollection(id, type, style, name, note, imgurl,imgurltitle, tvnum);
		} catch (Exception e) {
			log.error("修改藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean collectThing(long id, int iscollection) {
		log.info("收藏藏品");
		try {
			return dao.collectThing(id, iscollection);
		} catch (Exception e) {
			log.error("收藏藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean collectionShowOrHide(long id, int state) {
		log.info("收藏/隐藏藏品");
		try {
			return dao.collectionShowOrHide(id, state);
		} catch (Exception e) {
			log.error("收藏/隐藏藏品异常："+e.getMessage());
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
			log.error("获取藏品异常："+e.getMessage());
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
			List<Map<String, Object>> maplist = dao.getTypeList(currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addType(String typename) {
		log.info("添加藏品类型");
		try {
			return dao.addType(typename);
		} catch (Exception e) {
			log.error("添加类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delType(long id) {
		log.info("删除藏品类型");
		try {
			return dao.delType(id);
		} catch (Exception e) {
			log.error("删除类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updType(long id, String typename) {
		log.info("修改藏品类型");
		try {
			return dao.updType(id, typename);
		} catch (Exception e) {
			log.error("修改类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String autoName() {
		log.info("自动补全藏品名称");
		try {
			return JSONArray.fromObject(dao.autoName()).toString();
		} catch (Exception e) {
			log.error("自动补全藏品名称异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String autoOwner() {
		log.info("自动补全归属");
		try {
			return JSONArray.fromObject(dao.autoOwner()).toString();
		} catch (Exception e) {
			log.error("自动补全归属异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getTypeCombobox() {
		log.info("获取藏品类型下拉列表");
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", 0);
			map.put("typename", "全部");
			list.add(map);
			for (Map<String, Object> mmap : dao.getTypeCombobox()) {
				list.add(mmap);
			}
			return JSONArray.fromObject(list).toString();
		} catch (Exception e) {
			log.error("获取藏品类型下拉列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public String getStyleCombobox(int typeid) {
		log.info("获取藏品类型下拉列表");
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", 0);
			map.put("typename", "全部");
			list.add(map);
			for (Map<String, Object> mmap : dao.getStyleCombobox(typeid)) {
				list.add(mmap);
			}
			return JSONArray.fromObject(list).toString();
		} catch (Exception e) {
			log.error("获取藏品类型下拉列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	public String autoserialnum() {
		log.info("自动补全编号");
		try {
			return JSONArray.fromObject(dao.autoserialnum()).toString();
		} catch (Exception e) {
			log.error("自动补全上传者异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	public String autoUsername() {
		log.info("自动补全上传者");
		try {
			return JSONArray.fromObject(dao.autoUsername()).toString();
		} catch (Exception e) {
			log.error("自动补全上传者异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean priceareaControl(long id, int pricearea) {
		log.info("修改价格区间");
		try {
			return dao.priceareaControl(id,pricearea);
		} catch (Exception e) {
			log.error("修改间隔区间异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean pointpriceControl(long id, String pricearea) {
		log.info("修改价格区间");
		try {
			return dao.pointpriceControl(id,pricearea);
		} catch (Exception e) {
			log.error("修改间隔区间异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> exportCSV(Date begindate, Date enddate,
			String type, String style, String name, String serialnum,
			String username, String state, String pricearea, int currentPage,
			int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getCollectionList(begindate, enddate, type, style, name, serialnum, username, state, pricearea, currentPage, pageSize);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("username")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("tvnum")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("lastmodifydate")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("imgurl")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
						  
					  }else if(entry.getKey().equals("note")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("pricearea")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("pointprice")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }
		     }
			}
			
			map.put("CollectionusList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("获取用户藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

}
