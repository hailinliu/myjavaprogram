package com.hyzm.admin.dao.article;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ArticleDao {
	
	/**
	 * 获取帖子列表
	 * @param begindate
	 * @param enddate
	 * @param nickname
	 * @param typeid
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getArticleList(Date begindate, Date enddate, String nickname, String typeid, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取帖子数量
	 * @param begindate
	 * @param enddate
	 * @param nickname
	 * @param typeid
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getArticleListNum(Date begindate, Date enddate, String nickname, String typeid, String state) throws Exception;
	
	/**
	 * 添加新帖子
	 * @param content
	 * @param userid
	 * @param nickname
	 * @param typeid
	 * @return
	 * @throws Exception
	 */
	public boolean insertArticle(String content, long userid, String nickname, long typeid) throws Exception;
	
	/**
	 * 删除帖子
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteArticle(long id) throws Exception;
	
	/**
	 * 修改帖子
	 * @param id
	 * @param content
	 * @param typeid
	 * @return
	 * @throws Exception
	 */
	public boolean updateArticle(long id, String content, long typeid) throws Exception;
	
	/**
	 * 获取评论列表
	 * @param articleid
	 * @param begindate
	 * @param enddate
	 * @param nickname
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getReviewList(long articleid, Date begindate, Date enddate, String nickname, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取评论数量
	 * @param articleid
	 * @param begindate
	 * @param enddate
	 * @param nickname
	 * @return
	 * @throws Exception
	 */
	public long getReviewListNum(long articleid, Date begindate, Date enddate, String nickname) throws Exception;
	
	/**
	 * 删除评论
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteReview(long id) throws Exception;
	
	/**
	 * 获取赞列表
	 * @param articleid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getExellentList(long articleid, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取赞数量
	 * @param articleid
	 * @return
	 * @throws Exception
	 */
	public long getExellentListNum(long articleid) throws Exception;
	
	/**
	 * 删除赞
	 * @param articleid
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public boolean deleteExellent(long articleid, long userid) throws Exception;

}
