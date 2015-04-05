package com.hyzm.admin.dao.yc;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ActionDao {
	/**
	 * 获取拍卖会列表
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getActionList(Date begindate,Date enddate,String auctionname,String state,int currentPage,int pageSize) throws Exception;
	
	/**
	 * 获取拍卖会数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param owner
	 * @param username
	 * @param isAction
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getActionListNum(Date begindate,Date enddate,String auctionname,String state) throws Exception;
	
	/**
	 * 添加拍卖会
	 * @param type
	 * @param name
	 * @param serialnum
	 * @param userid
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 * @throws Exception
	 */
	public boolean addAction(String auctionname,String actiontime,long ins_id,String place,String specialnumber,String totalnumber,int state,String previewtime,String previewaddress) throws Exception;
	

	
	/**
	 * 修改拍卖会
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
	public boolean updAction(long id,String auctionname,String actiontime,long ins_id,String place,String specialnumber,String totalnumber,int state,String previewtime,String previewaddress) throws Exception;
	
	/**
	 * 通过id获得拍卖会
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getActionById(long id) throws Exception;
	
}
