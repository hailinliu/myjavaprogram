package com.hyzm.admin.dao.daigou;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 系统管理数据库操作接口
 * @author Administrator
 *
 */
public interface DaigouDao {
		
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getDaigouById(long id) throws Exception;
	
	
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
	public List<Map<String, Object>> getDaigouinfoList(Date begindate, Date enddate,String name, String mobile,String state,int pageSize, int currentPage) throws Exception;
	
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
	public long getDaigouinfoListNum(Date begindate, Date enddate,String name, String mobile,String state) throws Exception;
	
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
	public boolean updDaigou(int sex, String mobile, String email, String address,String weixin,int state, long id) throws Exception;
	

}
