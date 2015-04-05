package com.hyzm.admin.service.daigou;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hyzm.bean.MenuTree;
import com.hyzm.bean.UserInfo;

public interface DaigouService {

	
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 */
	public Map<String, Object> getDaigouById(long id);
	
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
	public String getDaigouinfoList(Date begindate, Date enddate, String name, String mobile,String state, int pageSize, int currentPage);

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
	public boolean updDaigou(int sex, String mobile, String email,String address,String weixin, int state, long id);
	
}
