package com.hyzm.forward.service.dg.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.dg.DaiGouService;
@Service
public class DaiGouServiceImpl extends MessageResponse implements DaiGouService {
	private final Logger log = Logger.getLogger(this.getClass());

	public int AddDaigou(Map<String, String> map) {
		log.info("添加代购");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"DaiGou_AddDaigou");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("添加代购："+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}

}
