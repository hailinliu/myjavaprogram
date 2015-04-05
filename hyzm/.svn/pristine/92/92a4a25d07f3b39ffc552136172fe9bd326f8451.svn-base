package com.hyzm.forward.service.news;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.enroll.EnrollInfoReqBean;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.news.NewsStyleRespBean.Style;

public interface NewsService {
	
	/**
	 * 获取公告列表
	 * @return
	 * @throws Exception
	 */
	public List<News> getBulletinList(String type) throws Exception;
	
	/**
	 * 获取收藏学院列表
	 * @return
	 * @throws Exception
	 */
	public List<News> getCollectionInfoList() throws Exception;
	/**
	 * 获取华豫快讯列表
	 * @return
	 * @throws Exception
	 */
	public List<News> getHuayuInfoList() throws Exception;
	/**
	 * 获取官网活动列表
	 * @return
	 * @throws Exception
	 */
	public List<News> getHuodongInfoList() throws Exception;
	
	/**
	 * 获取收藏学院列表
	 * @return
	 * @throws Exception
	 */
	public List<News> getSchoolInfoList() throws Exception;
	
	/**
	 * 获取最新新闻
	 * @param type类型2=推荐，3=最新，4=热点
	 * @return
	 * @throws Exception
	 */
	public List<News> getNewsList(String type) throws Exception;
	
	/**
	 * 根据新闻子类型获取新闻列表
	 * @param reqtype
	 * @param type 1=收藏资讯，2=收藏学院
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public List<News> getNewsList(String reqtype, String type, String style) throws Exception;
	
	/**
	 * 获取新闻子类型列表
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<Style> getStyleList(String type) throws Exception;
	
	/**
	 * 根据新闻子类型获取新闻列表（分页）
	 * @param reqtype
	 * @param type
	 * @param style
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getNewsList(String reqtype, String type, String style, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 根据新闻子类型获取新闻列表（不包含当前新闻）
	 * @param reqtype
	 * @param type
	 * @param style
	 * @param id
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getNewsList(String reqtype, String type, String style, String id, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取单条新闻
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, News> getOneNews(long id) throws Exception;
	/**
	 * 报名信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean EnrollInfo(EnrollInfoReqBean info) throws Exception;
	
	
	
}
