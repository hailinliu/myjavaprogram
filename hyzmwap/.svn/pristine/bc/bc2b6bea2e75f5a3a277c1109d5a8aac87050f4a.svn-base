package com.hyzm.forward.service.video;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.video.VideoListRespBean.Video;

public interface VideoService {
	
	/**
	 * 获取视频列表
	 * @return
	 * @throws Exception
	 */
	public List<Video> getVideoList() throws Exception;
	
	/**
	 * 首页随机获取视频列表
	 * @return
	 * @throws Exception
	 */
	public List<Video> getVideoListIndex() throws Exception;
	
	/**
	 * 获取视频列表（分页）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getVideoList(int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取视频
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Video> getVideoById(long id) throws Exception;

}
