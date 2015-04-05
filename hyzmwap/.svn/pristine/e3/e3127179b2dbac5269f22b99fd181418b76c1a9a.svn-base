package com.hyzm.forward.service.baibao;

import java.util.List;
import java.util.Map;

/**
 * 百宝街--交易中转 service接口
 * @author xjt
 * @createDate 2014年12月16日 08:53:08
 */
public interface BaiBaoTransferService {
	/**
	 * 支付交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int PayTransfer(Map<String, String> map);
	/**
	 * 添加交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddTransfer(Map<String, String> map);
	
	
	/**
	 * 修改交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateTransfer(Map<String, String> map);
	
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
	public Map<String,Object> getTransferForList(Map<String, String> map);
	
	/**
	 * 查询单个结果
	 * @param map
	 * @return
	 */
	public Map<String,Object>getTransfer(Map<String, String> map);
}
