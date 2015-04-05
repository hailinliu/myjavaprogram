package com.hyzm.admin.service.email;

import java.util.Date;

public interface EmailService {
	
	/**
	 * 获取邮件列表
	 * @param mobile
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getEmailList(String mailaddress,Date begindate, Date enddate, String state, int currentPage,int pageSize);
	
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
	public long addEmailSend(final String mailaddress,final String content,final String state,final String subject,final String files);
	

}
