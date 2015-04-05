package com.hyzm.forward.service.onlinepic.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.onlinepic.OnlinePicService;
@Service
public class OnlinePicServiceImpl  extends MessageResponse  implements OnlinePicService {
	private final Logger log = Logger.getLogger(this.getClass());
	
	/***********************************************************以下为藏品方法*******************************************************************************/
	//增加藏品
	public int AddOnlinePicColl(Map<String, String> map){
		log.info("添加在线鉴定藏品信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"AddOnlinePicColl");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("添加在线鉴定藏品信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	//修改藏品
	public int UpdateOnlinePicColl(Map<String, String> map){
		log.info("修改在线鉴定藏品信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"UpdateOnlinePicColl");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("修改在线鉴定藏品信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	//查询单个藏品
	public Map<String, Object>  getOnlinePicCollForMap(Map<String, String> map){
		log.info("查询单个在线鉴定藏品信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"getOnlinePicCollForMap");
			return data;
		} catch (Exception e) {
			log.error("查询单个在线鉴定藏品信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	//查询藏品个数
	public int getOnlinePicCollForCount(Map<String, String> map){
		log.info("查询藏品个数");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"getOnlinePicCollForCount");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("查询藏品个数信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	//查询藏品列表
	public Map<String, Object> getOnlinePicCollForList(Map<String, String> map){
		log.info("查询藏品列表信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"getOnlinePicCollForList");
			return data;
		} catch (Exception e) {
			log.error("查询藏品列表信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	
	/***********************************************************以下为图片鉴定藏品类型方法*******************************************************************************/
	//获取藏品类型
	public Map<String, Object> getOnlinePicType(Map<String, String> map){
		log.info("查询获取藏品类型信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"getOnlinePicType");
			return data;
		} catch (Exception e) {
			log.error("获取藏品类型异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	
	/***********************************************************以下为图片鉴定专家方法*******************************************************************************/
	//获取专家
	public Map<String, Object> getOnlinePicProf(Map<String, String> map){
		log.info("获取专家列表信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"getOnlinePicProf");
			return data;
		} catch (Exception e) {
			log.error("获取专家列表信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
