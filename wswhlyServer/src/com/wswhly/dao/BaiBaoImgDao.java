package com.wswhly.dao;

import java.util.List;
import java.util.Map;

/**
 * 百宝街--藏品图片 dao接口
 * @author xjt
 * @createDate 2014年12月11日 17:22:09
 */
public interface BaiBaoImgDao {
	/**
	 * 添加图片
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddImg(Map<String, String> map);
	
	/**
	 * 删除图片
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteImg(Map<String, String> map);
	
	/**
	 * 查询图片     根据藏品id 
	 * @param map
	 * @return list
	 */
	public List<Map<String,Object>> getImgForList(Map<String, String> map);
}
