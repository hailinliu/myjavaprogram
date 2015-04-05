package com.hyzm.admin.service.enroll;

import java.util.Date;
import java.util.Map;

public interface EnrollService {
	
	/**
	 * 获取报名活动列表
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getEnrollList(Date begindate, Date enddate, String state, int currentPage, int pageSize);
	
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
	public String getEnrollInfoList(Date begindate, Date enddate, long enrollid, String username, int currentPage, int pageSize);
	
	/**
	 * 添加报名活动
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @param validdate
	 * @return
	 */
	public boolean addEnroll(long cycle, String title, String content, Date begindate, Date enddate, Date validdate);
	
	/**
	 * 开启/关闭报名活动
	 * @param state
	 * @param id
	 * @return
	 */
	public boolean onOrOffEnroll(long id, int state);
	
	/**
	 * 修改报名活动
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @param validdate
	 * @param id
	 * @return
	 */
	public boolean editEnroll(long cycle, String title, String content, Date begindate, Date enddate, Date validdate, long id);
	
	/**
	 * 通过报名记录信息获取用户报名藏品
	 * @param bmid
	 * @return
	 */
	public String getCollectionsByBmid(long bmid);
	
	/**
	 * 导出csv
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> exportCSV(Date begindate, Date enddate, long enrollid, String username) throws Exception;

}
