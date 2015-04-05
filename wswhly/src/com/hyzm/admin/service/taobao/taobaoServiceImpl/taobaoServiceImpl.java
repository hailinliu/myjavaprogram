
package com.hyzm.admin.service.taobao.taobaoServiceImpl;

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

import com.hyzm.admin.dao.taoinfo.taobaoDao;
import com.hyzm.admin.service.taobao.taobaoService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
 public class  taobaoServiceImpl implements taobaoService{
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private taobaoDao dao;

	public boolean gettaobaoinfoByUrl(String pmname, String qpprice,
			String baozhengprice, String dangqianprice, String jprice,
			String bmnum, String sznum, String wgnum, String jgname)
			throws Exception {
		log.info("抓取淘宝信息");
		try {
			return dao.gettaobaoinfoByUrl(pmname, qpprice, baozhengprice, dangqianprice, jprice, bmnum, sznum, wgnum, jgname);
		} catch (Exception e) {
			log.error("抓取淘宝信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String gettaobaoinfoList(int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.gettaobaoinfoListNum();
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.gettaobaoinfoList(currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取信息列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean deltaobaolist(long id) {
		log.info("删除信息");
		try {
			return dao.deltaobaolist(id);
		} catch (Exception e) {
			log.error("删除信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> exportCSV(int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.gettaobaoinfoList( currentPage, pageSize);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("reviewtime")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("qpprice")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("baozhengprice")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("dangqianprice")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("bmnum")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("sznum")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("wgnum")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("jgname")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  
					  }
		     }
			}			
			map.put("useList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("获取列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	 
 }
 