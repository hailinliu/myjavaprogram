package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoCollectionService;
/**
 * 百宝街--藏品 service实现类
 * @author xjt
 * @createDate 2014年12月16日 09:08:09
 */
@Service
public class BaiBaoCollectionServiceImpl extends MessageResponse implements BaiBaoCollectionService {
	private final Logger log = Logger.getLogger(this.getClass());
	/******************************************************个人中心********************************************************************/
	/**
	 * 添加藏品
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddCollection(Map<String, String> map){
		 log.info("添加藏品");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddCollection");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("添加藏品异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	/**
	 * 修改藏品
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateCollection(Map<String, String> map){
		 log.info("修改藏品");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_UpdateCollection");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("修改藏品异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	/**
	 * 删除藏品  
	 * @param map  根据id单个删除   或者根据userid 批量删除
	 * @return 0：失败  1：成功
	 */
	public int DeleteCollection(Map<String, String> map){
		 log.info("删除藏品");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_DeleteCollection");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("删除藏品异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	
	/******************************************************前台展示********************************************************************/
	
	/**
	 * 专家推荐藏品  
	 * @param map  
	 * @return 0：失败  1：成功
	 */
	public int UpdateCollectionByZj(Map<String, String> map){
		log.info("专家推荐藏品  ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_UpdateCollectionByZj");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("专家推荐藏品  异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据藏品id查询藏品详细信息
	 * @param map  藏品id
	 * @return map
	 */
	public Map<String,Object> getCollection(Map<String, String> map){
		log.info("查询藏品详细信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getCollection");
			return data;
		} catch (Exception e) {
			log.error("查询藏品详细信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 根据用户id   或者店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址   关键字 藏品名称  店铺名称  店主名称  分页查询        。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * @param map 
	 * @return List
	 */
	public Map<String,Object> getCollectionForList(Map<String, String> map){
		log.info("查询藏品");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getCollectionForList");
			return data;
		} catch (Exception e) {
			log.error("查询藏品异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
}
