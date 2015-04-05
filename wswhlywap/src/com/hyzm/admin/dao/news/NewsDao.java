package com.hyzm.admin.dao.news;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 新闻数据库操作接口
 * @author Administrator
 *
 */
public interface NewsDao {
	
	/**
	 * 获取收藏资讯列表
	 * @param type 1=收藏资讯，2=收藏学院
	 * @param title标题
	 * @param begindate
	 * @param enddate
	 * @param recommend是否推荐
	 * @param style子类型
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getNewsList(int type, String id,String title, Date begindate, Date enddate, String recommend, String style, String state,String flagshopid, int currentPage, int pageSize) throws Exception;
	
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
	 * @throws Exception
	 */
	public List<Map<String, Object>> getNewsList(String title, Date begindate, Date enddate, String recommend, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取公告列表
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getBulletinList(String title, Date begindate, Date enddate, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取收藏资讯数量
	 * @param type 1=收藏资讯，2=收藏学院
	 * @param title标题
	 * @param begindate
	 * @param enddate
	 * @param recommend是否推荐
	 * @param state子类型
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getNewsListNum(int type, String id, String title, Date begindate, Date enddate, String recommend, String style, String state,String flagshopid) throws Exception;
	
	/**
	 * 获取收藏学院数量
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param recommend
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getNewsListNum(String title, Date begindate, Date enddate, String recommend, String state) throws Exception;
	
	/**
	 * 获取公告数量
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getBulletinListNum(String title, Date begindate, Date enddate, String state) throws Exception;
	
	/**
	 * 添加新闻
	 * @param type
	 * @param title
	 * @param label
	 * @param content
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public boolean addNews(int type, String title, String label, String content, int style,String flagshopid,String imgurltitle) throws Exception;
	
	/**
	 * 删除新闻
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delNews(long id) throws Exception;
	/**
	 * 删除新闻
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delNewlist(long id) throws Exception;
	
	/**
	 * 修改新闻
	 * @param id
	 * @param title
	 * @param label
	 * @param content
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public boolean updNews(long id, String title,int state ,String label, String content, int style,String flagshopid,String imgurltitle,String createdate) throws Exception;
	
	/**
	 * 获取新闻
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getNewsById(long id) throws Exception;
	
	/**
	 * 设置推荐新闻
	 * @param id
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public boolean setRecommend(long id, int style) throws Exception;
	
	/**
	 * 自动补全新闻标题
	 * @param type
	 * @param recommend
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoTitle(String type, String recommend) throws Exception;
	
	/**
	 * 获取最新/推荐/热点新闻列表
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getNewsListTd(String title, Date begindate, Date enddate, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取最新/推荐/热点新闻数量
	 * @param title
	 * @param begindate
	 * @param enddate
	 * @return
	 * @throws Exception
	 */
	public long getNewsListTdNum(String title, Date begindate, Date enddate) throws Exception;
	
	/**
	 * 获取新闻子类列表
	 * @param style
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getNewsTypeList(int style, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取新闻子类数量
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public long getNewsTypeListNum(int style) throws Exception;
	
	/**
	 * 添加新闻子类
	 * @param style
	 * @param parentid
	 * @return
	 * @throws Exception
	 */
	public boolean addType(String style, int parentid) throws Exception;
	
	/**
	 * 删除新闻子类
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delType(int id) throws Exception;
	
	/**
	 * 修改新闻子类
	 * @param id
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public boolean updType(int id, String style) throws Exception;
	
	/**
	 * 获取新闻子类下拉列表
	 * @param style
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoType(int style) throws Exception;
	/**
	 * 抓取新闻
	 * @param title
	 * @param content
	 * @param label
	 * @return
	 * @throws Exception
	 */
	public boolean getNewsinfo(String title,String content,String label) throws Exception;

}
