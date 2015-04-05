package com.wswhly.dao;

import java.util.List;
import java.util.Map;

/**
 * 百宝街--打分选项 dao接口
 * @author xjt
 * @createDate 2014年12月11日 15:56:13
 */
public interface BaiBaoChooseDao {
	
	/**
	 * 查询打分选项
	 * @param map
	 * @return
	 */
	 public List<Map<String,Object>> getChooseForList(Map<String, String> map);

}
