package com.hyzm.admin.service.article;

import java.util.Date;

public interface ArticleService {
	
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
	 */
	public String getArticleList(Date begindate, Date enddate, String nickname, String typeid, String state, int currentPage, int pageSize);
	
	/**
	 * 添加新帖子
	 * @param content
	 * @param userid
	 * @param nickname
	 * @param typeid
	 * @return
	 */
	public boolean insertArticle(String content, long userid, String nickname, long typeid);
	
	/**
	 * 删除帖子
	 * @param id
	 * @return
	 */
	public boolean deleteArticle(long id);
	
	/**
	 * 修改帖子
	 * @param id
	 * @param content
	 * @param typeid
	 * @return
	 */
	public boolean updateArticle(long id, String content, long typeid);
	
	/**
	 * 获取评论列表
	 * @param articleid
	 * @param begindate
	 * @param enddate
	 * @param nickname
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getReviewList(long articleid, Date begindate, Date enddate, String nickname, int currentPage, int pageSize);
	
	/**
	 * 删除评论
	 * @param id
	 * @return
	 */
	public boolean deleteReview(long id);
	
	/**
	 * 获取赞列表
	 * @param articleid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getExellentList(long articleid, int currentPage, int pageSize);
	
	/**
	 * 删除赞
	 * @param articleid
	 * @param userid
	 * @return
	 */
	public boolean deleteExellent(long articleid, long userid);

}
