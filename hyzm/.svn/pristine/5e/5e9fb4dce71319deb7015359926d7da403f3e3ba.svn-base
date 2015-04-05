package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaibaoShopService;
/**
 * 百宝街--店铺 service实现类
 * @author xjt
 * @createDate 2014年12月16日 09:18:56
 */
@Service
public class BaibaoShopServiceImpl extends MessageResponse  implements BaibaoShopService {
	private final Logger log = Logger.getLogger(this.getClass());
/******************************************************个人中心********************************************************************/
	
	/**
	* 商家申请
	* @param data
	* @return int  0:失败  1：成功
	*/
	public int AddShop(Map<String, String> map){
		 log.info("商家申请");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddShop");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("商家申请异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	
	/**
	* 修改商家信息
	* @param data
	* @return int 0:失败  1：成功
	*/
	public int UpdateShop(Map<String, String> map){
		 log.info("修改商家信息");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_UpdateShop");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("修改商家信息异常："+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	
	/******************************************************前台展示********************************************************************/
	 
	/**
	 * 根据  藏品种类   详细地址   关键字 （商家名称   店铺名称  手机号  微信号）   分页查询         。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * @param map 
	 * @return List
	 */
	public Map<String,Object> getShopForList(Map<String, String> map){
		log.info("查询商家信息信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getShopForList");
			return data;
		} catch (Exception e) {
			log.error("查询商家信息信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据map 中userid 查询店铺基本信息    或根据店铺id查询基本信息
	 * @param map
	 * @return map
	 */
	public Map<String,Object> getShop(Map<String, String> map){
		log.info("根据中userid 查询店铺基本信息    或根据店铺id查询基本信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getShop");
			return data;
		} catch (Exception e) {
			log.error("根据中userid 查询店铺基本信息    或根据店铺id查询基本信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
