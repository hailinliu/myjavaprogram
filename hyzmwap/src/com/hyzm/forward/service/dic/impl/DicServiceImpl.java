package com.hyzm.forward.service.dic.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.dic.DicService;
@Service
public class DicServiceImpl extends MessageResponse  implements DicService {
	private final Logger log = Logger.getLogger(this.getClass());

	//	根据父级id查询 下面的地区
	public Map<String, Object> getDicaddress(int parentcode) throws Exception {
		log.info("根据父级id查询 下面的地区");
		Map<String,Object> data =new HashMap<String, Object>();
		Map<String,String> where =new HashMap<String, String>();
		where.put("parentcode", String.valueOf(parentcode));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getDicaddress");
		} catch (Exception e) {
			log.error("根据父级id查询 下面的地区异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

}
