package com.hyzm.admin.service.daigou.impl;

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

import com.hyzm.admin.dao.daigou.DaigouDao;
import com.hyzm.admin.service.daigou.DaigouService;
import com.hyzm.admin.service.sys.SysService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MenuTree;
import com.hyzm.bean.UserInfo;
import com.hyzm.util.DateJsonValueProcessor;
import com.hyzm.util.StringUtil;

@Service
public class DaigouServiceImpl implements DaigouService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private DaigouDao dao;


	public Map<String, Object> getDaigouById(long id) {
		log.info("获取用户信息");
		Map<String, Object> map = null;
		try {
			map = dao.getDaigouById(id);
		} catch (Exception e) {
			log.error("获取用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return map==null?new HashMap<String, Object>():map;
	}

	public String getDaigouinfoList(Date begindate, Date enddate,String name, String mobile,String state,int pageSize,int currentPage) {
		log.info("获取用户信息，当前页："+pageSize+"，每页数据为："+currentPage);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getDaigouinfoListNum(begindate, enddate, name, mobile, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getDaigouinfoList(begindate, enddate, name, mobile, state, pageSize, currentPage);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	

	public boolean updDaigou(int sex, String mobile, String email, String address, String weixin, int state, long id) {
		log.info("修改用户信息");
		try {
			return dao.updDaigou(sex, mobile, email, address, weixin, state, id);
		} catch (Exception e) {
			log.error("修改用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}


}
