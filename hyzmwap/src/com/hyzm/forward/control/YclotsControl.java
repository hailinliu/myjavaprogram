package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hyzm.bean.yc.YcCountBean;
import com.hyzm.bean.yc.YcinstitutionsRespBean;
import com.hyzm.bean.yc.YcactionRespBean.Ycaction;
import com.hyzm.bean.yc.YcinstitutionsRespBean.Ycinstitutions;
import com.hyzm.bean.yc.YclotsListRespBean.Yclots;
import com.hyzm.bean.yc.YcspecialRespBean.Ycspecial;
import com.hyzm.forward.service.yc.YclotsService;

@Controller
@RequestMapping("/yclots")
public class YclotsControl {
	
	@Autowired
	private YclotsService yclotsService;
	/**
	 * 根据专场id查询专场下的拍列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getYclotsListByspecialID")
	public String getYclotsListByspecialID(HttpServletRequest request, HttpServletResponse response) {
		try {
			String jgid=request.getParameter("jgid");
			String pmhid=request.getParameter("pmhid");
			String specialID=request.getParameter("specialID");
			
			if(specialID==null||specialID==""){
				//获取所有机构
				List<Ycinstitutions> jglist=(List<Ycinstitutions>) yclotsService.queryYcinstitutions().get("list");
				//获取第一个机构id
				jgid=String.valueOf(jglist.get(0).getId());
				//根据机构id查询机构下  拍卖会
				List<Ycaction>  pmhist=(List<Ycaction>) yclotsService.queryYcactionByins_id(jgid, 1, 100000000).get("list");
				//获取第一个拍卖会id
				pmhid=String.valueOf(pmhist.get(0).getId());
				//根据拍卖会获取第一个专场id
				List<Ycspecial> zclist =(List<Ycspecial>) yclotsService.queryYcspecialByactionID(pmhid, 1, 100000000).get("list");
				specialID=String.valueOf(zclist.get(0).getId());
			}
			
			if(specialID==null||specialID==""){
				specialID="1";
			}
			String currentPage = request.getParameter("currentPage");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			Map<String, Object> map=yclotsService.queryYclotsByspecialID(specialID, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			YcCountBean ycount=yclotsService.queryYccount();
			request.setAttribute("ycount", ycount);
			request.setAttribute("jgid",jgid);
			request.setAttribute("pmhid",pmhid);
			request.setAttribute("specialID",specialID);
			request.setAttribute("pageSize",pageSize);
			request.setAttribute("count", map.get("count"));
			request.setAttribute("yclotslist", (List<Yclots>)map.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pmyuzhan/pmyuzhan";
	}
	
	/**
	 * 根据拍品id查询拍品详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getYclotsListByid")
	public String getYclotsListByid(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id=request.getParameter("id");
			Yclots yclots=yclotsService.queryYclotsByid(id);
			request.setAttribute("yclots", yclots);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/pmyuzhan/oneCollection";
	}
	/**
	 * 根据拍卖公司查询拍卖会
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getYcactionByinsid")
	public void getYcactionByinsid(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String ins_id=request.getParameter("ins_id");
			Map<String, Object> map=yclotsService.queryYcactionByins_id(ins_id, 1, 100000000);
			String res= new Gson().toJson(map.get("list"));
			out.print(res);
			
		} catch (Exception e) {
			out.print("0001");
			e.printStackTrace();
		}
	}
	/**
	 * 根据拍卖会查询拍卖专场
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getYcspecialByactionID")
	public void getYcspecialByactionID(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String actionid=request.getParameter("actionid");
			Map<String, Object> map=yclotsService.queryYcspecialByactionID(actionid, 1, 100000000);
			String res= new Gson().toJson(map.get("list"));
			out.print(res);
			
		} catch (Exception e) {
			out.print("0001");
			e.printStackTrace();
		}
	}
	/*
	/**
	 * 根据拍卖会查询拍卖机构
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getYcinstitutions")
	public void getYcinstitutions(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, Object> map=yclotsService.queryYcinstitutions();
			String res= new Gson().toJson(map.get("list"));
			out.print(res);
			
		} catch (Exception e) {
			out.print("0001");
			e.printStackTrace();
		}
	}
	@RequestMapping("/getYclots")
	public void getHycp(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, Object> map = new HashMap<String, Object>();
			String page = request.getParameter("page");
			String pageSize = request.getParameter("pageSize");
			String specialID=request.getParameter("specialID");
			if (page==null || "0".equals(page)) {
				page = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}			
			map = (Map<String, Object>) yclotsService.queryYclotsByspecialID(specialID, Integer.valueOf(page), Integer.valueOf(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
