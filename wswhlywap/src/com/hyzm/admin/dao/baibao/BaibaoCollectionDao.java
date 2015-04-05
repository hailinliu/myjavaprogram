package com.hyzm.admin.dao.baibao;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface BaibaoCollectionDao {
	/**
	 * 获取藏品列表
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
	public List<Map<String, Object>> getBaibaoCollectionList(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取藏品数量
	 * @param begindate
	 * @param enddate
	 * @param name
	 * @param username
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getBaibaoCollectionListNum(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state) throws Exception;
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
	 * @throws Exception
	 */
	public boolean updBaibaoCollection(long id,String name,String imgurl,String price,String advertisement,int isagree,String note) throws Exception;
	/**
	 * 
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean editcollectionsate(long id,int state) throws Exception;
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
     * @throws Exception
     */
	public boolean addBaibaoCollection(long id,String name,String username,String imgurl,String price,String advertisement,int isagree,int state,String note) throws Exception;
	/**
	 * 删除
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delBaibaoCollection(long id) throws Exception;
	/**
	 * 通过id获得
	 * @param id
	 * @throws Exception
	 */
	public Map<String, Object> getBaibaoCollectionById(long id) throws Exception ;

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
	public List<Map<String, Object>> getBaibaoTrabsferList(Date begindate, Date enddate, String shopname, String name, String username,String userid, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取交易数量
	 * @param begindate
	 * @param enddate
	 * @param name
	 * @param username
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getBaibaoTrabsferListNum(Date begindate, Date enddate, String shopname, String name,String username,String userid, String state) throws Exception;
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
	public boolean updBaibaoTrabsferstate(long id,int state,String version) throws Exception;
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
			String thconsigneemobile, String thconsignee, String thconsigneeaddress,int state) throws Exception;

	/**
	 * 通过id获得
	 * @param id
	 * @throws Exception
	 */
	public Map<String, Object> getBaibaoTrabsferById(long id,String version ) throws Exception ;

}
