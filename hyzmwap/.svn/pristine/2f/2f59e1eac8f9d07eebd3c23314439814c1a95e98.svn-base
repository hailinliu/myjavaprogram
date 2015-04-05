package com.hyzm.forward.service.baibao;
import java.util.List;
import java.util.Map;

/**
 * 百宝街--店铺 service接口
 * @author xjt
 * @createDate 2014年12月16日 08:52:50
 */
public interface BaibaoShopService {

	
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
	public Map<String,Object> getShopForList(Map<String, String> map);
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据map 中userid 查询店铺基本信息    或根据店铺id查询基本信息
	 * @param map
	 * @return map
	 */
	public Map<String,Object> getShop(Map<String, String> map);

}
