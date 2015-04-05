package com.hyzm.forward.service.baibao;

import java.util.List;
import java.util.Map;

/**
 * 百宝街--打分 service接口
 * @author xjt
 * @createDate 2014年12月16日 08:52:38
 */
public interface BaiBaoGradesService {
	
	/**
	 * 添加打分记录
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddGrades(Map<String, String> map);
	
	/**
	 * 查询打分记录       暂定该方法用处
	 * @param map
	 * @return
	 */
	public Map<String,Object> getGradesForList(Map<String, String> map);
}
