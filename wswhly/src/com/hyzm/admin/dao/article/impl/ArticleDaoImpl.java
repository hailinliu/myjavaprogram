package com.hyzm.admin.dao.article.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.article.ArticleDao;

@Repository
public class ArticleDaoImpl implements ArticleDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getArticleList = "select t.*,u.username,a.name from t_article t left join t_user u on t.userid = u.id left join t_articletype a on t.typeid = a.id where t.createdate >= ? and t.createdate <= ? and u.username like ? and t.typeid like ? and t.state like ? order by t.createdate desc limit ?, ?";

	public List<Map<String, Object>> getArticleList(Date begindate,
			Date enddate, String nickname, String typeid, String state,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getArticleList, new Object[]{begindate, enddate, "%"+nickname+"%", "%"+typeid+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取帖子列表异常："+e.getMessage());
		}
	}
	
	private final static String getArticleListNum = "select count(t.id) from t_article t left join t_user u on t.userid = u.id where t.createdate >= ? and t.createdate <= ? and u.username like ? and t.typeid like ? and t.state like ?";

	public long getArticleListNum(Date begindate, Date enddate,
			String nickname, String typeid, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getArticleListNum, new Object[]{begindate, enddate, "%"+nickname+"%", "%"+typeid+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取帖子数量异常："+e.getMessage());
		}
	}
	
	private final static String insertArticle = "insert into t_article (content, createdate, position, userid, nickname, state, sort, typeid) values (?, now(), 2, ?, ?, 1, 2, ?)";

	public boolean insertArticle(String content, long userid, String nickname, long typeid) throws Exception {
		try {
			int i = jdbcTemplate.update(insertArticle, new Object[]{content, userid, nickname, typeid});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加新帖子异常："+e.getMessage());
		}
	}
	
	private final static String deleteArticle = "update t_article set state = 2 where id = ?";

	public boolean deleteArticle(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(deleteArticle, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除帖子异常："+e.getMessage());
		}
	}
	
	private final static String updateArticle = "update t_article set content = ?, typeid = ? where id = ?";

	public boolean updateArticle(long id, String content, long typeid)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updateArticle, new Object[]{content, typeid, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改帖子异常："+e.getMessage());
		}
	}
	
	private final static String getReviewList = "select t.* from t_review t left join t_user u on t.userid = u.id where t.articleid = ? and t.createdate >= ? and t.createdate <= ? and u.username like ? order by t.createdate desc limit ?, ?";

	public List<Map<String, Object>> getReviewList(long articleid,
			Date begindate, Date enddate, String nickname, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getReviewList, new Object[]{articleid, begindate, enddate, "%"+nickname+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取评论列表异常："+e.getMessage());
		}
	}
	
	private final static String getReviewListNum = "select count(t.id) from t_review t left join t_user u on t.userid = u.id where t.articleid = ? and t.createdate >= ? and t.createdate <= ? and u.username like ?";

	public long getReviewListNum(long articleid, Date begindate, Date enddate,
			String nickname) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getReviewListNum, new Object[]{articleid, begindate, enddate, "%"+nickname+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取评论数量异常："+e.getMessage());
		}
	}
	
	private final static String deleteReview = "update t_review set state = 2 where id = ?";

	public boolean deleteReview(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(deleteReview, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除评论异常："+e.getMessage());
		}
	}
	
	private final static String getExellentList = "select a.content, u.username from t_exellentlog t left join t_article a on t.articleid = a.id left join t_user u on t.userid = u.id where t.articleid = ? order by t.createdate desc limit ?, ?";

	public List<Map<String, Object>> getExellentList(long articleid,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getExellentList, new Object[]{articleid, (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取赞列表异常："+e.getMessage());
		}
	}
	
	private final static String getExellentListNum = "select count(t.articleid) from t_exellentlog t where t.articleid = ?";

	public long getExellentListNum(long articleid) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getExellentListNum, new Object[]{articleid});
		} catch (Exception e) {
			throw new RuntimeException("获取赞数量异常："+e.getMessage());
		}
	}
	
	private final static String deleteExellent = "delete from t_exellentlog where articleid = ? and userid = ?";

	public boolean deleteExellent(long articleid, long userid) throws Exception {
		try {
			int i = jdbcTemplate.update(deleteExellent, new Object[]{articleid, userid});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除赞异常："+e.getMessage());
		}
	}

}
