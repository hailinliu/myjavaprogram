package com.hyzm.admin.dao.weixin;

import java.util.List;
import java.util.Map;

/**
 * 系统管理数据库操作接口
 * @author Administrator
 *
 */
public interface WeixinDao {	
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getUserById(long id) throws Exception;
	
	/**
	 * 获取用户列表
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param adminName
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getUserinfoList(String onesearch, String search, String state,String level,String duibi,String type,int pageSize, int currentPage) throws Exception;
	
	/**
	 * 获取用户数量
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getUserinfoListNum(String onesearch, String search, String state,String level,String duibi,String type) throws Exception;
   

	/**
	 * 删除用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteUser(long id) throws Exception;		
	
	/**
	 * 添加用户信息
	 * @param username
	 * @param password
	 * @param sex
	 * @param mobile
	 * @param email
	 * @param realname
	 * @param idcard
	 * @param job
	 * @param address
	 * @return
	 * @throws Exception
	 */
	public boolean addUser(String username, int sex,
			String mobile, String email, String realname, String idcard, String address,String weixin, String recommend) throws Exception;
	
	/**
	 * 修改用户信息
	 * @param sex
	 * @param mobile
	 * @param email
	 * @param realname
	 * @param idcard
	 * @param job
	 * @param address
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean updUser(int sex, String mobile, String email, String realname, String idcard, String address,String adminName,String desction, long id) throws Exception;	
}
