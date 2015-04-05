package com.hyzm.admin.service.mem.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
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

import com.hyzm.admin.dao.collection.CollectionDao;
import com.hyzm.admin.dao.member.MemberDao;
import com.hyzm.admin.service.mem.MemService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class MemServiceImpl implements MemService{
	private final Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MemberDao dao;

	public String getMemberList(String userid,String username, String collectage,
			String likeoption, String price, int currentPage, int pageSize) {
	                 	log.info("获取会员列表");
	                	try {
	            			Map<String, Object> map = new HashMap<String, Object>();
	            			long total = dao.getMeminfoListNum(userid,username, collectage, likeoption, price);
	            			if (total == 0) {
	            				return "{total:0,rows:[]}";
	            			}
	            			map.put("total", total);
	            			JsonConfig jsonConfig = new JsonConfig();
	            			jsonConfig.registerJsonValueProcessor(Timestamp.class,
	            					new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
	            			List<Map<String, Object>> listmap = dao.getMeminfoList(userid,username, collectage, likeoption, price, pageSize, currentPage);
	            			System.out.println(listmap);
	            			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
	            			return JSONObject.fromObject(map).toString();
	            		} catch (Exception e) {
	            			log.error("获取会员列表异常：" + e.getMessage());
	            			e.printStackTrace();
	            		}
	            		return "查询失败！";	
	            		}


	public boolean updMember( Long id,String username,String collectage,String likeoption,String target,String service,String channel,String price, String isjoin, String isload) {
		log.info("修改会员");
		try {
			return dao.updMember(id, username, collectage, likeoption, target, service, channel, price, isjoin, isload);
		} catch (Exception e) {
			log.error("修改会员异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getMemberById(long id) {
		log.info("获取会员");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.gettMemberById(id);
		} catch (Exception e) {
			log.error("获取会员异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public String autoUserName() {
		log.info("自动补全会员名称");
		try {
			return JSONArray.fromObject(dao.autoUserName()).toString();
		} catch (Exception e) {
			log.error("自动补全会员名称异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
		
	}


	public Map<String, Object> exportCSV(String userid,String username, String collectage,
			String likeoption, String price, int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getMeminfoList(userid,username, collectage, likeoption, price, pageSize, currentPage);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("username")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("collectage")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("likeoption")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("suggest")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
						  
					  }else if(entry.getKey().equals("organization")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("collection1")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("collection2")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }
		     }
			}
			
			map.put("MemberList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}



}
