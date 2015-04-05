package com.hyzm.admin.dao.video;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface VideoDao {
	
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
	 * @throws Exception
	 */
	public List<Map<String, Object>> getVideoList(String title, String proficient, Date begindate, Date enddate, String state,String videotype, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取视频数量
	 * @param title
	 * @param proficient
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getVideoListNum(String title, String proficient, Date begindate, Date enddate, String state,String videotype) throws Exception;
	
	/**
	 * 添加视频
	 * @param title
	 * @param videoimg
	 * @param videoname
	 * @param proficient
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public boolean addVideo(String title, String videoimg, String videoname, String proficient, String note,String videotype) throws Exception;
	
	/**
	 * 删除视频
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delVideo(long id) throws Exception;
	
	/**
	 * 修改视频
	 * @param id
	 * @param title
	 * @param videoimg
	 * @param videoname
	 * @param proficient
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public boolean updVideo(long id, String title, String videoimg, String videoname, String proficient, String note,String videotype) throws Exception;
	
	/**
	 * 获取视频
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getVideoById(long id) throws Exception;
	
	/**
	 * 自动补全标题
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoTitle() throws Exception;
	
	/**
	 * 自动补全专家
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoProficient() throws Exception;

}
