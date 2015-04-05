package com.hyzm.forward.service.vote.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.vote.ActivityInfoReqBean;
import com.hyzm.bean.vote.ActivityInfoRespBean;
import com.hyzm.bean.vote.ActivityListReqBean;
import com.hyzm.bean.vote.ActivityListRespBean;
import com.hyzm.bean.vote.ActivityListRespBean.Activity;
import com.hyzm.bean.vote.ActivityDelReqBean;
import com.hyzm.bean.vote.ActivityNoteReqBean;
import com.hyzm.bean.vote.ActivityReqBean;
import com.hyzm.bean.vote.CurrentActivityReqBean;
import com.hyzm.bean.vote.CurrentActivityRespBean;
import com.hyzm.bean.vote.VoteInfoReqBean;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.vote.VoteService;

@Service
public class VoteServiceImpl extends MessageResponse implements VoteService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	@Override
	public List<Activity> getActivityAllList() throws Exception {
		log.info("华豫上传列表");
		List<Activity> list = null;
		try {
			ActivityListReqBean vote = new ActivityListReqBean();
			vote.setPageno(1);
			vote.setPagesize(8);
			list = ((ActivityListRespBean)getMessageResponse(vote, new ActivityListRespBean(), "ActivityAllList")).getList();
		} catch (Exception e) {
			log.error("列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Activity>():list;
	}
	
	@Override
	public MessageRespBean activityDel(long id) throws Exception {
		log.info("删除藏品信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			ActivityDelReqBean reqBean = new ActivityDelReqBean();
			reqBean.setId(id);
			respBean = getMessageResponse(reqBean, "ActivityDel");
		} catch (Exception e) {
			log.error("异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}
	
	public Map<String, Object> getMyCollection(long userid, int currentPage,
			int pageSize) throws Exception {
		log.info("获取我的上传/收藏");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ActivityListReqBean collection = new ActivityListReqBean();
			
			collection.setUserid(userid);
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
			ActivityListRespBean respBean = (ActivityListRespBean) getMessageResponse(collection, new ActivityListRespBean(), "ActivityCollectionList");
			map.put("count", respBean.getCount());
			map.put("list", respBean.getList()==null?new ArrayList<Activity>():respBean.getList());
		} catch (Exception e) {
			log.error("获取我的上传/收藏异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<Activity> getActivityList(long userid) throws Exception {
		log.info("华豫列表");
		List<Activity> list = null;
		try {
			ActivityListReqBean activity = new ActivityListReqBean();
			activity.setUserid(userid);
			list = ((ActivityListRespBean)getMessageResponse(activity, new ActivityListRespBean(), "ActivityList")).getList();
		} catch (Exception e) {
			log.error("获取旗舰商家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Activity>():list;
	}
	
	@Override
	public MessageRespBean updateActivityInfo(ActivityReqBean info)
			throws Exception {
		log.info("修改华豫信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "Activity");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public MessageRespBean activityInfo(ActivityReqBean info)
			throws Exception {
		log.info("新增上传信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "Activity");
		} catch (Exception e) {
			log.error("异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}
	
	@Override
	public MessageRespBean voteInfo(VoteInfoReqBean info)
			throws Exception {
		log.info("新增投票信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "VoteInfo");
		} catch (Exception e) {
			log.error("异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public List<Activity> getVoteInfoList() throws Exception {
		log.info("列表投票");
		List<Activity> list = null;
		try {
			ActivityListReqBean vote = new ActivityListReqBean();
			vote.setPageno(1);
			vote.setPagesize(8);
			list = ((ActivityListRespBean)getMessageResponse(vote, new ActivityListRespBean(), "VoteListindex")).getList();
		} catch (Exception e) {
			log.error("列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Activity>():list;
	}

	@Override
	public List<Activity> getVoteList(long userid,long collectionid) throws Exception {
		log.info("投票列表");
		List<Activity> list = null;
		try {
			ActivityListReqBean activity = new ActivityListReqBean();
			activity.setUserid(userid);
			//activity.setCollectionid(collectionid);
			list = ((ActivityListRespBean)getMessageResponse(activity, new ActivityListRespBean(), "VoteList")).getList();
		} catch (Exception e) {
			log.error("获取旗舰商家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Activity>():list;
	}
	
	@Override
	public MessageRespBean updateVoteInfo(VoteInfoReqBean info)
			throws Exception {
		log.info("修改投票信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "updateVoteList");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public MessageRespBean updateActivityInfo(long id) throws Exception {
		log.info("获取藏品");
		MessageRespBean respBean = new MessageRespBean();
		try {
			ActivityInfoReqBean activity = new ActivityInfoReqBean();
			//activity.setId(id);
			
			respBean = getMessageResponse(activity, "updateActivityInfo");
		} catch (Exception e) {
			log.error("获取藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public Map<String, Object> getActivitiesList(int pageno, int pagesize,
			long issue, String order, String type) throws Exception {
		log.info("获取“我要上华豫投票藏品列表”");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ActivityListReqBean activity = new ActivityListReqBean();
			activity.setIssue(issue);
			activity.setOrder(order);
			activity.setType(type);
			activity.setPageno(pageno);
			activity.setPagesize(pagesize);
			ActivityListRespBean respBean = ((ActivityListRespBean)getMessageResponse(activity, new ActivityListRespBean(), "ActivityList"));
			map.put("list", respBean.getList()==null?new ArrayList<Activity>():respBean.getList());
			map.put("count", respBean.getCount());
		} catch (Exception e) {
			log.error("获取列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	@Override
	public Map<String, Object> getMyActivitiesList(int pageno, int pagesize, long userid, String order, String type) throws Exception {
		log.info("获取我上传的藏品");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ActivityListReqBean activity = new ActivityListReqBean();
			activity.setUserid(userid);
			activity.setOrder(order);
			activity.setType(type);
			activity.setPageno(pageno);
			activity.setPagesize(pagesize);
			ActivityListRespBean respBean = ((ActivityListRespBean)getMessageResponse(activity, new ActivityListRespBean(), "ActivityList"));
			map.put("list", respBean.getList()==null?new ArrayList<Activity>():respBean.getList());
			map.put("count", respBean.getCount());
		} catch (Exception e) {
			log.error("获取列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public long getCurrentActivity(String type) throws Exception {
		log.info("获取当前期");
		long issue = 0;
		try {
			CurrentActivityReqBean reqBean = new CurrentActivityReqBean();
			reqBean.setType(type);
			CurrentActivityRespBean respBean = (CurrentActivityRespBean) getMessageResponse(reqBean, new CurrentActivityRespBean(), "CurrentActivity");
			issue = respBean.getIssue();
		} catch (Exception e) {
			log.error("获取当前期异常："+e.getMessage());
		}
		return issue;
	}

	@Override
	public long getCurrentActivitycycle(String type) throws Exception {
		log.info("获取上一期");
		long issue = 0;
		try {
			CurrentActivityReqBean reqBean = new CurrentActivityReqBean();
			reqBean.setType(type);
			CurrentActivityRespBean respBean = (CurrentActivityRespBean) getMessageResponse(reqBean, new CurrentActivityRespBean(), "CurrentActivitycycle");
			issue = respBean.getIssue();
		} catch (Exception e) {
			log.error("获取上一期异常："+e.getMessage());
		}
		return issue;
	}

	@Override
	public Activity getActivity(long id) throws Exception {
		log.info("获取“我要上华豫藏品”");
		Activity activity = null;
		try {
			ActivityInfoReqBean reqBean = new ActivityInfoReqBean();
			reqBean.setId(id);
			ActivityInfoRespBean respBean = (ActivityInfoRespBean) getMessageResponse(reqBean, new ActivityInfoRespBean(), "ActivityInfo");
			activity = respBean.getActivity();
		} catch (Exception e) {
			log.error("获取藏品异常："+e.getMessage());
			e.printStackTrace();
			return new ActivityListRespBean().new Activity();
		}
		return activity;
	}

	@Override
	public MessageRespBean vote(long userid, long collectionid)
			throws Exception {
		MessageRespBean respBean = new MessageRespBean();
		try {
			VoteInfoReqBean reqBean = new VoteInfoReqBean();
			reqBean.setUserid(userid);
			reqBean.setCollectionid(collectionid);
			respBean = getMessageResponse(reqBean, "VoteInfo");
		} catch (Exception e) {
			log.error("“我要上华豫”投票异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public MessageRespBean updateNote(long id, String note) throws Exception {
		MessageRespBean respBean = new MessageRespBean();
		try {
			ActivityNoteReqBean reqBean = new ActivityNoteReqBean();
			reqBean.setId(id);
			reqBean.setNote(note);
			respBean = getMessageResponse(reqBean, "ActivityNote");
		} catch (Exception e) {
			log.error("修改补充藏品介绍异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

}
