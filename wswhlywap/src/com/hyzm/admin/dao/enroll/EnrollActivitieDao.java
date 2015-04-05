package com.hyzm.admin.dao.enroll;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface EnrollActivitieDao {
	
	/**
	 * 获取报名活动列表
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEnrollActiveList(Date begindate, Date enddate, String name, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取报名活动数量
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getEnrollActiveListNum(Date begindate, Date enddate, String name) throws Exception;
	
	/**
	 * 获取对应用户报名列表
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEnrollActiveInfoList(Date begindate, Date enddate, String username, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取对应用户报名列表(csv)
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEnrollActiveInfoList(Date begindate, Date enddate, String username) throws Exception;
	
	/**
	 * 获取对应用户报名数量
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public long getEnrollActiveInfoListNum(Date begindate, Date enddate,String username) throws Exception;
	
}
