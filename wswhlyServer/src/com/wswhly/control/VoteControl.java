package com.wswhly.control;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.vote.ActivityDelReqBean;
import com.wswhly.bean.vote.ActivityInfoReqBean;
import com.wswhly.bean.vote.ActivityInfoRespBean;
import com.wswhly.bean.vote.ActivityListReqBean;
import com.wswhly.bean.vote.ActivityListRespBean;
import com.wswhly.bean.vote.ActivityNoteReqBean;
import com.wswhly.bean.vote.ActivityReqBean;
import com.wswhly.bean.vote.CurrentActivityReqBean;
import com.wswhly.bean.vote.CurrentActivityRespBean;
import com.wswhly.bean.vote.VoteInfoReqBean;
import com.wswhly.dao.VoteDao;
import com.wswhly.util.StringUtil;

@Controller
public class VoteControl{

	private static final Logger logger = Logger.getLogger(VoteControl.class);
	
	@Autowired
	private VoteDao VoteDao;//注入报名DAO
	/**
	 * 华豫上传信息
	 */
	@RequestMapping("/Activity")
	public void Activity(HttpServletRequest request,HttpServletResponse response){
		ActivityReqBean activityReqBean = (new Gson()).fromJson(request.getAttribute("data").toString(), ActivityReqBean.class);
		try{
			/*if(activityReqBean.getIssue() == 0l){
				request.setAttribute("resultjson",StringUtil.Error("0001", "期数错误"));
				return ;
			}*/

			if (activityReqBean.getId() == 0) {
				List<String> list = VoteDao.queryActivityCount(activityReqBean.getIssue(),activityReqBean.getUserid());
				if(list.size() > 0){
					if(activityReqBean.getIssue() == 0){
						if(list.size()>=Integer.valueOf(activityReqBean.getUserlevel())*2){
							request.setAttribute("resultjson",StringUtil.Error("0001", "对不起，您发布的藏品数量已达上限。"));
							return;
						}
					}
					if(list.get(0) != null && list.get(0).equals("2") && list.size()>=5){
						request.setAttribute("resultjson",StringUtil.Error("0001", "您本期已发布5件藏品，请您下期再行参与。"));
						return ;
					}
				}
				VoteDao.addActivityInfo(activityReqBean);
			} else {
				VoteDao.updActivityInfo(activityReqBean);
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("ActivityInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	@RequestMapping("/ActivityDel")
	public void ActivityDel(HttpServletRequest request,HttpServletResponse response) {
		ActivityDelReqBean reqBean = (new Gson()).fromJson(request.getAttribute("data").toString(), ActivityDelReqBean.class);
		try {
			VoteDao.delActivityInfo(reqBean.getId());
			request.setAttribute("resultjson",StringUtil.Success(""));
		} catch (Exception e) {
			logger.error("ActivityInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	@RequestMapping("/ActivityInfo")
	public void ActivityInfo(HttpServletRequest request,HttpServletResponse response){
		ActivityInfoReqBean activityInfoReqBean = (new Gson()).fromJson(request.getAttribute("data").toString(), ActivityInfoReqBean.class);
		ActivityInfoRespBean activityInfoRespBean = new ActivityInfoRespBean();
		try{
			activityInfoRespBean.setActivity(VoteDao.queryActivity(activityInfoReqBean.getId()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(activityInfoRespBean)));
		}catch (Exception e) {
			logger.error("ActivityInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	
	/**
	 * 获取所有上传List
	 */
	@RequestMapping("/ActivityList")
	public void ActivityCollectionList(HttpServletRequest request,HttpServletResponse response){
		ActivityListReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ActivityListReqBean.class);
		ActivityListRespBean collectionresp = new ActivityListRespBean();
		try{
			if(collectionreq.getUserid() == 0l){
				if(collectionreq.getIssue() == 0){
					collectionresp.setCount(VoteDao.queryVipActivityListCount());
					collectionresp.setList(VoteDao.queryVipActivityList(collectionreq.getPageno(), collectionreq.getPagesize()));
				}else{
					if(collectionreq.getOrder() == null ||  collectionreq.getOrder().equals(""))
						collectionreq.setOrder("2");
					if(collectionreq.getType() == null || collectionreq.getType().equals(""))
						collectionreq.setType("2");
					collectionresp.setCount(VoteDao.queryActivityListCount(collectionreq.getIssue()));
					collectionresp.setList(VoteDao.queryActivityList(collectionreq.getIssue(), collectionreq.getOrder(), collectionreq.getPageno(), collectionreq.getPagesize()));		
				}
			}else{
				if(collectionreq.getIssue() == 0){
					if (collectionreq.getType().equals("4")) {
						collectionresp.setCount(VoteDao.queryMyVipListCount(collectionreq.getUserid()));
						collectionresp.setList(VoteDao.queryMyVipList(collectionreq.getUserid(), collectionreq.getPageno(), collectionreq.getPagesize()));
					} else {
						collectionresp.setCount(VoteDao.queryMyActivityListCount(collectionreq.getUserid(),collectionreq.getType()));
						collectionresp.setList(VoteDao.queryMyActivityList(collectionreq.getUserid(), collectionreq.getType(), collectionreq.getPageno(), collectionreq.getPagesize()));		
					}
				}else{
					
				}
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("ActivityCollectionList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 投票信息
	 */
	@RequestMapping("/VoteInfo")
	public void VoteInfo(HttpServletRequest request,HttpServletResponse response){
		VoteInfoReqBean VoteInfoReqBean = (new Gson()).fromJson(request.getAttribute("data").toString(), VoteInfoReqBean.class);
		try{
			long userid = VoteInfoReqBean.getUserid();
			long collectionid = VoteInfoReqBean.getCollectionid();
			if(VoteDao.queryIsVote(userid, collectionid)){
				request.setAttribute("resultjson",StringUtil.Error("0001", "已经投过票了"));
				return ;
			}
			VoteDao.addVoteInfo(userid, collectionid);
			VoteDao.updateActivityVote(collectionid);
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("VoteInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 华豫上传信息
	 */
	@RequestMapping("/CurrentActivity")
	public void CurrentActivity(HttpServletRequest request,HttpServletResponse response){
		CurrentActivityReqBean currentReqBean = (new Gson()).fromJson(request.getAttribute("data").toString(), CurrentActivityReqBean.class);
		CurrentActivityRespBean currentRespBean = new CurrentActivityRespBean();
		try{
			if(currentReqBean.getType() == null || currentReqBean.getType().equals(""))
				currentReqBean.setType("2");
			Long issue = VoteDao.queryCurrentActivity(currentReqBean.getType());
			if(issue == null)
				currentRespBean.setIssue(0l);
			else
				currentRespBean.setIssue(issue);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(currentRespBean)));
		}catch (Exception e) {
			logger.error("ActivityInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 上一期
	 */
	@RequestMapping("/CurrentActivitycycle")
	public void CurrentActivitycycle(HttpServletRequest request,HttpServletResponse response){
		CurrentActivityReqBean currentReqBean = (new Gson()).fromJson(request.getAttribute("data").toString(), CurrentActivityReqBean.class);
		CurrentActivityRespBean currentRespBean = new CurrentActivityRespBean();
		try{
			if(currentReqBean.getType() == null || currentReqBean.getType().equals(""))
				currentReqBean.setType("2");
			Long issue = VoteDao.queryActivitycycle(currentReqBean.getType());
			if(issue == null)
				currentRespBean.setIssue(0l);
			else
				currentRespBean.setIssue(issue);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(currentRespBean)));
		}catch (Exception e) {
			logger.error("ActivityInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 华豫补充信息
	 */
	@RequestMapping("/ActivityNote")
	public void ActivityNote(HttpServletRequest request,HttpServletResponse response){
		ActivityNoteReqBean activityNotereq = (new Gson()).fromJson(request.getAttribute("data").toString(), ActivityNoteReqBean.class);
		try{
			VoteDao.updateActivityNote(activityNotereq.getId(), activityNotereq.getNote());
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("ActivityInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
}
