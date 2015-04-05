package com.hyzm.admin.service.news.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.news.NewsDao;
import com.hyzm.admin.service.news.NewsService;
import com.hyzm.util.DateJsonValueProcessor;

@Service
public class NewsServiceImpl implements NewsService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private NewsDao dao;

	public String getNewsList(int type,String id, String title, Date begindate, Date enddate,
			String recommend, String style, String state,String flagshopid, int currentPage, int pageSize) {
		log.info("获取新闻列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getNewsListNum(type,id, title, begindate, enddate, recommend, style, state,flagshopid);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getNewsList(type,id, title, begindate, enddate, recommend, style, state,flagshopid, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取新闻列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public String getNewsList(String title, Date begindate, Date enddate, String recommend, String state, int currentPage, int pageSize) {
		log.info("获取收藏学院列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getNewsListNum(title, begindate, enddate, recommend, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getNewsList(title, begindate, enddate, recommend, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取收藏学院列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	
	public String getBulletinList(String title, Date begindate, Date enddate, String state, int currentPage, int pageSize) {
		log.info("获取公告列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getBulletinListNum(title, begindate, enddate, state);
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getBulletinList(title, begindate, enddate, state, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取公告列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addNews(int type, String title, String label, String content, int style,String flagshopid,String imgurltitle) {
		log.info("添加新闻");
		try {
			Document doc = Jsoup.parse(content, "utf-8");
			Elements imgs = doc.select("img");
			for (Element link : imgs) {
				String imgsrc = link.attr("src");
				if(imgsrc.indexOf("wswhly/ueditor")>=0){
					imgsrc = imgsrc.substring(imgsrc.indexOf("wswhly/ueditor"));
				}else{
					imgsrc = imgsrc.substring(imgsrc.indexOf("ueditor"));
				}
				
				link.attr("src", "http://admin.wswhly.com/"+imgsrc);
			}
			Element body = doc.body();
			return dao.addNews(type, title, label, body.html(), style,flagshopid,imgurltitle);
		} catch (Exception e) {
			log.error("添加新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delNews(long id) {
		log.info("删除新闻");
		try {
			return dao.delNews(id);
		} catch (Exception e) {
			log.error("删除新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updNews(long id, String title,int state , String label, String content, int style,String flagshopid,String imgurltitle,String createdate) {
		log.info("修改新闻");
		try {
		if(state==4){
			return dao.updNews(id, title,state, label, content, style,flagshopid,imgurltitle, createdate);
			}else if(state==1){
				Document doc = Jsoup.parse(content, "utf-8");
				Elements imgs = doc.select("img");
					for (Element link : imgs) {
						String imgsrc = link.attr("src");
						System.out.println(imgsrc);
						if(imgsrc.indexOf("wswhly/ueditor")>=0){
							imgsrc = imgsrc.substring(imgsrc.indexOf("wswhly/ueditor"));
						}else{
							imgsrc = imgsrc.substring(imgsrc.indexOf("ueditor"));
						}
						System.out.println(imgsrc);
						link.attr("src", "http://admin.wswhly.com/"+imgsrc);
					}
				        Element body = doc.body();	
				    	System.out.println(body.html());
					return dao.updNews(id, title,state, label, body.html(), style,flagshopid,imgurltitle, createdate);
			}

		
		} catch (Exception e) {
			log.error("修改新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public Map<String, Object> getNewsById(long id) {
		log.info("获取新闻");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.getNewsById(id);
			Document doc = Jsoup.parse(map.get("content").toString(), "utf-8");
			Elements imgs = doc.select("img");
			for (Element link : imgs) {
				String imgsrc = link.attr("src");
				imgsrc = imgsrc.substring(imgsrc.indexOf("wswhly/ueditor"));
				link.attr("src", "/"+imgsrc);
			}
			Element body = doc.body();
			map.put("content", body.html());
		} catch (Exception e) {
			log.error("获取新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public boolean setRecommend(long id, int style) {
		log.info("设置推荐新闻");
		try {
			return dao.setRecommend(id, style);
		} catch (Exception e) {
			log.error("设置推荐新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String autoTitle(String style, String recommend) {
		log.info("自动补全新闻标题");
		try {
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			return JSONArray.fromObject(dao.autoTitle(style, recommend), jsonConfig).toString();
		} catch (Exception e) {
			log.error("自动补全新闻标题异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getNewsListTd(String title, Date begindate, Date enddate,
			int currentPage, int pageSize) {
		log.info("获取最新/推荐/热点新闻数量");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getNewsListTdNum(title, begindate, enddate);
			if (total == 0) {
				return "{tatal:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> maplist = dao.getNewsListTd(title, begindate, enddate, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取最新/推荐/热点新闻数量异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getNewsTypeList(int style, int currentPage, int pageSize) {
		log.info("获取新闻子类型列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getNewsTypeListNum(style);
			if (total == 0) {
				return "{tatal:0,rows:[]}";
			}
			map.put("total", total);
			List<Map<String, Object>> maplist = dao.getNewsTypeList(style, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取新闻子类型列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addType(String style, int parentid) {
		log.info("添加新闻子类型");
		try {
			return dao.addType(style, parentid);
		} catch (Exception e) {
			log.error("添加新闻子类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delType(int id) {
		log.info("删除新闻子类型");
		try {
			return dao.delType(id);
		} catch (Exception e) {
			log.error("删除新闻子类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updType(int id, String style) {
		log.info("修改新闻子类型");
		try {
			return dao.updType(id, style);
		} catch (Exception e) {
			log.error("修改新闻子类型异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String autoType(int style) {
		log.info("获取新闻子类型下拉列表");
		try {
			return JSONArray.fromObject(dao.autoType(style)).toString();
		} catch (Exception e) {
			log.error("获取新闻子类型下拉列表异常："+e.getMessage());
		}
		return "查询失败！";
	}


	public boolean delNewlist(long id) {
		log.info("删除新闻");
		try {
			return dao.delNewlist(id);
		} catch (Exception e) {
			log.error("删除新闻异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public boolean getNewsinfo(String title,String content,String label)
			throws Exception {
		log.info("抓取新闻信息");
		try {
			return dao.getNewsinfo(title, content, label);
		} catch (Exception e) {
			log.error("抓取新闻信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
