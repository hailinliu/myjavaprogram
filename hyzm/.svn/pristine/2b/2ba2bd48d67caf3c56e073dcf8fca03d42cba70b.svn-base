package com.hyzm.forward.service.flagshop.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.flagshop.FlagshopListRespBean;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.flagshop.FlagShopBaseInfoService;
@Service
public class FlagShopBaseInfoServiceImpl  extends MessageResponse implements FlagShopBaseInfoService {

	private final Logger log = Logger.getLogger(this.getClass());
	
	public Map<String, Object> queryFlagShopBaseInfoById(String id) {
		log.info("查询旗舰商家详细信息 ");
		
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("id", String.valueOf(id));
		
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getFlagShopBaseInfoById");
		} catch (Exception e) {
			log.error("查询旗舰商家详细信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	public Map<String, Object> queryFlagShopBaseInfoList(int pageno,
			int pagesize, String name, String type) {
		log.info("查询旗舰商家基本信息列表");
		
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("pageno", String.valueOf(pageno));
		where.put("pagesize", String.valueOf(pagesize));
		where.put("name", name);
		where.put("type", type);
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getFlagShopBaseInfoList");
		} catch (Exception e) {
			log.error("查询旗舰商家基本信息列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	public Map<String, Object> queryFlagShopBaseInfoNews(int pageno,
			int pagesize, String flagshopbaseinfoid, String style,String recommend)
			throws SQLException {
		log.info("查询旗舰商家咨询信息列表");
		
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("pageno", String.valueOf(pageno));
		where.put("pagesize", String.valueOf(pagesize));
		where.put("flagshopbaseinfoid", flagshopbaseinfoid);
		where.put("style", style);
		where.put("recommend", recommend);
		
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getFlagShopBaseInfoNews");
		} catch (Exception e) {
			log.error("查询旗舰商家咨询信息列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	public Map<String, Object> queryNews(long id) throws SQLException {
		log.info("查询旗舰商家新闻详情");
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("id", String.valueOf(id));
		
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getNews");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	public Map<String, Object> queryNextNews(long id, String style)
			throws SQLException {
		log.info("查询旗舰商家新闻下一条详情");
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("id", String.valueOf(id));
		where.put("style", String.valueOf(style));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getNextNews");
		} catch (Exception e) {
			log.error("查询旗舰商家新闻下一条详情异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

	
	public Map<String, Object> queryPrevNews(long id, String style)
			throws SQLException {
		log.info("查询旗舰商家新闻上一条详情");
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("id", String.valueOf(id));
		where.put("style", String.valueOf(style));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getPrevNews");
		} catch (Exception e) {
			log.error("查询旗舰商家新闻上一条详情异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}


	public Map<String, Object> queryFlagShopBaseInfoByuserId(String userid) {
        log.info("根据用户id查询旗舰商家详细信息 ");		
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("userid", String.valueOf(userid));
		
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getFlagShopBaseInfoByuserId");
		} catch (Exception e) {
			log.error("查询旗舰商家详细信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

}
