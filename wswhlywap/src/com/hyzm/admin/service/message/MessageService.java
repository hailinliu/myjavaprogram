package com.hyzm.admin.service.message;

import java.util.Date;
import java.util.Map;

public interface MessageService {
	
	/**
	 * 获取短信列表
	 * @param mobile
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getMessageList(String mobile, Date begindate, Date enddate, String state, int currentPage, int pageSize);
	
	/**
	 * 发送短信
	 * @param mobile
	 * @param content
	 * @param state
	 * @param times
	 * @param backtime
	 * @param accountcount
	 * @return
	 */
	public long addSmsSend(final String mobile, final String content, final String state, final int times, final String backtime, final String accountcount);
	
	/**
	 * 获取收费会员的通知短信
	 * @return
	 */
	public String getVipMessageList();
	
	/**
	 * 修改收费会员的通知短信
	 * @param id
	 * @param content
	 * @return
	 */
	public boolean editVipMessage(long id, String content);
	/**
	 * 查询回访
	 * @param map
	 * @return
	 */
	public String gethfMessageList(Map<String, String> map) ;
	/**
	 * 添加回访
	 * @param map
	 * @return
	 */
	public boolean addhfMessage(Map<String, String> map);
    /**
     * 回访状态
     * @param map
     * @return
     */
	public boolean editIshuif(Map<String, String> map);


	
	
}
