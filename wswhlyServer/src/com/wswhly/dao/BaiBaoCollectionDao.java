package com.wswhly.dao;

import java.util.List;
import java.util.Map;

/**
 * 百宝街--藏品 dao接口
 * @author xjt
 * @createDate 2014年12月11日 15:14:05
 */
public interface BaiBaoCollectionDao {
	/******************************************************个人中心********************************************************************/
	/**
	 * 添加藏品
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddCollection(Map<String, String> map);
	
	/**
	 * 修改藏品
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateCollection(Map<String, String> map);
	
	/**
	 * 删除藏品  
	 * @param map  根据id单个删除   或者根据userid 批量删除
	 * @return 0：失败  1：成功
	 */
	public int DeleteCollection(Map<String, String> map);
	
	
	/******************************************************前台展示********************************************************************/
	
	/**
	 * 专家推荐藏品  
	 * @param map  
	 * @return 0：失败  1：成功
	 */
	public int UpdateCollectionByZj(Map<String, String> map);
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据藏品id查询藏品详细信息
	 * @param map  藏品id
	 * @return map
	 */
	public Map<String,Object> getCollection(Map<String, String> map);
	
	/**
	 * 根据用户id   或者店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址   关键字 藏品名称  店铺名称  店主名称  分页查询        。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * @param map 
	 * @return List
	 */
	public List<Map<String,Object>> getCollectionForList(Map<String, String> map);
	
	/**
	 * 根据用户id   或者店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址  关键字 藏品名称  店铺名称  店主名称   查询总数        。。。。。。。 条件不确定 
	 * @param map 
	 * @return int 总数
	 */
	public int getCollectionForCount(Map<String, String> map);
}
