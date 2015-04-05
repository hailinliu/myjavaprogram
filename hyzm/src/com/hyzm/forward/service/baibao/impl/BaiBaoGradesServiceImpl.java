package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoGradesService;
/**
 * 百宝街--打分 service实现类
 * @author xjt
 * @createDate 2014年12月16日 09:12:17
 */
@Service
public class BaiBaoGradesServiceImpl extends MessageResponse implements BaiBaoGradesService {
	private final Logger log = Logger.getLogger(this.getClass());
	/**
	 * 添加打分记录
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddGrades(Map<String, String> map){
		log.info("添加打分记录");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddGrades");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("添加打分记录异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 查询打分记录       暂定该方法用处
	 * @param map
	 * @return
	 */
	public Map<String,Object> getGradesForList(Map<String, String> map){
		log.info("查询打分记录 ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getGradesForList");
			return data;
		} catch (Exception e) {
			log.error("查询打分记录 异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}
