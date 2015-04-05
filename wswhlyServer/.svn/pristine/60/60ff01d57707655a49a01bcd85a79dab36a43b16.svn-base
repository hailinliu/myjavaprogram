package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wswhly.bean.tool.GetJobsRespBean;

public interface ToolDao {

	public long addSmsSend(String mobile, String content, String state, int times, String backtime, String accountcount) throws SQLException;

	public boolean addVerifyCode(String mobile, long smsid, String code) throws SQLException;
	
	public Map<String,Object> querySms(String type) throws SQLException;
	
	public List<GetJobsRespBean.Job> queryJobs() throws SQLException;
	
	public Map<String, Object> queryVersion() throws SQLException;
	public int getcountBYmobile(String mobile,int time,String content);
}
