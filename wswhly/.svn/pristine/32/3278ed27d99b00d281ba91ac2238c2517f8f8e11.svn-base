package com.hyzm.admin.service.weixin.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.weixin.WeixinDao;
import com.hyzm.admin.service.weixin.WeixinService;
import com.hyzm.util.DateJsonValueProcessor;


@Service
public class WeixinServiceImpl implements WeixinService{
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private WeixinDao dao;
	
	public Map<String, Object> getUserById(long id) {
		log.info("获取用户信息");
		Map<String, Object> map = null;
		try {
			map = dao.getUserById(id);
		} catch (Exception e) {
			log.error("获取用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return map==null?new HashMap<String, Object>():map;
	}

	public String getUserinfoList(String onesearch, String search, String state,String level,String duibi,String type,int pageSize, int currentPage) {
		log.info("获取用户信息，当前页："+pageSize+"，每页数据为："+currentPage);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getUserinfoListNum(search, onesearch,state,level,duibi,type);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getUserinfoList(search,onesearch, state, level,duibi,type, pageSize, currentPage);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}



	public boolean deleteUser(long id) {
		log.info("删除用户");
		try {
			return dao.deleteUser(id);
		} catch (Exception e) {
			log.error("删除用户异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean addUser(String username, int sex, String mobile,
			String email, String realname, String idcard, String address,
			String weixin, String recommend) {
		log.info("添加用户信息");
		try {
			return dao.addUser(username, sex, mobile, email, realname, idcard,  address, weixin, recommend);
		} catch (Exception e) {
			log.error("添加用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updUser(int sex, String mobile, String email,
			String realname, String idcard, String address, String adminName,
			String desction, long id) {
		log.info("修改用户信息");
		try {
			return dao.updUser(sex, mobile, email, realname, idcard, address,adminName,desction, id);
		} catch (Exception e) {
			log.error("修改用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	
	public Map<String, Object> exportCSV(String onesearch, String search, String state,String level,String duibi,String type, int pageSize, int currentPage) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getUserinfoList(onesearch, search, state, level,duibi,type, pageSize, currentPage);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("email")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("realname")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("idcard")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("recommend")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("address")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("desction")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }
		     }
			}
			
			map.put("useList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}









}
