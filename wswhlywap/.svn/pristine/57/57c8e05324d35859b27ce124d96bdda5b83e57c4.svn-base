package com.hyzm.admin.service.yc;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ActionService {
	/**
	 * 获取拍卖会列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param owner
	 * @param username
	 * @param isAction
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getActionList(Date begindate,Date enddate, String auctionname,String state,int currentPage,int pageSize);
	
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
	 */
	public boolean addAction(String auctionname,String actiontime,long ins_id,String place,String specialnumber,String totalnumber,int state,String previewtime,String previewaddress);

	
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
	 */
	public boolean updAction(long id,String auctionname,String actiontime,long ins_id,String place,String specialnumber,String totalnumber,int state,String previewtime,String previewaddress);

	/**
	 * 通过id获取拍卖会
	 * @param id
	 * @return
	 */
	public Map<String, Object> getActionById(long id);
	
	public String getaction(String ins_id);
	
	
	
	
	
	
	/**
	 * 获取专场列表
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public String getSpecialList(Date begindate,Date enddate,String specialname,String actionid,int currentPage,int pageSize) throws Exception;
	
	
	/**
	 * 添加专场
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
	public boolean addSpecial(String specialname,String time,int actionid,String address,String totalnum) throws Exception;
	
	public String getspecial(String actionid);
}
