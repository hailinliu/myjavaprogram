package com.hyzm.admin.service.weixin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hyzm.bean.MenuTree;
import com.hyzm.bean.UserInfo;

public interface WeixinService {	
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 */
	public Map<String, Object> getUserById(long id);
	
	/**
	 * 获取用户信息
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public String getUserinfoList(String onesearch, String search, String state,String level,String duibi,String type, int pageSize, int currentPage);	
	
	
     /**
      * 删除
      * @param id
      * @return
      */
	public boolean deleteUser(long id) ;
	
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
	 */
	public boolean addUser(String username, int sex, String mobile, String email, String realname, String idcard,String address,String weixin,String recommend);
	
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
	 */
	public boolean updUser(int sex, String mobile, String email, String realname, String idcard, String address,String adminName,String desction, long id);	
	/**
	 * 导出excel
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param state
	 * @param money
	 * @param level
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public Map<String, Object> exportCSV(String onesearch, String search, String state,String level,String duibi,String type, int pageSize, int currentPage);
	
}
