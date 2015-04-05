package com.hyzm.admin.service.lylots.Impl;


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





















import com.hyzm.admin.dao.lylots.LylotsDao;
import com.hyzm.admin.service.lylots.LylotsService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class LylotsServiceImpl implements LylotsService {

	private final Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private LylotsDao dao;

	public String getLylotsList(Date begindate, Date enddate,
			String specialID, String lynumber, String name, String username,
			String userid, String state, int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getLylotsListNum(begindate, enddate, specialID, lynumber, name, username, userid, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getLylotsList(begindate, enddate, specialID, lynumber, name, username, userid, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean updLylots(long id, int specialID, String name,String image,String qpprice,String pricearea,String taobaourl,String trialcomments,String reviewcomments,
			String cjprice,String adminname, String record, String suggest) {
		try {
			return dao.updLylots(id, specialID, name, image, qpprice,pricearea, taobaourl, trialcomments, reviewcomments, cjprice, adminname, record, suggest);
		} catch (Exception e) {
			log.error("修改拍品异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getLylotsById(long id) {
		log.info("获取拍品");
		Map<String, Object> map = new HashMap<String, Object>();
	    try {
			map = dao.getLylotsById(id);
		} catch (Exception e) {
			log.error("获取拍品异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	public boolean updstate(long id, int state) {
		try {
			return dao.updstate(id, state);
		} catch (Exception e) {
			log.error("修改状态异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updzjlots(long id, String trialcomments,String sczjid,String trialexperts) throws Exception {
		try {
			return dao.updzjlots(id, trialcomments, sczjid, trialexperts);
		} catch (Exception e) {
			log.error("修改专家评论异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getLylotsList(Date begindate, Date enddate, String lynumber,
			String name, String zjid, int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getZJlotsListNum(begindate, enddate, lynumber, name, zjid);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getZJlotsList(begindate, enddate, lynumber, name, zjid, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取专家拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public Map<String, Object> exportCSV(Date begindate, Date enddate,
			String specialID, String lynumber, String name, String username,
			String userid, String state, int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getLylotsList(begindate, enddate, specialID, lynumber, name, username, userid, state, currentPage, pageSize);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("reviewtime")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("autor")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("size")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("year")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("cjprice")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("suggest")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("record")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("adminname")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("trialtime")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("trialcomments")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("dealtime")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("reviewexperts")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("reviewcomments")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("qpprice")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("pricearea")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("taobaourl")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("signingtime")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("auctiontime")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("trialexperts")){ 
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

	public Map<String, Object> ZjexportCSV(Date begindate, Date enddate, String lynumber, String name, String zjid, int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getZJlotsList(begindate, enddate, lynumber, name, zjid, currentPage, pageSize);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("pmname")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("autor")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("size")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("year")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("cjprice")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("suggest")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("record")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("adminname")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("trialtime")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("trialcomments")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("dealtime")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("reviewexperts")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("reviewcomments")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("qpprice")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("pricearea")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("taobaourl")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("signingtime")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("auctiontime")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("trialexperts")){ 
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
