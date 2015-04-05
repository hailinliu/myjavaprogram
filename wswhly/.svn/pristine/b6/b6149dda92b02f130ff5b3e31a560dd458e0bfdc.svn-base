package com.hyzm.admin.service.news;

import java.util.Date;
import java.util.Map;

public interface NewsService {
	
	/**
	 * 获取新闻列表
	 * @param type
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param recommend
	 * @param style
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getNewsList(int type, String id,String title, Date begindate, Date enddate, String recommend, String style, String state,String flagshopid, int currentPage, int pageSize);
	
	/**
	 * 获取收藏学院列表
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param recommend
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getNewsList(String title, Date begindate, Date enddate, String recommend, String state, int currentPage, int pageSize);
	
	/**
	 * 获取公告列表
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getBulletinList(String title, Date begindate, Date enddate, String state, int currentPage, int pageSize);
	
	/**
	 * 添加新闻
	 * @param type
	 * @param title
	 * @param label
	 * @param content
	 * @param style
	 * @return
	 */
	public boolean addNews(int type, String title, String label, String content, int style,String flagshopid,String imgurltitle);
	
	/**
	 * 删除新闻
	 * @param id
	 * @return
	 */
	public boolean delNews(long id);
	/**
	 * 删除新闻
	 * @param id
	 * @return
	 */
	public boolean delNewlist(long id);
	
	/**
	 * 修改新闻
	 * @param id
	 * @param title
	 * @param label
	 * @param content
	 * @param style
	 * @return
	 */
	public boolean updNews(long id, String title, int state ,String label, String content, int style,String flagshopid,String imgurltitle,String createdate);
	
	/**
	 * 获取新闻
	 * @param id
	 * @return
	 */
	public Map<String, Object> getNewsById(long id);
	
	/**
	 * 设置推荐新闻
	 * @param id
	 * @param style
	 * @return
	 */
	public boolean setRecommend(long id, int style);
	
	/**
	 * 自动补全新闻标题
	 * @param type
	 * @param recommend
	 * @return
	 */
	public String autoTitle(String style, String recommend);
	
	/**
	 * 获取最新/推荐/热点新闻列表
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getNewsListTd(String title, Date begindate, Date enddate, int currentPage, int pageSize);
	
	/**
	 * 获取新闻子类列表
	 * @param style
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getNewsTypeList(int style, int currentPage, int pageSize);
	
	/**
	 * 添加新闻子类
	 * @param style
	 * @param parentid
	 * @return
	 */
	public boolean addType(String style, int parentid);
	
	/**
	 * 删除新闻子类
	 * @param id
	 * @return
	 */
	public boolean delType(int id);
	
	/**
	 * 修改新闻子类
	 * @param id
	 * @param style
	 * @return
	 */
	public boolean updType(int id, String style);
	
	/**
	 * 获取新闻子类下拉列表
	 * @param style
	 * @return
	 */
	public String autoType(int style);
	/**
	 * 抓取新闻
	 * @param title
	 * @param content
	 * @param label
	 * @return
	 * @throws Exception
	 */
	public boolean getNewsinfo(String title,String content,String label)throws Exception ;

}
