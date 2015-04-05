package com.hyzm.admin.dao.email;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 藏品数据库操作接口
 * @author Administrator
 *
 */
public interface EmailDao {
	
	/**
	 * 获取邮件列表
	 * @param mobile
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEmailList(String mailaddress, Date begindate, Date enddate, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取邮件数量
	 * @param mobile
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getEmailListNum(String mailaddress, Date begindate, Date enddate, String state) throws Exception;
	
	/**
	 * 发送邮件
	 * @param mobile
	 * @param content
	 * @param state
	 * @param times
	 * @param backtime
	 * @param accountcount
	 * @return
	 * @throws SQLException
	 */
	public long addEmailSend(final String mailaddress, final String content, final String state, final String subject, final String files) throws SQLException;
	


}
