package com.hyzm.admin.service.yc.impl;

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

import com.hyzm.admin.dao.yc.ActionDao;
import com.hyzm.admin.dao.yc.SpecialDao;
import com.hyzm.admin.service.yc.ActionService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class ActionServiceImpl implements ActionService{
	
	private final Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private ActionDao dao;
	
	@Autowired
	private SpecialDao sdao;
	
	public String getActionList(Date begindate, Date enddate,
			String auctionname, String state, int currentPage, int pageSize) {
		log.info("获取拍卖会列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getActionListNum(begindate, enddate, auctionname, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class,
					new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getActionList(begindate, enddate, auctionname, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取拍卖会列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addAction(String auctionname, String actiontime,
			long ins_id, String place, String specialnumber,
			String totalnumber, int state, String previewtime,
			String previewaddress) {
		log.info("添加拍卖会");
		try {
			return dao.addAction(auctionname, actiontime, ins_id, place, specialnumber, totalnumber, state, previewtime, previewaddress);
		} catch (Exception e) {
			log.error("添加拍卖会异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}


	public boolean updAction(long id, String auctionname, String actiontime,
			long ins_id, String place, String specialnumber,
			String totalnumber, int state, String previewtime,
			String previewaddress) {
		log.info("修改拍卖会");
		try {
			return dao.updAction(id, auctionname, actiontime, ins_id, place, specialnumber, totalnumber, state, previewtime, previewaddress);
		} catch (Exception e) {
			log.error("修改拍卖会异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getActionById(long id) {
		log.info("获取拍卖会");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getActionById(id);
		} catch (Exception e) {
			log.error("获取拍卖会异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public String getaction(String ins_id) {
		List<Map<String, Object>> listmap;
		try {
			listmap = dao.getActionList(null, null, ins_id, "", 1, 1000000);
			return JSONArray.fromObject(listmap).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public boolean addSpecial(String specialname, String time, int actionid, String address, String totalnum) throws Exception {
		log.info("添加专场");
		try {
			return sdao.addSpecial(specialname, time, actionid, address, totalnum);
		} catch (Exception e) {
			log.error("添加专场异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getSpecialList(Date begindate, Date enddate, String specialname, String actionid, int currentPage, int pageSize) throws Exception {
		log.info("获取专场列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = sdao.getSpecialListNum(begindate, enddate, specialname, actionid);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class,
					new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = sdao.getSpecialList(begindate, enddate, specialname, actionid, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取专场列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getspecial(String actionid) {
		List<Map<String, Object>> listmap;
		try {
			listmap = sdao.getSpecialList(null, null, "", actionid, 1, 100000);
			return JSONArray.fromObject(listmap).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
