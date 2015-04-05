package com.hyzm.admin.service.baibao.impl;


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

import com.hyzm.admin.dao.baibao.BaibaoCollectionDao;
import com.hyzm.admin.service.baibao.BaibaoCollectionService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class BaibaoCollectionServiceImpl implements BaibaoCollectionService {

	private final Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private BaibaoCollectionDao dao;

	public String getBaibaoCollectionList(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state, int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getBaibaoCollectionListNum(begindate, enddate, baibaonum, name, username, userid, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getBaibaoCollectionList(begindate, enddate, baibaonum, name, username, userid, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean updBaibaoCollection(long id,String name,String imgurl,String price,String advertisement,int isagree,String note) {
		try {
			return dao.updBaibaoCollection(id, name, imgurl, price, advertisement, isagree, note);
		} catch (Exception e) {
			log.error("修改藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public boolean editcollectionsate(long id,int state) {
		try {
			return dao.editcollectionsate(id, state);
		} catch (Exception e) {
			log.error("修改藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public boolean addBaibaoCollection(long id, String name, String username,
			String imgurl, String price, String advertisement, int isagree,
			int state, String note) {
		try {
			return dao.addBaibaoCollection(id, name, username, imgurl, price, advertisement, isagree, state, note);
		} catch (Exception e) {
			log.error("添加藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delBaibaoCollection(long id) {
		try {
			return dao.delBaibaoCollection(id);
		} catch (Exception e) {
			log.error("删除藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public Map<String, Object> getBaibaoCollectionById(long id) {
		log.info("获取藏品");
		Map<String, Object> map = new HashMap<String, Object>();
	    try {
			map = dao.getBaibaoCollectionById(id);
		} catch (Exception e) {
			log.error("获取藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> exportCSV(Date begindate, Date enddate, 
			String baibaonum, String name,String username,String userid,
			String state, int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getBaibaoCollectionList(begindate, enddate, baibaonum, baibaonum, username, userid, state, currentPage, pageSize);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("baibaonum")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("username")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("advertisement")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("note")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("price")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
				  }
			    }
		      }
			}
			map.put("baibaoCollectionusList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("获取藏品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public String getBaibaoTrabsferList(Date begindate,
			Date enddate, String shopname, String name, String username,
			String userid, String state, int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getBaibaoTrabsferListNum(begindate, enddate, shopname, name, username, userid, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getBaibaoTrabsferList(begindate, enddate, shopname, name, username, userid, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取交易列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}


	public boolean updBaibaoTrabsferstate(long id, int state,String version) {
		try {
			return dao.updBaibaoTrabsferstate(id, state, version);
		} catch (Exception e) {
			log.error("修改交易状态异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}



	public Map<String, Object> getBaibaoTrabsferById(long id,String version) {
		log.info("获取交易");
		Map<String, Object> map = new HashMap<String, Object>();
	    try {
			map = dao.getBaibaoTrabsferById(id,version);
		} catch (Exception e) {
			log.error("获取交易异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}



	public boolean updBaibaoTrabsfer(long id,String version ,String couriernumber,String starttime,String paytime,
			String txmjfhtime,String dddqtime,String deliverytime,String wfhtime,String kdgs,
			String syspaytime,String applyreturntime,String thkdgs,String thmjqrtime,String dkdmftime,
			String consigneemobile, String consignee, String consigneeaddress,String thcouriernumber,
			String thconsigneemobile, String thconsignee, String thconsigneeaddress,int state) {
		try {
			return dao.updBaibaoTrabsfer(id, version, couriernumber, starttime, paytime, txmjfhtime, dddqtime, deliverytime, wfhtime, kdgs, syspaytime, applyreturntime, thkdgs, thmjqrtime, dkdmftime, consigneemobile, consignee, consigneeaddress, thcouriernumber, thconsigneemobile, thconsignee, thconsigneeaddress,state);
		} catch (Exception e) {
			log.error("修改交易异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
}
