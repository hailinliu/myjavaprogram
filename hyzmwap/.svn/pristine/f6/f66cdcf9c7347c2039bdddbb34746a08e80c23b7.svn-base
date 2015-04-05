package com.hyzm.forward.service.news.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.enroll.EnrollInfoReqBean;
import com.hyzm.bean.news.NewsInfoReqBean;
import com.hyzm.bean.news.NewsInfoRespBean;
import com.hyzm.bean.news.NewsListReqBean;
import com.hyzm.bean.news.NewsListRespBean;
import com.hyzm.bean.news.NewsStyleReqBean;
import com.hyzm.bean.news.NewsStyleRespBean;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.news.NewsStyleRespBean.Style;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.news.NewsService;

@Service
public class NewsServiceImpl extends MessageResponse implements NewsService {
	
	private final Logger log = Logger.getLogger(this.getClass());

	public List<News> getBulletinList(String type) throws Exception {
		log.info("获取公告列表");
		List<News> list = null;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(1);
			news.setPagesize(8);
			news.setReqtype("1");
		    //news.setType("3");
			news.setType(type);
			list = ((NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList")).getList();
		} catch (Exception e) {
			log.error("获取公告列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<News>():list;
	}
	
	public List<News> getCollectionInfoList() throws Exception {
		log.info("获取收藏资讯列表");
		List<News> list = null;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(1);
			news.setPagesize(7);
			news.setReqtype("1");
			news.setType("1");
			list = ((NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList")).getList();
		} catch (Exception e) {
			log.error("获取收藏资讯列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<News>():list;
	}

	public List<News> getSchoolInfoList() throws Exception {
		log.info("获取收藏学院列表");
		List<News> list = null;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(1);
			news.setPagesize(6);
			news.setReqtype("1");
			news.setType("2");
			list = ((NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList")).getList();
		} catch (Exception e) {
			log.error("获取收藏学院列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<News>():list;
	}
	
	public List<News> getNewsList(String type) throws Exception {
		log.info("获取最新新闻列表");
		List<News> list = null;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(1);
			news.setPagesize(6);
			news.setReqtype(type);
			list = ((NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList")).getList();
		} catch (Exception e) {
			log.error("获取最新新闻列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<News>():list;
	}

	public List<News> getNewsList(String reqtype, String type, String style) throws Exception {
		log.info("获取新闻列表");
		List<News> list = null;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(1);
			news.setPagesize(7);
			news.setReqtype(reqtype);
			news.setType(type);
			news.setStyle(style);
			list = ((NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList")).getList();
		} catch (Exception e) {
			log.error("获取新闻列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<News>():list;
	}

	public List<Style> getStyleList(String type) throws Exception {
		log.info("获取新闻子类型列表");
		List<Style> list = null;
		try {
			NewsStyleReqBean newsStyle = new NewsStyleReqBean();
			newsStyle.setType(type);
			list = ((NewsStyleRespBean)getMessageResponse(newsStyle, new NewsStyleRespBean(), "NewsStyle")).getList();
		} catch (Exception e) {
			log.error("获取新闻列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Style>():list;
	}

	public Map<String, Object> getNewsList(String reqtype, String type, String style,
			int currentPage, int pageSize) throws Exception {
		log.info("获取新闻列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<News> list = null;
		int count = 0;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(currentPage);
			news.setPagesize(pageSize);
			news.setReqtype(reqtype);
			news.setType(type);
			news.setStyle(style);
			NewsListRespBean respBean = (NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list==null?new ArrayList<News>():list);
		} catch (Exception e) {
			log.error("获取新闻列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String, Object> getNewsList(String reqtype, String type, String style, String id, int currentPage, int pageSize) throws Exception {
		log.info("获取新闻列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<News> list = null;
		int count = 0;
		try {
			NewsListReqBean news = new NewsListReqBean();
			news.setPageno(currentPage);
			news.setPagesize(pageSize);
			news.setReqtype(reqtype);
			news.setType(type);
			news.setStyle(style);
			news.setId(id);
			NewsListRespBean respBean = (NewsListRespBean)getMessageResponse(news, new NewsListRespBean(), "NewsList");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list==null?new ArrayList<News>():list);
		} catch (Exception e) {
			log.error("获取新闻列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, News> getOneNews(long id) throws Exception {
		log.info("获取单条新闻");
		Map<String, News> map = new HashMap<String, News>();
		try {
			NewsInfoReqBean news = new NewsInfoReqBean();
			news.setId(id);
			NewsInfoRespBean respBean = (NewsInfoRespBean)getMessageResponse(news, new NewsInfoRespBean(), "NewsInfo");
			News pre = respBean.getPrevNews();
			News n = respBean.getNews();
			News next = respBean.getNextNews();
			map.put("pre", pre==null?new NewsListRespBean().new News():pre);
			map.put("news", n==null?new NewsListRespBean().new News():n);
			map.put("next", next==null?new NewsListRespBean().new News():next);
		} catch (Exception e) {
			log.error("获取单条新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public static void main(String[] args) throws Exception {
			String path = "WebRoot/WEB-INF/applicationContext.xml";
			ApplicationContext ctx = new FileSystemXmlApplicationContext(path);
			NewsService service = (NewsService) ctx.getBean("schoolInfoServiceImpl");
			List<News> list = service.getSchoolInfoList();
			for (News n : list) {
				System.out.println(n.getTitle());
				System.out.println(n.getContent());
				System.out.println(n.getCreatedate());
				System.out.println(n.getClicknum());
			}
	}
	@Override
	public MessageRespBean EnrollInfo(EnrollInfoReqBean info) throws Exception {
     log.info("报名信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "EnrollInfo");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}


}
