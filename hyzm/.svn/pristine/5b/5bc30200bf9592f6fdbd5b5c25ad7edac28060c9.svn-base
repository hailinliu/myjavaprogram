package com.hyzm.forward.service.baibao;

import java.util.List;
import java.util.Map;

/**
 * 百宝街--关注 service接口
 * @author xjt
 * @createDate 2014年12月16日 08:52:20
 */
public interface BaiBaoAttentionService {
	/******************************************************个人中心********************************************************************/
	
	/**
	 * 添加关注
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddAttention(Map<String, String> map);
	
	/**
	 * 删除关注
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteAttention(Map<String, String> map);
	
	
	
	/******************************************************前台展示********************************************************************/
	
//	/**
//	 * 根据藏品id 用户id 查询     该方法可以用于判断用户是否已经关注过该藏品
//	 * @param map
//	 * @return
//	 */
//	public Map<String,Object> getAttention(Map<String, String> map);
	
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据用户id   或藏品id  。。。。等 分页查询
	 * @param map
	 * @return List
	 */
	public Map<String,Object> getAttentionForList(Map<String, String> map);
	

}
