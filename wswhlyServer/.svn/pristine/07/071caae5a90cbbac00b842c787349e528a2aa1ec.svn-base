package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.video.VideoListRespBean;

public interface VideoDao {

	public int queryVideoCount(String videotype) throws SQLException;
	
	public List<VideoListRespBean.Video> queryVideo(String videotype,int pageno,int pagesize) throws SQLException;
	
	public VideoListRespBean.Video queryVideo(long id) throws SQLException;
	
	public VideoListRespBean.Video queryPrevVideo(long id) throws SQLException;
	
	public VideoListRespBean.Video queryNextVideo(long id) throws SQLException;
	
	public boolean updateClicknum(long id) throws SQLException;
	
	public List<VideoListRespBean.Video> queryVideoIndex(String videotype,int pageno,int pagesize) throws SQLException;
}
