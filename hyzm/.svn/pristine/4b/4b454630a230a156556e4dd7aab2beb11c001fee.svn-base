package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.forums.ForumsInfoReqBean;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.util.MchatFilterUtil;
//import com.hyzm.util.UrlFile;

@Controller
@RequestMapping("/froums")
public class ForumsControl {
	
	@Autowired
	private ForumsService forumsService;
	
	
	/**
	 * 新增信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/forumsInfo")
	public void flagshopInfo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		MessageRespBean respBean=null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			String newInfo = MchatFilterUtil.getFilterString(request.getParameter("content"));
			ForumsInfoReqBean info = new ForumsInfoReqBean();
			info.setUserid(currentSession.getId());
			info.setCollectionid(Long.parseLong(request.getParameter("collectionid")));
			info.setContent(newInfo);
			info.setCountnum("0");
			info.setLikenum("0");
			info.setForumtime(request.getParameter("forumtime"));
			info.setDesction(request.getParameter("desction"));
			info.setCollectionnum(request.getParameter("collectionnum"));
			info.setType(request.getParameter("type"));
			respBean=forumsService.forumsInfo(info);	
//			//String path=UrlFile.getFilepath(request);
//			UrlFile.delFile("E:\\tomcat\\servertomcat\\webapps\\hyzm\\news\\getOneNews_id_788.html");
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
			out.print(new Gson().toJson(respBean.getErrorcode()));
		}
		
	}
	
	
	/**
	 * 修改信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateForumsInfo")
	public void flagshopList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;	
		MessageRespBean respBean=null;
		try {
			out = response.getWriter();
			String id=request.getParameter("id");
			String likenum=request.getParameter("likenum");
			ForumsInfoReqBean info = new ForumsInfoReqBean();
			info.setId(Long.parseLong(id));
			info.setLikenum(likenum);
			respBean=forumsService.updateForumsInfo(info);
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/queryForums")
	public void queryForums(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			String collectionid= request.getParameter("collectionid");
			String type = request.getParameter("type");
			List<Forums> list=forumsService.getFlagshopList(Long.parseLong(collectionid), type);	
			out.print(list);
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
		}
		
	}
	/**
	 * 新增信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/addReply")
	public void addReply(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		MessageRespBean respBean=null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			String newInfo = MchatFilterUtil.getFilterString(request.getParameter("content"));
			ForumsInfoReqBean info = new ForumsInfoReqBean();
			info.setUserid(currentSession.getId());
			info.setCollectionid(Long.parseLong(request.getParameter("collectionid")));
			info.setContent(newInfo);
			info.setCountnum(request.getParameter("id"));
			info.setLikenum("0");
			info.setForumtime(request.getParameter("forumtime"));
			info.setDesction("回复");
			info.setCollectionnum(request.getParameter("collectionnum"));
			info.setType(request.getParameter("type"));
			respBean=forumsService.forumsInfo(info);	
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
			out.print(new Gson().toJson(respBean.getErrorcode()));
		}
		
	}
	
	
}
