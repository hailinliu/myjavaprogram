package com.wswhly.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.news.NewsListRespBean;
import com.wswhly.bean.news.NewsStyleRespBean;
import com.wswhly.dao.NewsDao;
import com.wswhly.util.StringUtil;

@Repository
public class NewsDaoImpl implements NewsDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryNewsByTypeCount = "select count(*) from t_news where (state = 1 or state = 4 )  and type = ? and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null)";
	private final String queryNewsByTypeStyleCount = "select count(*) from t_news where (state = 1 or state = 4 )  and type = ? and style = ?   and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) ";
	
	private final String queryNewsByTypeStyleUNIdCount = "select count(*) from t_news where (state = 1 or state = 4 ) and id <> ? and type = ? and style = ?   and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) ";
	
	public int queryNewsByTypeCount(String type,String style,String id) throws SQLException{
		if(style == null || style.equals(""))
			return jdbcTemplate.queryForInt(queryNewsByTypeCount,new Object[]{type});
		if(id == null || id.equals(""))
			return jdbcTemplate.queryForInt(queryNewsByTypeStyleCount,new Object[]{type,style});
		return jdbcTemplate.queryForInt(queryNewsByTypeStyleUNIdCount,new Object[]{id,type,style});
	}

	private final String queryNewsRecommendCount = "select count(*) from t_news where (state = 1 or state = 4 ) and recommend = 1   and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) ";
	public int queryNewsRecommendCount() throws SQLException{
		return jdbcTemplate.queryForInt(queryNewsRecommendCount);
	}
	
	private final String queryNewsCount = "select count(*) from t_news where (state = 1 or state = 4 )  and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) ";
	public int queryNewsCount() throws SQLException{
		return jdbcTemplate.queryForInt(queryNewsCount);
	}
	
	private final String queryNewsByType = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1  or t.state = 4) and t.type = ?  and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) order by t.createdate desc limit ?,?";
	private final String queryNewsByTypeStyle = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4 )and t.type = ? and t.style = ?    and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) order by t.createdate desc limit ?,?";
	private final String queryNewsByTypeStyleUNId = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4) and t.id <> ? and t.type = ? and t.style = ?   and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) order by t.createdate desc limit ?,?";
	
	public List<NewsListRespBean.News> queryNewsByType(int pageno,int pagesize,String type,String style,String id) throws SQLException{
		if(style == null || style.equals(""))
			return (List<NewsListRespBean.News>)jdbcTemplate.query(queryNewsByType,new Object[]{type,(pageno-1)*pagesize,pagesize}, new NewsMapper());
		if(id == null || id.equals(""))
			return (List<NewsListRespBean.News>)jdbcTemplate.query(queryNewsByTypeStyle,new Object[]{type,style,(pageno-1)*pagesize,pagesize}, new NewsMapper());
		return (List<NewsListRespBean.News>)jdbcTemplate.query(queryNewsByTypeStyleUNId,new Object[]{id,type,style,(pageno-1)*pagesize,pagesize}, new NewsMapper());
	}

	private final String queryNewsRecommend = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4) and t.recommend = 1   and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null)  order by t.createdate desc limit ?,?";
	public List<NewsListRespBean.News> queryNewsRecommend(int pageno,int pagesize) throws SQLException{
		return (List<NewsListRespBean.News>)jdbcTemplate.query(queryNewsRecommend,new Object[]{(pageno-1)*pagesize,pagesize}, new NewsMapper());
	}
	
	private final String queryNewsNew = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4 ) and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null)  order by t.createdate desc limit ?,?";
	public List<NewsListRespBean.News> queryNewsNew(int pageno,int pagesize) throws SQLException{
		return (List<NewsListRespBean.News>)jdbcTemplate.query(queryNewsNew,new Object[]{(pageno-1)*pagesize,pagesize}, new NewsMapper());
	}
	
	private final String queryNewsHot = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4)  and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null)  order by t.clicknum desc limit ?,?";
	public List<NewsListRespBean.News> queryNewsHot(int pageno,int pagesize) throws SQLException{
		return (List<NewsListRespBean.News>)jdbcTemplate.query(queryNewsHot,new Object[]{(pageno-1)*pagesize,pagesize}, new NewsMapper());
	}
	
	protected class NewsMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			NewsListRespBean.News news = new NewsListRespBean().new News();
			news.setId(rs.getLong("id"));
			news.setTitle(rs.getString("title"));
			news.setContent(StringUtil.filterHtml(rs.getString("content")));
			news.setClicknum(rs.getInt("clicknum"));
			news.setRecommend(rs.getString("recommend"));
			String createdate = rs.getString("createdate");
			if(createdate != null && createdate.length() > 19)
				news.setCreatedate(createdate.substring(0, 19));
			news.setLabel(rs.getString("label"));
			news.setType(rs.getString("type"));
			news.setStyle(rs.getString("style"));
			news.setStylename(rs.getString("stylename"));
			news.setImgurltitle(rs.getString("imgurltitle"));
			return news;
		}
	}
	
	private final String queryNews = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4 ) and t.id = ?    ";
	public NewsListRespBean.News queryNews(long id) throws SQLException{
		List<NewsListRespBean.News> list = (List<NewsListRespBean.News>)jdbcTemplate.query(queryNews,new Object[]{id}, new NewsInfoMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String queryPrevNews = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1 or t.state = 4 ) and t.id = (select min(id) from t_news where id > ? and style = ?  and (state = 1  or state = 4 ) and (CHAR_LENGTH(flagshopbaseinfoid)<=0 or flagshopbaseinfoid is null))";
	public NewsListRespBean.News queryPrevNews(long id,String style) throws SQLException{
		List<NewsListRespBean.News> list = (List<NewsListRespBean.News>)jdbcTemplate.query(queryPrevNews,new Object[]{id,style}, new NewsInfoMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String queryNextNews = "select t.*,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where (t.state = 1  or t.state = 4 ) and t.id = (select max(id) from t_news where id < ? and style = ? and (state = 1 or state = 4) and (CHAR_LENGTH(flagshopbaseinfoid)=0 or flagshopbaseinfoid is null) )";
	public NewsListRespBean.News queryNextNews(long id,String style) throws SQLException{
		List<NewsListRespBean.News> list = (List<NewsListRespBean.News>)jdbcTemplate.query(queryNextNews,new Object[]{id,style}, new NewsInfoMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	protected class NewsInfoMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			NewsListRespBean.News news = new NewsListRespBean().new News();
			news.setId(rs.getLong("id"));
			news.setTitle(rs.getString("title"));
			news.setContent(rs.getString("content"));
			news.setClicknum(rs.getInt("clicknum"));
			news.setRecommend(rs.getString("recommend"));
			String createdate = rs.getString("createdate");
			if(createdate != null && createdate.length() > 19)
				news.setCreatedate(createdate.substring(0, 19));
			news.setLabel(rs.getString("label"));
			news.setType(rs.getString("type"));
			news.setStyle(rs.getString("style"));
			news.setStylename(rs.getString("stylename"));
			news.setImgurltitle(rs.getString("imgurltitle"));
			return news;
		}
	}
	
	private final String queryNewsStyle = "select * from t_newstype where state = 1 and parentid = ?";
	public List<NewsStyleRespBean.Style> queryNewsStyle(String type) throws SQLException{
		return (List<NewsStyleRespBean.Style>)jdbcTemplate.query(queryNewsStyle,new Object[]{type}, new StyleMapper());
	}
	
	protected class StyleMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			NewsStyleRespBean.Style style = new NewsStyleRespBean().new Style();
			style.setId(rs.getLong("id"));
			style.setName(rs.getString("style"));
			return style;
		}
	}
	
	private final String updateClicknum = "update t_news set clicknum = clicknum + 1 where id = ?";
	public boolean updateClicknum(long id) throws SQLException{
		int i = jdbcTemplate.update(updateClicknum,new Object[]{id});
		if(i>0)return true;else return false;
	}
}
