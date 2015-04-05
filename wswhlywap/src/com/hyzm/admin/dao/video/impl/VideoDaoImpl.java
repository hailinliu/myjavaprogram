package com.hyzm.admin.dao.video.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.video.VideoDao;

@Repository
public class VideoDaoImpl implements VideoDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getVideoList = "select t.* from t_video t where t.title like ? and t.proficient like ? and t.uploaddate >= ? and t.uploaddate <= ? and t.state like ? and videotype like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getVideoList(String title,
			String proficient, Date begindate, Date enddate, String state,String videotype,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getVideoList, new Object[]{"%"+title+"%", "%"+proficient+"%", begindate, enddate, "%"+state+"%","%"+videotype+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取视频列表异常："+e.getMessage());
		}
	}
	
	private final static String getVideoListNum = "select count(id) from t_video where title like ? and proficient like ? and uploaddate >= ? and uploaddate <= ? and state like ? and videotype like ?";

	public long getVideoListNum(String title, String proficient,
			Date begindate, Date enddate, String state,String videotype) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getVideoListNum, new Object[]{"%"+title+"%", "%"+proficient+"%", begindate, enddate, "%"+state+"%","%"+videotype+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取视频数量异常："+e.getMessage());
		}
	}
	
	private final static String addVideo = "insert into t_video (title, imgurl, name, proficient, uploaddate, note,videotype) values (?,?,?,?,now(),?,?)";

	public boolean addVideo(String title, String videoimg, String videoname, String proficient, String note,String videotype)
			throws Exception {
		try {
			int i = jdbcTemplate.update(addVideo, new Object[]{title, videoimg, videoname, proficient, note,videotype});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加视频异常："+e.getMessage());
		}
	}
	
	private final static String delVideo = "update t_video set state = 2 where id = ?";

	public boolean delVideo(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delVideo, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除视频异常："+e.getMessage());
		}
	}
	
	private final static String updVideo = "update t_video set title = ?, imgurl = ?, name = ?, proficient = ?, note = ?,videotype=? where id = ?";

	public boolean updVideo(long id, String title, String videoimg, String videoname,
			String proficient, String note,String videotype) throws Exception {
		try {
			int i = jdbcTemplate.update(updVideo, new Object[]{title, videoimg, videoname, proficient, note,videotype, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改视频异常："+e.getMessage());
		}
	}
	
	private final static String getVideoById = "select * from t_video where id = ?";

	public Map<String, Object> getVideoById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getVideoById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取视频异常："+e.getMessage());
		}
	}
	
	private final static String autoTitle = "select title from t_video";

	public List<Map<String, Object>> autoTitle() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoTitle);
		} catch (Exception e) {
			throw new RuntimeException("自动补全视频名称异常："+e.getMessage());
		}
	}
	
	private final static String autoProficient = "select proficient from t_video";

	public List<Map<String, Object>> autoProficient() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoProficient);
		} catch (Exception e) {
			throw new RuntimeException("自动补全讲座专家异常："+e.getMessage());
		}
	}

}
