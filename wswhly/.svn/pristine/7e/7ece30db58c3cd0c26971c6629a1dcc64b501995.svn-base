package com.hyzm.admin.service.lylots;

import java.util.Date;
import java.util.Map;

public interface LylotsService {
	/**
	 * 获取拍品列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	
	public String getLylotsList(Date begindate, Date enddate, String specialID, String lynumber, String name,  String username,String userid, String state, int currentPage, int pageSize);
	/**
	 * 通过id获取拍品
	 * @param id
	 * @return
	 */
	public Map<String, Object> getLylotsById(long id);
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
	 */
	public boolean updLylots(long id, int specialID, String name,String image,String qpprice,String pricearea,String taobaourl,String trialcomments,String reviewcomments,
			String cjprice,String adminname, String record, String suggest);
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
	 */
	public boolean updstate(long id,  int state);
/**
 * 修改专家评论
 * @param id
 * @param trialcomments
 * @return
 * @throws Exception
 */
	public boolean updzjlots(long id, String trialcomments,String sczjid,String trialexperts) throws Exception;
	/**
	 * 获取专家拍品
	 * @param begindate
	 * @param enddate
	 * @param lynumber
	 * @param name
	 * @param zjid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getLylotsList(Date begindate, Date enddate, String lynumber, String name, String zjid, int currentPage, int pageSize);
	/**
	 * 导出
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
	 */
	public Map<String, Object> exportCSV(Date begindate, Date enddate,String specialID, String lynumber, String name, String username,String userid, String state, int currentPage, int pageSize); 
	/**
	 * 专家导出
	 * @param begindate
	 * @param enddate
	 * @param lynumber
	 * @param name
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> ZjexportCSV(Date begindate, Date enddate, String lynumber, String name, String zjid, int currentPage, int pageSize); 
}
