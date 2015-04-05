package com.hyzm.forward.service.vote;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.vote.ActivityListRespBean.Activity;
import com.hyzm.bean.vote.ActivityReqBean;
import com.hyzm.bean.vote.VoteInfoReqBean;

public interface VoteService {
	/**
	 * 上传华豫藏品信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean activityInfo(ActivityReqBean info) throws Exception;
	
	/**
	 * 删除藏品信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean activityDel(long id) throws Exception;
	
	/**
	 * 根据userid判断
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<Activity> getActivityList(long userid) throws Exception;
	
	
	
	/**
	 * 获取列表
	 * @return
	 * @throws Exception
	 */
	public List<Activity> getActivityAllList() throws Exception;
	/**
	 * 修改信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean updateActivityInfo(ActivityReqBean info) throws Exception;

	/**
	 * 更新投票数
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean updateActivityInfo(long id) throws Exception;

	
	/**
	 * 投票信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean voteInfo(VoteInfoReqBean info) throws Exception;
	/**
	 * 根据userid判断投票
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<Activity> getVoteList(long userid,long collectionid) throws Exception;
	/**
	 * 获取投票列表
	 * @return
	 * @throws Exception
	 */
	public List<Activity> getVoteInfoList() throws Exception;
	/**
	 * 修改信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean updateVoteInfo(VoteInfoReqBean info) throws Exception;
	
	/**
	 * 获取我的上传/收藏
	 * @param reqtype
	 * @param userid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyCollection(long userid, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取“我要上华豫投票藏品列表”
	 * @param pageno
	 * @param pagesize
	 * @param issue
	 * @param order
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getActivitiesList(int pageno, int pagesize, long issue, String order, String type) throws Exception;
	
	/**
	 * 获取我上传的藏品
	 * @param pageno
	 * @param pagesize
	 * @param userid
	 * @param order
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getMyActivitiesList(int pageno, int pagesize, long userid, String order, String type) throws Exception;
	
	/**
	 * 获取当前期
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public long getCurrentActivity(String type) throws Exception;
	
	/**
	 * 获取“我要上华豫藏品”
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Activity getActivity(long id) throws Exception;
	
	/**
	 * “我要上华豫”投票
	 * @param userid
	 * @param collectionid
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean vote(long userid, long collectionid) throws Exception;
	
	/**
	 * 修改补充藏品介绍
	 * @param id
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean updateNote(long id, String note) throws Exception;
	
}
