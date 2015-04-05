package com.hyzm.admin.dao.index;

import java.util.Map;

public interface IndexDao {
	
	/**
	 * 获取当前报名
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCurrentEnroll() throws Exception;
	
	/**
	 * 获取本期报名信息
	 * @param bmid
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getEnrollInfo(long bmid) throws Exception;

}
