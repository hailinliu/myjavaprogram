package com.hyzm.admin.service.business;

import java.util.Date;
import java.util.Map;

public interface BusinessService {
	
	/**
     * 获取发票列表
     * @param begindate
     * @param enddate
     * @param username
     * @param issend
     * @param currentPage
     * @param pageSize
     * @return
     */
	public String getInvoiceList(Date begindate, Date enddate,String userid , String username, String issend, int currentPage, int pageSize);
	
	/**
	 * 修改发送状态
	 * @param issend
	 * @param id
	 * @return
	 */
	public boolean updateState(int issend, long id);
	
	/**
	 * 获取订单列表
	 * @param username用户名
	 * @param money金额
	 * @param tradetype交易类型
	 * @param ordernum订单号
	 * @param orderno支付宝订单号
	 * @param paytype网关途径
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getOrderList(String userid ,String username, String money, String tradetype, String ordernum, String orderno, String paytype, int currentPage, int pageSize);
	
	/**
	 * 删除订单
	 * @param id
	 * @return
	 */
	public boolean delOrder(long id);
	
	/**
	 * 获取积分明细列表
	 * @param begindate
	 * @param enddate
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public String getPointList(Date begindate, Date enddate,String userid , String username, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 删除积分明细
	 * @param id
	 * @return
	 */
	public boolean delPoint(long id);
	
	/**
	 * 获取收支明细列表
	 * @param begindate
	 * @param enddate
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public String getMoneyList(Date begindate, Date enddate, String userid ,String username,String tradetype, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 删除收支明细
	 * @param id
	 * @return
	 */
	public boolean delMoney(long id);
	
	/**
	 * 获取线下支付明细列表
	 * @param begindate
	 * @param enddate
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public String getOffLinePayList(Date begindate, Date enddate,String userid , String username, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 线下支付处理
	 * @param userid
	 * @param money
	 * @return
	 * @throws Exception
	 */
	public boolean dealOffLine(long userid, double money) throws Exception;
	
	/**
	 * 改变线下支付处理状态
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean changeState(long id, int state) throws Exception;
	
	/**
	 * 添加用户积分明细
	 * @param userid
	 * @param points
	 * @param type获取与扣除1=获取，2=扣除
	 * @param note
	 * @param leftpoints
	 * @return
	 */
	public boolean addPoints(long userid, int points,int tradetype, int type, String note, int leftpoints);
	
	/**
	 * 添加用户收支明细
	 * @param userid
	 * @param money
	 * @param type获取与扣除1=获取，2=扣除
	 * @param note
	 * @param leftmoney
	 * @return
	 */
	public boolean addMoney(long userid, double money,int tradetype, int type, String note, double leftmoney);
	/**
	 * 导出excel收支明细列表
	 * @param begindate
	 * @param enddate
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @returngetInvoiceList
	 * @throws Exception
	 */
	public Map<String, Object> exportCSV(Date begindate, Date enddate,String userid , String username,String tradetype, String state, int currentPage, int pageSize) throws Exception;
	/**
	 * 导出excel收支明细列表
	 * @param begindate
	 * @param enddate
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @returngetInvoiceList
	 * @throws Exception
	 */
	public Map<String, Object> exportInvoiceCSV(Date begindate, Date enddate,String userid, String username, String issend, int currentPage, int pageSize) throws Exception;
	
}
