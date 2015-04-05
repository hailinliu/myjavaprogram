package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoTransferService;
/**
 * 百宝街--交易中转 service实现类
 * @author xjt
 * @createDate 2014年12月16日 09:22:42
 */
@Service
public class BaiBaoTransferServiceImpl  extends MessageResponse   implements BaiBaoTransferService {
	private final Logger log = Logger.getLogger(this.getClass());
	/**
	 * 添加交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddTransfer(Map<String, String> map){
		log.info("添加交易中转信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddTransfer");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("添加交易中转信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 修改交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateTransfer(Map<String, String> map){
		log.info("修改交易中转信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_UpdateTransfer");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("修改交易中转信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 删除交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteTransfer(Map<String, String> map){
		log.info("删除交易中转信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_DeleteTransfer");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("删除交易中转信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * 根据买方id  或者卖方id  等 查询交易中转   分页查询
	 * @param map
	 * @return list
	 */
	public Map<String,Object> getTransferForList(Map<String, String> map){
		log.info("查询交易中转信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getTransferForList");
			return data;
		} catch (Exception e) {
			log.error("查询交易中转信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	public int PayTransfer(Map<String, String> map) {
		log.info("支付交易中转信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_PayTransfer");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("支付交易中转信息异常："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}

	public Map<String, Object> getTransfer(Map<String, String> map) {
		log.info("查询单个交易中转信息");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getTransfer");
			return data;
		} catch (Exception e) {
			log.error("查询单个交易中转信息异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
