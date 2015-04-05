package com.hyzm.admin.service.vote;

import java.util.Date;
import java.util.Map;


public interface VoteService {
	
	/**
	 * 获取藏品信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionById(long id);
	
	/**
	 * 获取藏品列表
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
	 */
	public String getVoteCollectionList(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String issue, String issuetype, String state, int currentPage, int pageSize);
	
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
	 */
	public String getVipCollectionList(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String state, int currentPage, int pageSize);
	
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
	 */
	public boolean addVoteCollection(int type, String name, String serialnum, long userid, String note, String imgurl, String issue);
	
	/**
	 * 删除藏品信息
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean delVoteCollection(long id, int state);
	
	/**
	 * 修改藏品信息
	 * @param id
	 * @param type
	 * @param name
	 * @param note
	 * @param imgurl
	 * @param issue
	 * @return
	 */
	public boolean updVoteCollection(long id, int type, String name, String note, String imgurl, String issue);
	
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
	 */
	public String getActivityBmList(String cycle, String title, Date begindate, Date enddate, String type, String state, int currentPage, int pageSize);
	
	/**
	 * 添加活动报名
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @return
	 */
	public boolean addBm(long cycle, String title, String content, Date begindate, Date enddate, int type);
	
	/**
	 * 删除活动报名
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean delBm(long id, int state);
	
	/**
	 * 修改活动报名
	 * @param id
	 * @param cycle
	 * @param title
	 * @param content
	 * @param begindate
	 * @param enddate
	 * @return
	 */
	public boolean updBm(long id, long cycle, String title, String content, Date begindate, Date enddate);

}
