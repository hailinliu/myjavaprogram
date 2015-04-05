package com.wswhly.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.video.VideoInfoReqBean;
import com.wswhly.bean.video.VideoInfoRespBean;
import com.wswhly.bean.video.VideoListReqBean;
import com.wswhly.bean.video.VideoListRespBean;
import com.wswhly.dao.VideoDao;
import com.wswhly.util.StringUtil;

@Controller
public class VideoControl {


	private static final Logger logger = Logger.getLogger(VideoControl.class);
	
	@Autowired
	private VideoDao videodao;
	
	/**
	 * 获取视频列表
	 */
	@RequestMapping("/VideoList")
	public void VideoList(HttpServletRequest request,HttpServletResponse response){
		VideoListReqBean videoreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VideoListReqBean.class);
		VideoListRespBean videoresp = new VideoListRespBean();
		try{
			videoresp.setCount(videodao.queryVideoCount(videoreq.getVideotype()));
			videoresp.setList(videodao.queryVideo(videoreq.getVideotype(),videoreq.getPageno(), videoreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(videoresp)));
		}catch (Exception e) {
			logger.error("VideoList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取视频列表
	 */
	@RequestMapping("/VideoListIndex")
	public void VideoListIndex(HttpServletRequest request,HttpServletResponse response){
		VideoListReqBean videoreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VideoListReqBean.class);
		VideoListRespBean videoresp = new VideoListRespBean();
		try{
			videoresp.setCount(videodao.queryVideoCount(videoreq.getVideotype()));
			videoresp.setList(videodao.queryVideoIndex(videoreq.getVideotype(),videoreq.getPageno(), videoreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(videoresp)));
		}catch (Exception e) {
			logger.error("queryVideoIndex Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取视频详情
	 */
	@RequestMapping("/VideoInfo")
	public void VideoInfo(HttpServletRequest request,HttpServletResponse response){
		VideoInfoReqBean videoreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VideoInfoReqBean.class);
		VideoInfoRespBean videoresp = new VideoInfoRespBean();
		try{
			videodao.updateClicknum(videoreq.getId());
			videoresp.setVideo(videodao.queryVideo(videoreq.getId()));
			videoresp.setPrevVideo(videodao.queryPrevVideo(videoreq.getId()));
			videoresp.setNextVideo(videodao.queryNextVideo(videoreq.getId()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(videoresp)));
		}catch (Exception e) {
			logger.error("VideoInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
