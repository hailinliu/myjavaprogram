package com.hyzm.forward.service.mine;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.enroll.CurrentEnrollRespBean.Enroll;
import com.hyzm.bean.enroll.EnrollReqBean.Invoice;

public interface MineService {
	
	/**
	 * 获取积分明细
	 * @param userid
	 * @param year  1=最近一年，2=最近两年，3=最近三年
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyPoints(long userid, String year, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取收支明细
	 * @param userid
	 * @param year  1=最近一年，2=最近两年，3=最近三年
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyMoney(long userid, String year, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取报名历史
	 * @param userid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyApplicationHistory(long userid, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取我的上传/收藏
	 * @param reqtype
	 * @param userid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyCollection(String reqtype, String userid, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取当前报名内容
	 * @return
	 * @throws Exception
	 */
	public Enroll getCurrentEnroll() throws Exception;
	
	/**
	 * 获取已选藏品的id集合
	 * @param userid
	 * @param enrollid
	 * @return
	 * @throws Exception
	 */
	public List<Long> getSelectedCollection(long userid, long enrollid) throws Exception;
	
	/**
	 * 报名
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean EnrollCollection(long bmid, long userid, String mobile, List<Long> collectionid, double money, Invoice invoice) throws Exception;
	
	/**
	 * 上传藏品信息
	 * @param type
	 * @param userid
	 * @param name
	 * @param owner
	 * @param source
	 * @param imgurl
	 * @param memo
	 * @return
	 * @throws Exception
	 */
	public boolean uploadCollectionMsg(int type, long userid, String name, String owner, String source, String imgurl, String memo) throws Exception;
	
	/**
	 * 修改藏品信息
	 * @param id
	 * @param type
	 * @param userid
	 * @param name
	 * @param owner
	 * @param source
	 * @param imgurl
	 * @param memo
	 * @return
	 * @throws Exception
	 */
	public boolean updateCollectionMsg(String id, int type, long userid, String name, String owner, String source, String imgurl, String memo) throws Exception;
	
	/**
	 * 删除藏品信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteUpload(long id) throws Exception;
	
	/**
	 * 线下支付上传凭证
	 * @param userid
	 * @param money
	 * @param imgurl
	 * @return
	 * @throws Exception
	 */
	public boolean payOffLine(long userid, double money, String imgurl) throws Exception;
	
	/**
	 * 收藏藏品
	 * @param userid
	 * @param collectionid
	 * @return
	 * @throws Exception
	 */
	public boolean collect(long userid, long collectionid) throws Exception;
	
	/**
	 * 删除我的收藏
	 * @param userid
	 * @param collectionid
	 * @return
	 * @throws Exception
	 */
	public boolean deleteMyCollection(long userid, long collectionid) throws Exception;
	
	/**
	 * 会员升级
	 * @param userid
	 * @param money
	 * @param viplevel
	 * @param mobile
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean vipUpdate(long userid, double money, String viplevel, String mobile) throws Exception;
	
}
