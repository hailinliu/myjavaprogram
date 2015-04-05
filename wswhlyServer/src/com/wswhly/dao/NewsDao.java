package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.news.NewsListRespBean;
import com.wswhly.bean.news.NewsStyleRespBean;


public interface NewsDao {

	public int queryNewsByTypeCount(String type,String style,String id) throws SQLException;

	public int queryNewsRecommendCount() throws SQLException;
	
	public int queryNewsCount() throws SQLException;
	
	public List<NewsListRespBean.News> queryNewsByType(int pageno,int pagesize,String type,String style,String id) throws SQLException;

	public List<NewsListRespBean.News> queryNewsRecommend(int pageno,int pagesize) throws SQLException;
	
	public List<NewsListRespBean.News> queryNewsNew(int pageno,int pagesize) throws SQLException;
	
	public List<NewsListRespBean.News> queryNewsHot(int pageno,int pagesize) throws SQLException;
	
	public NewsListRespBean.News queryNews(long id) throws SQLException;
	
	public NewsListRespBean.News queryPrevNews(long id,String style) throws SQLException;
	
	public NewsListRespBean.News queryNextNews(long id,String style) throws SQLException;
	
	public List<NewsStyleRespBean.Style> queryNewsStyle(String type) throws SQLException;
	
	public boolean updateClicknum(long id) throws SQLException;

}
