package com.wswhly.dao;
import java.util.List;
import java.util.Map;

/**
 * 百宝街--店铺 dao接口
 * @author xjt
 * @createDate 2014年12月11日 14:49:17
 */
public interface BaibaoShopDao {

	
	/******************************************************个人中心********************************************************************/
	
	/**
	* 商家申请
	* @param data
	* @return int  0:失败  1：成功
	*/
	public int AddShop(Map<String, String> map);
	
	
	/**
	* 修改商家信息
	* @param data
	* @return int 0:失败  1：成功
	*/
	public int UpdateShop(Map<String, String> map);
	
	
	/******************************************************前台展示********************************************************************/
	 
	/**
	 * 根据  藏品种类   详细地址   关键字 （商家名称   店铺名称  手机号  微信号）   分页查询         。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * @param map 
	 * @return List
	 */
	public List<Map<String,Object>> getShopForList(Map<String, String> map);
	
	
	/**
	 * 根据  藏品种类   详细地址   关键字 （商家名称   店铺名称  手机号  微信号） 最新  最热（点击量）     查询 总数  。。。。。。。 条件不确定 
	 * @param map
	 * @return int  返回总数
	 */
	public int getShopForCount(Map<String, String> map);
	
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据map 中userid 查询店铺基本信息    或根据店铺id查询基本信息
	 * @param map
	 * @return map
	 */
	public Map<String,Object> getShop(Map<String, String> map);

}
