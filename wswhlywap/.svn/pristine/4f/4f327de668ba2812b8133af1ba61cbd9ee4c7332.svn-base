package com.hyzm.admin.service.enroll;

import java.util.Date;
import java.util.Map;

public interface EnrollActivitieService {
	
	/**
	 * 获取报名活动列表
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getEnrollActiveList(Date begindate, Date enddate, String name, int currentPage, int pageSize);
	
	/**
	 * 获取对应用户报名列表
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getEnrollActiveInfoList(Date begindate, Date enddate,  String username, int currentPage, int pageSize);
	/**
	 * 导出csv
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> exportCSV(Date begindate, Date enddate, String username) throws Exception;

}
