package com.hyzm.forward.service.video.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.video.VideoInfoReqBean;
import com.hyzm.bean.video.VideoInfoRespBean;
import com.hyzm.bean.video.VideoListReqBean;
import com.hyzm.bean.video.VideoListRespBean;
import com.hyzm.bean.video.VideoListRespBean.Video;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.video.VideoService;

@Service
public class VideoServiceImpl extends MessageResponse implements VideoService {
	
	private final Logger log = Logger.getLogger(this.getClass());

	public List<Video> getVideoList() throws Exception {
		log.info("获取视频列表");
		List<Video> list = new ArrayList<Video>();
		try {
			VideoListReqBean video = new VideoListReqBean();
			video.setPageno(1);
			video.setPagesize(4);
			VideoListRespBean respBean = (VideoListRespBean) getMessageResponse(video, new VideoListRespBean(), "VideoList");
			list = respBean.getList();
		} catch (Exception e) {
			log.error("获取视频列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Video> getVideoListIndex() throws Exception {
		log.info("获取视频列表");
		List<Video> list = new ArrayList<Video>();
		try {
			VideoListReqBean video = new VideoListReqBean();
			video.setPageno(1);
			video.setPagesize(4);
			VideoListRespBean respBean = (VideoListRespBean) getMessageResponse(video, new VideoListRespBean(), "VideoListIndex");
			list = respBean.getList();
		} catch (Exception e) {
			log.error("获取视频列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> getVideoList(String videotype,int currentPage, int pageSize)
			throws Exception {
		log.info("获取视频列表");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			VideoListReqBean video = new VideoListReqBean();
			video.setPageno(currentPage);
			video.setPagesize(pageSize);
			video.setVideotype(videotype);
			VideoListRespBean respBean = (VideoListRespBean) getMessageResponse(video, new VideoListRespBean(), "VideoList");
			map.put("count", respBean.getCount());
			map.put("list", respBean.getList());
		} catch (Exception e) {
			log.error("获取视频列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Video> getVideoById(long id) throws Exception {
		log.info("获取视频");
		Map<String, Video> map = new HashMap<String, Video>();
		try {
			VideoInfoReqBean video = new VideoInfoReqBean();
			video.setId(id);
			VideoInfoRespBean respBean = (VideoInfoRespBean) getMessageResponse(video, new VideoInfoRespBean(), "VideoInfo");
			Video pre = respBean.getPrevVideo();
			Video v = respBean.getVideo();
			Video next = respBean.getNextVideo();
			map.put("pre", pre==null?new VideoListRespBean().new Video():pre);
			map.put("video", v==null?new VideoListRespBean().new Video():v);
			map.put("next", next==null?new VideoListRespBean().new Video():next);
		} catch (Exception e) {
			log.error("获取视频异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

}
