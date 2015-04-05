package com.wswhly.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.collection.CollectionListRespBean;
import com.wswhly.bean.news.NewsListRespBean;
import com.wswhly.bean.proficient.ProficientListRespBean;
import com.wswhly.bean.video.VideoListRespBean;
import com.wswhly.bean.video.VideoListRespBean.Video;
import com.wswhly.dao.VideoDao;
import com.wswhly.dao.impl.CollectionDaoImpl.CollectionMapper;
import com.wswhly.dao.impl.NewsDaoImpl.NewsMapper;

@Repository
public class VideoDaoImpl implements VideoDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryVideoCount = "select count(*) from t_video where state = 1 and videotype=? order by uploaddate desc";
	public int queryVideoCount(String videotype) throws SQLException{
		videotype=videotype==null?"0":videotype;
		return jdbcTemplate.queryForInt(queryVideoCount,new Object[]{videotype});
	}
	
	private final String queryVideo = "select * from t_video where state = 1 and videotype=? order by uploaddate desc limit ?,?";
	public List<VideoListRespBean.Video> queryVideo(String videotype,int pageno,int pagesize) throws SQLException{
		videotype=videotype==null?"0":videotype;
		return (List<VideoListRespBean.Video>)jdbcTemplate.query(queryVideo,new Object[]{videotype,(pageno-1)*pagesize,pagesize}, new VideoMapper());
	}
	
	private final String queryVideoIndex = "select * from t_video where state = 1 and videotype=? ORDER BY rand() limit ?,?";
	public List<VideoListRespBean.Video> queryVideoIndex(String videotype,int pageno,int pagesize) throws SQLException{
		videotype=videotype==null?"0":videotype;
		return (List<VideoListRespBean.Video>)jdbcTemplate.query(queryVideoIndex,new Object[]{videotype,(pageno-1)*pagesize,pagesize}, new VideoMapper());
	}
	
	
	protected class VideoMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			VideoListRespBean.Video video = new VideoListRespBean().new Video();
			video.setId(rs.getLong("id"));
			video.setName(rs.getString("name"));
			video.setTitle(rs.getString("title"));
			video.setProficient(rs.getString("proficient"));
			video.setNote(rs.getString("note"));
			video.setVideotype(rs.getString("videotype"));
			
			String uploaddate = rs.getString("uploaddate");
			if(uploaddate != null && uploaddate.length() > 19)
				video.setUploaddate(uploaddate.substring(0, 19));
			
			video.setClicknum(rs.getInt("clicknum"));
			video.setImgurl(rs.getString("imgurl"));
			return video;
		}
	}
	
	private final String queryVideoOne = "select * from t_video where state = 1 and id = ?";
	public VideoListRespBean.Video queryVideo(long id) throws SQLException{
		List<VideoListRespBean.Video> list = (List<VideoListRespBean.Video>)jdbcTemplate.query(queryVideoOne,new Object[]{id}, new VideoMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}

	private final String queryPrevVideo = "select t.* from t_video t where t.id = (select min(id) from t_video where t.state = 1 and id > ?)";
	public VideoListRespBean.Video queryPrevVideo(long id) throws SQLException{
		List<VideoListRespBean.Video> list = (List<VideoListRespBean.Video>)jdbcTemplate.query(queryPrevVideo,new Object[]{id}, new VideoMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String queryNextVideo = "select t.* from t_video t where t.id = (select max(id) from t_video where t.state = 1 and id < ?)";
	public VideoListRespBean.Video queryNextVideo(long id) throws SQLException{
		List<VideoListRespBean.Video> list = (List<VideoListRespBean.Video>)jdbcTemplate.query(queryNextVideo,new Object[]{id}, new VideoMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String updateClicknum = "update t_video set clicknum = clicknum + 1 where id = ?";
	public boolean updateClicknum(long id) throws SQLException{
		int i = jdbcTemplate.update(updateClicknum,new Object[]{id});
		if(i>0)return true;else return false;
	}
	
}
