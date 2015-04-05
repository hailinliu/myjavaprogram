package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoImgService;
/**
 * 百宝街--藏品图片 service实现类
 * @author xjt
 * @createDate 2014年12月16日 09:14:42
 */
@Service
public class BaiBaoImgServiceImpl extends MessageResponse implements BaiBaoImgService {
	private final Logger log = Logger.getLogger(this.getClass());
	/**
	 * 添加图片
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddImg(Map<String, String> map){
		 log.info("添加图片");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddImg");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("添加图片异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	/**
	 * 删除图片
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteImg(Map<String, String> map){
		log.info("删除图片");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_DeleteImg");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("删除图片异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 查询图片根据藏品id 
	 * @param map
	 * @return list
	 */
	public Map<String,Object> getImgForList(Map<String, String> map){
		log.info("查询图片根据藏品id");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getImgForList");
			return data;
		} catch (Exception e) {
			log.error("查询图片根据藏品id异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
