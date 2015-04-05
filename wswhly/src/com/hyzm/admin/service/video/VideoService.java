package com.hyzm.admin.service.video;

import java.util.Date;
import java.util.Map;

public interface VideoService {
	
	/**
	 * 获取视频列表
	 * @param title
	 * @param proficient
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getVideoList(String title, String proficient, Date begindate, Date enddate, String state,String videotype, int currentPage, int pageSize);
	
	/**
	 * 添加视频
	 * @param title
	 * @param videoimg
	 * @param videoname
	 * @param proficient
	 * @param note
	 * @return
	 */
	public boolean addVideo(String title, String videoimg, String videoname, String proficient, String note,String videotype);
	
	/**
	 * 删除视频
	 * @param id
	 * @return
	 */
	public boolean delVideo(long id);
	
	/**
	 * 修改视频
	 * @param id
	 * @param title
	 * @param videoimg
	 * @param videoname
	 * @param proficient
	 * @param note
	 * @return
	 */
	public boolean updVideo(long id, String title, String videoimg, String videoname, String proficient, String note,String videotype);
	
	/**
	 * 获取视频
	 * @param id
	 * @return
	 */
	public Map<String, Object> getVideoById(long id);
	
	/**
	 * 自动补全标题
	 * @return
	 */
	public String autoTitle();
	
	/**
	 * 自动补全专家
	 * @return
	 */
	public String autoProficient();

}
