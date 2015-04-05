package com.hyzm.admin.dao.enroll;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface EnrollDao {
	
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
	public List<Map<String, Object>> getEnrollList(Date begindate, Date enddate, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取报名活动数量
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getEnrollListNum(Date begindate, Date enddate, String state) throws Exception;
	
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
	public List<Map<String, Object>> getEnrollInfoList(Date begindate, Date enddate, long enrollid, String username, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取对应用户报名列表(csv)
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEnrollInfoList(Date begindate, Date enddate, long enrollid, String username) throws Exception;
	
	/**
	 * 获取对应用户报名数量
	 * @param begindate
	 * @param enddate
	 * @param enrollid
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public long getEnrollInfoListNum(Date begindate, Date enddate, long enrollid, String username) throws Exception;
	
	/**
	 * 添加报名活动
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @param validdate
	 * @return
	 * @throws Exception
	 */
	public boolean addEnroll(long cycle, String title, String content, Date begindate, Date enddate, Date validdate) throws Exception;
	
	/**
	 * 开启/关闭报名活动
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean onOrOffEnroll(long id, int state) throws Exception;
	
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
	 * @throws Exception
	 */
	public boolean editEnroll(long cycle, String title, String content, Date begindate, Date enddate, Date validdate, long id) throws Exception;
	
	/**
	 * 通过报名记录信息获取用户报名藏品信息
	 * @param bmid
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCollectionsByBmid(long bmid) throws Exception;
	
	/**
	 * 获取报名活动
	 * @param id
	 * @return
	 */
	public Map<String, Object> getEnrollById(long id);

}
