package com.hyzm.admin.service.article.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.article.ArticleDao;
import com.hyzm.admin.service.article.ArticleService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ArticleDao dao;

	public String getArticleList(Date begindate, Date enddate, String nickname,
			String typeid, String state, int currentPage, int pageSize) {
		log.info("获取帖子列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getArticleListNum(begindate, enddate, nickname, typeid, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getArticleList(begindate, enddate, nickname, typeid, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取帖子列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean insertArticle(String content, long userid, String nickname,
			long typeid) {
		log.info("添加新帖子");
		try {
			return dao.insertArticle(content, userid, nickname, typeid);
		} catch (Exception e) {
			log.error("添加新帖子异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteArticle(long id) {
		log.info("删除帖子");
		try {
			return dao.deleteArticle(id);
		} catch (Exception e) {
			log.error("删除帖子异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateArticle(long id, String content, long typeid) {
		log.info("修改帖子");
		try {
			return dao.updateArticle(id, content, typeid);
		} catch (Exception e) {
			log.error("修改帖子异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getReviewList(long articleid, Date begindate, Date enddate,
			String nickname, int currentPage, int pageSize) {
		log.info("获取评论列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getReviewListNum(articleid, begindate, enddate, nickname);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getReviewList(articleid, begindate, enddate, nickname, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取评论列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean deleteReview(long id) {
		log.info("删除评论");
		try {
			return dao.deleteReview(id);
		} catch (Exception e) {
			log.error("删除评论异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getExellentList(long articleid, int currentPage, int pageSize) {
		log.info("获取赞列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getExellentListNum(articleid);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getExellentList(articleid, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取赞列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean deleteExellent(long articleid, long userid) {
		log.info("删除赞");
		try {
			return dao.deleteExellent(articleid, userid);
		} catch (Exception e) {
			log.error("删除赞异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
