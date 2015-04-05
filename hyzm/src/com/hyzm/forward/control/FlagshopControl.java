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
import com.hyzm.bean.flagshop.FlagshopInfoReqBean;
import com.hyzm.bean.flagshop.FlagshopListRespBean.Flagshop;
import com.hyzm.forward.service.flagshop.FlagshopService;

@Controller
@RequestMapping("/flagshop")
public class FlagshopControl {
	
	@Autowired
	private FlagshopService flagService;
	
	
	@RequestMapping("/addFlagDoc")
	public String flagShop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		return "flagship/addFlagDoc";
		
	}
	
	/**
	 * 新增商家信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/flagshopInfo")
	public void flagshopInfo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;
		MessageRespBean respBean=null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			FlagshopInfoReqBean info = new FlagshopInfoReqBean();
			info.setUserid(currentSession.getId());
			info.setCompanyName(request.getParameter("comName"));
			info.setComabb(request.getParameter("comabb"));
			info.setCode(request.getParameter("code"));
			info.setScan(request.getParameter("scan"));
			info.setComcode(request.getParameter("comcode"));
			info.setComscan(request.getParameter("comscan"));
			info.setAddress(request.getParameter("address"));
			info.setMoney(request.getParameter("money"));
			info.setFname(request.getParameter("fname"));
			info.setFscan(request.getParameter("fscan"));
			info.setFidcode(request.getParameter("fidcode"));
			info.setName(request.getParameter("name"));
						
			info.setIdcard(request.getParameter("idcard"));
			info.setIdscan(request.getParameter("idscan"));;
			info.setMobile(request.getParameter("mobile"));
			info.setEmail(request.getParameter("email"));
			info.setManage(request.getParameter("manage"));
			info.setComarea(request.getParameter("comarea"));
			info.setUploadimg(request.getParameter("uploadimg"));
			info.setImageUrl(request.getParameter("imageUrl"));
			info.setLogo(request.getParameter("logo"));
			info.setThumbnail(request.getParameter("thumbnail"));
			info.setMapPath(request.getParameter("mapPath"));
			info.setApplicationtime(request.getParameter("applicationtime"));
			
			info.setBegintime(request.getParameter("begintime"));
			info.setEndtime(request.getParameter("endtime"));
			info.setState(request.getParameter("state"));
			info.setDisplay(request.getParameter("display"));
			info.setStyle(request.getParameter("style"));
			info.setDesction(request.getParameter("desction"));

			respBean=flagService.FlagshopInfo(info);	
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
			out.print(new Gson().toJson(respBean.getErrorcode()));
		}
		
	}
	
	
	/**
	 * 商家信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/flagshopList")
	public void flagshopList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;	
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");	
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			List<Flagshop>list=flagService.getFalgshopInfoList();	
			out.print(list);
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 商家申请信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/queryFlagshop")
	public void queryFlagshop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			List<Flagshop> list=flagService.getFlagshopList(currentSession.getId());	
			int count=list.size();
			out.print(count);
		} catch (Exception e) {		
			out.print("程序异常！");
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
}
