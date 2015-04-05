package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.video.VideoListRespBean.Video;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.video.VideoService;

@Controller
@RequestMapping("/video")
public class VideoControl {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/gotoVideoList")
	public String gotoVideoList() {
		return "video/videos";
	}
	
	@RequestMapping("/getVideoList")
	public void getVideoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = videoService.getVideoList(Integer.valueOf(currentPage), Integer.valueOf(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getVideo")
	public String getVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, Video> map = videoService.getVideoById(id);
			Map<String, Object> videoMap = videoService.getVideoList(1, 10);
			request.setAttribute("pre", map.get("pre"));
			request.setAttribute("video", map.get("video"));
			request.setAttribute("next", map.get("next"));
			request.setAttribute("videoList", videoMap.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/video";
	}
	
	@RequestMapping("/getWapVideo")
	public String getWapVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String width = request.getParameter("width");
			String height = request.getParameter("height");
			System.out.println(width);
			System.out.println(height);
			Map<String, Video> map = videoService.getVideoById(id);
			request.setAttribute("video", map.get("video"));
			request.setAttribute("width", width==null?"800":width);
			request.setAttribute("height", height==null?"600":height);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getWapVideo";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/getHyvideoList")
	public String getHyvideoList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = videoService.getVideoList(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("count", 0);
			//request.setAttribute("videoList", map.get("list"));
			request.setAttribute("listsize", ((List<Video>)map.get("list")).size());
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getHyvideoList";
	}
	

}
