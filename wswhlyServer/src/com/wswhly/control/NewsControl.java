package com.wswhly.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.news.NewsInfoReqBean;
import com.wswhly.bean.news.NewsInfoRespBean;
import com.wswhly.bean.news.NewsListReqBean;
import com.wswhly.bean.news.NewsListRespBean;
import com.wswhly.bean.news.NewsListRespBean.News;
import com.wswhly.bean.news.NewsStyleReqBean;
import com.wswhly.bean.news.NewsStyleRespBean;
import com.wswhly.dao.NewsDao;
import com.wswhly.util.StringUtil;

@Controller
public class NewsControl {

	private static final Logger logger = Logger.getLogger(NewsControl.class);
	
	@Autowired
	private NewsDao newsdao;
	
	/**
	 * ��ȡ����List
	 */
	@RequestMapping("/NewsList")
	public void NewsList(HttpServletRequest request,HttpServletResponse response){
		NewsListReqBean newsreq = (new Gson()).fromJson(request.getAttribute("data").toString(), NewsListReqBean.class);
		if(newsreq.getReqtype() == null || newsreq.getReqtype().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "���Ͳ���Ϊ��"));
			return;
		}
		NewsListRespBean newsresp = new NewsListRespBean();
		try{
			if(newsreq.getReqtype().equals("1")){//�����ŷ����ѯ
				newsresp.setCount(newsdao.queryNewsByTypeCount(newsreq.getType(),newsreq.getStyle(), newsreq.getId()));
				newsresp.setList(newsdao.queryNewsByType(newsreq.getPageno(), newsreq.getPagesize(), newsreq.getType() ,newsreq.getStyle(), newsreq.getId()));
			}else if(newsreq.getReqtype().equals("2")){//�Ƽ� 
				newsresp.setCount(newsdao.queryNewsRecommendCount());
				newsresp.setList(newsdao.queryNewsRecommend(newsreq.getPageno(), newsreq.getPagesize()));
			}else if(newsreq.getReqtype().equals("3")){//����
				newsresp.setCount(newsdao.queryNewsCount());
				newsresp.setList(newsdao.queryNewsNew(newsreq.getPageno(), newsreq.getPagesize()));
			}else if(newsreq.getReqtype().equals("4")){//����
				newsresp.setCount(newsdao.queryNewsCount());
				newsresp.setList(newsdao.queryNewsHot(newsreq.getPageno(), newsreq.getPagesize()));
			}else{
				request.setAttribute("resultjson",StringUtil.Error("9999", "״̬δ֪"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(newsresp)));
		}catch (Exception e) {
			logger.error("NewsList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ���ŵ�����Ϣ
	 */
	@RequestMapping("/NewsInfo")
	public void NewsInfo(HttpServletRequest request,HttpServletResponse response){
		NewsInfoReqBean newsreq = (new Gson()).fromJson(request.getAttribute("data").toString(), NewsInfoReqBean.class);
		NewsInfoRespBean newsresp = new NewsInfoRespBean();
		try{
			newsdao.updateClicknum(newsreq.getId());//���µ����
			News news = newsdao.queryNews(newsreq.getId());
			newsresp.setNews(news);
			newsresp.setPrevNews(newsdao.queryPrevNews(newsreq.getId(),news.getStyle()));
			newsresp.setNextNews(newsdao.queryNextNews(newsreq.getId(),news.getStyle()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(newsresp)));
		}catch (Exception e) {
			logger.error("NewsInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ���ŷ���
	 */
	@RequestMapping("/NewsStyle")
	public void NewsStyle(HttpServletRequest request,HttpServletResponse response){
		NewsStyleReqBean stylereq = (new Gson()).fromJson(request.getAttribute("data").toString(), NewsStyleReqBean.class);
		NewsStyleRespBean styleresp = new NewsStyleRespBean();
		try{
			styleresp.setList(newsdao.queryNewsStyle(stylereq.getType()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(styleresp)));
		}catch (Exception e) {
			logger.error("NewsStyle Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
}
