package com.hyzm.admin.service.serve;

import java.util.Map;

public interface ServeService {
	
	/**
	 * 获取服务列表
	 * @param name
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public String getServeList(String name, String state, int currentPage, int pageSize);
	
	/**
	 * 获取观摩预约列表
	 * @param name
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public String getServeLookList(String name, String mobile, int currentPage, int pageSize);
	
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
	public String getUserServeList(long serveid, String username, String state, int currentPage, int pageSize);
	
	/**
	 * 添加服务
	 * @param name
	 * @param price
	 * @param period
	 * @param memo
	 * @return
	 * @throws Exception
	 */
	public boolean addServe(String name, double price, String period, String memo);
	
	/**
	 * 关闭/开启服务
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean delServe(long id, int state);
	
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
	public boolean updServe(long id, String name, double price, String period, String memo);
	
	/**
	 * 添加购买服务的用户信息
	 * @param userid
	 * @param serviceid
	 * @return
	 * @throws Exception
	 */
	public boolean addServeUser(long userid, long serviceid);
	
	/**
	 * 删除购买服务的用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delServeUser(long id);
	
	/**
	 * 修改购买状态
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean updServeUser(long id, int state);
	
	/**
	 * 自动补全服务名称
	 * @return
	 * @throws Exception
	 */
	public String autoServeName();
	
	/**
	 * 获取用户信息
	 * @param username
	 * @return
	 */
	public Map<String, Object> getUsernameByName(String username);

}
