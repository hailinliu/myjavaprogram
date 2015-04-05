package com.hyzm.admin.dao.vote;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface VoteDao {
	
	/**
	 * 获取藏品信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionById(long id) throws Exception;
	
	/**
	 * 获取我要上华豫/藏品征集令列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param issue
	 * @param issuetype
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getVoteCollectionList(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String issue, String issuetype, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取我要上华豫/藏品征集令数量
	 * @param type
	 * @param name
	 * @param issue
	 * @param issuetype
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getVoteCollectionListNum(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String issue, String issuetype, String state) throws Exception;
	
	/**
	 * 获取会员藏品区列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getVipCollectionList(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取会员藏品区数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getVipCollectionListNum(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String state) throws Exception;
	
	/**
	 * 添加藏品信息
	 * @param type
	 * @param name
	 * @param serialnum
	 * @param userid
	 * @param note
	 * @param imgurl
	 * @param issue
	 * @return
	 * @throws Exception
	 */
	public boolean addVoteCollection(int type, String name, String serialnum, long userid, String note, String imgurl, String issue) throws Exception;
	
	/**
	 * 删除藏品信息
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean delVoteCollection(long id, int state) throws Exception;
	
	/**
	 * 修改藏品信息
	 * @param id
	 * @param type
	 * @param name
	 * @param note
	 * @param imgurl
	 * @param issue
	 * @return
	 * @throws Exception
	 */
	public boolean updVoteCollection(long id, int type, String name, String note, String imgurl, String issue) throws Exception;
	
	/**
	 * 获取活动报名列表
	 * @param cycle
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getActivityBmList(String cycle, String title, Date begindate, Date enddate, String type,String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取活动报名数量
	 * @param cycle
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getActivityBmListNum(String cycle, String title, Date begindate, Date enddate, String type, String state) throws Exception;
	
	/**
	 * 添加活动报名
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public boolean addBm(long cycle, String title, String content, Date begindate, Date enddate, int type) throws Exception;
	
	/**
	 * 删除活动报名
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean delBm(long id, int state) throws Exception;
	
	/**
	 * 修改活动报名
	 * @param id
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @return
	 * @throws Exception
	 */
	public boolean updBm(long id, long cycle, String title, String content, Date begindate, Date enddate) throws Exception;

}
