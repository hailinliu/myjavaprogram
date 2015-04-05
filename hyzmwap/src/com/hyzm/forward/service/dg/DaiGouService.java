package com.hyzm.forward.service.dg;

import java.util.Map;

public interface DaiGouService {
	/**
	 * 添加代购
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddDaigou(Map<String, String> map);
}
