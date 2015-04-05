package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoAttentionService;
@Service
public class BaiBaoAttentionServiceImpl extends MessageResponse  implements BaiBaoAttentionService {
	private final Logger log = Logger.getLogger(this.getClass());

/******************************************************个人中心********************************************************************/
	
	/**
	 * 添加关注
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddAttention(Map<String, String> map){
	    log.info("添加关注");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddAttention");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("添加关注异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 删除关注
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteAttention(Map<String, String> map){
		 log.info("删除关注");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_DeleteAttention");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("删除关注异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据用户id   或藏品id  。。。。等 分页查询
	 * @param map
	 * @return List
	 */
	public Map<String,Object> getAttentionForList(Map<String, String> map){
		log.info("查询关注");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getAttentionForList");
			return data;
		} catch (Exception e) {
			log.error("查询关注异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	


}
