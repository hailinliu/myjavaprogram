package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 百宝街--交易中转 dao接口
 * @author xjt
 * @createDate 2014年12月11日 16:04:28
 */
public interface BaiBaoTransferDao {
	
	/**
	 * 添加交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddTransfer(Map<String, String> map);
	/**
	 * 查询余额
	 * @param userid
	 * @return
	 */
	public double queryMoney(long userid) ;
	
	/**
	 * 修改交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateTransfer(Map<String, String> map);
	/**
	 * 修改积分
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int addpoint(Map<String,Object> data);
	/**
	 * 修改明细
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int addusermoney(Map<String,Object> data);
	/**
	 * 添加订单
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int addOrder(Map<String,Object> data);
	/**
	 * 修改用户余额
	 * @param where
	 * @return
	 */
	public int updatemoney(Map<String,Object> map);
	
	/**
	 * 删除交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteTransfer(Map<String, String> map);
	
	/**
	 * 根据买方id  或者卖方id  等 查询交易中转   分页查询
	 * @param map
	 * @return list
	 */
	public List<Map<String,Object>> getTransferForList(Map<String, String> map);
	
	/**
	 * 根据买方id  或者卖方id  等 查询交易中转   总数
	 * @param map
	 * @return int  总数
	 */
	public int getTransferForCount(Map<String, String> map);
	
	/**
	 * 查询单个结果
	 * @param map
	 * @return
	 */
	public Map<String,Object>getTransfer(Map<String, String> map);

}
