package com.hyzm.forward.service.lylots.impl;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.lylots.lyService;


@Service
public class lyServiceImpl extends MessageResponse implements lyService{
	private final Logger log = Logger.getLogger(this.getClass());
	@Override
	public Map<String, Object> getlylots(String specialID, String pricearea,
			String ly, String userid, int currentPage, int pageSize)
			throws Exception {
		log.info("获取拍品列表");
		Map<String,Object> data =new HashMap<String, Object>();
		Map<String,String> where =new HashMap<String, String>();
		where.put("specialID",specialID );
		where.put("pricearea",pricearea );
		where.put("ly",ly );
		where.put("userid", userid);
		where.put("pageno", String.valueOf(currentPage));
		where.put("pagesize",String.valueOf(pageSize));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getlylots");
		} catch (Exception e) {
			log.error("获取拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public Map<String, Object> getlylotsById(String id) throws Exception {
		log.info("获取拍品详情");
		Map<String,Object> data =new HashMap<String, Object>();
		Map<String,String> where =new HashMap<String, String>();
		where.put("id",id );
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getlylotsById");
		} catch (Exception e) {
			log.error("获取拍品详情异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

}
