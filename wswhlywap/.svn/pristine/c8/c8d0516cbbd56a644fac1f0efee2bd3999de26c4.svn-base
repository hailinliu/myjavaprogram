package com.hyzm.admin.service.baibao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface BaibaoCollectionService {
	/**
	 * 获取藏品列表
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
	
	public String getBaibaoCollectionList(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state, int currentPage, int pageSize);
	/**
	 * 通过id获取藏品
	 * @param id
	 * @return
	 */
	public Map<String, Object> getBaibaoCollectionById(long id);
	/**
	 * 修改藏品
	 * @param id
	 * @param type
	 * @param name
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 */
	public boolean updBaibaoCollection(long id,String name,String imgurl,String price,String advertisement,int isagree,String note);
	/**
	 * 添加
	 * @param id
	 * @param name
	 * @param username
	 * @param imgurl
	 * @param price
	 * @param advertisement
	 * @param isagree
	 * @param state
	 * @param note
	 * @return
	 */
	public boolean addBaibaoCollection(long id,String name,String username,String imgurl,String price,String advertisement,int isagree,int state,String note);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean delBaibaoCollection(long id);
	/**
	 * 修改状态
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean editcollectionsate(long id,int state);
	/**
	 * 导出
	 * @param begindate
	 * @param enddate
	 * @param specialID
	 * @param baibaonum
	 * @param name
	 * @param username
	 * @param userid
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> exportCSV(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state, int currentPage, int pageSize); 


	/**
	 * 获取交易列表
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
	public String getBaibaoTrabsferList(Date begindate, Date enddate, String shopname, String name, String username,String userid, String state, int currentPage, int pageSize);
	
	/**
	 * 修改交易状态
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
	public boolean updBaibaoTrabsferstate(long id,int state,String version);
	/**
	 * 修改交易
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
	public boolean updBaibaoTrabsfer(long id,String version ,String couriernumber,String starttime,String paytime,
			String txmjfhtime,String dddqtime,String deliverytime,String wfhtime,String kdgs,
			String syspaytime,String applyreturntime,String thkdgs,String thmjqrtime,String dkdmftime,
			String consigneemobile, String consignee, String consigneeaddress,String thcouriernumber,
			String thconsigneemobile, String thconsignee, String thconsigneeaddress,int state);


	/**
	 * 通过id获得
	 * @param id
	 * @throws Exception
	 */
	public Map<String, Object> getBaibaoTrabsferById(long id,String version ) ;
}
