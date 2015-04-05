package com.hyzm.admin.service.business.impl;

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

import com.hyzm.admin.dao.business.BusinessDao;
import com.hyzm.admin.service.business.BusinessService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class BusinessServiceImpl implements BusinessService {
	
private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BusinessDao dao;

	public String getInvoiceList(Date begindate, Date enddate,String userid , String username, String issend,
			int currentPage, int pageSize) {
		log.info("获取发票列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getInvoiceListNum(begindate, enddate,userid, username, issend);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getInvoiceList(begindate, enddate,userid, username, issend, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取发票列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean updateState(int issend, long id) {
		log.info("修改发票状态");
		try {
			return dao.updateState(issend, id);
		} catch (Exception e) {
			log.error("修改发票状态异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getOrderList(String userid ,String username, String money, String tradetype, String ordernum, String orderno, String paytype, int currentPage, int pageSize) {
		log.info("获取订单列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getOrderListNum(userid,username, money, tradetype, ordernum, orderno, paytype);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getOrderList(userid,username, money, tradetype, ordernum, orderno, paytype, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取订单列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public boolean delOrder(long id) {
		log.info("删除订单");
		try {
			return dao.delOrder(id);
		} catch (Exception e) {
			log.error("删除订单异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public String getPointList(Date begindate, Date enddate,String userid, String username,
			String state, int currentPage, int pageSize) throws Exception {
		log.info("获取积分明细列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getPointListNum(begindate, enddate,userid, username, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getPointList(begindate, enddate, userid,username, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取积分明细列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public boolean delPoint(long id) {
		log.info("删除积分明细");
		try {
			return dao.delPoint(id);
		} catch (Exception e) {
			log.error("删除积分明细异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getMoneyList(Date begindate, Date enddate,String userid, String username,String tradetype,
			String state, int currentPage, int pageSize) throws Exception {
		log.info("获取收支明细列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getMoneyListNum(begindate, enddate,userid, username,tradetype, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getMoneyList(begindate, enddate,userid, username,tradetype, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取收支明细列表异常"+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public boolean delMoney(long id) {
		log.info("删除收支明细");
		try {
			return dao.delMoney(id);
		} catch (Exception e) {
			log.error("删除收支明细异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getOffLinePayList(Date begindate, Date enddate,
			String userid,String username, String state, int currentPage, int pageSize)
			throws Exception {
		log.info("获取线下支付明细列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getOffLinePayListNum(begindate, enddate,userid, username, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getOffLinePayList(begindate, enddate,userid, username, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取线下支付明细列表异常"+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean dealOffLine(long userid, double money) throws Exception {
		log.info("线下支付处理");
		try {
			return dao.dealOffLine(userid, money);
		} catch (Exception e) {
			log.error("线下支付处理异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean changeState(long id, int state) throws Exception {
		log.info("改变线下支付处理状态");
		try {
			return dao.changeState(id, state);
		} catch (Exception e) {
			log.error("改变线下支付处理状态异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean addPoints(long userid, int points,int tradetype, int type, String note,
			int leftpoints) {
		log.info("添加用户积分明细");
		try {
			return dao.addPoints(userid, points,tradetype, type, note, leftpoints);
		} catch (Exception e) {
			log.error("添加用户积分明细异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean addMoney(long userid, double money, int tradetype,int type, String note,
			double leftmoney) {
		log.info("添加用户收支明细");
		try {
			return dao.addMoney(userid, money, tradetype,type, note, leftmoney);
		} catch (Exception e) {
			log.error("添加用户收支明细异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> exportCSV(Date begindate, Date enddate,
			String userid,String username,String tradetype, String state, int currentPage, int pageSize)
			throws Exception {
		log.info("获取导出收支明细列表");
		Map<String, Object> map =null;
		try {
			map = new HashMap<String, Object>();
			List<Map<String, Object>> listmap = dao.getMoneyList(begindate, enddate, userid,username,tradetype, state, currentPage, pageSize);
			for(int i =0;i< listmap.size();i++){
		           Map<String, Object> mapdata= listmap.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   
					    if(entry.getKey().equals("note")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }
		     }
			}
			map.put("moneyList", listmap==null?new ArrayList<Map<String, Object>>():listmap);
		} catch (Exception e) {
			log.error("获取导出收支明细列表异常"+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> exportInvoiceCSV(Date begindate, Date enddate,String userid,
			String username, String issend, int currentPage, int pageSize)
			throws Exception {
		log.info("获取导出收支明细列表");
		Map<String, Object> map =null;
		try {
			map = new HashMap<String, Object>();
			List<Map<String, Object>> listmap = dao.getInvoiceList(begindate, enddate,userid, username, issend, currentPage, pageSize);
			for(int i =0;i< listmap.size();i++){
		           Map<String, Object> mapdata= listmap.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					    if(entry.getKey().equals("note")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else  if(entry.getKey().equals("invoicename")){
					    	if(entry.getValue().equals("请输入姓名或单位名称") || entry.getValue()==null ){
					    		entry.setValue("");
					    	}
					  }else  if(entry.getKey().equals("recipient")){
					    	if(entry.getValue()==null || entry.getValue().equals("请输入收件人")){
					    		entry.setValue("");
					    	}
					  }else  if(entry.getKey().equals("mobile")){
					    	if(entry.getValue()==null || entry.getValue().equals("请输入电话号码")){
					    		entry.setValue("");
					    	}
					  }else  if(entry.getKey().equals("address")){
					    	if(entry.getValue()==null ||entry.getValue().equals("请输入邮件地址")){
					    		entry.setValue("");
					    	}
					  }else  if(entry.getKey().equals("code") ){
					    	if(entry.getValue()=="" || entry.getValue().equals("请输入邮编")){
					    		entry.setValue("");
					    	}
					  }
		     }
			}
			map.put("invoicList", listmap==null?new ArrayList<Map<String, Object>>():listmap);
		} catch (Exception e) {
			log.error("获取导出收支明细列表异常"+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

}
