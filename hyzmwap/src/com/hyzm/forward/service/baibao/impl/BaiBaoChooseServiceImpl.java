package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoChooseService;
@Service
public class BaiBaoChooseServiceImpl extends MessageResponse implements BaiBaoChooseService {
	private final Logger log = Logger.getLogger(this.getClass());
	
	/**
	 * 查询打分选项
	 * @param map
	 * @return
	 */
	public Map<String, Object> getChooseForList(Map<String, String> map) {
		log.info("查询打分选项");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getChooseForList");
			return data;
		} catch (Exception e) {
			log.error("查询打分选项异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
