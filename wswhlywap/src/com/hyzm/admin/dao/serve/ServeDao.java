package com.hyzm.admin.dao.serve;

import java.util.List;
import java.util.Map;

public interface ServeDao {
	
	/**
	 * 获取服务列表
	 * @param name
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getServeList(String name, String state, int currentPage, int pageSize) throws Exception;
	/**
	 * 获取观摩预约列表
	 * @param name
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getServeLookList(String name, String state, int currentPage, int pageSize) throws Exception;
	
	
	/**
	 * 获取服务数量
	 * @param name
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getServeListNum(String name, String state) throws Exception;
	/**
	 * 获取观摩预约数量
	 * @param name
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getServeLookListNum(String name, String state) throws Exception;
	
	/**
	 * 获取购买服务的用户信息列表
	 * @param serveid
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getUserServeList(long serveid, String username, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取购买服务的用户信息数量
	 * @param serveid
	 * @param state
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public long getUserServeListNum(long serveid, String username, String state) throws Exception;
	
	/**
	 * 添加服务
	 * @param name
	 * @param price
	 * @param period
	 * @param memo
	 * @return
	 * @throws Exception
	 */
	public boolean addServe(String name, double price, String period, String memo) throws Exception;
	
	/**
	 * 关闭/开启服务
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean delServe(long id, int state) throws Exception;
	
	/**
	 * 修改服务
	 * @param id
	 * @param name
	 * @param price
	 * @param period
	 * @param memo
	 * @return
	 * @throws Exception
	 */
	public boolean updServe(long id, String name, double price, String period, String memo) throws Exception;
	
	/**
	 * 添加购买服务的用户信息
	 * @param userid
	 * @param serviceid
	 * @return
	 * @throws Exception
	 */
	public boolean addServeUser(long userid, long serviceid) throws Exception;
	
	/**
	 * 删除购买服务的用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delServeUser(long id) throws Exception;
	
	/**
	 * 修改购买状态
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean updServeUser(long id, int state) throws Exception;
	
	/**
	 * 自动补全服务名称
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoServeName() throws Exception;
	
	/**
	 * 根据名字获取用户
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getUsernameByName(String username) throws Exception;

}
