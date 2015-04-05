package com.hyzm.admin.dao.lylots;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface LylotsDao {
	/**
	 * 获取拍品列表
	 * @param begindate
	 * @param enddate
	 * @param name
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getLylotsList(Date begindate, Date enddate, String specialID, String lynumber, String name,  String username,String userid, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取拍品数量
	 * @param begindate
	 * @param enddate
	 * @param name
	 * @param username
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getLylotsListNum(Date begindate, Date enddate, String specialID, String lynumber, String name,  String username,String userid, String state) throws Exception;
	/**
	 * 修改拍品
	 * @param id
	 * @param type
	 * @param name
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 * @throws Exception
	 */
	public boolean updLylots(long id, int specialID, String name,String image,String qpprice,String pricearea,String taobaourl,String trialcomments,String reviewcomments,
		String cjprice,String adminname, String record, String suggest) throws Exception;
	/**
	 * 通过id获得
	 * @param id
	 * @throws Exception
	 */
	public Map<String, Object> getLylotsById(long id) throws Exception ;
	/**
	 * 修改状态
	 * @param id
	 * @param type
	 * @param name
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 * @throws Exception
	 */
	public boolean updstate(long id, int state) throws Exception;
	/**
	 * 专家修改评论
	 * @param id
	 * @param type
	 * @param name
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 * @throws Exception
	 */
	public boolean updzjlots(long id, String trialcomments,String sczjid,String trialexperts) throws Exception;	
	/**
	 * 专家拍品
	 * @param begindate
	 * @param enddate
	 * @param specialID
	 * @param lynumber
	 * @param name
	 * @param username
	 * @param userid
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getZJlotsList(Date begindate, Date enddate,  String lynumber, String name,	String zjid, int currentPage, int pageSize) throws Exception;
	/**
	 * 获取拍品数量
	 * @param begindate
	 * @param enddate
	 * @param name
	 * @param username
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getZJlotsListNum(Date begindate, Date enddate, String lynumber, String name, String zjid ) throws Exception;
}
