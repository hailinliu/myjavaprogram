package com.hyzm.syslog.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SyslogDao {
	
	/**
	 * 浏览日志
	 * @param begindate
	 * @param enddate
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSyslogList(Date begindate, Date enddate, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 日志数量
	 * @param begindate
	 * @param enddate
	 * @return
	 * @throws Exception
	 */
	public long getSyslogListNum(Date begindate, Date enddate) throws Exception;
	
	/**
	 * 记录日志
	 * @param opmodel
	 * @param action
	 * @param content
	 * @param result
	 * @param opername
	 * @param ip
	 * @param model
	 * @throws Exception
	 */
	public void addSyslog(String opmodel, String action, String content, String result, String  opername, String ip, int model) throws Exception;

}
