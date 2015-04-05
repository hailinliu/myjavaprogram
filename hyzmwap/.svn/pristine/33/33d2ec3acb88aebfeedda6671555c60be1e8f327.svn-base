package com.hyzm.forward.control;


import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hyzm.forward.service.lylots.lyService;
import com.hyzm.forward.service.user.UserService;
@Controller
@RequestMapping("/collect")
public class LylotsControl {
	@Autowired
	private lyService  lyservice;
	@Autowired
	private UserService userService;
	@RequestMapping("/getlylotslist")
public String getlylotslist(HttpServletRequest request,HttpServletResponse response){
		
		return "collect/show";
	
	}
	
	@RequestMapping("/getlylots")
	public void getlylots(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String specialID=request.getParameter("specialID");
			//价格区间
			String pricearea=request.getParameter("pricearea");
			//来源  如果为乐园自有 userid=1000   用户送拍 userid!=1000
			String ly=request.getParameter("ly");
			String userid="3302";
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			if (ly==null || "".equals(ly)) {
				ly = "1";//乐园自由
			}
			Map<String, Object> ppmap = lyservice.getlylots(specialID, pricearea, ly, userid, Integer.valueOf(currentPage), Integer.valueOf(pageSize));
			String result = new Gson().toJson(ppmap);
			out.print(result);
		} catch (Exception e) {
			out.print("error");
			e.printStackTrace();
		}
	}


	@RequestMapping("/getlylotsById")
	public String getlylotsById(HttpServletRequest request,HttpServletResponse response){
		try {
			String id=request.getParameter("id");
			Map<String, Object> map = lyservice.getlylotsById(id);
			request.setAttribute("info", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/collect/showinfo";	
	}
}
