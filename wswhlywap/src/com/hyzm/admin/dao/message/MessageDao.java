package com.hyzm.admin.dao.message;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface MessageDao {
	
	/**
	 * 获取短信列表
	 * @param mobile
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getMessageList(String mobile, Date begindate, Date enddate, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取短信数量
	 * @param mobile
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getMessageListNum(String mobile, Date begindate, Date enddate, String state) throws Exception;
	
	/**
	 * 发送短信
	 * @param mobile
	 * @param content
	 * @param state
	 * @param times
	 * @param backtime
	 * @param accountcount
	 * @return
	 * @throws SQLException
	 */
	public long addSmsSend(final String mobile, final String content, final String state, final int times, final String backtime, final String accountcount) throws SQLException;
	
	/**
	 * 获取收费会员的通知短信
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getVipMessageList() throws Exception;
	
	/**
	 * 修改收费会员的通知短信
	 * @param id
	 * @param content
	 * @return
	 * @throws Exception
	 */
	public boolean editVipMessage(long id, String content) throws Exception;
	
	/**
	 * 查询回复
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> gethfMessageList(Map<String,String> map);
	
	/**
	 * 查询回复数量
	 * @param map
	 * @return
	 */
	public  long gethfMessageListNum(Map<String,String> map);
	
	/**
	 * 添加回复信息
	 * @return
	 */
	public boolean addhfMessage(Map<String,String> map);
	/**
	 * 回访状态控制
	 * @param map
	 * @return
	 */
	public boolean editIshuif(Map<String,String> map);


}
