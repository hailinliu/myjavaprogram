package com.hyzm.syslog.service;

import java.util.Date;

public interface SyslogService {
	
	/**
	 * 浏览日志
	 * @param begindate
	 * @param enddate
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getSyslogList(Date begindate, Date enddate, int currentPage, int pageSize);
	
	/**
	 * 记录日志
	 * @param opmodel
	 * @param action
	 * @param content
	 * @param result
	 * @param opername
	 * @param ip
	 * @param model
	 */
	public void addSyslog(String opmodel, String action, String content, String result, String opername, String ip, int model);

}
